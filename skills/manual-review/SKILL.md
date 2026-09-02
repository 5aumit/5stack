---
name: manual-review
description: Guide a human through the small code areas they should review or understand after meaningful implementation work.
---

# Guided manual review

Use this when the final ownership recommendation is REVIEW or UNDERSTAND and personal inspection adds value.

Read the spec or request, final diff, independent review, evidence, and relevant journal entries. Divide the important code into conceptual chunks. Do not dump the full diff.

For each chunk:

1. Explain in plain project-specific language what it controls.
2. Give exact functions, files, and line ranges to read.
3. Explain why those lines need correctness judgment, understanding, or both.
4. State what surrounding code can be delegated.
5. Pause for the user's inspection and questions.

Record meaningful conclusions, change requests, and completed review status. Update current project memory when the review changes understanding or a decision. Do not record routine comments or the conversation transcript.
