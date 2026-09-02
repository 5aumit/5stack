#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
STACK_REPO=$(dirname -- "$SCRIPT_DIR")
OWNED_SKILLS=(
  5stack-setup
  route
  feedback
  reflect
  brainstorming
  grilling
  grill-with-docs
  to-spec
  to-tickets
  implement
  code-review
  manual-review
  tdd
  diagnosing-bugs
  domain-modeling
  review-5stack-feedback
)

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
  declared=$(sed -n 's/^name: *//p' "$skill_file" | head -n 1)
  [[ "$declared" == "$skill" ]] || fail "$skill declares name '$declared'"
  grep -q '^description: ' "$skill_file" || fail "$skill has no description"
  skill_names+=("$declared")
done

duplicates=$(printf '%s\n' "${skill_names[@]}" | sort | uniq -d)
[[ -z "$duplicates" ]] || fail "duplicate skill names: $duplicates"

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
[[ -L "$TEST_AGENTS_DIR/skills/route" ]] || fail "installer did not link route"
[[ -L "$TEST_AGENTS_DIR/skills/implement" ]] || fail "installer did not replace implement safely"

bash "$STACK_REPO/scripts/install.sh" --agents-dir "$TEST_AGENTS_DIR" >/dev/null

bash "$STACK_REPO/scripts/uninstall.sh" --agents-dir "$TEST_AGENTS_DIR" >/dev/null
[[ -f "$TEST_AGENTS_DIR/AGENTS.md" ]] || fail "uninstaller did not restore AGENTS.md"
[[ ! -e "$TEST_AGENTS_DIR/skills/route" && ! -L "$TEST_AGENTS_DIR/skills/route" ]] || fail "uninstaller left route"
grep -q 'original global instructions' "$TEST_AGENTS_DIR/AGENTS.md" || fail "wrong AGENTS.md restored"
grep -q 'original implement skill' "$TEST_AGENTS_DIR/skills/implement/SKILL.md" || fail "wrong implement skill restored"

echo "5stack static and installer checks passed."
