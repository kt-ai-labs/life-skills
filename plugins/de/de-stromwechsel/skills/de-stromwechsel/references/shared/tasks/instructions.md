# Shared Task Register

Use this register across phases when the evidence or the user identifies a concrete follow-up action within the current phase's scope. Apply that phase's task-selection filters first; reading an older contract for context does not automatically make its payments in scope. It is a passive, user-facing list; it does not monitor events, send reminders, or perform actions on the user's behalf.

## Files and language

Store tasks under the user's confirmed workspace:

```text
<workspace>/de-stromwechsel/tasks/
├── active.md
└── done-<completion-year>.md
```

Create the directory and files only when there is a task to record. Keep open tasks in `active.md`. When a task is complete, move it to the `done-YYYY.md` file for the year it was completed; preserve prior entries. Write user-facing task files in the language of the first substantive request in the current run. Preserve existing entries in their original language unless the user asks for translation.

## What to record

Record a task only when it is an actionable obligation or follow-up supported by a document or explicitly requested by the user. Keep research gaps and unresolved questions in the relevant report or internal state unless they require a distinct action. Avoid duplicate or speculative tasks.

Each entry should briefly state:

- the action and who is responsible;
- a `Blocked` status only when an active task is waiting on a prerequisite; otherwise its presence in `active.md` means it remains open;
- an explicit eligibility result on eligibility-check tasks;
- a due date or trigger, only when supported by evidence or the user's instruction (label calculated dates as calculated);
- a dependency on another task, expressed as a relative link to the exact task entry when one must be completed first;
- the source document and page/section, or that the task was explicitly requested by the user.

Use relative links to source files when practical. A compact entry can follow this shape:

```markdown
### <Action>

- **Owner:** <user or skill on a user-initiated run>
- **Status:** <Blocked; use only for a blocked task in `active.md`>
- **Eligibility result:** <Eligible, Not eligible, or Unresolved; for eligibility-check tasks>
- **When:** <supported date or trigger; omit if unknown>
- **Depends on:** <relative link to the prerequisite task entry; omit if none>
- **Evidence:** <relative source link and page/section, or user request>
- **Completed:** <completion date; required in `done-YYYY.md`>
- **Result:** <concise outcome summary; required in `done-YYYY.md`>
```

## Provider payments and credits under concrete contracts

When in-scope documents for a concrete contract identify a provider-to-user payment or credit with unresolved entitlement or receipt, record linked follow-ups for both. Uncertain eligibility or payment timing does not remove the need for follow-up. If entitlement and actual receipt are already evidenced, record the result in the report without manufacturing completed task history; preserve any existing task entries. This rule does not apply to hypothetical market-search candidates.

For each distinct payment or credit that needs follow-up, use two linked tasks:

1. **Verify eligibility and terms.** Confirm the conditions, amount or calculation, payment method, and due date or trigger from the contract and supporting evidence. Record `Eligibility result` as `Eligible`, `Not eligible`, or `Unresolved`, with evidence. Do not mark this task complete unless an evidence-supported outcome is `Eligible` or `Not eligible`. If the outcome is unresolved, keep the task open and state what evidence or action is still needed.
2. **Verify receipt.** Check whether the payment or credit was actually received, using the supported due date or trigger when known. Set `Depends on` to a relative link to the exact eligibility task entry. Keep that link even when eligibility is confirmed and the eligibility task has moved to `done-YYYY.md`. While the result is `Unresolved`, keep the receipt task `Blocked`. If the result is `Eligible`, remove `Status: Blocked` and set `When` to the supported payment date or trigger. If the result is `Not eligible`, close the receipt task as not applicable and record the evidence; it must not remain an active check.

If eligibility is already established by the reviewed evidence, record `Eligible` and its evidence in the eligibility task and mark it complete; the dependent receipt task still tracks actual payment and links to the eligibility entry wherever it is filed. If evidence establishes `Not eligible`, record that result and close the receipt task as not applicable. Create separate pairs for distinct bonuses, refunds, or other credits. Keep the register passive: do not monitor accounts, send reminders, or contact the provider in the background.

## Updating tasks

On a user-initiated run, review relevant active tasks and update them only when the user confirms completion or supplied evidence supports it. Do not mark a task complete just because its due date has passed. `active.md` contains tasks that still need action; omit `Status: Open` because the file location already implies that state. Use `Status: Blocked` only when a prerequisite is unresolved. A task in `done-YYYY.md` is completed, so do not add a redundant `Status: Done` field. When moving a prerequisite to its completion file, update dependent tasks' links to the new entry.

When moving a task to `done-YYYY.md`, record its completion date and a concise **Result** summary, along with supporting evidence. If the result is brief, state it directly in the entry. If it needs detail, summarize the conclusion and link to the relevant report section. For eligibility tasks, include the explicit eligibility result. For receipt tasks, record the actual payment or applied credit, its date when known, and evidence. A bonus visibly applied on a bill proves receipt as an invoice credit; a bill showing a refund due does not prove the refund reached the bank account. A promised or calculated entitlement alone does not complete a receipt check.

Do not conduct background checks, issue reminders, or make applications, cancellations, or other commitments to complete a task.

Link to `tasks/active.md` from internal state when it exists; do not duplicate its entries there. At a phase checkpoint, summarize relevant active tasks for the user.
