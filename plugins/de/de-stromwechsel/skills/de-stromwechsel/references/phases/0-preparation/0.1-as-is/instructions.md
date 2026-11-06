# Phase 0.1 — As-Is Research

## Goal and boundary

Establish the user's current electricity-supply situation from accessible records. Leave a readable, evidence-backed report and enough private state to resume later.

Inventory the user's existing documents where they are. Do not sort, move, copy, rename, or otherwise reorganize the old archive. Phase 0.1 does not research market offers, recommend a new tariff, or submit or cancel a contract.

## Locations and workspace

1. If a previous working-directory location is available, read `<wd>/de-stromwechsel/internal/state.md` before asking for locations. Reuse saved locations only if they are accessible and the state records that the user confirmed their roles. Before treating a phase as complete, verify that its latest report still exists. If the report is missing, tell the user, treat that checkpoint as incomplete, and use saved state only as an index for a fresh review.
2. If the current working directory or nearby context clearly identifies a likely Strom project, inspect only low-cost folder metadata first. Tell the user what you found and propose using that location both as the existing document archive and as the skill workspace, with a brief reason. Wait for confirmation before creating files or beginning deep inventory. Do not treat an earlier unconfirmed inference recorded in state as approval. If the location is not clear, ask separately where the existing electricity documents are and where the skill should work; the user may choose the same folder for both. A cloud-provider name is not a path: use an available connector or mounted folder, and if files are inaccessible ask for a usable local path, mount, or upload. Do not claim to have inspected inaccessible files.
3. In the user's selected working directory (`<wd>`), create or reuse:

   ```text
   <wd>/de-stromwechsel/reports/
   <wd>/de-stromwechsel/internal/
   <wd>/<year>/
   ```

   `reports/` holds readable reports; `internal/` holds private state and working inventory. Year folders sit alongside `de-stromwechsel/` and are for electricity documents the skill handles from this point forward. Reuse suitable year folders already present. Create the current or otherwise relevant year folder for active work, and add later year folders as needed; use a document's date to choose its year. Do not place these new documents under `de-stromwechsel/`.

4. If the chosen working directory contains old user documents, leave them untouched. The year-folder structure is not permission to move or copy them. During Phase 0.1, link to or record their original locations instead.

## Inventory and effort

1. Start with a broad, low-cost inventory of accessible folders and file metadata: names, paths, file types, sizes, dates, and existing year groupings. Look for electricity contracts and confirmations, annual or final bills, price changes, meter readings, and relevant correspondence. Count original documents and OCR companions separately; do not add companion-page counts to originals as if they were distinct pages.
2. If documents are already grouped by year, begin with the newest relevant records and expand only to establish history or resolve an important gap or conflict. If they are not grouped, inventory broadly enough to find relevant records, but do not deep-read every file by default.
3. Check whether PDFs have searchable text and whether OCR companions already exist, using available tools. Do not start bulk OCR or deep extraction before estimating the effort. If the archive is large or scan-heavy, report the estimated number of relevant files/pages and what is or is not searchable, then ask whether to proceed with the costly pass. Do not impose a fixed numeric cutoff. If the platform supports model choice, offer a lower-cost model when useful; do not switch models automatically. For material facts taken from OCR, visually verify the relevant page when feasible; otherwise label the value and its limitation clearly.
4. If the user declines the costly pass, continue with accessible searchable evidence and any relevant records that can be reviewed within the agreed scope. Record which files were not examined and why. Do not present the result as complete if unreviewed records could materially change it.

## Establish the current situation

Review the evidence most likely to establish the current supply: the active contract or confirmation, recent annual/final bills, recent price notices, meter readings, and relevant previous-provider records. Read older records only when they establish a transition, resolve a conflict, or clarify a material term.

Record facts only as far as the evidence supports, including where available:

- current provider and tariff;
- contract and supply dates, minimum term, renewal, and termination details;
- Arbeitspreis, Grundpreis, payment or Abschlag, and applicable bonuses;
- consumption, billing period, and whether the value comes from a meter reading, bill, estimate, or user statement;
- previous providers and known supply periods;
- missing records, contradictions, uncertain dates, and material limitations.

For each material fact, identify its source file and page or section where available. Keep document-backed facts, user-provided information, and inferences distinct. Link to original files with relative links when practical; otherwise record their accessible paths. Do not copy source documents into the report or state folders.

Weigh conflicting evidence by directness, recency, completeness, and relevance. Use the strongest applicable evidence as the working fact or default, explain briefly why it controls, and retain weaker or older values as contextual history with their provenance. Do not present them as equally unresolved alternatives when the evidence supports a clear choice. For consumption, a recent complete, representative annual bill or `Abschlussrechnung` is normally the working basis unless stronger contrary evidence exists; state the period and source and invite correction without forcing a choice between it and older order-form or historical figures. An estimated meter-reading interval that contributes to a billed annual total is a component of that total, not another competing annual consumption figure. Record any material estimate or limitation.

Email is optional. Obtain the user's explicit permission before searching it. If permission is declined or email is unavailable, continue without it. Record relevant email evidence in the report; do not save attachments unless the user asks.

## Save and checkpoint

- Save a dated, user-readable report in `de-stromwechsel/reports/` in the language of the first substantive user request in the current run. A suitable initial name is `YYYY-MM-DD-as-is.md`. Preserve earlier reports and avoid overwriting a same-day report. Include a readable inventory of relevant source documents and their original locations, review status, and important findings or limitations.
- Maintain a concise Markdown `de-stromwechsel/internal/state.md` as the initial resumability index and keep `internal/inventory.md` in English. Record the source and working-directory locations and whether the user confirmed each role, phase status, latest report link, material open questions, and next step. Link to `tasks/active.md` when it exists; do not duplicate its entries in state. Keep an inventory of candidate electricity documents with original paths, available metadata, text/OCR status, and review status in `state.md`; move it to a linked `internal/inventory.md` only if it grows too large to scan comfortably. Keep detailed findings in the report instead of duplicating them in state. Treat this initial format as subject to revision after testing.
- When this phase identifies a concrete follow-up action, use the [shared task-register instructions](../../../tasks/instructions.md). The register applies across phases and remains proposed for validation in real use.
- Keep personal paths, household details, and document findings in the user's workspace. Never add them to the shared skill repository or provider knowledge base.
- At the phase checkpoint, summarize in the user's language what was reviewed, the current situation established, material unknowns or cost-related exclusions, any active tasks, and the report/state paths. Mark Phase 0.1 complete only if the evidence is sufficient for its stated scope; otherwise mark it partial and explain why. Stop at the checkpoint. Do not start a later phase automatically.
