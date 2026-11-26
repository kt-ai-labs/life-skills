# Start, preflight and routing

## Once per chat

Handle explicit pause, stop, withdrawal or abandonment immediately via [Recovery](state-and-recovery.md); do not delay for model preflight. Before substantial search/drafting, identify the harness and main model/effort from reliable host information or human attestation, labeling provenance and unknowns. Recommend Codex **Luna Max** or Claude Code **Haiku Medium** once when those profiles are supported in the actual environment; these labels are recommendations, not guaranteed public model IDs. If a recommendation is unavailable, state that fact and ask the human to select an available profile (offer supported alternatives without guessing equivalence); for another harness use only a known agreed default. If the harness is unknown, ask before recommending or selecting a profile. The human selects the Executor; offer supported switching only. Obtain explicit continuation (an explicit selection and instruction to proceed, given with knowledge of the recommendation, suffices; otherwise ask). This is cost consent, not Task approval or launch. Do not repeat on compaction. Record harness, current model/effort (including unknown), their provenance, human selection and continuation in the decision record only after resolving scope, confirming writable active/new Task state, authorized storage and governing Skill identity below. Existing Task restrictions and version recovery take precedence over this bookkeeping.

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

Use one authorized installed Skill; resolve references relative to its root. For a new Task, record and read back its governing recoverable revision and location in the existing decision record, before D00, after scope and authorized storage are established. A clean project-tracked Skill directory identified by commit and path, or a pinned source revision matching the installation, suffices. For local uncommitted content preserve a recoverable version by the project's existing mechanisms. A release label alone is insufficient; no additional identity file or routine full-file hashing is required.

On Resume or compaction, recover the recorded version and use its entrypoint and references. Establish that the actual copy matches that revision (e.g. Git revision and clean Skill path); only investigate content further if needed. For missing bootstrap or legacy records, recover the governing version from reliable history or recorded intent before finishing authorized initialization or recording the basis; never guess a version or infer adoption. If it cannot be recovered, block affected work; honor immediate human restrictions regardless.

Keep unfinished Tasks on their governing version; normally adopt updates for new Tasks only. If the human explicitly authorizes switching an unfinished Task, record the old and new revisions and reason. Reconcile affected pending jobs/reviews and verify the impact on governing requirements, authority, evidence and all still-relied-on gates, including earlier acceptances. Independently verify compatibility of affected acceptances or re-establish affected gates and required approvals using existing lifecycle rules (new correction batches for accepted work) before dependent work or closure. Record the effective revision and disposition; do not reinterpret an old review under a changed contract. Preserve valid history; if compatibility or necessary historical evidence cannot be established, block affected work. No separate migration process or additional mandatory gate.

## Route

- New Task → [Task Definition](task-definition.md).
- Existing active Task / handoff / compaction → [Recovery](state-and-recovery.md).
- Reviewed/approved but unlaunched → [Human approvals](human-approvals.md).
- Closed or restricted → report state and applicable next action read-only, except explicitly authorized termination bookkeeping under Recovery.

New chat/harness alone does not invalidate valid approvals or reset profiles. Surface suspected stale external facts as a note; refresh only when requested or genuinely needed.
