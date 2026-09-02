#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
STACK_REPO=$(dirname -- "$SCRIPT_DIR")
mapfile -t OWNED_SKILLS < "$STACK_REPO/skills/owned.txt"

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

for required in \
  AGENTS.md \
  README.md \
  references/project-memory.md \
  references/trust-handoff.md \
  templates/project-agent-block.md \
  templates/agent-journal/architecture.md \
  templates/agent-journal/verification.md \
  templates/agent-journal/ownership.md \
  templates/agent-journal/uncertainties.md \
  templates/agent-journal/5stack-feedback.md \
  templates/agent-journal/decisions/README.md \
  templates/agent-journal/reviews/README.md \
  evals/scenarios.md; do
  [[ -f "$STACK_REPO/$required" ]] || fail "missing $required"
done

skill_names=()
for skill in "${OWNED_SKILLS[@]}"; do
  skill_file="$STACK_REPO/skills/$skill/SKILL.md"
  [[ -f "$skill_file" ]] || fail "missing skill $skill"
  [[ "$(sed -n '1p' "$skill_file")" == "---" ]] || fail "$skill has no opening frontmatter delimiter"
  closing_line=$(awk 'NR > 1 && $0 == "---" { print NR; exit }' "$skill_file")
  [[ -n "$closing_line" ]] || fail "$skill has no closing frontmatter delimiter"
  declared=$(sed -n 's/^name: *//p' "$skill_file" | head -n 1)
  [[ "$declared" == "$skill" ]] || fail "$skill declares name '$declared'"
  [[ "$(sed -n 's/^description: *//p' "$skill_file" | wc -l)" -eq 1 ]] || fail "$skill needs one description"
  skill_names+=("$declared")
done

duplicates=$(printf '%s\n' "${skill_names[@]}" | sort | uniq -d)
[[ -z "$duplicates" ]] || fail "duplicate skill names: $duplicates"

if command -v ruby >/dev/null; then
  ruby -ryaml -e '
    ARGV.each do |file|
      parts = File.read(file).split(/^---\s*$\n?/, 3)
      raise "invalid frontmatter: #{file}" unless parts.length == 3
      data = YAML.safe_load(parts[1])
      raise "invalid skill metadata: #{file}" unless data.is_a?(Hash) && data["name"] && data["description"]
    end
  ' "$STACK_REPO"/skills/*/SKILL.md || fail "skill YAML validation failed"
fi

if LC_ALL=C grep -RIl $'\342\200\224' \
  "$STACK_REPO/AGENTS.md" \
  "$STACK_REPO/README.md" \
  "$STACK_REPO/references" \
  "$STACK_REPO/skills" \
  "$STACK_REPO/templates" \
  "$STACK_REPO/evals" >/dev/null; then
  fail "em dash character found"
fi

bash -n "$STACK_REPO/scripts/install.sh"
bash -n "$STACK_REPO/scripts/uninstall.sh"
bash -n "$STACK_REPO/scripts/check.sh"

CHECK_TMP=$(mktemp -d)
case "$CHECK_TMP" in
  /tmp/*) ;;
  *) fail "unexpected temporary path: $CHECK_TMP" ;;
esac
trap 'rm -rf -- "$CHECK_TMP"' EXIT

TEST_AGENTS_DIR="$CHECK_TMP/agents"
mkdir -p "$TEST_AGENTS_DIR/skills/implement"
printf 'original global instructions\n' > "$TEST_AGENTS_DIR/AGENTS.md"
printf 'original implement skill\n' > "$TEST_AGENTS_DIR/skills/implement/SKILL.md"

bash "$STACK_REPO/scripts/install.sh" --agents-dir "$TEST_AGENTS_DIR" >/dev/null
[[ -L "$TEST_AGENTS_DIR/AGENTS.md" ]] || fail "installer did not link AGENTS.md"
[[ -L "$TEST_AGENTS_DIR/5stack" ]] || fail "installer did not link the 5stack repository"
for skill in "${OWNED_SKILLS[@]}"; do
  [[ -L "$TEST_AGENTS_DIR/skills/$skill" ]] || fail "installer did not link $skill"
done

bash "$STACK_REPO/scripts/install.sh" --agents-dir "$TEST_AGENTS_DIR" >/dev/null

bash "$STACK_REPO/scripts/uninstall.sh" --agents-dir "$TEST_AGENTS_DIR" >/dev/null
[[ -f "$TEST_AGENTS_DIR/AGENTS.md" ]] || fail "uninstaller did not restore AGENTS.md"
[[ ! -e "$TEST_AGENTS_DIR/5stack" && ! -L "$TEST_AGENTS_DIR/5stack" ]] || fail "uninstaller left the 5stack repository link"
for skill in "${OWNED_SKILLS[@]}"; do
  if [[ "$skill" == "implement" ]]; then
    [[ -f "$TEST_AGENTS_DIR/skills/implement/SKILL.md" ]] || fail "uninstaller did not restore implement"
  else
    [[ ! -e "$TEST_AGENTS_DIR/skills/$skill" && ! -L "$TEST_AGENTS_DIR/skills/$skill" ]] || fail "uninstaller left $skill"
  fi
done
grep -q 'original global instructions' "$TEST_AGENTS_DIR/AGENTS.md" || fail "wrong AGENTS.md restored"
grep -q 'original implement skill' "$TEST_AGENTS_DIR/skills/implement/SKILL.md" || fail "wrong implement skill restored"

echo "5stack static and installer checks passed."
