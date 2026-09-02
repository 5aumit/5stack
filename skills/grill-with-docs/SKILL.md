---
name: grill-with-docs
description: Run a proportionate grilling pass and record only the durable project conclusions that result.
---

# Grill with project memory

Use the `grilling` workflow. Read relevant `.agent-journal/` files and an existing `CONTEXT.md` before asking questions.

As decisions settle:

- update current project truth only when it materially changes;
- keep domain vocabulary in `CONTEXT.md` when that glossary exists or a real vocabulary need appears;
- create a file under `.agent-journal/decisions/` only when future agents need the reasoning to avoid a likely wrong assumption or repeated debate;
- put unresolved material uncertainty in `.agent-journal/uncertainties.md`.

Do not create documentation merely because this workflow ran. Do not create ADRs or a second decision system.
