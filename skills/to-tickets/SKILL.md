---
name: to-tickets
description: Split genuinely large or multi-session work into a small set of independently useful, verifiable tickets with real blockers.
---

# Create useful tickets

Use tickets only when splitting work improves progress, context, or verification. Do not ticketize small work or a medium task that fits one coherent session.

Read the approved spec, request, relevant project memory, and configured tracker from the project's `## 5stack` instructions. Inspect referenced GitHub issues and comments through `gh` when applicable.

Prefer narrow vertical slices that produce observable behavior across the needed layers. Each ticket should be useful and verifiable by itself and small enough for one focused session. Use a mechanical expand-migrate-contract sequence only when a wide change cannot stay working as vertical slices.

For each ticket, provide:

- title;
- what it delivers;
- acceptance evidence;
- blockers that genuinely prevent it from starting.

Show the proposed breakdown and ask for approval before creating issues. For GitHub, use `gh`, native blocker relationships when available, and written blocker references as a fallback. Remote writes require explicit authority.

Do not create extra parent, tracking, or coordination issues unless they provide a demonstrated benefit.
