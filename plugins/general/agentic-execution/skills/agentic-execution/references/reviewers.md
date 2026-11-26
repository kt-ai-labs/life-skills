# Reviewer configuration and invocation

Executor is the main chat, not a reviewer. Task Plan contains exactly three roles. Defaults for unsupplied new-Task entries; present all for explicit human confirmation before main Discovery. No automatic change to existing Tasks.

```markdown
## Reviewer Profiles

Proposed — pending human confirmation.

- **Batch:** Discovery and Execution Batch planning/execution.
  - Codex: Sol Medium
  - Claude Code: Opus High
- **Final Substantive:** Task Definition and final substantive correctness.
  - Codex: Sol High
  - Claude Code: Opus High
- **Final Completeness:** Final obligation and evidence completeness.
  - Codex: Sol High
  - Claude Code: Opus High
```

Additional harness mappings use the same structure. Record actual human confirmation separately. Executor selection is not Plan configuration. These are recommended labels, not guaranteed public model names or API IDs. Where a needed profile label is unavailable, establish a supported human-confirmed choice before use; never guess equivalence or silently downgrade. Present both default harness mappings as proposals when applicable. If a harness is unavailable or not intended for the Task, the human may explicitly leave it unconfigured for all applicable roles; do not claim support or invoke that harness until a mapping is explicitly confirmed under the profile-change rules. All three roles must have confirmed mappings for the intended review harnesses before main Discovery.

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

1. Identify harness, select confirmed role entry. Inspect current supported model AND effort selection and independent context facilities. Require a supported explicit selection or verified configuration for both values; prose instructions alone, inherited unverified settings, guessed aliases or a shared-context fork cannot establish the requested setup.
2. Confirm no other active invocation for this Task; preserve the pending round and submit bounded gate scope, primary evidence and version references per [Review protocol](review-protocol.md). Fresh context must be independent of Executor and other reviewer conversations; authorized Task artifacts are legitimate shared evidence. Give it the governing version's relevant read-only review contract and gate instructions per Review protocol; never let automatic Skill activation switch it into Executor mode.
3. Verify actual invocation/context isolation, access, completion and response. Inspect available effective settings, overrides and fallback/substitution warnings. Label each model/effort **host-established**, **human-attested** (scope of observation), or **unknown**; keep requested values distinct. A reviewer self-report is not proof.
4. **Observability policy:** when supported explicit selection/verified configuration was used, independence, access and completed response are established, and no known mismatch or unresolved fallback warning exists, effective settings not exposed by the host may remain unknown. Record that limitation and which checks the host exposes; proceed without repeated human confirmation. This is V2's default, unless applicable human/project policy requires stricter verification. Do not extrapolate one UI attestation to later invocations or call unknown settings verified. On Resume preserve stricter existing policy and scoped exceptions; use V2 default for new Tasks, and for active legacy Tasks only with authorized adoption of V2 for pending gates, never retroactively relabel old acceptances.
5. **Hard stop** if confirmed mapping/selection unsupported, actual mismatch, fallback/substitution evidence unresolved, independence or completion cannot be established, required response/access/evidence missing, or stricter policy unmet. Recover/repeat under confirmed profile or request authorized resolution; no downgrade or self-acceptance. Capture the review envelope in Review protocol before accepting.

## Host facilities

- Codex: inspect installed subagent tools, explicit model/effort selection, agent/default overrides and fresh non-forked context option. Retain actual thread handle and use supported follow-up/wait/close. When the next gate depends on a reviewer, use native event/long wait under [Pending work and waiting](../SKILL.md#pending-work-and-waiting). Where the installed `wait_agent` supports `timeout_ms`, prefer an explicit bounded wait of 300000–600000 ms (5–10 minutes), or the longest suitable supported interval if constrained; shorten only for a real responsiveness, safety or human requirement. Prefer direct native waiting when nested wrappers return early; do not replace a supported long wait with frequent status calls. Inspect whether the installed tool waits for a particular target or any mailbox update, and whether it returns content or only a notification. Receive/retrieve the actual response through supported facilities and correlate completion and response with this pending round, not merely the retained thread; unrelated, partial or prior-round events are not completion. Mailbox delivery alone need not wake a finished parent turn. [Documentation](https://developers.openai.com/codex/multi-agent); [wait guidance](https://github.com/openai/plugins/blob/main/plugins/superpowers/skills/using-superpowers/references/codex-tools.md).
- Claude Code: inspect installed Agent tool, model/effort support, non-fork mode, model allowlists/forced overrides, effort environment overrides and fallback; retain agent/session handle and use supported resume. Prefer a supported blocking invocation or reliable completion notification to repeated status checks; do not assume notifications resume a finished turn. [Documentation](https://code.claude.com/docs/en/sub-agents).
- Other harness: require equivalent supported capability. Documentation is not proof of installed feature; never invent commands or grant more permissions. A host-supported separate isolated session is acceptable if same contract is established.

## Recovery and profile changes

Lost/incompatible reviewer: establish old invocation ended or cancel it where authorized and verify termination; start fresh isolated same role/current confirmed profile for pending gate, submit primary versions, earlier findings/decisions/corrections. Record replacement lineage; ignore late superseded responses. Do not rerun accepted work just for a new harness using an existing confirmed mapping.

Mapping change requires explicit human confirmation before use, retains prior provenance, retires incompatible context (verify any in-flight invocation ended before replacement). Before launch re-review affected definition and renew changed approved Plan per [Human approvals](human-approvals.md). After launch enter or continue pending definition re-entry even for profile-only change per [Changes and corrections](changes-and-corrections.md); use newly confirmed profiles for pending readiness and final definition, never require unavailable old profile to approve replacement. Prior valid acceptances survive absent real defect or applicable human policy.
