# Execute a batch and advance

Verify current Planning Acceptance per [Execution planning](execution-planning.md). Use [Evidence and checkpoints](evidence-and-checkpoints.md) for evidence and versioning.

## Execute each Single Focus Step

1. Verify actual dependencies and valid earlier results; stop affected work on invalid inputs or reserved decisions.
2. Execute authorized work, cheap checks before costly operations. Preserve failures, skipped checks and limitations. For potentially non-idempotent actions persist/read back authorized intent, target and expected result before acting; reconcile actual outcome before retry.
3. Record actual output/checks, input and implementation versions and evidence in Ledger. Material changes to executable scope or prerequisites require renewed Planning Acceptance before affected work; strategy failure/earlier defect → [Changes and corrections](changes-and-corrections.md).

### Long-running work (when applicable)

Plan proportionate verification before expensive/irreversible runs: actual executable/environment identity, input versions, permissions and data isolation, clean output destinations, fresh versus reused work, completion/error signals, proportionate no-progress reassessment criteria and recoverable evidence. Cheap preflight must test the real path/assumptions; disclose changes to execution copies or instrumentation and verify that intended work actually ran. Keep local/private evidence access-controlled. No universal harness, telemetry or mandatory polling interval.

Apply [Pending work and waiting](../SKILL.md#pending-work-and-waiting). For a long job that may outlive its tool call/turn, persist/read back pending intent, input/command identity, output/evidence location and available recovery basis in the existing applicable records (Ledger during Execution) before launch. Add available process/session handle or receipt as soon as returned, before further waiting or yielding; label missing identity and reconcile an uncertain launch before retry, even for costly read-only computation. Use the supported blocking wait or completion event; in Codex use an explicit long suitable `yield_time_ms` or other supported wait control if available, respecting actual tool caps and safety/interaction needs. Do not confuse a command yield, tool timeout or absence of output with process exit or progress. Check actual exit/result/liveness evidence as needed; prefer deterministic in-tool monitoring when supported and authorized, not repeated model calls. Preserve actual exit status and results. No speculative token attribution. If interrupted, recover existing results/checkpoints rather than blindly rerun.

## Execution Acceptance and checkpoint

Give the **same Combined Execution Batch Reviewer** recoverable actual implementation/artifacts, evidence, Ledger, effective requirements and plan changes; apply [Reviewers](reviewers.md) and [Review protocol](review-protocol.md). Require explicit acceptance of technical/domain substance and completeness/truthfulness of required work, checks, evidence and tracking. Correct, rerun affected checks and resubmit until accepted. Renew Planning Acceptance first if material plan changed.

After acceptance verify/create scoped durable checkpoint per Evidence and checkpoints. Record/read back acceptance, evidence and checkpoint in Ledger; pending until verified. Recover exact accepted content if interrupted; no substitution. Retire reviewer and advance only after checkpoint; follow [Execution planning](execution-planning.md) to reconcile suspended dependents before ordinary Next Batch promotion. Earlier batches are historical; use correction batches. When no work remains route to [Final acceptance](final-acceptance.md).

## Ledger (actual state, not second plan)

Append material events, using UTC or explicitly unknown, Task/batch/E-Step/O-ID, status (e.g. partial, performed-unverified, failed, reviewed, checkpointed, suspended), actual commands/procedures/results/limits, version and primary evidence links, dependency impact, review/disposition/checkpoint and authorization pointers as applicable. Record pending external intent/outcome. Maintain a concise current recovery pointer: effective definition, phase, active/suspended batch IDs, open findings and next action. Update summary without erasing history. Do not duplicate full decisions/reviews or count planned checks as performed. Reconcile on [Recovery](state-and-recovery.md).
