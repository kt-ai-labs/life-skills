# Shared Task Register

Use this register across phases when the evidence or the user identifies a concrete follow-up action within the current phase's scope. Apply that phase's task-selection filters first; reading an older contract for context does not automatically make its payments in scope. It is a passive, user-facing list; it does not monitor events, send reminders, or perform actions on the user's behalf.

## Files and language

Store tasks under the user's confirmed workspace:

```text
<workspace>/de-stromwechsel/tasks/
├── active.md
└── done-<closure-year>.md
```

Create the directory and files only when there is a task to record. Keep tasks that still need action in `active.md`. Move closed tasks to `done-YYYY.md` for the year of closure, preserving earlier entries. This archive includes completed tasks, tasks explicitly cancelled by the user, and tasks established as not applicable. Use a title that covers all closed outcomes, such as `Закрытые задачи — 2026` in Russian.

Write headings, field labels, generic statuses, and results in the language of the first substantive request in the run. Provider names and useful contractual terms such as Abschlag, Sofortbonus, and Neukundenbonus may retain their original wording. Preserve intentionally different-language earlier entries unless translation is requested; correct mixed metadata in entries authored or updated for this run. English field names and outcomes below describe semantics, not fixed output strings. For Russian, use labels such as `Владелец`, `Статус`, `Право на выплату`, `Когда`, `Зависит от`, `Основание`, `Закрыта`, `Итог закрытия`, and `Результат`, with these outcome values:

| Meaning | Russian wording |
| --- | --- |
| Eligible | Право подтверждено |
| Not eligible | Права на выплату нет |
| Conditional on a known future requirement | Зависит от будущего условия |
| Unresolved | Не выяснено |
| Blocked | Заблокирована |
| Cancelled by user | Отменена пользователем |
| Not applicable | Не применима |

## What to record

Record a task only when it is an actionable obligation or follow-up supported by a document or explicitly requested by the user. Keep research gaps and unresolved questions in the relevant report or internal state unless they require a distinct action. Avoid duplicate or speculative tasks.

Each entry should briefly state:

- the action and who is responsible;
- a `Blocked` status only when an active task is waiting on a prerequisite; otherwise its presence in `active.md` means it remains open;
- an explicit eligibility result on eligibility-and-terms checks;
- a due date or trigger, only when supported by evidence or the user's instruction (label calculated dates as calculated);
- a dependency on another task, expressed as a relative link to the exact task entry when one must be completed first;
- the source document and page/section, or that the task was explicitly requested by the user.

### Field order and date display

Keep the task title first, then the owner, then the `When` field, followed by other applicable fields. Put the supported date or trigger at the beginning of the `When` value, followed by a short explanation. Label calculated or estimated dates clearly; do not invent a date when only an undated trigger is supported.

### Sorting

- Sort `active.md` by the date in `When`, earliest to latest, so overdue and nearest actions appear first. Put entries without a calendar date after dated entries.
- Sort `done-YYYY.md` by the closure date, latest to earliest. Do not sort closed tasks by their expected `When` date.
- Do not group either file by task category; keep the chronological ordering across categories.

Use relative links to source files when practical. A closed entry also needs a closure date and concise result with evidence or the user's explicit decision. Include a closure outcome for cancellation or non-applicability; ordinary completion needs no redundant Done status. Keep the actual payment/event date distinct from the date the task was closed or the user confirmed it. Omit fields that do not apply.

## Financial follow-ups

Within the current phase's task-selection scope, every unresolved financial obligation or transaction supported by the reviewed evidence needs a task. Cover money owed by the user as well as payments or credits owed to the user: bills, debits, service fees, bonuses, refunds, credits, and discrepancies in their amounts or timing. A monetary figure alone does not create a task when no action remains. A scheduled payment date or a promise to pay does not establish that the transaction occurred.

For a one-off bill, charge, or fee, record a task to verify the amount and actual payment or debit when these remain unconfirmed. For recurring Abschläge, record one task to verify that the first scheduled payment or debit occurred with the expected amount and timing. Keep it open if that first payment is unconfirmed, including when its date has passed. Once confirmed, do not generate monthly checks; create another follow-up only when later evidence or the user identifies a change, missed or duplicate payment, or another discrepancy. Apply the procedure below to money owed to the user. All checks remain passive tasks for a user-initiated follow-up.

## Provider payments and credits under concrete contracts

When in-scope documents for a concrete contract identify a provider-to-user payment or credit with unresolved entitlement or receipt, record linked follow-ups for both. Uncertain eligibility or payment timing does not remove the need for follow-up. If entitlement and actual receipt are already evidenced, record the result in the report without manufacturing completed task history; preserve any existing task entries. This rule does not apply to hypothetical market-search candidates.

For each distinct payment or credit that needs follow-up, use two linked tasks:

1. **Verify eligibility and terms.** Establish the conditions, amount or calculation, payment method, and due date or trigger from the contract and supporting evidence. Record a localized outcome: eligible, not eligible, conditional on a known future requirement, or unresolved. Complete this review when the terms and currently checkable facts support an eligible, not-eligible, or conditional outcome. For a conditional outcome, name the outstanding condition and its date or trigger; completion means the review is finished, not that the future condition has occurred. Keep the review open when necessary terms or qualifying facts remain unresolved and state what evidence or action is needed.
2. **Verify receipt.** Check actual receipt on the supported payment date or trigger. Link to the exact eligibility-and-terms entry, retaining the link after it moves to `done-YYYY.md`. Block receipt while eligibility is unresolved. For eligible or conditional outcomes, keep the supported receipt check active; state any outstanding future condition in the receipt entry as well as the linked result. At that check, verify conditions due by then. If the user is not eligible, close receipt as not applicable with the evidence.

A user's intention to stay with a supplier is evidence of intent, not proof that a future continuous-supply requirement is fulfilled. Likewise, receiving money does not prove that a later retention condition has been met. If the contract promises an early payment while requiring supply to continue longer, retain the earlier receipt check and record the later condition explicitly. Describe forfeiture, recovery, or another consequence only when the contract supports it. Never infer a repayment mechanism merely from a future condition. Create separate pairs for distinct bonuses, refunds, or other credits; a conditional result does not itself require an extra task solely to wait for time to pass.

## Meter readings and direct submission

When an in-scope active contract supplies a documented end-of-supply date or another concrete reading trigger, create **one task** covering the entire action: read the meter on that date, photograph it, save the dated photo in the user's document archive, and report the reading directly to the **Netzbetreiber**. Submission to the supplier is optional and additional; do not rely on a supplier or intermediary to forward it. Include these steps in the same task description, without separate task IDs for reading, photographing, saving, and reporting.

Use an evidence-supported date or a date explicitly supplied by the user. A minimum contractual term ending is not proof of an actual supply end; do not invent a reading deadline from it. If the reading/photo already exists, retain only the steps still needed, such as submitting to or verifying receipt by the Netzbetreiber. Record the photo location, reading date/value, and submission confirmation when supplied. Keep the task open until its required steps are supported as complete. Phase 0.1 records this follow-up; it does not submit the reading or execute later task-processing phases.

## Updating tasks

Apply this procedure to later user updates in the same conversation, including after a phase checkpoint, even when the user does not name the skill again. Before editing, read `active.md` and the relevant closure-year files; reread these instructions if their requirements are no longer clear. Update completion only when the user confirms the action occurred or supplied evidence supports it. An overdue date alone is not completion. A user confirmation is valid evidence; identify it as such without implying that a bank document was reviewed.

When the user explicitly cancels a task, asks to remove it, or says they no longer want to do or track it, move it to the closure archive with a localized Cancelled by user outcome, closure date, and their reason when supplied; otherwise cite the explicit cancellation request without inventing a reason. Do not infer cancellation from an ambiguous aside or from a statement that a debit has not occurred. Keep an ambiguous task active and clarify if necessary. Cancellation records the user's decision; it does not establish payment or extinguish a contractual obligation. Review dependent tasks when a prerequisite closes; cancellation alone supplies no eligibility result and does not complete a receipt check.

For every closure, record a concise result and supporting evidence or user decision. Put a brief result directly in the entry; summarize longer findings and link to the report. For eligibility-and-terms tasks, retain the explicit outcome and any future condition. For receipt tasks, record the actual payment or applied credit and its event date when known. A bonus visibly applied on a bill proves receipt as an invoice credit; a refund shown as due does not prove bank receipt. A promised or calculated entitlement does not complete a receipt check.

### Reconcile before finishing an update

Review Active against Done on every task update and before the phase checkpoint. If an active entry already contains a supported completed result or explicit cancellation, recover the task's context from the entry, user statements, and relevant accessible evidence, then archive it appropriately. If the outcome cannot be established, retain it in Active with the uncertainty; do not invent a result. This also repairs mistakes left by an earlier update.

Save and check each closed entry in `done-YYYY.md` before removing it from `active.md`. Reuse an existing matching Done entry rather than duplicating it, preserving its result and evidence. Every removed active task must have a traceable closure outcome in Done; never replace Active with only the remaining tasks and silently lose the others. Preserve prior Done entries and task anchors, update dependent links when entries move, and confirm that each retained active task still needs action. Omit redundant Open or Done statuses; use Blocked only for a pending prerequisite, with localized wording.

Do not conduct background checks, issue reminders, or make applications, cancellations, or other commitments to complete a task.

Link to `tasks/active.md` from internal state when it exists; do not duplicate its entries there. At a phase checkpoint, summarize relevant active tasks for the user.
