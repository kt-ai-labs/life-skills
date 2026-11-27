# Agentic Execution — Observations

Temporary maintenance notes for the 0.3 discussion. Observations are not operational instructions, confirmed defects or approved changes. Keep consumer-project material private; record only generalized behavioral evidence here.

## OBS-001 — Repeated no-op shell calls around an independent review

**Observed:** 2026-11-27  
**Status:** Observed; root cause and impact pending behavioral diagnostic.  
**Harness:** Codex  
**Executor:** GPT-6.1 Sol Medium (operator-reported; increased from Sol Light for this run).  
**Reference contract:** Agentic Execution 0.2.2, particularly the waiting policy introduced in 0.2.1. Exact governing installed revision for the observed run has not yet been verified.

### Observation

During a single Execution run, the operator observed approximately 20–30 consecutive shell calls to `true` around a Batch Planning review. The visible activity sequence showed updates and read-backs of the review and Task Ledger records, repeated `true` calls, subsequent updates to planning/review/Ledger records, and a message reporting that Planning Acceptance had been obtained without findings.

The screenshots support the repeated no-op calls and visible sequence; the approximate count and Executor configuration are operator-reported. The review response, invocation timing, raw tool-call trace and governing Skill identity have not yet been independently verified. No consumer-project paths, screenshots, source code, actual Task records or proprietary details are included here.

A bare shell `true` returns success without performing substantive work, verification or blocking waiting. The calls are therefore a potential no-progress overhead pattern.

### Additional observations from the same run (2026-11-27)

- The same repeated `true` call pattern was visible around Batch Execution Review and again around Final Substantive Review. These are additional episodes within one run, not independent experiments.
- During the Batch Execution Review episode, the Codex UI reported failure to send a queued human message and offered retry, edit or deletion to continue the queue. The operator reported that the session had been hanging and appeared to recover. The cause, duration and any relationship to the no-op calls are unverified.
- During the Final Substantive Review episode, the human explicitly challenged the repeated calls. The Executor acknowledged (paraphrased) that it had looped on empty `true` calls instead of waiting for the Reviewer, that the calls performed no checks or changes, and that it intended to stop the pattern and use real waiting. This is an observed Executor self-report, not independent proof of the underlying cause, available wait facilities, or subsequent compliance.
- The repeated behavior therefore also consumed human attention through an intervention. The actual elapsed time, token cost and whether the intervention resolved the pattern remain unknown.

For the diagnostic, correlate the three review-stage episodes, the queued-message delivery failure, actual host events and the intervention. Check whether the pattern ceased after the intervention and whether any later gates or work were affected. Do not infer causation from temporal proximity or treat the Executor's acknowledgment as a verified root-cause analysis.

### Working hypotheses (unconfirmed)

- The Executor may have used repeated no-op tool calls as a surrogate for waiting on a Reviewer or receiving a completion event.
- This may instead reflect harness orchestration, notification delivery behavior or a workaround for unavailable or ineffective native waiting.
- If the Executor deliberately simulated waiting in this manner under the 0.2.2 contract, it would conflict with the existing requirement for genuine blocking or supported event-driven continuation and the prohibition on spinning. This does not yet establish a defect in the Skill itself.

### Follow-up: behavioral diagnostic after the run

- Recover the actual invocation and tool-call sequence, including who initiated the calls, their count, timestamps, elapsed intervals and relationship to Reviewer completion.
- Establish which native blocking/event-driven waiting facilities were available and whether they were attempted, supported or ineffective; inspect any relevant errors or host limitations.
- Determine why `true` was selected and repeated. Separate observed trace evidence from the Executor's retrospective explanation.
- Verify the pinned governing Skill revision and compare behavior with its waiting policy; distinguish instruction adherence, harness limitations and actual instruction ambiguity.
- Quantify time, token and cost overhead where reliable telemetry exists; report unknowns instead of speculative attribution.
- Establish whether the pattern is reproducible and whether Executor model/effort has an effect. A single observed Sol Medium run does not establish a causal relationship with the effort increase.

Let the run finish without diagnostic interference where safe. Do not prescribe a Skill change before establishing the root cause. Consider a correction for 0.3 only if evidence supports it; preserve the existing waiting and independent review invariants.
