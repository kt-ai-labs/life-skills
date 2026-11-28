# Agentic Execution — Proposal v0.3

**Status:** P01–P06 approved for implementation; candidate pending full independent audit. P07.1 (deterministic Ledger append with ordinary tests) additionally approved. Remaining P07, P08 and P09 deferred to the separate 0.4 research branch.
**Baseline:** Originally drafted on 0.2.2; main 0.2.5 merged at `1847f947c6ce36d74a091a231bf6eaafa963e629` before implementation.

This temporary proposal collects findings from a selective comparison with public agentic workflows and identifies candidates worth considering for 0.3. It is not operational Skill guidance. Discuss and decide each candidate before implementation. Remove this document once its purpose is fulfilled; retain only accepted guidance in the owning operational references.

## Motivation and design direction

Human attention is a scarce and valuable resource. The desired optimization is human attention and total cost per independently verified outcome, not the volume of AI-generated documentation or the number of tokens alone.

Generating an extensive upfront implementation plan is cheap relative to reading and repeatedly approving it, but additional detail cannot eliminate uncertainty that only execution resolves. Preserve progressive elaboration and rolling-wave planning: detail the Current Batch, outline the Next Batch, and maintain a minimal Remaining Overview that covers all obligations and material dependencies. Do not prescribe a complete sequence of future batches prematurely.

Keep human authority over intent, outcomes, governing strategic choices and permissions. Delegate operational decisions and independent verification within that authority. Preserve the existing separation between human-facing Task Definition and machine-facing execution records.

## Candidates worth considering

P01–P06 are approved for implementation on the 0.3 branch; the following is the original design rationale, not operational authority.

### P01 — Human Attention Principle

**Finding:** Public planning workflows often reduce agent cost without explicitly separating machine-readable detail from material requiring human judgment.

**Consider:** An explicit architectural principle in `SKILL.md`: minimize unnecessary human reading, repeated approvals and operational interventions per verified outcome without weakening human authority, evidence or independent review. Avoid fixed length limits that would suppress material information.

**Potential benefit:** Less attention spent supervising decisions that a competent Executor and independent Reviewer can resolve.

### P02 — Human Review Focus

**Finding:** [dzhng/skills](https://github.com/dzhng/skills) provides inspiration for surfacing consequential agent decisions rather than asking the human to inspect everything equally.

**Consider:** At existing Brief/Plan approval and required re-entry approval, highlight material AI interpretations, strategic judgments, assumptions, alternatives, trade-offs and unresolved uncertainties that merit human attention. For amendments, identify what changed and its consequences. Integrate this into the existing approval message, not a new mandatory artifact or approval gate.

**Guardrail:** The summary is a navigation aid, not a substitute for the complete identifiable governing documents or explicit approval. Do not manufacture decisions or imply agreement.

### P03 — Information Value in Discovery and Planning

**Finding:** [PM Claude Skills — writing-plans](https://github.com/mohitagw15856/pm-claude-skills/blob/main/plugins/pm-method/skills/writing-plans/SKILL.md) emphasizes resolving high-impact unknowns early, before expensive dependent work.

**Consider:** In `discovery.md`, prioritize proportionate investigation of unknowns capable of invalidating the proposed strategy, materially changing scope or eliminating unnecessary work. Consider the same principle when selecting operational prerequisites, without violating actual dependencies or extending Discovery into substantive Execution.

**Potential benefit:** Fewer expensive dead ends and avoidable Definition re-entry cycles. Do not require exhaustive research, a quantitative scoring system or a new queue.

### P04 — Risk Tripwires

**Finding:** The PM Claude Skills planning approach links risks to observable signals and intended reactions; similar reasoning is useful for material assumptions in long-running work.

**Consider:** For material risks or assumptions where useful, record the observable condition that would trigger reassessment and the expected response (e.g., stop affected work, use an already authorized fallback, replan, or request a reserved decision). Use existing Key Assumptions / Decisions, strategy and verification sections in `task-artifacts.md` and existing execution/re-entry rules.

**Guardrail:** No mandatory risk register, generic boilerplate or automatic authority expansion. Do not duplicate existing long-job reassessment guidance.

### P05 — Outcome Sufficiency

**Finding:** [GitHub Spec Kit](https://github.com/github/spec-kit) treats requirements quality as something to verify, not merely document. An analogous failure mode is completing every listed Objective while leaving the Intended Outcome inadequately addressed.

**Consider:** Explicitly require the existing Final Task Definition review to assess whether the combined Objectives, strategy and evidence obligations are sufficient to address the Intended Outcome and original human intent. If not, correct Definition through the existing process. Consider whether existing final substantive guidance already covers the corresponding execution-side question adequately.

**Guardrail:** An honest negative or inconclusive result may satisfy a research outcome when the approved method and evidence support it. Do not demand a predetermined positive result or introduce another Reviewer or gate.

### P06 — Proportionate Documentation

**Finding:** [Superpowers — writing-plans](https://github.com/obra/superpowers/blob/main/skills/writing-plans/SKILL.md) and its [release notes](https://github.com/obra/superpowers/blob/main/RELEASE-NOTES.md) describe reducing over-detailed plans and recording decisions rather than prewriting implementation. This complements the existing Agentic Execution prohibition on fine-grained execution steps in Task Plan.

**Consider:** Strengthen existing artifact guidance in `task-artifacts.md`: record information necessary to preserve intent, strategic decisions, constraints, obligations and verifiability; defer reversible operational details that the Executor can resolve at the appropriate time. Avoid repeated content, unnecessary boilerplate and detail without decision value. Apply progressive disclosure to human-facing communication while keeping complete authoritative records.

**Guardrail:** Conciseness must not omit required sections, substantive commitments, material uncertainty, dependencies, references or verification. Do not shorten governing definitions by replacing them with summaries.

## Other findings and disposition

| Source | Finding | Candidate disposition |
| --- | --- | --- |
| [Anthropic — Harness Design for Long-Running Application Development](https://www.anthropic.com/research/harness-design-long-running-apps) | Planner, generator and evaluator; independent evaluation of bounded work, with substantial cost trade-offs. | Comparable mechanisms already exist. Consider measuring marginal value of review gates; do not remove gates on this evidence alone. |
| [Superpowers](https://github.com/obra/superpowers) | Design and implementation planning, independent review, proportional planning and reduced upfront implementation detail. | P06; retain rolling-wave planning and do not require human approval of detailed Execution Plans. |
| [PM Claude Skills — executing-plans](https://github.com/mohitagw15856/pm-claude-skills/blob/main/plugins/pm-method/skills/executing-plans/SKILL.md) | Explicit verification, visible deviations, state notes and feedback on inaccurate plans. | Existing Ledger, operational replanning and Definition re-entry cover the lifecycle; consider plan feedback as experimental learning, not mandatory closeout paperwork. |
| [Wayfinder](https://github.com/mattpocock/skills/blob/main/skills/engineering/wayfinder/SKILL.md) | Resolve uncertainty through bounded decision-oriented work. | Bounded Discovery already covers the central idea; no new ticket infrastructure. |
| [Planning with Files](https://github.com/OthmanAdi/planning-with-files) | Persistent context and plan recovery. | Already covered by governing Definition and targeted operational recovery; no mandatory reread hooks. |
| [OpenSpec](https://github.com/Fission-AI/OpenSpec) | Domain-specific requirements and change specifications. | Complementary through existing Tools & Skills where authorized; avoid duplicating its artifacts or imposing its workflow globally. |
| [BMAD Method](https://github.com/bmad-code-org/BMAD-METHOD) | Specialized roles and structured lifecycle practices. | No demonstrated need for extra permanent roles or additional lifecycle artifacts. |

The previously reported `write-plan` by aumiity was not unambiguously identified; do not base implementation decisions on that unverified comparison.

## Experimental questions (not release requirements)

- Measure human attention time, material human interventions, human review volume and total cost per accepted outcome. Distinguish required reading from optional access to machine records.
- Compare batch size and reviewer model/effort against verification quality and total cost; evaluate marginal value of each gate under controlled conditions.
- Assess goal drift, recovery cost and effective-definition fidelity after compaction.
- Investigate whether cross-model independent review detects additional material defects.
- Consider lightweight plan feedback in consumer-owned experiments and retrospectives, without adding mandatory operational artifacts.

The comparisons and external reports are selective and qualitative, not a controlled benchmark proving relative effectiveness. The observed size of public documentation is not a measurement of actual human reading time. Revalidate source details before relying on specific external results.

## Constraints for any accepted implementation

Preserve the 0.2.5 operational invariants, human approval and launch, independent review, Single Focus, version-specific evidence and acceptance, lifecycle Ledger, recovery and waiting policy. Prefer small amendments to existing owning instructions. No new mandatory artifact, checklist, lifecycle gate, integration, permanent manager or consumer-project data. Keep main at the released 0.2.5 until explicit release acceptance; branch package/manifests are candidate 0.3.0. Audit the complete affected Skill before release.
