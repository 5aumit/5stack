# 5stack

5stack is a harness-agnostic operating contract for agentic software engineering. It aims to make agent work trustworthy and understandable without applying heavyweight process to every task.

V1 is optimized for one coding agent, one current branch or worktree, and one task at a time. It uses Markdown skills, project memory, lightweight behavioral scenarios, and reversible symlink installation. It has no workflow runtime or orchestration service.

## Commands to remember

- `/5stack-setup`: prepare or repair a repository.
- `/route`: recommend the smallest sufficient workflow.
- `/feedback <text>`: record explicit feedback about 5stack.
- `/reflect`: inspect the current session for useful 5stack feedback.

Other workflows are selected through normal conversation or `/route`.

5stack owns only skills whose behavior is part of its core contract or directly conflicts with that contract. Upstream `handoff`, `codebase-design`, and `improve-codebase-architecture` remain available without local forks. `/route` supersedes the upstream `/ask-matt` as the normal router.

## Install

From this repository:

```bash
bash scripts/check.sh
bash scripts/install.sh
```

The installer links the repository at `~/.agents/5stack`, then links 5stack-owned instructions and skills into `~/.agents`. It backs up conflicting files and does not remove unrelated skills. Start a fresh Codex session after installation.

To preview changes:

```bash
bash scripts/install.sh --dry-run
```

To remove 5stack-owned links and restore safe backups:

```bash
bash scripts/uninstall.sh
```

Run the uninstaller before moving this repository. If it was already moved, update `~/.agents/5stack` to the new repository path before uninstalling.

## Project memory

Onboarded projects use `.agent-journal/` for current architecture, verification knowledge, ownership, uncertainties, durable decisions, review checkpoints, and project-local 5stack feedback. GitHub Issues remain the preferred work tracker for GitHub repositories when tickets add value.

## Development

Behavior is the product. Changes should update or add a focused scenario in `evals/scenarios.md`, then exercise relevant scenarios in fresh sessions. Feedback from project journals should be reviewed in this repository before changing 5stack.
