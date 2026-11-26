# Start, preflight and routing

## Once per chat

Handle explicit pause, stop, withdrawal or abandonment immediately via [Recovery](state-and-recovery.md); do not delay for model preflight. Before substantial search/drafting, identify the harness and main model/effort from reliable host information or human attestation, labeling provenance and unknowns. Recommend Codex **Luna Max** or Claude Code **Haiku Medium** once when those profiles are supported in the actual environment; these labels are recommendations, not guaranteed public model IDs. If a recommendation is unavailable, state that fact and ask the human to select an available profile (offer supported alternatives without guessing equivalence); for another harness use only a known agreed default. If the harness is unknown, ask before recommending or selecting a profile. The human selects the Executor; offer supported switching only. Obtain explicit continuation (an explicit selection and instruction to proceed, given with knowledge of the recommendation, suffices; otherwise ask). This is cost consent, not Task approval or launch. Do not repeat on compaction. Record harness, current model/effort (including unknown), their provenance, human selection and continuation in the decision record only after resolving scope and confirming writable active/new Task state.

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

Use the host's actual discovered Skill location or an explicitly configured project-local installation; resolve references relative to that Skill's own root. Do not assume a repository path, global cache location, or automatic instruction reinjection after compaction. Identify the governing Skill from its entrypoint and installed manifest if present. A package version or cache path alone does not establish content identity. Establish a recoverable identity for the complete operational Skill (entrypoint and all operational references): e.g. a pinned source revision verified against the actual loaded files, or a recoverable authorized local version with verifiable content identity. Record where to recover that content; a digest alone or a moving branch is insufficient. Verify against the actual copy, not merely the catalog. If multiple candidates exist, resolve the authorized one, and do not combine references or review contracts from competing copies.

For a new Task, after scope and writable-state resolution, preserve the original request and record/read back Skill name, lifecycle contract, package release, recoverable operational content identity and runtime continuation in the existing decision record before D00 or substantive Task work. Do not create records for closed/restricted Tasks without authority. Label unavailable metadata; missing optional metadata does not block a verified recoverable identity. If the governing content cannot be identified and recovered, block affected work instead of recording a guessed version. Recheck identity on compaction, resumption, or evidence of changed instructions; do not repeatedly hash unchanged files on every ordinary tool return.

For an existing Task, read its available governing record and restrictions before using the installed release to advance or write. A legacy Task may lack release metadata: recover its established instructions from actual history or another reliable authorized source, and record the basis only when authorized. Never infer adoption from an absent record. If content is unavailable, ambiguous or different, stop affected work (immediate human restriction handling still applies) and ask for authorized recovery or adoption.

A release or operational-content change during an unfinished Task requires explicit human authorization identifying the old and new recoverable versions and a recorded compatibility assessment of lifecycle/artifact contracts, pending jobs/reviews, current gate and affected decisions/evidence. Reconcile or safely suspend affected in-flight work under [Recovery](state-and-recovery.md) before switching; never use an old pending result as acceptance under a different review contract without independent verification. If the old release cannot be recovered, state that limitation and block any affected gate whose governing history cannot be verified; authorization alone does not repair missing evidence. Preserve valid historical approvals and review provenance, re-establish affected pending gates under the applicable Definition, approval-impact, planning or final-review rules before advancement, and do not silently migrate historical artifacts. Record/read back the effective version and compatibility disposition in existing Task records. These checks are part of existing preflight and Recovery, not a new lifecycle gate.

## Route

- New Task → [Task Definition](task-definition.md).
- Existing active Task / handoff / compaction → [Recovery](state-and-recovery.md).
- Reviewed/approved but unlaunched → [Human approvals](human-approvals.md).
- Closed or restricted → report state and applicable next action read-only, except explicitly authorized termination bookkeeping under Recovery.

New chat/harness alone does not invalidate valid approvals or reset profiles. Surface suspected stale external facts as a note; refresh only when requested or genuinely needed.
