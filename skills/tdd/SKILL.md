---
name: tdd
description: Use a proportionate red-green-refactor loop when test-first development was requested or materially improves confidence in complex behavior.
---

# Proportionate TDD

Do not apply TDD automatically to every task. Use it when requested, for regression protection, or when behavior is complex enough that a red-green loop reduces uncertainty.

Test observable behavior through the highest practical stable interface. Choose ordinary test placement from repository conventions without asking the user. Surface the choice only when it would create a substantial new interface, harness, dependency, or maintenance burden.

Work one useful behavior slice at a time:

1. Write the smallest test that fails for the intended reason.
2. Run it and observe the failure.
3. Write the smallest complete implementation.
4. Run it and observe success.
5. Refactor when it improves clarity, then keep the test green.

Prefer real local dependencies. Mock only true external or nondeterministic boundaries such as remote APIs, time, randomness, or unavailable infrastructure. Do not mock internal collaborators merely to make a test easy.

Expected values should come from the requirement, a worked example, or another independent source, not a restatement of the implementation.

Tests are self-authored evidence. Add direct or observable evidence when that would be more convincing.
