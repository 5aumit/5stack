---
name: 5stack-setup
description: Prepare, migrate, repair, or health-check a repository for 5stack with the smallest useful project-local setup.
---

# Set up a project for 5stack

Inspect before editing. Read relevant agent instructions, project docs, Git state and remote, build and verification configuration, old decisions or ADRs, handoffs, issue conventions, harness folders, and any existing `.agent-journal/`.

Do not ask for facts available in the repository or tools. Do not turn setup into an architecture audit or refactor.

## Propose

Show a concise setup or migration proposal before writing. Explain:

- which existing instruction file will receive one `## 5stack` block;
- which journal files need creation or repair;
- the initial architecture and verification sources;
- the recommended work tracker;
- any old decision material worth migrating or referencing.

Ask only for choices that materially change the result. Wait for approval before editing existing project documentation.

## Apply

Use the templates under the installed 5stack repository's `templates/` directory as starting points, then replace placeholders with project facts.

- If `AGENTS.md` exists, update it. Otherwise update an existing general agent instruction file such as `CLAUDE.md`. Create `AGENTS.md` only when no suitable file exists.
- Preserve surrounding user instructions. Update an existing `## 5stack` block in place.
- Create the initial `.agent-journal` shape.
- Make `architecture.md` a useful current mental model based on inspected code and docs.
- Put reliable commands and meaningful evidence in `verification.md`.
- Make conservative ownership recommendations. Do not claim a human review was completed.
- Keep unresolved migration questions in `uncertainties.md`.
- Move or copy an old durable decision only when its future reasoning value warrants it and the proposal was approved. Avoid duplicate sources of truth. Preserve historical material when moving it would lose context.
- Preserve `CONTEXT.md` as a domain glossary when useful. Do not merge it into engineering memory.
- After verification, remove only cache or temporary artifacts created by the setup run. Report the final Git state accurately.

For a GitHub remote, recommend GitHub Issues through `gh`. Small work still needs no issue. Record the chosen tracker in the project instruction block, not in a new configuration system.

## Idempotence

On an onboarded project, compare current files with the contract. Repair missing sections, migrate schema wording when needed, and preserve project-specific content. Never reinitialize or duplicate the journal.

Finish with only this mental model:

- Talk to the agent normally.
- Use `/route` when the right process is unclear.
- Use `/feedback` to record explicit feedback.
- Use `/reflect` to mine the current session for feedback.
