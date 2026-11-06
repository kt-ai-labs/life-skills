# Electricity Switching Skill v2 — Plan

**Status:** The user accepted Phase 0.1 v1 after a successful rerun on 2026-11-06. The run paused for source-access answers, reviewed newly authorized email evidence, distinguished a promised provider credit from a separate service fee, kept receipt open without proof of payment, and saved the completed checkpoint. Task closure, localized metadata, conditional eligibility, and source recovery behaved as intended in this Phase 0.1 run. Phase 0.2 and later phases are not implemented.

## Vision

Build a skill that researches German household electricity supply and tariffs, supports an evidence-backed choice, and leaves durable results that can be resumed. Its workflow is the **Progressive Discovery Funnel**: begin with broad discovery, reduce the candidate set through proportionate checks, and spend more research effort only where it can still change the decision.

The first version is intended to cover the research and assessment funnel through a final recommendation. Phase 0.1 must also provide standalone value by establishing and describing the user's current electricity situation from existing records. It inventories the existing archive in place; it does not sort or reorganize the user's old documents.

## Decision labels

- **Agreed** records an architectural decision from the handoff.
- **Proposed** records a direction or example that still needs validation in implementation or real use.
- **Open** records a question whose answer has not been settled.

The labels apply throughout this plan. A listed phase, example, count, date, threshold, or storage idea is not a requirement unless explicitly marked agreed.

## Agreed architecture

- **Complete rewrite:** replace the old workflow instead of incrementally refactoring it or preserving it for backward compatibility. Retire the old Research and Execution modes and the active `Research Prompt` and `Documents and Actions` mechanisms from the new architecture; do not automatically carry old instructions forward. Read the current repository before removing anything, check for material the user asked to preserve, and retain useful technical findings only when they serve the new design. Git history remains available for earlier decisions.
- **Real execution:** the skill performs research with available tools. It does not prepare a separate research prompt or offer separate Research and Execution modes.
- **Progressive Discovery Funnel:** start broadly, narrow candidates using standard checks, and increase research depth as the candidate set shrinks. Prioritize low-cost evidence before expensive investigation when it can still inform the decision.
- **Target description and incremental delivery:** the skill and plugin descriptions express the intended final capability. Keep that target description while implementing and validating one phase at a time; executable instructions state the currently implemented boundary. See [D-010](decisions.md#d-010-target-description-and-incremental-delivery).
- **Phase-based development:** implement and exercise one phase at a time. Subphases may be introduced when testing shows they are useful. Do not prebuild later phases or empty future folders.
- **Small entry point:** `SKILL.md` describes the shared workflow and routes the agent to the current phase instructions. It should not duplicate each phase's detailed procedure.
- **Phase-matched hierarchy:** the file hierarchy follows the phase hierarchy, and each executable phase uses `instructions.md` as its primary instruction file.
- **Recorded decisions:** assessments and exclusions need evidence and reasons. Users can override an exclusion; the original assessment, evidence, and override remain visible.
- **Opinionated defaults:** the skill applies its standard assessment and exclusion method without repeatedly asking the user to make routine decisions. It distinguishes confirmed failure from insufficient evidence and allows user preferences to affect their own recommendation.
- **Checkpoint control:** users review results at phase boundaries. Ordinary research should not require approval for every small step, while specific consent boundaries such as searching personal email remain explicit.
- **Durable and resumable research:** keep concise state and durable results separate from working snapshots. Use `internal/checkpoints/registry.md` to locate the active snapshot; retain at most one current snapshot and one completed archive, rotating only after final artifacts are checked. See [D-015](decisions.md#d-015-working-checkpoints-and-bounded-retention).
- **Shared model escalation:** use shared criteria across phases, with provider-specific request instructions under `references/shared/model-escalation/`. Resolve material source gaps in authorized sources before deciding on discretionary escalation; Phase 0.1 asks about relevant additional folders and focused connected-mailbox searches first. OpenAI starts with a Sol Medium request and uses High only for remaining material uncertainty. A supported request is sufficient; do not verify actual model assignment. Warn and continue if a request is unavailable or fails. Phase instructions may require an attempt for a particular step. In OpenAI/Codex, Phase 0.1 recommends Luna Extra High at launch and waits for `Continue`; this is a configuration recommendation to test. See [D-016](decisions.md#d-016-shared-model-escalation-and-phase-01-launch) and [D-018](decisions.md#d-018-source-recovery-before-model-escalation).
- **Language separation:** user-facing reports, supply history, and task lists follow the language of the first substantive request in the run; internal state and inventory remain in English.
- **Shared task guidance:** keep cross-phase task instructions under `references/shared/tasks/`. `active.md` contains tasks that still need action and is sorted by expected action date, earliest first; `done-YYYY.md` archives closures by closure year and is sorted by closure date, latest first. In each entry, show the owner before `When`, with the date or trigger before its explanation. Explicit cancellations and non-applicable tasks have distinct outcomes. Reconcile both registers on each update, preserve every removed task's outcome, and localize field labels and statuses. See [D-008](decisions.md#d-008-shared-task-reference) and [D-019](decisions.md#d-019-task-closure-reconciliation-and-language).
- **Evidence-weighted defaults:** assess directness, recency, completeness, and relevance. Where evidence clearly favors one value, use it as the working default, explain why, and preserve weaker values as contextual history rather than equal unresolved alternatives. For consumption, a complete representative annual bill or final bill normally takes precedence unless evidence or the user indicates otherwise.
- **User-selected personal workspace:** obtain the user's working folder and create a lowercase `de-stromwechsel/` directory there. Keep agent-managed state in `de-stromwechsel/internal/` and readable Markdown reports in `de-stromwechsel/reports/`. Year-based folders for documents the skill handles sit alongside `de-stromwechsel/`; reuse existing year folders where present. Inventory the user's old documents in place and record their locations. Do not sort, move, copy, or rename them. Keep provider-specific paths out of the shared skill plan. Working-checkpoint layout is agreed in D-015; other internal fields remain open for validation.
- **Archive reading scope and private workspace:** combine archive confirmation with consent to inspect needed file contents of any type, including local EML messages and attachments. Stop Phase 0.1 if that archive-reading scope is declined. Connected mailbox access still needs separate permission; the costly extraction checkpoint remains. Warn users to choose a private, non-public working folder. See [D-012](decisions.md#d-012-archive-content-access-and-workspace-warning).
- **Document-based supply history:** maintain `de-stromwechsel/history.md` as a table of documented annual/contract cycles, consolidating consecutive invoice slices within a cycle, newest/current first, with linked reference sections in the same order. Record consumption and total electricity cost before advance-payment deductions; keep transaction balances and payment status in tasks. See [D-013](decisions.md#d-013-document-based-supply-history) and its refinement [D-014](decisions.md#d-014-history-period-aggregation-and-consumption-labels).
- **Confirm inferred locations:** when the current folder clearly appears to be the Strom archive and workspace, the skill may propose that inference with its reason, but must wait for the user's confirmation before creating files or beginning deep inventory. Previously saved locations may be reused when accessible and explicitly confirmed.
- **Combined financial exposure:** assess operational risks such as excessive advance payments and delayed final bills or credit refunds, including how they can compound into cash-flow exposure. Keep this distinct from tariff cost.
- **Private and shared knowledge stay separate:** personal research data is not published into shared provider knowledge. See [the knowledge-base plan](knowledge-base.md).
- **Financial follow-ups:** create tasks for every unresolved financial obligation or transaction within the phase scope. Verify the first recurring Abschlag payment once, rather than creating monthly checks; later evidenced discrepancies can create new tasks. See [D-011](decisions.md#d-011-financial-follow-ups-and-first-recurring-payment).
- **Contract payment follow-up:** when a concrete contract identifies a provider-to-user payment or credit, track eligibility/terms and actual receipt as linked follow-ups. Distinguish eligible, not eligible, known future conditions, and unresolved terms or facts, using localized wording. A known future condition may complete the terms review while remaining explicit in the receipt task; it does not postpone an earlier documented payment check. Unresolved eligibility keeps receipt blocked. User intent and early payment do not prove future conditions fulfilled. See [D-007](decisions.md#d-007-provider-payment-follow-up) and [D-020](decisions.md#d-020-conditional-eligibility-and-payment-timing). Keep the register passive and apply the rule to concrete contracts within phase scope.
- **Phase 0.1 task horizon:** include the current active contract in full. Include predecessor-contract follow-ups only when their relevant event or due trigger falls in the current calendar month or three preceding calendar months. See [D-009](decisions.md#d-009-phase-01-task-horizon).
- **Meter-reading follow-up:** record one task to read and photograph the meter, save the photo, and submit the reading directly to the Netzbetreiber at an evidence-supported trigger. Supplier submission is optional. This is a passive task, not execution or monitoring. See [D-017](decisions.md#d-017-single-meter-reading-follow-up).
- **Incremental evidence-led development:** run phases on real documents and research tasks, inspect results, fix material issues, and repeat before moving forward. Avoid infrastructure and polishing without a demonstrated need.

## Scope

The intended v1 capability includes current-state research; discovery and comparison of electricity offers; price, bonus, and contract checks; provider assessment; automatic exclusion of unsuitable candidates; operational and combined financial risk analysis; evidence retention; resumability; and eventual use of shared provider knowledge. A passive user-facing task register is implemented and accepted for Phase 0.1 v1; cross-phase applicability remains to be validated. Its closure and result rules are recorded in [D-008](decisions.md#d-008-shared-task-reference) and [D-019](decisions.md#d-019-task-closure-reconciliation-and-language); the sort and date-display convention is defined in the shared task instructions, while other format details and usefulness remain open. The cross-phase rule to track eligibility and receipt for provider payments under concrete contracts is agreed by [D-007](decisions.md#d-007-provider-payment-follow-up), refined for future conditions by [D-020](decisions.md#d-020-conditional-eligibility-and-payment-timing).

**Explicit v1 exclusions:** integration with Wechselpilot or other intermediaries; identifying whether a user has an intermediary arrangement as a special research task; special warnings about such arrangements; submitting or terminating contracts for the user; performing the actual supplier switch; ongoing contract monitoring; and proactive follow-up or reminders about future final bills after a switch. The exception to the future-final-bill follow-up exclusion covers document-backed financial actions under concrete contracts being reviewed ([D-007](decisions.md#d-007-provider-payment-follow-up), [D-011](decisions.md#d-011-financial-follow-ups-and-first-recurring-payment)): provider payments or credits receive linked eligibility and receipt tasks; outgoing payments receive a verification task, with recurring Abschläge checked once at their first payment. The task register does not monitor accounts or send reminders. The passive, document-backed meter-reading task in [D-017](decisions.md#d-017-single-meter-reading-follow-up) is also in scope; the skill does not execute it during Phase 0.1. Apart from these exceptions, the proposed task register does not change these exclusions: a user may still ask the skill to review a document they provide, within the currently implemented phase scope. The user remains responsible for existing contractual obligations. This skill researches, compares, and supports a tariff choice; it does not manage every aspect of electricity supply.

## Initial file target

The initial skill layout is deliberately small. Shared task guidance lives under `references/shared/tasks/`; its agreed active/done distinction is recorded in D-008, while remaining register details and usefulness stay proposed for validation. No instructions for future phases are prebuilt:

```text
<existing-skill-root>/
├── SKILL.md
└── references/
    ├── phases/
    │   └── 0-preparation/
    │       └── 0.1-as-is/
    │           └── instructions.md
    └── shared/
        ├── tasks/
        │   └── instructions.md
        ├── history/
        │   └── instructions.md
        ├── checkpoints/
        │   └── instructions.md
        └── model-escalation/
            ├── instructions.md
            └── openai.md
```

The implemented skill root is `plugins/de/de-stromwechsel/skills/de-stromwechsel/`. The required skill metadata and file structure must follow the format already used by this repository. Add phase references, templates, or other files only when Phase 0.1 demonstrates a need.

## Proposed directions and open questions

- **Proposed:** the future funnel may include market discovery, cheap screening, contractual screening, operational-risk screening, deeper investigation, and final evaluation. Their current names and order are working labels, not a locked design.
- **Open:** the order of contractual and operational-risk screening, and the point at which each check is most valuable, should be tested.
- **Open:** precise evidence formats, the internal state schema, report naming and organization, research thresholds, review sources and weights, and other numeric defaults should emerge from implementation and testing. Do not treat examples in the handoff as fixed requirements.
- **Open:** the Phase 0.1 rules for an incidental discovery of intermediary-related material need clarification; the v1 exclusion is against a dedicated intermediary investigation.
- **Proposed:** a shared provider knowledge base may live in the skill repository's references, with later contributions reviewed by the maintainer. Its format and workflow remain undecided; Phase 0.1 must not depend on it.
- **Agreed; validation pending:** In OpenAI/Codex, Phase 0.1 starts with a Luna Extra High recommendation and user confirmation; use the shared, conditional OpenAI escalation route rather than assuming model-switch capabilities. Test quality and actual delegation support before changing recommendations.
- **Proposed:** validate the remaining details and usefulness of the user-facing task register in later phases. The closure, cancellation, reconciliation, language, and conditional-eligibility rules in D-019 and D-020 passed the accepted Phase 0.1 v1 run; applicability across later phases remains to be observed. User-initiated later runs and follow-up messages may update tasks based on user confirmation or supplied evidence. No automatic reminders or background monitoring are in scope.
- **Proposed:** during testing of later phases, evaluate small scripts for repeatable mechanical work such as file/PDF inventory, arithmetic from agent-selected evidence, and artifact validation. Keep semantic document interpretation and task decisions with the agent; add automation only where real runs show recurring friction. See the [automation exploration](automation.md). No scripts are planned or required yet.

See [phase definitions and status](phases.md) and [shared provider knowledge](knowledge-base.md) for the working detail. The [decision log](decisions.md) keeps concise dated records and links decisions that supersede or override earlier ones. Update this plan as phase design and real testing resolve open questions.

## Development cycle

**Implement → Run on real inputs → Inspect results → Fix material issues → Repeat → Complete the phase.** Only after a phase works in practice should the next phase be designed. Phase 0.1 v1 is accepted; the next work is to define Phase 0.2 before implementing it.
