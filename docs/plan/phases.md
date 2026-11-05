# Progressive Discovery Funnel and Phases

This document records the current phase concept and the first implementation target. The funnel is intended to guide staged research, but only Phase 0.1 is currently in implementation scope. Later phase boundaries remain open to evidence from real use.

## Funnel principle

Begin with broad market discovery, then reduce the candidate set through increasingly focused checks. Spend on deeper investigation only while its result could affect suitability, cost, risk, or the recommendation. Apply ordinary screening decisions automatically, record their evidence and reasons, and bring the user in at phase checkpoints rather than after every routine step.

**Cost-aware rule:** cheap evidence first; expensive investigation only when it can still change the decision. A missing fact is not automatically a confirmed failure. Distinguish verified facts, attempted but blocked checks, unchecked questions, and evidenced exclusions.

## Working phase hierarchy

| Phase | Working name               | Intended objective                                                                                                | Status                                                                                         |
| ----- | -------------------------- | ----------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| 0.1   | As-Is Research             | Inventory existing records in place, establish the current supply picture, and save a resumable report and state. | **Instructions implemented and locally validated; test with the user's real archive pending.** |
| 0.2   | Discovery Configuration    | Prepare research inputs and criteria for discovery.                                                               | Identified as part of Phase 0; scope is not designed yet.                                      |
| 1     | Market Discovery           | Gather a broad set of potentially relevant offers.                                                                | **Proposed.**                                                                                  |
| 2     | Cheap Screening            | Remove duplicates and perform low-cost initial checks.                                                            | **Proposed.**                                                                                  |
| 3     | Contractual Knockout       | Find contract conditions that disqualify an offer.                                                                | **Proposed; order needs testing.**                                                             |
| 4     | Operational Risk Screening | Screen for provider-service and financial risks.                                                                  | **Proposed; order needs testing.**                                                             |
| 5     | Deep Investigation         | Resolve material evidence gaps for remaining candidates.                                                          | **Proposed.**                                                                                  |
| 6     | Final Evaluation           | Compare suitable candidates and explain a recommendation.                                                         | **Proposed.**                                                                                  |

The hierarchy is illustrative, not a finalized implementation contract. Phase numbers, labels, boundaries, and sequence may change. In particular, test whether contractual screening or operational-risk screening should come first. The handoff's market-size example of roughly 20–30 offers is a planning idea, not a quota or required coverage target.

## Phase 0 — Preparation

Phase 0 prepares a reliable account of the user's starting situation and the inputs for later research. It has two identified subphases: 0.1 As-Is Research and 0.2 Discovery Configuration. Only 0.1 is in the first implementation slice; do not create the later phase instructions in advance.

## Phase 0.1 — As-Is Research

### Objective and value

Reconstruct the user's current electricity-supply situation from available records and leave an understandable, resumable starting point for future work. Phase 0.1 should be useful on its own, even if the user does not continue to tariff discovery. Inventory existing documents where they are and record their locations; do not sort or reorganize the user's old files.

### Sources

Potential inputs include accessible local folders; current and previous contracts or confirmations; annual and final bills; price sheets and terms; meter readings; and other electricity-related documents. Connected email may be offered as an optional source, but the skill must obtain the user's permission before searching it. If permission is declined or email is unavailable, continue from other accessible sources.

### Initial workflow

This sequence is a starting scope for implementation, not a mandate to create a rigid taxonomy for the user's existing files.

1. **Choose locations:** ask where the user's existing electricity documents are and where the skill should keep its work, unless those locations are already known and accessible. The user may choose the same folder for both. Treat a cloud-provider name as an access route, not as a path; if the files are not accessible, ask for a usable local path, mount, or upload.
2. **Create the skill workspace:** in the selected work folder, create or reuse `de-stromwechsel/internal/` for agent-managed state and `de-stromwechsel/reports/` for readable reports. Year-based folders for documents the skill handles sit at the same level as `de-stromwechsel/`; reuse existing folders where suitable and create a year folder when a new document needs to be stored. This applies to documents the skill handles from this point forward, not to the user's old archive. Do not copy old source documents into the workspace as part of inventory.
3. **Inventory in place:** inspect accessible folders and file metadata to learn how the archive is arranged, identify likely electricity documents, and record their original paths. If existing records are already grouped by year, start with the newest relevant documents and expand when gaps or conflicts require it. If not, search broadly enough to find the relevant records without deep-reading every file automatically.
4. **Estimate extraction effort:** identify text-searchable files, image-only scans, and any available OCR companions where tools allow. Before bulk OCR or deep reading of a large scan-heavy archive, tell the user the estimated scope and ask whether to proceed. If supported, mention a lower-cost model as an option; do not change models automatically. If the user declines, continue with searchable and already-extracted evidence and record the limitation. Exact thresholds remain open.
5. **Identify and reconcile:** review the records that can establish the current supply and relevant history; note likely duplicates, conflicting facts, missing materials, and which versions appear current or superseded. Use older records only where they establish a transition, resolve a conflict, or clarify a material term.
6. **Enrich if permitted:** email is an optional source. Obtain explicit permission before searching it. If permission is declined or email is unavailable, continue from other accessible sources.
7. **Save a current-state record:** create a user-readable report and a minimal resumable state in the skill workspace. Link to source documents and record where each was found; do not sort, move, rename, or otherwise reorganize the old source archive.

### Information to establish

Where evidence permits, record the current provider and tariff; contract start and known end or termination dates; Arbeitspreis and Grundpreis; known bonuses and material contractual limits; historical consumption; meter details and readings; previous providers and supply periods; relevant documents; and missing, uncertain, or conflicting information. Never fill gaps by invention. Separate document-supported facts from user reports and preliminary inferences.

### Repeated runs

**Proposed:** later runs should reuse saved state, look for changes, and avoid reprocessing a full archive without reason. The initial implementation may use a concise Markdown state index in `internal/` that points to the detailed report in `reports/`; its fields and naming should be validated in real use. Complex synchronization is out of scope for the first implementation.

### Boundary with future market research

Phase 0.1 establishes actual contract dates and terms where available. It does not set a binding future quotation date. The handoff floated using a user-supplied date or a supported approximate date for market research, with roughly three months ahead as one possible default if no date is known. This remains a **proposal for Market Discovery**, not a Phase 0.1 rule, and must never be represented as a legally confirmed switch date. A calculator's date limits and the chosen scenario need to be recorded when that later phase is designed.

### Current status

Phase 0.1 instructions are implemented in `references/phases/0-preparation/0.1-as-is/instructions.md` and pass local skill validation. Validation on the user's real archive is pending. The initial report and state conventions are provisional and should be adjusted from observed use. Phase 0.2 instructions are not part of this implementation. Add further files only when needed.

## Checkpoints and resumability

At the end of each completed phase, save its result and provide a short checkpoint that tells the user what was examined, what was found and remains unknown, which material decisions or exclusions were made and why, and what phase is next. Then stop so the user can review, continue, refine criteria, request more research, repeat part of the phase, or override a decision.

Checkpoints are phase boundaries, not per-action approval prompts. Specific consent rules still apply, including the user's permission before email search. Phase 0.1 treats the old source archive as read-only and does not reorganize its files.

Saved artifacts should let a later run identify the completed phase, research performed, verified facts, open questions, decisions, and next action without depending on chat history alone. The exact persistence layout and schema are **open**; design the minimum needed while testing Phase 0.1.

## Assessments, exclusions, and overrides

**Agreed direction:** the skill owns a standard assessment method and automatically applies its exclusion criteria. It records the criterion, evidence, and rationale rather than asking the user to approve each routine exclusion. It distinguishes a confirmed incompatibility from insufficient evidence. A user may restore an excluded candidate; preserve the original finding and reason alongside the user's override, and do not erase the identified risks.

Potential provider assessment topics include unusually high Abschläge, delays in Schlussrechnung and Guthaben payment, their combined cash-flow effect, and customer reports. Their source set, weighting, severity rules, and numeric thresholds are **open for validation**. A personal preference can shape the user's own decision without becoming a universal factual risk rule.
