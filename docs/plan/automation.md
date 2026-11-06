# Automation Candidates

**Status:** Proposed exploration. No helper scripts are currently required or planned for the skill. Phase 0.1 v1 was accepted on 2026-11-06; revisit these candidates during later-phase testing if real runs show recurring mechanical friction.

The goal is to reduce time spent on repeatable mechanics during skill development and testing. Automation should support evidence gathering and artifact checks without taking over document interpretation or user-facing decisions.

## Candidates to evaluate

- **Archive and PDF inventory:** enumerate paths, file types, sizes, and dates; report PDF page counts and whether text is extractable; distinguish likely OCR companions from source PDFs when filenames or metadata support that match. Treat companion matching as tentative when it is not exact.
- **PDF extraction support:** use available local tools to extract text or render selected pages and retain page-level provenance. Extraction is a mechanical aid; OCR and extracted text can be wrong, so the agent still decides what a document establishes and visually checks material OCR-derived facts when feasible.
- **Arithmetic and date calculations:** calculate sums, date offsets, and comparisons from evidence the agent has already selected. The helper must expose its inputs and result so the calculation can be checked. The agent remains responsible for choosing the relevant documents, periods, and contractual rule.
- **Artifact validation:** check local Markdown links and anchors, expected files, and mechanically detectable task-register inconsistencies such as an active entry disappearing without a matching closure record. Report possible problems for review; do not infer that a task was completed or cancelled from formatting alone.
- **Checkpoint consistency:** if later runs show repeated errors, check that the registry points to the current snapshot and that retained checkpoint files follow the agreed bounded-retention rules.

These are candidates, not a commitment to build every helper. Start with one small utility only after real runs show that a repeated mechanical step is slow or error-prone and that automation would materially improve testing.

## Boundaries

Scripts may collect metadata, perform explicit calculations, and validate file structure. They must not independently decide which documents are relevant, whether invoices belong to one billing cycle or correct one another, whether a meter reading is estimated, what a contract means, whether eligibility is established, which tasks should be created, or whether user consent or model escalation is needed. Those decisions depend on evidence and context.

Keep the user's source archive read-only. Preserve source paths and page references in helper output. Do not let a failed or unavailable helper block the skill from using its documented tools and fallbacks.

For development utilities in this repository, follow the project-local Python environment instructions in `AGENTS.md`. Any helper shipped with the skill would need its own explicit runtime and dependency expectations; do not assume that a user's environment matches the development checkout.
