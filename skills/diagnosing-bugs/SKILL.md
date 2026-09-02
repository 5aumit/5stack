---
name: diagnosing-bugs
description: Diagnose difficult, intermittent, regression, performance, or poorly understood bugs through evidence and a repeatable feedback loop.
---

# Diagnose hard bugs

Use the global lightweight reproduce-evidence-fix-verify flow for trivial bugs. Use this fuller workflow only when the cause is unclear or the behavior is difficult to reproduce.

## Establish evidence

Drive the closest practical user flow and capture the exact symptom. Build the tightest useful feedback loop: a focused test, CLI command, HTTP request, browser flow, trace replay, benchmark, differential run, or small harness.

Prefer a deterministic agent-runnable signal, but do not pretend one is always possible. For intermittent behavior, measure a reproduction rate and run enough trials to distinguish a real change from luck. If access or evidence is missing, state what was tried and request the smallest missing artifact or authority.

Minimize the scenario when doing so narrows the cause without changing the bug.

## Determine cause

Form falsifiable hypotheses from evidence. Use multiple ranked hypotheses only when several causes remain plausible. Test one variable at a time with targeted instrumentation. Tag temporary debug output so it can be removed reliably. Measure performance before optimizing it.

## Fix and verify

Add a regression check at the closest useful behavioral interface when it provides real protection. Apply the root-cause fix, re-run the minimized signal, then re-run the original flow. For nondeterministic bugs, compare enough trials to support the conclusion.

Remove temporary instrumentation and artifacts. Record meaningful remaining uncertainty or a missing test interface, but do not automatically start an architecture workflow.
