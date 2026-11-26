---
name: agentic-execution
description: Define, review, approve, launch, execute or resume substantial bounded tasks through targeted discovery, evidence-based batches, independent reviews and durable checkpoints. Use for multi-step research, investigation, software work and other substantial tasks requiring verified outcomes; not for a one-off answer or routine small edit.
---

# Agentic Execution

Package release: `0.1.5`.

When activated to define, execute or resume a Task, this chat is the Executor: own work, human interactions, corrections and durable records. Use project instructions and domain skills. Do not delegate each unit or create a permanent manager.

A context explicitly assigned an independent review under this Skill is a read-only Reviewer, not an Executor. Follow the supplied governing Skill version's relevant review and gate instructions; return the actual decision or blocker. Do not initialize a Task, write its records, delegate another review or advance its lifecycle. The Executor instructions below do not authorize Reviewer actions.

**Progress invariant (Executor):** Once all prerequisites are verified, perform the enabled action next. Do not interpose redundant checks, rereads or status queries; reuse verified facts while their basis remains current. If attempts produce no new relevant evidence, reconcile once, then act if ready, try a materially different safe approach, genuinely wait on invoked work, or report a concrete blocker. Bookkeeping and unchanged results are not substantive progress. Do not hand a ready action back to the human. When the human answers an outstanding question or approval request, apply the answer and continue authorized work in that same turn per [Human approvals](references/human-approvals.md#resume-after-a-human-response); no separate Continue instruction.

## Executor: start and route

Read [Start and resume](references/start-and-resume.md) on invocation. Identify the Task, authorized work areas and actual stage; honor restrictions before writes. Report verified stage, blocker and next bounded action. Follow the current phase; load only its reference and linked protocols when needed. Reuse current, already-read guidance when its version and context are still reliable; reread on compaction, changed guidance or uncertainty. Once activated for a Task, keep this Skill active through compaction, interruption and resumption unless the human explicitly discontinues it. On recovery, locate and reread the governing Skill entrypoint and follow Recovery, not the whole Skill. Do not silently substitute a different version.

| Situation | Reference |
| --- | --- |
| New definition / re-entry | [Task Definition](references/task-definition.md) |
| Discovery assignment / readiness | [Discovery](references/discovery.md) |
| Human decisions, approvals, launch | [Human approvals](references/human-approvals.md) |
| Plan a Current Batch | [Execution planning](references/execution-planning.md) |
| Execute / accept / checkpoint Current Batch | [Execution](references/execution.md) |
| Interrupted work, lost context, handoff or abandonment | [Recovery and termination](references/state-and-recovery.md) |
| Strategy change or defect in accepted work | [Changes and corrections](references/changes-and-corrections.md) |
| Final reviews / completion | [Final acceptance](references/final-acceptance.md) |
| Any independent review or reviewer profile change | [Reviewers](references/reviewers.md) and [Review protocol](references/review-protocol.md) |

[Task artifacts](references/task-artifacts.md) defines formats; [Evidence and checkpoints](references/evidence-and-checkpoints.md) defines version/evidence preservation. Read when drafting or verifying those artifacts, not on every turn. Optional [examples](references/examples/README.md) illustrate formats only. Consumer-project proposals, observations and retrospectives are not operational instructions; do not load them for ordinary execution or review unless they are authorized Task inputs.

## Invariants

- Single Focus: each Discovery Assignment and executable E-Step has one coherent purpose and testable outcome. Related checks may share that purpose; separate unrelated work. One Executor works sequentially.
- Brief = WHAT/WHY; Plan = strategic HOW; Execution Plan = intended operational work; Ledger = actual events/evidence. Derived work cannot weaken governing obligations.
- Discovery is planning only. Independent definition acceptance, explicit human Brief and Plan approvals and launch are mandatory before substantive execution or Execution Plan creation.
- Required reviews are independent, read-only, one active review per Task at a time, using confirmed role profiles. Follow the profile observability policy in Reviewers; no known mismatch, unsupported selection, self-review, fictional response or unverified independence/completion. Resolve C/H/M and all mandatory checks before explicit version-specific acceptance.
- One executable Current Batch; accepted planning before affected work, accepted execution and verified checkpoint before advancement. Accepted batches are historical; corrections have new identities.
- Final substantive and distinct final completeness acceptance cover the whole Task on the same final substantive state.
- Preserve human authority, original inputs and material two-way dialogue throughout the lifecycle, actual review responses, recoverable versions and checkpoints. Read back gates before advancing. Respect pause/stop/withdrawal/abandonment and closed history; never overwrite unrelated work or force-push. No mandatory exclusivity declaration, separate state DB or lock.

## Pending work and waiting

Applies to every review and long-running job. Before invoking a review or long job that may outlive its call/turn, persist/read back pending intent and recovery basis in the existing phase record; record the available handle/receipt (or its absence) as soon as returned, before waiting or yielding. Missing identity does not prove absence. If dependent work cannot proceed, actually wait using a supported event-driven continuation or blocking tool on the pending operation, with suitable bounds for installed limits, safety and human responsiveness. Prefer the longest suitable wait to repeated short/default polls. A process/session yield, timeout, notification or empty output is not by itself proof of current liveness, progress or completion. Never simulate waiting with text or promises. Report material verified transitions/errors or requested/required updates, with the last observed state/time clearly distinguished from current status.

Repeated near-immediate or premature returns without meaningful invocation-specific evidence indicate an ineffective wait. Reconcile once and switch to a supported effective lower-overhead mechanism if available; if returns still prevent genuine waiting, report the wait blocker rather than spin. A genuinely elapsed capped short blocking wait is not itself a blocker: use the longest suitable interval while justified, without extra status queries after each ordinary timeout. Reassess at a proportionate elapsed-time/no-progress threshold using actual liveness, failure or result evidence and expected duration; do not reset the threshold on empty, duplicate or unrelated events. Healthy silent computation may justify extending the threshold; mere liveness is not progress. If no effective safe wait is available or state cannot be established at reassessment, report the concrete blocker and preserve pending state for Resume; do not stop after an arbitrary number of returns. Never cancel, relaunch, accept or advance merely because a wait timed out.

Honor new human restrictions immediately; use responsive waits as required. Before consuming results or advancing, reconcile invocation/result identity and affected governing state, not the entire Skill on each wakeup. End the turn pending an event only when the host actually supports automatic continuation without a new human turn and the operation is recoverable; a completion notification alone does not establish that capability. Otherwise keep a genuine wait active or report the pending blocker honestly.

Continue through authorized stages until a real blocker, human pause/termination, or verified completion. Report meaningful verified progress, not stale status; never promise unsupported background work. At completion give results, evidence, limitations and both final decisions. A pending gate is not success.
