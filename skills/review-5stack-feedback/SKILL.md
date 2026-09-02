---
name: review-5stack-feedback
description: Inside the 5stack repository, analyze accumulated project feedback and propose evidence-backed systemic improvements without mutating 5stack before approval.
---

# Review feedback about 5stack

This is an internal model-invoked workflow. Trigger it when the user is in the 5stack repository and supplies accumulated project feedback or asks to improve 5stack from feedback. Do not require the user to remember this skill name.

Parse and deduplicate the observations. For each group:

1. Inspect its recorded 5stack commit when available.
2. Inspect current policy, relevant skills, eval scenarios, and Git history.
3. Classify it as already addressed, usage or configuration issue, project-specific issue, or genuine systemic issue.
4. Explain already-addressed or project-specific items without changing 5stack.
5. For a systemic issue, add or update the smallest behavioral regression scenario and propose the smallest effective 5stack change.

Show the proposed diff before editing. One observation is evidence, not automatic proof of a systemic defect. Preserve good behavior while fixing bad behavior.

Ask for explicit approval of both the edits and a local commit. Only then modify 5stack and commit the approved change. Never push, merge, create a branch or worktree, or change remote state.
