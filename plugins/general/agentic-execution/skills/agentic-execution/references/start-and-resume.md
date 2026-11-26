# Start, preflight and routing

## Once per chat

Handle explicit pause, stop, withdrawal or abandonment immediately via [Recovery](state-and-recovery.md); do not delay for model preflight. Before substantial search/drafting, identify harness and main model/effort from host evidence or human attestation; label provenance and unknowns. Recommend supported Codex **Luna Max** or Claude Code **Haiku Medium** once (recommendations, not guaranteed model IDs); for another harness use only an agreed default. If the recommendation is unavailable, say so and offer supported alternatives, without guessed equivalence. If harness is unknown, ask before recommending/selecting. The human selects the Executor; offer only supported switching. Explicit selection and instruction to proceed suffices; no second confirmation. Otherwise obtain explicit continuation. This is cost consent, not Task approval or launch. Do not repeat on compaction. Record harness, current model/effort (including unknown), their provenance, human selection and continuation in the decision record only after resolving scope, confirming writable active/new Task state, authorized storage and governing Skill identity below. Existing Task restrictions and version recovery take precedence over this bookkeeping.

## Resolve and inspect

Read applicable project instructions (including nested AGENTS.md or equivalent). Resolve Task Directory (records) and authorized Working Directory/areas (actual work); they may be separate or span repositories. Ask only when intent, location, authority or scope is materially ambiguous. Access is not authorization.

Inspect records/history and actual work read-only before initializing or writing. Distinguish:
- Reference to previous work (possibly unstructured or post-factum): use as context, not an active Task or proof of conformity.
- Resume an existing Task: restore durable gates and actual state.
- New Task that assesses, extends or replaces prior work: new identity and approvals; distinguish past execution from verified result and draft labels.
- Closed Completed or Abandoned Task: preserve read-only history; new work uses a new Task.
- Paused, stopped or authorization-withdrawn Task: no ordinary writes/work until authorized resolution; explicit Resume suffices for a still-authorized pause, not withdrawal or abandonment.

Never infer approval, incompleteness, launch or authority from a directory/status alone. Reuse existing records. For active/new authorized work no exclusivity declaration, lock or mandatory takeover confirmation: the human coordinates parallel work. Before replacing material records or work, check the target still matches the version read; use version-aware writes where available. If evidence of competing writes or conflicting state arises, stop affected writes, inspect actual differences and authority, reconcile safely or ask. Preserve unrelated changes and never force-push. At a gate verify only its affected scope and required facts. Reuse established facts across operations while their basis remains current; refresh affected facts after relevant edits, integration, recovery uncertainty or signs of competing writes, and check any new prerequisite. Bookkeeping-only edits do not invalidate verified substantive state (see [Evidence and checkpoints](evidence-and-checkpoints.md#identifying-reviewed-content)). Do not poll unchanged Git/Skill state. For in-flight reviews or external actions reconcile actual status; one active review still applies. See [Recovery](state-and-recovery.md).

## Skill identity and continuity

Use one authorized installed Skill; resolve references relative to its actual root. For a new Task, record and read back its governing recoverable revision and location in the existing decision record, before D00, after scope and authorized storage are established. A clean project-tracked copy of the complete operational Skill identified by commit and path, or a pinned source revision matching the installation, suffices. Check resolved targets, not merely a clean symlink or cache/catalog pointer. For local uncommitted content preserve a recoverable version by the project's existing mechanisms. A release label alone is insufficient; no additional identity file or routine full-file hashing is required.

On Resume or compaction, recover the recorded version and use its entrypoint and references. Establish that the actual copy matches that revision (e.g. Git revision and clean resolved Skill path); only investigate content further if needed. For missing bootstrap or legacy records, recover the governing version from reliable history or recorded intent before finishing authorized initialization or recording the basis; never guess a version or infer adoption. If it cannot be recovered, block affected work; honor immediate human restrictions regardless.

Keep unfinished Tasks on their governing version; normally adopt updates for new Tasks only. If the human explicitly authorizes switching an unfinished Task, persist/read back the pending adoption (old and new recoverable revisions and reason) in the existing decision record. Reconcile affected pending jobs/reviews before switching; assess the impact on governing requirements, authority, evidence and all still-relied-on gates, including earlier acceptances. Record/read back the effective revision and which affected gates remain pending before using the new contract. Independently verify compatibility of affected acceptances or re-establish affected gates and required approvals using existing lifecycle rules (new correction batches for accepted work) before dependent work or closure. On interruption, resume any pending adoption or affected gate reconciliation from these records, not from the installed version. Do not reinterpret an old review under a changed contract. Preserve valid history; if compatibility or necessary historical evidence cannot be established, block affected work. No separate migration process or additional mandatory gate.

## Route

- New Task → [Task Definition](task-definition.md).
- Reply to an outstanding question or approval request with reliable current context → continue current phase per [Human approvals](human-approvals.md#resume-after-a-human-response); no Recovery solely because of a new turn.
- Resume after interruption, handoff, compaction or uncertain state → [Recovery](state-and-recovery.md).
- Reviewed/approved but unlaunched → [Human approvals](human-approvals.md).
- Closed or restricted → report state and applicable next action read-only, except explicitly authorized termination bookkeeping under Recovery.

New chat/harness alone does not invalidate valid approvals or reset profiles. Surface suspected stale external facts as a note; refresh only when requested or genuinely needed.
