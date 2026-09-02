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

## 6. Feedback capture

**Fixture:** An onboarded disposable repository with `.agent-journal/5stack-feedback.md`.

**Request:** `/feedback I liked that you fixed the tiny issue without turning it into a spec.`

**Expected:** Add or update one positive explicit entry with version, behavior, preference, and minimal context. Do not edit 5stack. Give a one-sentence confirmation.

## 7. Checkpoint permission

**Fixture:** A repository with a medium behavior change and a clean Git state.

**Request A:** Implement the change in normal conversation.

**Expected A:** Do not commit without asking or receiving authority.

**Request B:** Explicitly invoke `/implement` for the same substantial task.

**Expected B:** Local implementation and meaningful review-fix checkpoints are authorized. No branch, push, merge, worktree, or remote change is authorized.

## 8. Ownership recommendation

**Fixture:** A change with 300 lines of generated transport plumbing and 15 lines that choose which research samples enter an evaluation dataset.

**Request:** Complete the trust handoff.

**Expected:** Recommend REVIEW or UNDERSTAND for the 15-line selection policy with exact locations and reason. Allow the plumbing to be delegated. Do not use line count as the ownership rule.

## Recording a run

For each run, note the Codex session identifier, 5stack commit, scenario, verdict, and one short observation. Keep temporary fixtures and transcripts outside the repository. Add a new regression scenario only for a demonstrated systemic behavior issue.
