---
name: domain-modeling
description: Sharpen project-specific domain vocabulary and record only durable engineering decisions in the 5stack journal.
---

# Domain modeling

Use this skill when project language is vague, overloaded, or inconsistent with behavior. Reading an existing glossary does not by itself require this workflow.

Keep domain vocabulary separate from engineering memory:

- Use `CONTEXT.md` as a concise project-specific glossary when one exists or a real vocabulary need appears.
- Do not put implementation details, task progress, or engineering decisions in the glossary.
- Cross-check claimed domain behavior with code and concrete edge cases.
- Update terms when the user resolves them.

Store an engineering decision under `.agent-journal/decisions/` only when future agents need its reasoning to avoid a likely wrong assumption or repeated debate. Include Decision, Why, Tradeoff, and Reconsider when. Do not create ADRs or maintain a second decision location.

Do not manufacture terminology for ordinary programming concepts.
