# Repository Instructions

## Project plan

- At the start of every new work session in this repository, read [`docs/plan/README.md`](docs/plan/README.md) before substantive work. It is the concise entry point for the project's agreed direction, proposals, open questions, scope, and development approach.
- Read [`docs/plan/phases.md`](docs/plan/phases.md), [`docs/plan/knowledge-base.md`](docs/plan/knowledge-base.md), and [`docs/plan/decisions.md`](docs/plan/decisions.md) when the task touches their subject matter or requires a relevant prior decision. Do not require reading every plan document for unrelated work.

## Keep the plan current

- When work establishes or changes a material decision, resolves an open question, changes phase scope or status, or establishes durable guidance about data, privacy, or shared knowledge, update the relevant plan document in the same session. Do not defer a needed plan update to a later task.
- Prefer updating the existing document that owns the topic. If durable detail needs its own format or procedure, create one focused document, link it from the owning plan document, and avoid duplicating its contents elsewhere.
- Add only important decisions to [`docs/plan/decisions.md`](docs/plan/decisions.md), grouped under their date and given a stable sequential ID (`D-001`, `D-002`, ...). Keep each statement concise; routine implementation choices and temporary findings do not belong in the log.
- When a new decision replaces an earlier one, link to it with **Supersedes**; when it changes only part of an earlier decision, use **Overrides** and name the affected scope. Add a reverse link and status to the earlier entry, but preserve its original decision text.
- Preserve the distinction between **Agreed**, **Proposed**, and **Open**. Do not turn an unvalidated proposal into a requirement without a decision or evidence from implementation and testing.
- When updating project-plan documentation, briefly tell the user what changed and identify the updated document. Summarize it again in the final handoff when relevant.
