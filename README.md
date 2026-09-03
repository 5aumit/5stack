# 5stack

5stack is a harness-agnostic operating contract for agentic software engineering. It aims to make agent work trustworthy and understandable without applying heavyweight process to every task.

V1 is optimized for one coding agent, one current branch or worktree, and one task at a time. It uses Markdown skills, lightweight behavioral scenarios, and reversible symlink installation. It has no workflow runtime or orchestration service.

## Commands to remember

- `/route`: recommend the smallest sufficient workflow.
- `/give-5stack-feedback <text>`: correct the current work and draft a feedback handoff.
- `/review-5stack-feedback`: investigate a pasted feedback handoff in this repository.
- `/reflect-5stack`: inspect the current session and draft useful feedback handoffs.

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

Run the uninstaller before moving this repository. If it was already moved, restore the old path temporarily or inspect and remove the broken 5stack links manually. The uninstaller deliberately leaves links it cannot prove belong to the current checkout.

## Target projects

5stack does not add its own persistent files or directories to target projects. Agents recover context from code, tests, Git, existing documentation, trackers, and the active session. Normal project artifacts are created only when the task requests them and should follow the repository's conventions.

Feedback about 5stack stays in chat. A project session produces a sanitized prompt that the user may copy into a 5stack development session. Nothing is stored or sent automatically.

## Maintaining 5stack

Normal users install and use 5stack. They do not need to run the scenarios in `evals/`.

Maintainers use the scenarios to check 5stack behavior after a change. Changes should update or add a focused scenario in `evals/scenarios.md`, then exercise relevant scenarios in fresh sessions. Pasted feedback should be investigated with `/review-5stack-feedback` before changing 5stack.
