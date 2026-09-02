---
name: brainstorming
description: Explore meaningful design choices before new behavior or architecture when the request contains real uncertainty. Do not use for tiny, clear, low-risk changes.
---

# Proportionate design exploration

Use this skill when implementation depends on a meaningful unresolved design choice or the user asks to explore alternatives. Do not invoke it for a clear rename, mechanical edit, straightforward bug fix, or other low-risk task whose requested behavior is already specified.

Inspect the project and existing decisions first. Do not ask for facts available in files or tools. Do not reopen settled choices.

Explain the concrete problem in project language. Present the simplest reasonable approach first. Add one or two alternatives only when they expose a real tradeoff. For extra structure, state its concrete benefit, maintenance cost, and comprehension cost.

Ask the smallest number of questions needed to settle material choices. A short design can be a few sentences. Do not require a design document, spec, commit, or implementation plan merely because this skill ran.

Wait for user confirmation only when an unresolved choice would materially change the result. A request that already specifies and authorizes a clear design does not need a second approval gate.
