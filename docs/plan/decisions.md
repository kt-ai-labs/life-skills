# Plan Decisions

Record only decisions that materially affect architecture, scope, phases, data or privacy boundaries, or the shared knowledge workflow. Group entries by date and give each a stable sequential ID. Keep each entry concise; use the living plan documents for detail.

When a decision fully replaces an earlier one, the new entry links to its dated heading with **Supersedes**, and the earlier entry links back with **Superseded by**. For a partial change, use **Overrides**, state its scope, and mark the earlier entry **Partially overridden by** with a Markdown link. Preserve the earlier decision text so the history remains clear.

## 2026-11-05

### D-001: Project documentation workflow

**Status:** Current

Start each repository work session with `README.md`; consult the other plan documents when relevant. Update affected plan documents as soon as material decisions or durable findings arise, briefly inform the user, and record important decisions here. Prefer the existing topic document; create and link a focused document when durable detail needs its own format or procedure. Omit routine implementation details.

### D-002: Traceable decision changes

**Status:** Current

Give each important decision a stable ID and a dated subsection. Link later decisions to earlier ones with **Supersedes** for full replacement or **Overrides** for a scoped change, and add a reverse link on the earlier entry. Preserve the earlier decision text.

### D-003: User-selected Stromwechsel workspace

**Status:** Current; **Partially overridden by** [D-015](#d-015-working-checkpoints-and-bounded-retention) for working-checkpoint layout and retention.

Create lowercase `de-stromwechsel/` under the user's selected working folder, with `internal/` for agent-managed state and `reports/` for user-readable Markdown. Year folders for documents the skill handles sit alongside it. Inventory old user documents where they are and record their locations; do not sort, move, copy, or rename them. Reuse suitable year folders for skill-handled documents, keep personal paths and cloud-provider choices out of shared instructions, and leave the exact internal state format open.

## 2026-11-06

### D-004: User-facing and internal language

**Status:** Current

Write user-facing reports, task lists, and checkpoint messages in the language of the first substantive request in that run. Keep internal state and inventory in English.

### D-005: Evidence-weighted working defaults

**Status:** Current

Weigh evidence by directness, recency, completeness, and relevance. Use the strongest applicable evidence as the working fact or default, explain why, and retain weaker values as contextual history. A recent complete representative annual bill or `Abschlussrechnung` normally supplies the consumption basis unless stronger contrary evidence exists; invite correction without forcing false equivalence between values.

### D-006: Confirm inferred archive and workspace

**Status:** Current; **Partially overridden by** [D-012](#d-012-archive-content-access-and-workspace-warning) for the permission required before archive review and reuse of saved locations.

When context suggests the current folder is both the Strom archive and skill workspace, explain the inference and ask for confirmation before creating files or beginning deep inventory. Reuse saved locations only when accessible and previously confirmed.

### D-007: Provider payment follow-up

**Status:** Current; **Partially overridden by** [D-009](#d-009-phase-01-task-horizon) for historical task selection in Phase 0.1 and [D-020](#d-020-conditional-eligibility-and-payment-timing) for eligibility outcomes and future conditions.

Across phases, when a concrete contract identifies a provider-to-user payment or credit, create linked follow-ups to verify eligibility/terms and actual receipt. Record eligibility as `Eligible`, `Not eligible`, or `Unresolved`; keep the eligibility task open and receipt task blocked while unresolved. The receipt task depends on eligibility and is not applicable if the user is ineligible. This does not apply to hypothetical market-search candidates and does not introduce background account monitoring or reminders. This narrowly overrides the future-final-bill follow-up exclusion in [the scope section](README.md#scope); see that section for the boundary.

### D-008: Shared task reference

**Status:** Current; **Partially overridden by** [D-019](#d-019-task-closure-reconciliation-and-language) for closure outcomes, archive year, reconciliation, and metadata language.

Keep reusable task guidance under `references/shared/tasks/` because follow-ups span phases. Store the user's active and completed task files in the confirmed Strom workspace. `active.md` means tasks still need action; `done-YYYY.md` means completed, with a completion date, a concise result summary, and evidence rather than a redundant `Done` status. Put a short result directly in the entry; for longer results, provide a brief summary and link to the detailed report. Validate remaining register details and usefulness in Phase 0.1.

### D-009: Phase 0.1 task horizon

**Status:** Current

**Overrides:** [D-007](#d-007-provider-payment-follow-up) only for selecting which historical contracts generate Phase 0.1 tasks; the shared eligibility and receipt procedure still applies within that scope.

For Phase 0.1, include unresolved follow-ups from the currently active contract in full. Include predecessor-contract tasks only when their relevant event or due trigger falls in the current calendar month or the three preceding calendar months. Use calendar-month boundaries, not a rolling day count; do not mine older contract years for unrelated tasks. This limits Phase 0.1 task discovery and does not delete existing entries or constrain later phases reviewing a concrete contract.

### D-010: Target description and incremental delivery

**Status:** Current

Skill and plugin descriptions express the intended final capability. Develop and validate the skill in phases; executable instructions state the currently implemented phase boundary. Do not narrow the target description merely because later phases are not implemented yet.

### D-011: Financial follow-ups and first recurring payment

**Status:** Current

Within each phase's task horizon, record every unresolved document-backed financial action under a concrete contract, including outgoing bills, charges, debits, and fees as well as incoming bonuses, credits, and refunds. Retain D-007's linked eligibility/receipt procedure for incoming payments. For recurring Abschläge, verify the first scheduled payment once; create later checks only for evidenced changes or discrepancies or an explicit user request. This extends the passive financial-action exception in [Scope](README.md#scope) without adding background monitoring or monthly tasks.

### D-012: Archive content access and workspace warning

**Status:** Current

**Overrides:** [D-006](#d-006-confirm-inferred-archive-and-workspace) only for reading permission when confirming or reusing locations; folder-role confirmation alone is insufficient.

Combine archive confirmation with permission to inspect needed file contents regardless of type, including local EML messages and attachments; stop Phase 0.1 if that scope is declined. Preserve recorded consent for reuse and request it when older state lacks the scope. A connected mailbox remains a separate optional source requiring explicit permission. Retain the costly OCR/extraction checkpoint. At workspace selection, warn that the folder should be private and non-public because saved artifacts contain personal research details; this is a warning rather than an access-control audit.

### D-013: Document-based supply history

**Status:** Current; **Partially overridden by** [D-014](#d-014-history-period-aggregation-and-consumption-labels) for invoice slices within one annual/contract cycle and consumption labels.

Maintain private `de-stromwechsel/history.md`, in the run's user-facing language, from documents. Start with a short description and a table: supply/billing period, supplier, billed kWh, total electricity cost for the period before advance-payment deductions, and a link to that period's reference section. Annual/final bills define periods even across several years with one supplier; include the current period with unavailable billing values until documented. Sort the table and reference sections newest/current first, oldest last. Link key contracts/confirmations, annual/final bills, and relevant price-increase notices. Exclude settlement balances, individual transactions, and paid/unpaid status; those follow-ups belong in tasks. Keep this private history separate from shared provider knowledge.


### D-014: History period aggregation and consumption labels

**Status:** Current

**Overrides:** [D-013](#d-013-document-based-supply-history) for consecutive invoices within a documented annual/contract cycle. Reconcile confirmations and invoices before assigning rows; sum non-overlapping slices into one cycle, retaining source-period references. Keep separate annual cycles and avoid correction/cumulative double counting. If the closing reading is estimated, label the period kWh estimate-based. Intermediate estimates alone do not determine that label when actual endpoints and continuity establish the total. Money remains the documented billed electricity charge before advances.

### D-015: Working checkpoints and bounded retention

**Status:** Current

**Overrides:** [D-003](#d-003-user-selected-stromwechsel-workspace) only for the previously open working-checkpoint layout. Save English progress snapshots during lengthy work under `internal/checkpoints/`, indexed by `registry.md`; keep checkpoint details and links out of concise state. Retain one current snapshot and one last-completed archive across phases. Rotate after durable final artifacts are checked; retain interrupted/partial snapshots. Cleanup affects checkpoint files only, not source documents or durable reports/tasks.

### D-016: Shared model escalation and Phase 0.1 launch

**Status:** Current; Sol Medium and High requests exercised in test-4, with escalation judgement still under validation; **Partially overridden by** [D-018](#d-018-source-recovery-before-model-escalation) for source review and permission ordering before discretionary escalation.

Keep cross-phase escalation criteria and an OpenAI adapter in `references/shared/model-escalation/`. After ordinary source reconciliation, escalate only for a consequential unresolved question, or an explicit phase/user trigger. Request Sol Medium, then High only for remaining material uncertainty. Require documented ability to request the model, without verifying actual assignment. Make one concrete request per level; if unavailable or failed, warn and continue in the current model. In OpenAI/Codex, Phase 0.1 recommends Luna Extra High at a new run's launch and waits for `Continue`; this is user confirmation, not verified model selection. Add other providers only when needed.

### D-017: Single meter-reading follow-up

**Status:** Current

Within phase scope, an evidence-supported active-contract reading date or actual supply-end date creates one task covering reading, photographing, saving the photo in the archive, and reporting directly to the Netzbetreiber. Supplier submission is optional and additional. Minimum-term expiry alone does not establish a supply end. Retain only unfinished steps when the reading already exists. This extends the passive follow-up scope without executing submissions, processing tasks in a later phase, or adding monitoring/reminders.

### D-018: Source recovery before model escalation

**Status:** Current; source-first sequence exercised and accepted in the Phase 0.1 rerun on 2026-11-06; cross-phase validation remains pending

**Overrides:** [D-016](#d-016-shared-model-escalation-and-phase-01-launch) only for the order of evidence-source review and permission before discretionary model escalation.

Before discretionary model escalation, review relevant sources already authorized for the task and resolve material source gaps where possible. In Phase 0.1, ask whether relevant records may be in another folder; after explaining the scope, a user-provided path authorizes reviewing contents of that folder and its subfolders, across file types, for the task. The extraction-effort checkpoint still applies. Ask separately for explicit permission to run a focused connected-mailbox search. Review newly authorized evidence before deciding whether escalation remains useful. Wait for a response to pending access questions; silence is not permission. Missing evidence alone is not an escalation trigger. User- or phase-required test attempts do not grant access to additional sources.

### D-019: Task closure, reconciliation, and language

**Status:** Current; Phase 0.1 behavior accepted by the user after the 2026-11-06 rerun; cross-phase validation remains pending

**Overrides:** [D-008](#d-008-shared-task-reference) for closed-task archive semantics and metadata. Archive completed, explicitly user-cancelled, and non-applicable tasks in `done-YYYY.md` by closure year with a date, result, and evidence or decision; distinguish cancellation from actual completion. Reconcile Active and Done on each update, including follow-up messages in the same conversation. Save closure results before removing active entries, preserve prior outcomes and dependent links, and repair completed entries left in Active without inventing facts. Ambiguous remarks do not cancel tasks. Localize generic field labels and statuses as well as prose; useful contractual terms and provider names may remain in their original language.

### D-020: Conditional eligibility and payment timing

**Status:** Current; Phase 0.1 behavior accepted by the user after the 2026-11-06 rerun; cross-phase validation remains pending

**Overrides:** [D-007](#d-007-provider-payment-follow-up) for eligibility outcomes and receipt blocking. Add a conditional outcome when terms and currently checkable facts are established but a known future requirement remains. The terms-review task may close with that condition recorded; the receipt task stays on its supported date or trigger and repeats the condition. Unresolved terms or qualifying facts keep eligibility open and receipt blocked; established ineligibility closes receipt as not applicable. User intent or receipt of an early payment does not prove a future condition fulfilled. Describe forfeiture or recovery only where the contract supports it.
