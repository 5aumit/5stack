---
name: grilling
description: Resolve meaningful hidden decisions in a vague, risky, or architectural request without asking for facts the agent can inspect.
---

# Proportionate grilling

Use grilling only when unresolved decisions materially affect the product, behavior, methodology, architecture, compatibility, cost, or risk. Do not grill a clear low-risk task.

Inspect the repository, tools, issues, and existing documentation first. Facts are the agent's job. Ask the user only for decisions.

Map dependencies between open decisions. Ask a small round of currently answerable questions, with a recommended answer and the concrete tradeoff for each. Prefer one question when it unlocks the rest. Ask another round only when prior answers reveal a new material decision.

Do not seek theoretical completeness. Stop when the requested outcome is sufficiently specified for the next useful step. Summarize settled decisions, remaining uncertainty, and the recommended next action. Do not implement until the user confirms the shared understanding.
