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

### External corroboration (2026-11-27)

Public Codex issue reports describe related failure modes. These are user reports and diagnostic leads, not proof that this run has the same root cause.

- [#38132 — placeholder shell output during agent coordination](https://github.com/openai/codex/issues/38132): a Windows coordinator reportedly substituted repeated PowerShell output commands for agent-state tools.
- [#19325 — no-op shell tool-selection loop](https://github.com/openai/codex/issues/19325): repeated `true` and `printf` despite explicit user correction, in a different tool-use scenario (GPT-5.4 Medium).
- [#35259 — repeated parent inference during wait/status polling](https://github.com/openai/codex/issues/35259): one reported session had four subagent launches, 234 waits and approximately 140.7 million input tokens overall, mostly cached. This is not a measurement of waiting alone or of billed cost.
- [#31935 — blocking-wait duration guidance](https://github.com/openai/codex/issues/31935): users describe conflicting guidance concerning long native waits and frequent commentary. Verify whether equivalent constraints actually apply to the installed harness/model; do not assume they explain OBS-001.
- [#64090 — long-horizon multi-agent monitoring trap](https://github.com/openai/codex/issues/64090): a report describes 852 short wait-loop iterations and about 62.1 million tokens attributed to empty wait turns in one worker. It also reports an isolated successful experiment with event-driven wake-up via `wake_on_agent_messages`. The report warns that long shell/code-mode polling cells may delay delivery of child messages. These are externally reported measurements, not independently reproduced results.

### Open investigation — temporary waiting workaround

**Goal:** Find a practical, low-overhead temporary workaround for Codex pending-review/job waiting while the underlying failure is investigated or fixed upstream. Do not make a workaround a permanent cross-harness requirement.

Candidates to test in an isolated, authorized environment:

1. Native blocking wait, using the actual supported tool and target identity, e.g. a five-minute timeout (`timeout_ms: 300000` if supported). Verify that it genuinely blocks, wakes appropriately on completion or relevant events, and does not cause repeated premature returns.
2. If native waiting is ineffective, evaluate a bounded five-minute shell-based fallback (e.g. `sleep 300` with an actual supported blocking wait/yield mechanism). Check that the *outer* tool call genuinely waits rather than returning immediately and inducing a new polling loop. A timer is not an agent-status check or completion signal. Confirm that human interruption, urgent reviewer messages and result retrieval remain reliable; reject this option if it suppresses them, violates host constraints or merely moves the polling overhead elsewhere.
3. Investigate the experimental event-driven `wake_on_agent_messages` feature reported in #64090 and the relevant installed-client capabilities. Test automatic parent continuation and recovery without requiring a human turn. Do not enable it globally or assume corporate/IDE compatibility.
4. Investigate supported host-local wait configuration, including the user-reported configuration approach in #31935, only within authorized settings and applicable host constraints. Do not try to bypass higher-priority instructions or safety restrictions.

Compare the candidates against native/default behavior on the same bounded synthetic reviewer workload. Measure real elapsed blocking time, parent model requests, no-op calls, cached/non-cached token usage, completion-to-continuation latency, human interventions and message delivery. Confirm one active invocation, reliable result correlation, preserved pending records, and no duplicate launches or premature acceptance. If no effective safe wait is available, retain the existing blocker/Resume behavior instead of spinning.

**Disposition:** open experimental question for 0.3. No workaround is approved, no installed configuration is changed, and the 0.2.2 operational contract remains unchanged.


## Retrospective diagnostic — OBS-001 update (2026-11-27)

Source: generalized read-only retrospective of the same completed run, using persisted Executor and Reviewer journals, lifecycle records and available telemetry. These are reported findings from one run, not independent maintainer replication. No private artifacts or project identifiers are imported.

- Governing releases: 0.2.1 initially; 0.2.2 installed but not adopted; 0.2.3 explicitly adopted later. 0.2.4 installed during late closeout but did not govern the completed Task.
- Verified by the diagnostic: 106 unique Executor-authored `true` calls (32 initial planning, 6 correction/resubmission, 54 first final substantive preparation/review, 14 corrective planning after human intervention). 94 occurred while reviews were pending and 12 before dispatch. Native targeted blocking waiting with a 300000 ms requested timeout worked already under 0.2.1. No preceding failed native wait explained the first loop.
- After 0.2.3 adoption, no further `true` calls were observed, but see OBS-002. The run used native fallback, not demonstrated automatic continuation.
- Current configuration contained `wake_on_agent_messages = true`; historical effective enablement and the cause of the missing automatic wake were not established. The UI delivery failure remains unverified and cannot be causally attributed to the no-op calls.
- Controlled reproduction, actual-client feature verification and matched model comparisons remain open. No shell workaround is approved; the demonstrated effective native wait takes precedence.

## OBS-002 — Behavioral substitution and enabled-next-action failure

**Observed:** 2026-11-27  
**Status:** Diagnostic-confirmed in one run; behavioral reproduction pending.  
**Related findings:** AE-D02, AE-D03; OBS-001.

Following required invocation recording/readback under 0.2.3, the Executor performed 40 unnecessary operations (33 Git checks and seven clock calls) before genuine waits across four reviews: 4, 6, 12 and 18 respectively. The checks found no changed submitted content or other authorized obligation. The associated intervals totaled about 151 seconds; a completed follow-up response was consumed about 40 seconds late. These intervals may overlap other activity and must not be added indiscriminately.

Across both governing periods, the diagnostic found 146 avoidable tool calls associated with 75 usage-recorded Executor responses out of 244 (53 no-op sampling groups and 22 pre-wait probe responses). Associated input: 14,299,341 tokens, of which 14,278,904 cached; output 5,955; separately reported reasoning 1,192. These associations are not a measured counterfactual cost or billing estimate.

The diagnostic classified the recurring behavior as instruction-following failure: the next enabled action was deferred in favor of no-progress activity even when native blocking waiting was available. The disappearance of a particular command did not establish compliance. No causal model/effort attribution or missing harness capability was demonstrated.

Patch candidate 0.2.5 (PR #9) strengthens the generic invariant and waiting discipline, treats commands as non-exhaustive examples, and assesses material deviations in existing reviews. No new gate, telemetry, mandatory instrumentation or polling. Verify actual behavior using a delayed synthetic review: after required receipt bookkeeping, consume available results or enter effective waiting directly unless a concrete applicable obligation or new material event justifies action. Check for substitution across tools, unnecessary inference and result-consumption delay, not merely absence of `true`. Consider further 0.3 changes only on evidence.

## OBS-003 — Unsupported termination of authorized execution

**Observed:** 2026-11-27  
**Status:** Diagnostic-confirmed in one run; harness cause unestablished.  
**Related finding:** AE-D04 (High).

Under 0.2.1, the Executor ended an authorized turn with corrective planning review pending, without a human pause, established automatic continuation or concrete blocker. The child completed 37 seconds later; no automatic parent continuation was observed. Later human status-only restriction was correctly honored, and explicit resume restored execution. Do not attribute the entire subsequent idle interval to the initial cessation.

Investigate effective automatic continuation in the matching client with authorized harmless synthetic operations, including completion racing with turn termination, terminal/nonterminal messages, failure, interruption and applicable deadlines. A configuration value or completion notification alone is insufficient. Verify direct native blocking fallback when automatic continuation is unestablished. Patch candidate 0.2.5 makes the continuation decision explicit; effectiveness remains untested.

## OBS-004 — Selective timestamp capture and review detection

**Observed:** 2026-11-27  
**Status:** Diagnostic-confirmed in one run; 0.2.4 behavioral validation pending.  
**Related findings:** AE-D01, AE-D05, AE-D06.

Of 128 Ledger events, 51 had uncertainty in their timing fields. In 51 Execution/closeout events, 39 contained unknown occurrence times: one recovered historical completion and 38 current transitions. The Executor captured reliable clocks near selected reviewer dispatches and preserved them across records, but often failed to capture preparation, receipt/acceptance, step and checkpoint boundaries. Delayed bookkeeping contributed; clock failure and compaction as primary cause were not supported. Intermediate/final tracking reviews did not diagnose the systematic pattern. One late closeout reused a prior clock after intervening verification.

The 0.2.4 common timestamp policy and existing tracking checks directly address these mechanisms in specification. Do not retroactively apply it to the run or invent historical times. Validate current/remote-observed/historical transitions, timely capture and reuse, and reviewer distinction between justified uncertainty and avoidable omission without clock polling or exhaustive session replay. No additional timestamp rule proposed for 0.2.5.

## OBS-005 — Positive architectural evidence

**Observed:** 2026-11-27  
**Status:** Positive observations from the same diagnostic; not universal guarantees.

The run preserved governing revision across installations, performed explicit adoption and compatibility assessment, reread complete effective Brief and Plan after both Executor compactions, recovered actual child responses and replaced unavailable contexts appropriately. Sequential execution, scoped checkpoints, independent reviews and same-state final acceptance remained coherent. Final Substantive review detected a localized factual miss that survived intermediate acceptance; a corrective batch and renewed whole-task acceptance resolved it (AE-D07). These observations support retaining the architecture rather than adding gates or replacing it on the basis of this run.

All findings above are generalized maintenance evidence, not operational instructions or approved 0.3 design changes. The raw retrospective and consumer-specific evidence remain private.
