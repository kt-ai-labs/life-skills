# Working Checkpoints

Use small working snapshots during lengthy phase work so interruption does not require repeating completed review. These are progress saves, not user approval gates. Final reports, history, inventory, and tasks remain the durable results.

## Location and contents

After archive/workspace confirmation and reading consent, use `<workspace>/de-stromwechsel/internal/checkpoints/`:

- `registry.md`: a short English index listing the current phase snapshot, its status and last update, and the last completed archive if present.
- `phase-<phase>-current.md`, for example `phase-0.1-current.md`: one English snapshot for the phase in progress, updated in place.
- `archive/last-completed.md`: at most one completed snapshot across all phases.

Keep checkpoint details and their registry out of `state.md`. The fixed location above provides discovery; state retains only overall phase status and durable-artifact links. Create checkpoint files only for actual work, without prebuilding future phases.

Save an initial snapshot after consent and initial inventory, before lengthy extraction or visual review, and mark the overall phase in progress in state. A checkpoint is not permission to read an unapproved archive. Update it after each meaningful document group or reconciliation and before moving into another lengthy pass. Record reviewed source paths/pages and their review status (including visual checks), compact findings with evidence, material unresolved questions, artifacts already saved, and the next step. Update the working inventory as review progresses. Store enough verified findings to resume, without copying full extracted documents or repeating entire reports/tasks. Mark unfinished checks explicitly.

## Resume and retention

When resuming an incomplete phase, read `registry.md` and only its current snapshot. If the registry is missing or inconsistent, inspect the checkpoint folder and repair the index from existing snapshots. Check that locations, consent, sources, and saved artifacts still apply; recheck changed or incomplete evidence. A missing state file alone does not invalidate a usable in-progress snapshot, but a user-requested fresh start must not reuse prior checkpoints.

At successful phase completion, first save and check the final report, inventory, history, tasks, and concise state as applicable. Only then archive the current snapshot as `archive/last-completed.md` and update the registry to show no active snapshot. Retain the previous archived copy until the new completed snapshot is safely saved, then remove the previous copy. Thus retention is bounded to one current snapshot and one completed archive; a temporary copy during safe rotation is acceptable. Never rotate or delete a current snapshot merely because execution stopped or the phase is partial.

Archived snapshots are recovery copies, not additional history reports. Read one only for recovery or a relevant user request. Cleanup applies exclusively to agent-created checkpoint files; preserve source documents, dated reports, and task history.
