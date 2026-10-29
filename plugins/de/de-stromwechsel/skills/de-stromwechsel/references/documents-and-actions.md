# Research documents and user actions

Read when material verification needs human assistance, documents or material web evidence are retained, or an existing yearly action register needs review. Keep the user's workspace language and privacy rules from SKILL.md.

## Closing a blocked verification

For ordinary tariff research, **no registration or account login by default**. Do not suggest creating an account to read terms or advance into an application to obtain documents. A login wall closes that route, not all public research.

After diagnosis and reasonable public alternatives, offer scoped human help for a material gap. Explain the provider/product/channel, exact question, prior checks, stopping point and sufficient evidence. Offer both an existing isolated shared browser where control is actually supported, and an independent-browser route with the source link, search inputs and verified navigation; label unverified steps. Accept a screenshot, copied text or PDF as appropriate, not a PDF by default. Use the existing Human Assistance protocol in `browser-research` when available, otherwise the available tool's handoff rules, including **Full Research Pause**: after requesting help, stop all research until the user explicitly confirms completion or returns control. No other skill or browser integration is required.

Never perform or ask the user to perform an application, contract acceptance, paid-service confirmation or irreversible checkout just to obtain research evidence. If the document is available only after contracting, stop that route and record the limitation. Human help does not authorize bypassing a tool/security restriction; an independently user-provided document can be inspected through permitted file access.

For a saved file, ask for its location when unclear and verify actual access before reading. Do not assume a browser download is in system Downloads. Use existing file/PDF tools and validate the provider, product/channel, campaign/version and relevant conditions against the research question. A general AGB, a wrong-campaign PDF or an unreadable file does not close an offer-specific gap. Keep received evidence distinct from the bonus/contract assessment in the research protocol, then continue that assessment rather than stopping at file retention.

## Optional durable archive

Retain documents and web evidence that materially support or change a decision under `<workspace>/<target-year>/docs/<provider>/`; keep AGB, Preisblatt, Bonusbedingungen and other relevant sources separately. This includes tariff prices/conditions, guarantee scope/exclusions, bonus eligibility/termination/payout conditions, campaign disclosures and other decision-critical web-only terms. Archive selectively, not every visited page or browser interaction. This is an ordinary accessible folder on local storage, OneDrive, a Git workspace or another filesystem location; no Git workflow, cloud API or service is required. Honor available permissions and disclose persistence failure. Do not migrate or duplicate the user's historical archive indiscriminately.

Copy downloaded original PDFs and other original files byte-for-byte into the archive and verify the saved copy; keep originals intact. Never reconstruct an original PDF from extracted text or screenshots. Keep agent interpretation in a separate note or report. Minimize personal data in stored evidence, refer to the private profile rather than repeating the full supply address, and apply the private-workspace rules; never silently publish or commit it. Do not delete old versions automatically.

When an HTML/web page is the relevant source, especially without a downloadable document or for changing offer-specific conditions, save a compact Markdown evidence document in the same provider folder. Include:

- Provider, product/tariff, relevant channel/campaign and original source URL. State the applicable quotation scenario or offer version where relevant; label unestablished applicability/version as unknown.
- Source publication/revision date, or explicitly unknown; retrieval/observation timestamp; and a separate evidence-file creation/generation timestamp. Include timezone for both timestamps; do not infer a source date from either.
- Relevant factual excerpts or concise faithful descriptions of the observed conditions, clearly separated from agent interpretation/assessment.
- Links to the relevant report or offer where useful.

This Markdown file records observed evidence; it is not an original provider document. Use existing file capabilities without new dependencies or conversion tools.

Use kebab-case provider folders and filenames without underscores:

`<document-date>-<document-type>.<extension>`

Use the original document's or web source's own date/revision, not download, retrieval or evidence-file creation date: `YYYY-MM-DD`, `YYYY-MM`, or `unknown-date`. Examples: `2027/docs/yello/2026-08-01-agb-strom.pdf`, `2026-10-21-bonusbedingungen.pdf`, `2025-01-agb-strom.pdf`, `unknown-date-preisblatt.pdf`, `unknown-date-bonusbedingungen-web-evidence.md`. These illustrate naming, not actual retained documents. Do not invent a date or document type; use `unknown-type` if identification remains unresolved and explain it.

On a collision, reuse an identical document or add a short product/campaign/version distinction supported by its contents. Never overwrite a different document; if no distinction is established, append a short content-hash suffix and record the unresolved version distinction. Link important retained evidence from the existing research report, preserving the source URL/page (or user-provided origin), retrieval date and associated offer; link it from an action entry when relevant. No separate archive index or database is needed.

## One yearly user-action register

Create `<workspace>/<target-year>/action-required.md` only when an unresolved action genuinely needs the user's participation. Reuse it across runs and keep resolved entries as evidence; it is not a list of future agent research or a new per-run task file. Offer help in the conversation, rather than merely recording a silent request. Keep user-deferred topics in the research context, not as `waiting` tasks. Questions the agent can still investigate, and technical blocks without a requested human action, stay in the report. If help is declined or fails, preserve the outcome and continue useful independent verification only after explicit return of control under Full Research Pause.

Only entries that meet this human-action criterion use stable local task IDs and these statuses; `blocked` does not create an entry for unfinished agent research:

| Status     | Meaning                                                                                                                   |
| ---------- | ------------------------------------------------------------------------------------------------------------------------- |
| `waiting`  | A specific user action is requested; no usable result has been supplied.                                                  |
| `provided` | The user supplied a file/result; agent verification is pending.                                                           |
| `verified` | The agent checked the result and established its applicability; the substantive research question still needs assessment. |
| `closed`   | The material information gap is answered and the conclusion/evidence is recorded.                                         |
| `blocked`  | Assistance was attempted but failed, or no permitted route remains; the gap is still open.                                |

Record the check and conclusion explicitly. A wrong campaign or missing conditions returns the task to `waiting` for a specified correction, or `blocked` if no route remains, with the failed verification explained. A checked but unsuitable file is not a successful `verified` result. Transition through intermediate statuses within one turn when justified; do not stop after file verification instead of completing the assessment. Reopen a closed task if later evidence invalidates its conclusion.

Each compact entry needs:

- ID, current status/date, provider/offer, missing question and the condition for closing it.
- The human action, why the agent needs it, prior checks, source page/session or file location, prohibited legal actions, and a link to the relevant report.
- What was received, saved document/result link, verification outcome and remaining gap or closing conclusion. Keep these fields unknown until evidence exists.

At the start of each new substantive report briefly summarize important unresolved actions with task links and their impact; include enough context for the report to stand alone. Read the existing register on continuation, update the same entries and link verified evidence in the report. Downloading a file is not equivalent to checking its conditions or closing the task.
