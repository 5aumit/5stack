#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
STACK_REPO=$(dirname -- "$SCRIPT_DIR")
AGENTS_DIR="${HOME}/.agents"
DRY_RUN=0

usage() {
  echo "Usage: $0 [--dry-run] [--agents-dir PATH]"
}

while (($#)); do
  case "$1" in
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --agents-dir)
      [[ $# -ge 2 ]] || { usage >&2; exit 2; }
      AGENTS_DIR=$2
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      usage >&2
      exit 2
      ;;
  esac
done

[[ -d "$STACK_REPO/.git" ]] || { echo "Not a Git repository: $STACK_REPO" >&2; exit 1; }
[[ -f "$STACK_REPO/AGENTS.md" ]] || { echo "Missing $STACK_REPO/AGENTS.md" >&2; exit 1; }

BACKUP_DIR="$AGENTS_DIR/5stack-backups/v1"
SKILLS_DIR="$AGENTS_DIR/skills"
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

say_action() {
  if ((DRY_RUN)); then
    echo "DRY RUN: $*"
  else
    echo "$*"
  fi
}

install_link() {
  local source_path=$1 target_path=$2 backup_path=$3 resolved_source resolved_target
  resolved_source=$(readlink -f -- "$source_path")

  if [[ -L "$target_path" ]]; then
    resolved_target=$(readlink -f -- "$target_path" 2>/dev/null || true)
    if [[ "$resolved_target" == "$resolved_source" ]]; then
      echo "Already installed: $target_path"
      return
    fi
  fi

  if [[ -e "$target_path" || -L "$target_path" ]]; then
    if [[ -e "$backup_path" || -L "$backup_path" ]]; then
      echo "Refusing to overwrite existing backup: $backup_path" >&2
      exit 1
    fi
    say_action "Back up $target_path -> $backup_path"
    if ((!DRY_RUN)); then
      mkdir -p -- "$(dirname -- "$backup_path")"
      mv -- "$target_path" "$backup_path"
    fi
  fi

  say_action "Link $target_path -> $source_path"
  if ((!DRY_RUN)); then
    mkdir -p -- "$(dirname -- "$target_path")"
    ln -s -- "$source_path" "$target_path"
  fi
}

install_link "$STACK_REPO/AGENTS.md" "$AGENTS_DIR/AGENTS.md" "$BACKUP_DIR/AGENTS.md"

for skill in "${OWNED_SKILLS[@]}"; do
  [[ -f "$STACK_REPO/skills/$skill/SKILL.md" ]] || {
    echo "Missing owned skill: $skill" >&2
    exit 1
  }
  install_link \
    "$STACK_REPO/skills/$skill" \
    "$SKILLS_DIR/$skill" \
    "$BACKUP_DIR/skills/$skill"
done

if ((DRY_RUN)); then
  echo "5stack installation dry run complete."
else
  echo "5stack installation complete. Start a fresh Codex session to load it."
fi
echo "Backups, when needed: $BACKUP_DIR"
