# Electricity Switching Skill v2 — Plan

**Status:** The architectural direction is agreed, and the old active workflow has been replaced by a phase-based skill. One run against the user's real archive is complete. The review identified targeted improvements to location confirmation, evidence weighting, language separation, and a shared cross-phase task register; these refinements are being applied before a fresh retest. The register design remains proposed until validated in use.

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
- **Phase-based development:** implement and exercise one phase at a time. Subphases may be introduced when testing shows they are useful. Do not prebuild later phases or empty future folders.
- **Small entry point:** `SKILL.md` describes the shared workflow and routes the agent to the current phase instructions. It should not duplicate each phase's detailed procedure.
- **Phase-matched hierarchy:** the file hierarchy follows the phase hierarchy, and each executable phase uses `instructions.md` as its primary instruction file.
- **Recorded decisions:** assessments and exclusions need evidence and reasons. Users can override an exclusion; the original assessment, evidence, and override remain visible.
- **Opinionated defaults:** the skill applies its standard assessment and exclusion method without repeatedly asking the user to make routine decisions. It distinguishes confirmed failure from insufficient evidence and allows user preferences to affect their own recommendation.
- **Checkpoint control:** users review results at phase boundaries. Ordinary research should not require approval for every small step, while specific consent boundaries such as searching personal email remain explicit.
- **Durable and resumable research:** save results and unresolved questions so later runs can continue without relying on chat history alone. The exact state format is not decided.
- **Language separation:** user-facing reports and task lists follow the language of the first substantive request in the run; internal state and inventory remain in English.
- **Evidence-weighted defaults:** assess directness, recency, completeness, and relevance. Where evidence clearly favors one value, use it as the working default, explain why, and preserve weaker values as contextual history rather than equal unresolved alternatives. For consumption, a complete representative annual bill or final bill normally takes precedence unless evidence or the user indicates otherwise.
- **User-selected personal workspace:** obtain the user's working folder and create a lowercase `de-stromwechsel/` directory there. Keep agent-managed state in `de-stromwechsel/internal/` and readable Markdown reports in `de-stromwechsel/reports/`. Year-based folders for documents the skill handles sit alongside `de-stromwechsel/`; reuse existing year folders where present. Inventory the user's old documents in place and record their locations. Do not sort, move, copy, or rename them. Keep provider-specific paths out of the shared skill plan. The exact contents and format of `internal/` remain open for implementation.
- **Confirm inferred locations:** when the current folder clearly appears to be the Strom archive and workspace, the skill may propose that inference with its reason, but must wait for the user's confirmation before creating files or beginning deep inventory. Previously saved locations may be reused when accessible and explicitly confirmed.
- **Combined financial exposure:** assess operational risks such as excessive advance payments and delayed final bills or credit refunds, including how they can compound into cash-flow exposure. Keep this distinct from tariff cost.
- **Private and shared knowledge stay separate:** personal research data is not published into shared provider knowledge. See [the knowledge-base plan](knowledge-base.md).
- **Incremental evidence-led development:** run phases on real documents and research tasks, inspect results, fix material issues, and repeat before moving forward. Avoid infrastructure and polishing without a demonstrated need.

## Scope

The intended v1 capability includes current-state research; discovery and comparison of electricity offers; price, bonus, and contract checks; provider assessment; automatic exclusion of unsuitable candidates; operational and combined financial risk analysis; evidence retention; resumability; and eventual use of shared provider knowledge. A passive user-facing task register for evidence-backed follow-ups is proposed as a shared cross-phase capability and will first be validated through Phase 0.1; it does not imply background monitoring or reminders.

**Explicit v1 exclusions:** integration with Wechselpilot or other intermediaries; identifying whether a user has an intermediary arrangement as a special research task; special warnings about such arrangements; submitting or terminating contracts for the user; performing the actual supplier switch; ongoing contract monitoring; and proactive follow-up or reminders about future final bills after a switch. The proposed task register does not change these exclusions: a user may still ask the skill to review a document they provide, within the currently implemented phase scope. The user remains responsible for existing contractual obligations. This skill researches, compares, and supports a tariff choice; it does not manage every aspect of electricity supply.

## Initial file target

The initial skill layout is deliberately small. The shared task-register reference is a proposed cross-phase resource to validate; no instructions for future phases are prebuilt:

```text
<existing-skill-root>/
├── SKILL.md
└── references/
    ├── phases/
    │   └── 0-preparation/
    │       └── 0.1-as-is/
    │           └── instructions.md
    └── tasks/
        └── instructions.md
```

`<existing-skill-root>` is a placeholder: its real repository path must be confirmed before implementation. The required skill metadata and file structure must follow the format already used by this repository. Add phase references, templates, or other files only when Phase 0.1 demonstrates a need.

## Proposed directions and open questions

- **Proposed:** the future funnel may include market discovery, cheap screening, contractual screening, operational-risk screening, deeper investigation, and final evaluation. Their current names and order are working labels, not a locked design.
- **Open:** the order of contractual and operational-risk screening, and the point at which each check is most valuable, should be tested.
- **Open:** precise evidence formats, the internal state schema, report naming and organization, research thresholds, review sources and weights, and other numeric defaults should emerge from implementation and testing. Do not treat examples in the handoff as fixed requirements.
- **Open:** the Phase 0.1 rules for an incidental discovery of intermediary-related material need clarification; the v1 exclusion is against a dedicated intermediary investigation.
- **Proposed:** a shared provider knowledge base may live in the skill repository's references, with later contributions reviewed by the maintainer. Its format and workflow remain undecided; Phase 0.1 must not depend on it.
- **Proposed:** choose models and reasoning effort to fit the work and observed results rather than binding each phase to a particular model.
- **Proposed:** use a shared `references/tasks/instructions.md` for task handling across phases. Store user-facing open tasks in `<workspace>/de-stromwechsel/tasks/active.md` and completed items in `done-YYYY.md` by completion year. Phase 0.1 is the first validation point. User-initiated later runs may update tasks based on user confirmation or supplied evidence. Validate whether the register is useful; no automatic reminders or background monitoring are in scope.

See [phase definitions and status](phases.md) and [shared provider knowledge](knowledge-base.md) for the working detail. The [decision log](decisions.md) keeps concise dated records and links decisions that supersede or override earlier ones. Update this plan as phase design and real testing resolve open questions.

## Development cycle

**Implement → Run on real inputs → Inspect results → Fix material issues → Repeat → Complete the phase.** Only after a phase works in practice should the next phase be designed. The immediate implementation target is Phase 0.1 As-Is Research.
