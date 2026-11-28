# Reviewer configuration and invocation

Executor is the main chat, not a reviewer. Task Plan contains exactly three roles. For new Tasks propose mappings for both Codex and Claude Code for all three roles, regardless of the current Executor harness. Establish explicit human confirmation before main Discovery; one clear confirmation of the complete presented configuration suffices. No automatic change to existing confirmed Tasks.

```markdown
## Reviewer Profiles

Proposed — pending human confirmation.

- **Batch:** Discovery and Execution Batch planning/execution.
  - Codex: Sol High
  - Claude Code: Opus High
- **Final Substantive:** Task Definition and final substantive correctness.
  - Codex: Sol High
  - Claude Code: Opus High
- **Final Completeness:** Final obligation and evidence completeness.
  - Codex: Sol High
  - Claude Code: Opus High
```

Use the same structure for other explicitly requested harnesses. Record human confirmation separately; Executor selection is session-specific, not Plan configuration. Labels are recommendations, not guaranteed model IDs. Propose both standard harness mappings unless the human explicitly restricts the Task to fewer harnesses; document that restriction. Do not infer exclusion from current harness or local availability. Respect explicit selections already given, propose only missing in-scope mappings, and resolve ambiguous confirmations. A confirmed mapping is the requested profile, not proof of installed capability. For explicitly adopted legacy Tasks, previously confirmed complete three-role configurations remain valid in their established scope, even when only one harness was configured under the older contract; record that grandfathered scope in the adoption decision. This documented legacy exception satisfies the profile gate in Definition, Discovery and Human approvals without new confirmation; it does not authorize an unconfigured harness. Add missing mappings only by explicit confirmation under the existing mapping-change rules. Unconfirmed legacy drafts follow the new default for missing mappings. Verify support for the selected model and effort when that harness is actually used (before invocation); disclose known incompatibilities and resolve them before affected use. Never guess equivalence or silently downgrade.

## Lifecycle

| Role | Profile | Context |
| --- | --- | --- |
| Discovery Batch | Batch | Fresh per definition cycle; retain for milestones/readiness |
| Final Task Definition | Final Substantive | Fresh per definition cycle, distinct from Discovery; retain for corrections |
| Combined Execution Batch | Batch | Fresh per batch; retain for planning and execution and their correction loops |
| Final Substantive | Final Substantive | Fresh whole-task review; follow final protocol for follow-up |
| Final Completeness | Final Completeness | Distinct fresh context after substantive acceptance |

At most one active review within this Task; retained idle contexts allowed. No cross-Task lock or standalone Plan/Approval Impact Reviewer. Read-only tools if supported; prohibit edits/external actions. If a reviewer mutates artifacts or acts externally, reject the compromised round, stop affected work and retire that context. Preserve any actual response (or verified interruption disposition per [Review protocol](review-protocol.md)) and record the rejection, actual changes/effects and authority; reconcile safely without silently undoing unrelated work. Assess earlier decisions from that context and downstream evidence for actual compromise; preserve valid historical decisions, but block reliance on affected ones until independently revalidated. Verify the old invocation ended, then obtain valid independent review in a fresh context before crossing affected gates.

## Invoke and verify

1. Identify harness, select confirmed role entry. Establish installed support for model AND effort selection and independent context facilities; reuse that capability/configuration check while current. For each invocation require a supported explicit selection or verified configuration for both values; prose instructions alone, inherited unverified settings, guessed aliases or a shared-context fork cannot establish the requested setup.
2. Confirm no other active invocation for this Task; preserve the pending round and submit bounded gate scope, primary evidence and version references per [Review protocol](review-protocol.md). Fresh context must be independent of Executor and other reviewer conversations; authorized Task artifacts are legitimate shared evidence. Invoke per Review protocol once ready.
3. Verify actual invocation/context isolation, access, completion and response. Inspect available effective settings, overrides and fallback/substitution warnings. Label each model/effort **host-established**, **human-attested** (scope of observation), or **unknown**; keep requested values distinct. A reviewer self-report is not proof.
4. **Observability policy:** when supported explicit selection/verified configuration was used, independence, access and completed response are established, and no known mismatch or unresolved fallback warning exists, effective settings not exposed by the host may remain unknown. Record that limitation and which checks the host exposes; proceed without repeated human confirmation. This is the default, unless applicable human/project policy requires stricter verification. Do not extrapolate one UI attestation to later invocations or call unknown settings verified. On Resume preserve stricter existing policy and scoped exceptions; use the default for new Tasks; apply a changed default to an active Task only with authorized adoption of the new governing Skill release for pending gates, never retroactively relabel old acceptances.
5. **Hard stop** if confirmed mapping/selection unsupported, actual mismatch, fallback/substitution evidence unresolved, independence or completion cannot be established, required response/access/evidence missing, or stricter policy unmet. Recover/repeat under confirmed profile or request authorized resolution; no downgrade or self-acceptance. Capture the review envelope in Review protocol before accepting.

## Host facilities

- Codex: follow [Codex harness guidance](harness/codex.md) for installed subagent facilities, profile selection, independent context and pending work. The common invocation and acceptance requirements above still apply.
- Claude Code: inspect installed Agent tool, model/effort support, non-fork mode, model allowlists/forced overrides, effort environment overrides and fallback; retain agent/session handle and use supported resume. Follow the Skill's waiting rules; prefer supported blocking invocation or event-driven continuation. [Documentation](https://code.claude.com/docs/en/sub-agents).
- Other harness: require equivalent supported capability. Documentation is not proof of installed feature; never invent commands or grant more permissions. A host-supported separate isolated session is acceptable if same contract is established.

## Recovery and profile changes

Lost/incompatible reviewer (including a retained idle context that cannot be resumed after a harness switch): establish any old invocation ended or cancel it where authorized and verify termination; start a fresh isolated same-role context using the current confirmed mapping for the next required gate, even when its round has not yet been prepared. Submit primary versions, earlier accepted planning/readiness decisions and relevant findings/corrections; preserve valid earlier acceptances. This is the exception to retaining the same reviewer within a definition cycle or batch. Record replacement lineage; ignore late superseded responses. Do not rerun accepted work, change the Plan, require definition re-entry or re-confirm the existing mapping just for a new harness using an existing confirmed mapping; verify actual capability and recover compatible independent context or replace it for a pending gate.

Mapping change requires explicit human confirmation before use, retains prior provenance, retires incompatible context (verify any in-flight invocation ended before replacement). Before launch re-review affected definition and renew changed approved Plan per [Human approvals](human-approvals.md). After launch enter or continue pending definition re-entry even for profile-only change per [Changes and corrections](changes-and-corrections.md); use newly confirmed profiles for pending readiness and final definition, never require unavailable old profile to approve replacement. Prior valid acceptances survive absent real defect or applicable human policy.
