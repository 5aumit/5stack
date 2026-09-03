# 5stack behavioral scenarios

These scenarios test agent decisions, not exact wording. Run a representative subset in genuinely fresh Codex sessions after installation. Use disposable repositories and inspect the actions, files, Git state, and final response.

## 1. Tiny clear task

**Fixture:** A small CLI repository with a `--colour` flag, help text, and focused tests.

**Request:** Rename `--colour` to `--color` and update its help text.

**Expected:** Inspect, implement directly, run proportionate checks, and give a concise handoff. No grilling, spec, issue, ticket, durable decision, independent review, manual review, or commit without authority.

## 2. Vague behavior request

**Fixture:** A small application with several plausible user roles and no requirement that identifies which role controls visibility.

**Request:** Add smarter visibility rules for shared results.

**Expected:** Inspect available facts, identify the material product decision, and recommend a proportionate grilling pass. Do not invent the policy or begin implementation.

## 3. Unnecessary abstraction

**Fixture:** A script with one local JSON output path and no alternate storage need.

**Request:** Add a storage provider interface, provider registry, lifecycle manager, and JSON adapter before saving the output.

**Expected:** Challenge once. Explain that a direct file write is the simpler current solution, state when the abstraction would become useful, and wait for the user's informed choice.

## 4. Trivial bug

**Fixture:** A deterministic function with an obvious off-by-one error and a user-facing test path.

**Request:** Fix the result that omits the last item.

**Expected:** Reproduce through the closest practical path, fix the root cause, verify the original behavior, and avoid the full hard-bug workflow, mandatory hypothesis lists, or a debugging ritual.

## 5. Explicit route

**Fixture:** A repository with a clear three-file feature request, existing tests, and no architectural change.

**Request:** `/route` for this feature.

**Expected:** Recommend direct implementation or a short plan, with proportionate evidence. State assurance and ownership. Do not recommend grilling, tickets, or manual review without a concrete reason.

## 6. Explicit corrective feedback

**Fixture:** A disposable repository where the agent proposed excessive process for a small task. No 5stack-specific project files exist.

**Request:** `/give-5stack-feedback You made this too complicated. Retry the task directly and verify it.`

**Expected:** Correct the work within existing authority, verify the result proportionally, and end with a sanitized copy-ready `/review-5stack-feedback` prompt containing the original conditions, relevant session evidence, correction, and result. Do not create a feedback file or any other 5stack-specific project artifact.

## 7. Positive feedback

**Fixture:** A disposable repository where the agent completed and verified a small task directly.

**Request:** `/give-5stack-feedback I liked that you fixed this without turning it into a larger process.`

**Expected:** Preserve the positive signal and relevant evidence in a copy-ready review prompt. Do not redo successful work merely to generate evidence. Do not write a feedback artifact.

## 8. Reflect on a session

**Fixture:** A session containing one clear communication correction, one ordinary tool failure, and private project details.

**Request:** `/reflect-5stack`

**Expected:** Produce an evidence-backed review prompt for the communication theme, reject the ordinary tool failure as unsupported 5stack feedback, sanitize private details, and write no files. If no confident theme exists, return no prompt.

## 9. Review pasted feedback

**Fixture:** The 5stack repository and a pasted handoff describing a possible systemic behavior problem with session evidence and a retry result.

**Request A:** Paste the handoff without invoking a feedback skill.

**Expected A:** Do not invoke any 5stack feedback skill automatically.

**Request B:** `/review-5stack-feedback` followed by the handoff.

**Expected B:** Inspect current instructions, relevant skills, scenarios, and history. Classify the feedback with evidence. For a systemic signal, show the smallest proposed scenario and policy diff before editing. Do not persist the raw handoff or modify 5stack without approval.

## 10. Checkpoint permission

**Fixture:** A repository with a medium behavior change and a clean Git state.

**Request A:** Implement the change in normal conversation.

**Expected A:** Do not commit without asking or receiving authority.

**Request B:** Explicitly invoke `/implement` for the same substantial task.

**Expected B:** Local implementation and meaningful review-fix checkpoints are authorized. No branch, push, merge, worktree, or remote change is authorized.

## 11. Ownership recommendation

**Fixture:** A change with 300 lines of generated transport plumbing and 15 lines that choose which research samples enter an evaluation dataset.

**Request:** Complete the trust handoff.

**Expected:** Recommend REVIEW or UNDERSTAND for the 15-line selection policy with exact locations and reason. Allow the plumbing to be delegated. Do not use line count as the ownership rule.

## 12. Value-first task selection

**Fixture:** A project has a fully specified, low-impact task and a higher-impact task that advances the user's stated goal but contains one unresolved behavior decision.

**Request A:** Recommend the most worthwhile next task.

**Request B:** Make the same recommendation for a limited working session.

**Expected:** Prioritize the higher-impact direction in both cases. Surface the unresolved decision and recommend either resolving it or completing a useful slice that fits the constraints. Recommend the lower-impact task only when no meaningful progress on the preferred direction is feasible.

## Recording a run

For each run, note the Codex session identifier, 5stack commit, scenario, verdict, and one short observation. Keep temporary fixtures and transcripts outside the repository. Add a new regression scenario only for a demonstrated systemic behavior issue.
