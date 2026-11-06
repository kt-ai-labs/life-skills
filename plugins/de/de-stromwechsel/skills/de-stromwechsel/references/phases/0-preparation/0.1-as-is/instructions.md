# Phase 0.1 — As-Is Research

## Goal and boundary

Establish the user's current electricity-supply situation from accessible records. Leave a readable, evidence-backed report and enough private state to resume later.

Inventory the user's existing documents where they are. Do not sort, move, copy, rename, or otherwise reorganize the old archive. Phase 0.1 does not research market offers, recommend a new tariff, or submit or cancel a contract.

## Model recommendation at launch

In an OpenAI/Codex environment, at the beginning of a new Phase 0.1 run, before substantive review, recommend **GPT-6 Luna Extra High** as the starting configuration. Tell the user they may switch this same chat to it, or keep their current model, then reply `Continue` to begin. Wait for that confirmation; do not repeat the gate when resuming the same run or if the current request already explicitly confirms the recommendation and asks to proceed. Treat `Continue` as user authorization to proceed in the selected configuration, not technical proof of a model switch. Use trusted runtime model metadata if supplied; do not infer the active model or effort when it is unavailable. This recommendation is a starting configuration to validate, not a guarantee of quality.

During the phase, apply the [shared escalation procedure](../../../shared/model-escalation/instructions.md) only for a material question that remains unresolved after source reconciliation. Routine comparison of a confirmation and consecutive invoices does not by itself require Sol. A user may explicitly require an escalation attempt for a test case.

## Locations and workspace

1. If a working-directory location is available, check whether `<wd>/de-stromwechsel/internal/state.md` exists and read it when present. A remembered location or past chat is only a lead; establish the current checkpoint from accessible workspace files. If state is absent, do not assume a previous final checkpoint. After confirming locations and reading scope, check the fixed checkpoint registry for an interrupted run before beginning a fresh review, unless the user explicitly requested a fresh start. Reuse saved locations only if they are accessible and the state records that the user confirmed their roles. Before accepting a saved completed phase, verify that its latest report still exists. If it is missing, tell the user and mark completion incomplete; rebuild the missing result from usable snapshots and accessible evidence, rechecking as needed. An in-progress snapshot is usable even if its final report has not yet been written.
2. Use locations explicitly specified by the user for this run or validly confirmed in saved state. For any role that remains unconfirmed, inspect only low-cost folder metadata to identify a likely Strom project. Explain the inference, propose using that location as archive and workspace when appropriate, and wait for confirmation before creating files or beginning deep inventory. If the location is unclear, ask separately for the archive and working folder; they may be the same. An unconfirmed inference in saved state is not approval. A cloud-provider name is not a path: use an available connector or mounted folder, and if files are inaccessible ask for a usable local path, mount, or upload. Do not claim to have inspected inaccessible files.

   When choosing or confirming the archive, explain that the skill may read the contents of any files there as needed for the review, regardless of type, including archived `.eml` messages and their attachments. Obtain agreement to that reading scope together with location confirmation, before deep review or writing artifacts; do not ask separately for each file or extension. If the user declines archive content access, stop Phase 0.1. A path supplied without that disclosure, or saved role confirmation alone, does not establish this reading permission: obtain it unless already explicit in the current request or recorded in saved state. Remind the user to choose a private, non-public working folder because reports, state, history, and tasks can contain household and contract details; this is a warning, not a separate access-control check. Keep the extraction-effort checkpoint below even after archive content access is approved.

3. In the user's selected working directory (`<wd>`), create or reuse:

   ```text
   <wd>/de-stromwechsel/reports/
   <wd>/de-stromwechsel/internal/
   <wd>/<year>/
   ```

   `reports/` holds readable reports; `internal/` holds private state and working inventory. Year folders sit alongside `de-stromwechsel/` and are for electricity documents the skill handles from this point forward. Reuse suitable year folders already present. Create the current or otherwise relevant year folder for active work, and add later year folders as needed; use a document's date to choose its year. Do not place these new documents under `de-stromwechsel/`.

4. If the chosen working directory contains old user documents, leave them untouched. The year-folder structure is not permission to move or copy them. During Phase 0.1, link to or record their original locations instead.

## Inventory and effort

1. Start with a broad, low-cost inventory of accessible folders and file metadata: names, paths, file types, sizes, dates, and existing year groupings. Look for electricity contracts and confirmations, annual, interim, or final bills, price changes, meter readings, and relevant correspondence. Count original documents and OCR companions separately; do not add companion-page counts to originals as if they were distinct pages.
2. If documents are already grouped by year, begin with the newest relevant records and expand to establish the document-based supply history or resolve an important gap or conflict. For history, prioritize annual/final bills and key contract records over exhaustive reading of older correspondence. If documents are not grouped, inventory broadly enough to find relevant records, but do not deep-read every file by default.
3. Check whether PDFs have searchable text and whether OCR companions already exist, using available tools. Do not start bulk OCR or deep extraction before estimating the effort. Low-cost text-layer checks and searches of existing OCR companions do not themselves constitute bulk OCR; assess the proposed costly work rather than treating the total PDF count as its scope. If the archive is large or scan-heavy, report the estimated number of relevant files/pages and what is or is not searchable, then ask whether to proceed with the costly pass. Do not impose a fixed numeric cutoff. For material facts taken from OCR, visually verify the relevant page when feasible; otherwise label the value and its limitation clearly.
4. If the user declines the costly pass, continue with accessible searchable evidence and any relevant records that can be reviewed within the agreed scope. Record which files were not examined and why. Do not present the result as complete if unreviewed records could materially change it.

After initial inventory and before lengthy document review, start a working snapshot under the [shared checkpoint procedure](../../../shared/checkpoints/instructions.md). Save progress after meaningful review groups, including visual checks, rather than waiting until the final report.

## Task-selection scope

Apply this filter before creating tasks, including payment follow-ups under the shared instructions:

- Include unresolved follow-ups tied to the currently active contract throughout that contract's lifetime.
- For the immediately preceding contract, include only follow-ups whose documented event or due trigger falls in the current calendar month or the three preceding calendar months. In November, the window starts on August 1 and runs through today. A qualifying event can create a follow-up due later; today's review date alone does not make an old obligation qualify.
- If a predecessor task's relevant date cannot be established, record the uncertainty in the report rather than inventing a date or pulling an old task into scope. An explicit user request may extend this scope.

Older documents may still be needed to establish consumption, history, or a material term; reading them does not automatically create tasks for older contracts. Preserve existing task entries: the window does not authorize deleting or completing them merely because they are old. Later phases apply their own scope when reviewing concrete contracts.

## Establish the current situation

Review the evidence most likely to establish the current supply: the active contract or confirmation, recent annual/final bills, recent price notices, meter readings, and relevant previous-provider records. Read older records as needed to establish documented supply/billing periods for history, a transition, a conflict, or a material term.

Record facts only as far as the evidence supports, including where available:

- current provider and tariff;
- contract and supply dates, minimum term, renewal, and termination details;
- Arbeitspreis, Grundpreis, payment or Abschlag, and applicable bonuses;
- consumption, billing period, and whether the value comes from a meter reading, bill, estimate, or user statement;
- previous providers and known supply periods;
- missing records, contradictions, uncertain dates, and material limitations.

For each material fact, identify its source file and page or section where available. Keep document-backed facts, user-provided information, and inferences distinct. Link to original files with relative links when practical; otherwise record their accessible paths. Do not copy source documents into the report or state folders.

Weigh conflicting evidence by directness, recency, completeness, and relevance. Use the strongest applicable evidence as the working fact or default, explain briefly why it controls, and retain weaker or older values as contextual history with their provenance. Do not present them as equally unresolved alternatives when the evidence supports a clear choice. For consumption, a recent complete, representative annual bill or `Abschlussrechnung` is normally the working basis unless stronger contrary evidence exists; state the period and source and invite correction without forcing a choice between it and older order-form or historical figures. An estimated meter-reading interval that contributes to a billed annual total is a component of that total, not another competing annual consumption figure. Record any material estimate or limitation.

Archived email files within the approved archive scope are ordinary source documents; review relevant message content and attachments as needed without another email-specific permission request. Leave originals untouched and do not save extracted attachments unless the user asks; temporary extraction for reading follows the same archive and effort boundaries as other files.

Before the final Phase 0.1 checkpoint, if a material gap in contract, billing-history, payment, or eligibility evidence could plausibly be resolved by additional existing records, ask whether relevant records may be in another folder and whether the user permits a focused search of a connected mailbox. A known condition awaiting a future event is not itself a missing-source question. Name the unresolved question and make the two source options independent. Tell the user that providing an additional folder path authorizes review of its contents, including subfolders and all file types, for this task; do not ask separately about individual files. The usual extraction-effort checkpoint still applies. Inspect only the folder tree the user identifies. Connected-mailbox access is separate and requires explicit permission for a focused search; name the likely record or issue and relevant period when known. If access to either source is already explicitly authorized for this scope, use it without asking again. Review newly authorized sources before deciding whether model escalation remains useful. Do not use escalation as a substitute for missing evidence. Wait for the user's response before finalizing Phase 0.1 when a likely relevant source-access question is pending; silence is not permission. If the user declines, no additional folder is available, or mailbox access is unavailable, continue from authorized evidence and record any material limitation. Do not treat a missing bill as proof of a supply gap.

## Save and checkpoint

- Save a dated, user-readable report in `de-stromwechsel/reports/` in the language of the first substantive user request in the current run. A suitable initial name is `YYYY-MM-DD-as-is.md`. Preserve earlier reports and avoid overwriting a same-day report. Include a readable inventory of relevant source documents and their original locations, review status, and important findings or limitations.
- Create or update `de-stromwechsel/history.md` following the [shared history instructions](../../../shared/history/instructions.md). Include documented historical periods beyond the task horizon; keep any gaps or extraction exclusions visible. Link it from the report and state.
- Maintain a concise Markdown `de-stromwechsel/internal/state.md` as the initial resumability index and a separate `internal/inventory.md`. Write both internal files in English. Record the source and working-directory locations and whether the user confirmed each role and the archive content-reading scope, phase status, latest report link, material open questions, and next step. Link to `tasks/active.md` when it exists; do not duplicate its entries in state. Keep the document inventory in `internal/inventory.md`, with original paths, available metadata, text/OCR status, and review status; link to it from `state.md`. Keep detailed findings in the report instead of duplicating them in state. Treat this initial format as subject to revision after testing.
- When this phase identifies a concrete follow-up action, use the [shared task instructions](../../../shared/tasks/instructions.md). Include unresolved financial follow-ups in both directions, including a one-time check of the first recurring Abschlag payment or debit. For provider payments or credits under a concrete contract, apply the linked eligibility and receipt follow-ups. For a documented upcoming end-of-supply or other concrete meter-reading trigger, create the shared single meter-reading task; do not equate minimum-term expiry with a confirmed supply end. Follow the agreed task rules; the register's remaining format details and usefulness are still being validated.
- Keep personal paths, household details, and document findings in the user's workspace. Never add them to the shared skill repository or provider knowledge base.
- Finalize and rotate the working snapshot only after the final artifacts are saved and checked, following the [shared checkpoint instructions](../../../shared/checkpoints/instructions.md). Keep `state.md` free of checkpoint logs and checkpoint-file links; discover them through the fixed registry location.
- At the phase checkpoint, summarize in the user's language what was reviewed, the current situation established, material unknowns or cost-related exclusions, any active tasks, and the report/state paths. Mark Phase 0.1 complete only if the evidence is sufficient for its stated scope; otherwise mark it partial and explain why. Stop at the checkpoint. Do not start a later phase automatically.
