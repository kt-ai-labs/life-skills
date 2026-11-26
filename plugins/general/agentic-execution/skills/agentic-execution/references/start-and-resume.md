# Start, preflight and routing

## Once per chat

Handle explicit pause, stop, withdrawal or abandonment immediately via [Recovery](state-and-recovery.md); do not delay for model preflight. Before substantial search/drafting, identify the harness and main model/effort from reliable host information or human attestation, labeling provenance and unknowns. Recommend Codex **Luna Max** or Claude Code **Haiku Medium** once; for another harness use only a known agreed default. If the harness is unknown, ask before recommending or selecting a profile. The human selects the Executor; offer supported switching only. Obtain explicit continuation (an explicit selection and instruction to proceed, given with knowledge of the recommendation, suffices; otherwise ask). This is cost consent, not Task approval or launch. Do not repeat on compaction. Record harness, current model/effort (including unknown), their provenance, human selection and continuation in the decision record only after resolving scope and confirming writable active/new Task state.

## Resolve and inspect

Read applicable project instructions (including nested AGENTS.md or equivalent). Resolve Task Directory (records) and authorized Working Directory/areas (actual work); they may be separate or span repositories. Ask only when intent, location, authority or scope is materially ambiguous. Access is not authorization.

Inspect records/history and actual work read-only before initializing or writing. Distinguish:
- Reference to previous work (possibly unstructured or post-factum): use as context, not an active Task or proof of conformity.
- Resume an existing Task: restore durable gates and actual state.
- New Task that assesses, extends or replaces prior work: new identity and approvals; distinguish past execution from verified result and draft labels.
- Closed Completed or Abandoned Task: preserve read-only history; new work uses a new Task.
- Paused, stopped or authorization-withdrawn Task: no ordinary writes/work until authorized resolution; explicit Resume suffices for a still-authorized pause, not withdrawal or abandonment.

Never infer approval, incompleteness, launch or authority from a directory/status alone. Reuse existing records. For active/new authorized work no exclusivity declaration, lock or mandatory takeover confirmation: the human coordinates parallel work. Before replacing material records or work, check the target still matches the version read; use version-aware writes where available. If evidence of competing writes or conflicting state arises, stop affected writes, inspect actual differences and authority, reconcile safely or ask. Preserve unrelated changes and never force-push; recheck state after integration and before a gated write. For in-flight reviews or external actions reconcile actual status; one active review still applies. See [Recovery](state-and-recovery.md).

## Skill identity and continuity

Use the host's actual discovered Skill location or an explicitly configured project-local installation; resolve references relative to that Skill's own root. Do not assume a repository path, global cache location, or automatic instruction reinjection after compaction. Identify the governing release from its entrypoint and, when available, the installed manifest and recoverable source ref/content identity. Check consistency; an advertised release alone does not establish that a locally modified copy is identical. If multiple candidates exist, identify the authorized one; do not combine competing instructions.

For a new Task, include Skill name, lifecycle contract, package release and recoverable source/version identity where available in the existing runtime continuation decision record before D00 or other substantive Task work; label unknowns. Keep a project-local source or release reference sufficient to recover the governing instructions. For an existing Task, recover the recorded or otherwise reliably established governing identity before continuing. A legacy Task may lack release metadata: preserve its established instructions and record the basis only when authorized; never infer that it has adopted this package. If the required release cannot be located or materially differs, stop affected work and ask for authorized recovery or adoption. A release change requires explicit human authorization and reconciliation of affected pending gates, records and compatibility; preserve valid historical approvals and review provenance. Do not silently migrate historical artifacts. These checks are part of existing preflight and Recovery, not a new lifecycle gate.

## Route

- New Task → [Task Definition](task-definition.md).
- Existing active Task / handoff / compaction → [Recovery](state-and-recovery.md).
- Reviewed/approved but unlaunched → [Human approvals](human-approvals.md).
- Closed or restricted → report state and applicable next action read-only, except explicitly authorized termination bookkeeping under Recovery.

New chat/harness alone does not invalidate valid approvals or reset profiles. Surface suspected stale external facts as a note; refresh only when requested or genuinely needed.
