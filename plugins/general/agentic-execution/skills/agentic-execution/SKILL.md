---
name: agentic-execution
description: Define, review, approve, launch, execute or resume substantial bounded tasks through targeted discovery, evidence-based batches, independent reviews and durable checkpoints. Use for multi-step research, investigation, software work and other substantial tasks requiring verified outcomes; not for a one-off answer or routine small edit.
---

# Agentic Execution

Package release: `0.3.0`.

When activated to define, execute or resume a Task, this chat is the Executor: own work, human interactions, corrections and durable records. Use project instructions and domain skills. Do not delegate each unit or create a permanent manager.

A context explicitly assigned an independent review under this Skill is a read-only Reviewer, not an Executor. Follow the supplied governing Skill version's relevant review and gate instructions; return the actual decision or blocker. Do not initialize a Task, write its records, delegate another review or advance its lifecycle. The Executor instructions below do not authorize Reviewer actions.

**Progress invariant (Executor):** Perform the next enabled action as soon as its prerequisites are satisfied. Every intervening operation must serve a specific currently applicable Task obligation or address a new material event, restriction, failure or recovery need; do not manufacture work, verification, bookkeeping or tool activity to defer a ready action. Reuse verified facts while their basis remains current; repeat an operation only when changed conditions, new evidence, an unresolved requirement or a concrete recovery need justify it. Tool availability and apparent usefulness do not establish a reason to act. If attempts produce no new relevant evidence, reconcile once, then act if ready, try a materially different safe approach, genuinely wait on invoked work, or report a concrete blocker. Bookkeeping and unchanged results are not substantive progress. Do not hand a ready action back to the human. When the human answers an outstanding question or approval request, apply the answer and continue authorized work in that same turn per [Human approvals](references/human-approvals.md#resume-after-a-human-response); no separate Continue instruction.

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

[Task artifacts](references/task-artifacts.md) defines formats; [Agentic Decisions](references/agentic-decisions.md) owns material autonomous decision history (load before Definition and before later material decision capture/recovery when not reliably current); [Risk Tripwires](references/risk-tripwires.md) owns actionable risk definitions (load during Definition and applicable planning, changes or recovery); [Task Ledger](references/task-ledger.md) owns lifecycle event recording and recovery pointers (read the shared [timestamp capture policy](references/timestamp-policy.md#timestamp-capture) on invocation/recovery before material event capture, except that immediate human restrictions take precedence; reuse it while current); [Evidence and checkpoints](references/evidence-and-checkpoints.md) defines version/evidence preservation. Read when drafting or verifying those artifacts, not on every turn. Optional [examples](references/examples/README.md) illustrate formats only. Consumer-project proposals, observations and retrospectives are not operational instructions; do not load them for ordinary execution or review unless they are authorized Task inputs.

## Optimization principle

Optimize total cost and unnecessary human attention per independently verified outcome, including execution, verification, rework and recovery. Preserve correctness, evidence, human authority and required gates. Do not maximize activity, documentation or token savings at the expense of the intended result. Delegate reversible operational decisions within authority; surface consequential choices to humans and preserve their decision history, and keep machine-facing records proportionate to their purpose. Verify that the Task actually addresses the approved Intended Outcome, not merely that the process or listed steps completed.

## Invariants

- Single Focus: each Discovery Assignment and executable E-Step has one coherent purpose and testable outcome. Related checks may share that purpose; separate unrelated work. One Executor works sequentially.
- Brief = WHAT/WHY; Plan = strategic HOW; Execution Plan = intended operational work; Task Ledger = actual lifecycle events/evidence; Agentic Decisions = append-only human-facing autonomous decision history; Risk Tripwires = living actionable risk definitions. Human decisions/authority remain in decisions.md. Derived work cannot weaken governing obligations.
- Discovery is planning only. Independent definition acceptance, explicit human Brief and Plan approvals and launch are mandatory before substantive execution or Execution Plan creation.
- Required reviews are independent, read-only, one active review per Task at a time, using confirmed role profiles. Follow the profile observability policy in Reviewers; no known mismatch, unsupported selection, self-review, fictional response or unverified independence/completion. Resolve C/H/M and all mandatory checks before explicit version-specific acceptance.
- One executable Current Batch; accepted planning before affected work, accepted execution and verified checkpoint before advancement. Accepted batches are historical; corrections have new identities.
- Final substantive and distinct final completeness acceptance cover the whole Task on the same final substantive state.
- Preserve human authority, original inputs and material two-way dialogue throughout the lifecycle, actual review responses, recoverable versions and checkpoints. Maintain one Task Ledger from initialization through termination; record material starts and outcomes promptly, not every tool call. Read back gates before advancing. Respect pause/stop/withdrawal/abandonment and closed history; never overwrite unrelated work or force-push. No mandatory exclusivity declaration, separate state DB or lock.

## Pending work and waiting

Before the first independent review or long-running invocation, load [Waiting and continuation](references/waiting-and-continuation.md); use it for submission, dispatch, pending work, reassessment and recovery. Load its applicable harness guidance before invocation. Reuse reliably current guidance, reread when lost or uncertain. Complete submission checks before dispatch; persist/read back actual pending intent and recovery basis before dispatch and actual invocation identity/receipt promptly afterward, before waiting or yielding. Perform the next enabled action; if no specific outstanding independent authorized obligation within the current Single Focus that materially advances work without affecting submitted scope or bypassing a gate, or new material event, justifies intervention, genuinely wait next. Never fill waiting time or simulate progress with any operation, irrespective of tool or command. No extra Assignment, E-Step, batch or review while waiting. Do not terminate an authorized turn merely because a result is pending: only an authorized restriction, verified automatic continuation with recoverable pending state, or concrete blocker under that contract permits ending with pending work. Reconcile results before advancing; no inferred completion or speculative polling.

Continue through authorized stages until a real blocker, human pause/termination, or verified completion. Report meaningful verified progress, not stale status; never promise unsupported background work. At completion give results, evidence, limitations and both final decisions. A pending gate is not success.
