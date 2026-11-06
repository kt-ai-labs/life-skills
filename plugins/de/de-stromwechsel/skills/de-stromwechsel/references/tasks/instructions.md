# Shared Task Register

Use this register across phases when the evidence or the user identifies a concrete follow-up action. It is a passive, user-facing list; it does not monitor events, send reminders, or perform actions on the user's behalf.

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
- a due date or trigger, only when supported by evidence or the user's instruction (label calculated dates as calculated);
- the source document and page/section, or that the task was explicitly requested by the user.

Use relative links to source files when practical. A compact entry can follow this shape:

```markdown
### <Action>

- **Owner:** <user or skill on a user-initiated run>
- **When:** <supported date or trigger; omit if unknown>
- **Evidence:** <relative source link and page/section, or user request>
```

## Updating tasks

On a user-initiated run, review relevant active tasks and update them only when the user confirms completion or supplied evidence supports it. Do not mark a task complete just because its due date has passed. Move completed items from `active.md` to the appropriate `done-YYYY.md` and record the completion date and evidence. Do not conduct background checks, issue reminders, or make applications, cancellations, or other commitments to complete a task.

Link to `tasks/active.md` from internal state when it exists; do not duplicate its entries there. At a phase checkpoint, summarize relevant active tasks for the user.
