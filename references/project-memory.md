# Project memory contract

`.agent-journal/` is Git-tracked project memory. It is not a transcript archive or task tracker.

## Files

- `architecture.md`: the current engineering mental model. Replace stale statements instead of appending history.
- `verification.md`: project-specific evidence, useful commands, and important manual flows.
- `ownership.md`: important subsystems, recommended DELEGATE, REVIEW, or UNDERSTAND level, and whether a recommended human review was completed.
- `uncertainties.md`: unresolved assumptions, risks, temporary compromises, and missing validation. Remove resolved items.
- `decisions/`: durable engineering decisions that prevent a future wrong assumption or repeated debate.
- `reviews/`: short records of meaningful completed work and review outcomes.
- `5stack-feedback.md`: project-local observations about 5stack behavior. This is an inbox, not project truth.

Do not add categories without demonstrated need.

## Maintenance

- Read only relevant files before work.
- Update memory when meaningful truth changes, not after every edit.
- Prefer links to code, issues, commits, or tests over copied content.
- Keep domain vocabulary separate. Preserve `CONTEXT.md` as a glossary when the project already benefits from one.
- Do not duplicate active work from GitHub Issues in the journal.

## Durable decisions

Create a decision only when future agents need its reasoning to avoid a likely mistake. Include:

- Decision
- Why
- Tradeoff
- Reconsider when

Do not create one for ordinary implementation mechanics.

## Reviews

A meaningful review record can contain:

- work and implementation checkpoint;
- reviewer verdict and important findings;
- important review-induced changes;
- evidence and remaining uncertainty;
- final ownership recommendation.

Do not store the full reviewer transcript or diff.
