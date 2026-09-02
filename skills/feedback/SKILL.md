---
name: feedback
description: Capture explicit user feedback about 5stack in the current project's feedback journal without changing 5stack itself.
---

# Capture 5stack feedback

Treat the user's argument as feedback to record, not as a request to edit 5stack.

Identify the behavior, preferred behavior, minimal task context, and positive, negative, or mixed signal. Do not interview unless the meaning is genuinely ambiguous.

Use `.agent-journal/5stack-feedback.md`. If it does not exist, create only the needed directory and feedback file using the installed 5stack template. Do not run full project setup.

Record:

- a stable `FB-YYYYMMDD-NNN` ID;
- date;
- source `explicit`;
- signal;
- current 5stack Git commit or description when it can be resolved from the installed skill symlink;
- observed behavior;
- expected or preferred behavior;
- minimal project and task context;
- status `unreviewed`.

Search existing entries first. Update an obvious duplicate instead of adding another copy.

Confirm in one short sentence with the entry ID and signal.
