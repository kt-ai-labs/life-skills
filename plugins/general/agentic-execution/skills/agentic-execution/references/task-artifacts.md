# Task artifact contracts

Use plain Markdown and project-local conventions. This is a suggested mapping, not a universal physical layout. Keep the logical roles distinct; record any existing alternative mapping once. Use the project's authority rules and preserve original inputs.

```text
<Task Directory>/
  task-ledger.md            # actual events across the whole lifecycle
  01-task/
    task-brief.md
    task-plan.md
    references/              # human-provided sources or links
    request.md              # original request, material dialogue, scope
    decisions.md            # human decisions, approvals, launch, runtime events
  02-context/
    index.md
    D00-initial-discovery/
      plan.md
      README.md
      index.md
    D01-<description>/
      README.md
      index.md
  03-execution/              # only after explicit launch
    execution-plan.md
  04-reviews/
    01-discovery/batch/
    01-discovery/final-task-definition/
    02-execution/batches/
    02-execution/final-substantive/
    02-execution/final-completeness/
  05-results/evidence/
  05-results/published/
```

Create files/directories when needed; initialize the root [Task Ledger](task-ledger.md) during Task initialization, before D00. Its logical role is distinct from plans, decisions, reviews and evidence. For legacy Tasks follow the explicit adoption rule in [Start and resume](start-and-resume.md#skill-identity-and-continuity). Before storing original requests, dialogue, evidence or Task records, establish that the chosen location and any later commit/share are authorized for their sensitivity. Keep restricted originals in authorized private storage, with recoverable access-controlled references from the Task records when necessary; do not save credentials or unrelated personal data merely for completeness. If necessary authorized storage or reviewer access is unavailable, block the affected work. Published means the designated result area, not permission for external publication. A human decision lives in one authoritative record; cross-link from the Plan or Ledger rather than maintaining competing copies. Runtime preflight and governing Skill identity are recorded in decisions.md as existing lifecycle records per [Start and resume](start-and-resume.md#skill-identity-and-continuity), never as Plan configuration. Record UTC times (or explicitly unknown), actor, scope and recoverable version pointers; the Task Ledger has its own mandatory event identity and full UTC timestamp format. Use [evidence and checkpoints](evidence-and-checkpoints.md) to identify governing content; status and timestamp metadata are distinct from substantive changes.

## Request and material dialogue

Preserve the original human request verbatim in request.md or via an authorized recoverable restricted original when its sensitivity precludes local storage; retain language and source provenance and record authorized work areas. Do not reproduce secrets in broadly accessible records. Append material two-way exchanges throughout definition, execution and re-entry: speaker, order/time if known, meaningful original wording, Executor question/proposal and concise user-facing rationale, human answer/correction. Capture promptly, not by reconstructing lost chat as verbatim; preserve restricted portions via the same authorized private-reference rule as the original request. Omit routine status, raw logs, tool calls and private reasoning. A decision/approval is authoritative in decisions.md; link it rather than duplicating decision state. Reviewers read relevant excerpts and source artifacts, not the whole conversation. Existing alternate mapping is fine if recorded; no new transcript file required.

## Task Brief — WHAT / WHY

Human-readable structure (the three required level-two sections below follow the header in the stated order):
- Header: Task ID, Draft/Approved (or explicit effective revision status), Created and Last Updated UTC (`YYYY-MM-DD HH:mm:ssZ`). Created is fixed; use known provenance or label unknown. Update Last Updated on document edits.
- A separate required level-two Markdown section: `## Task`, `## Problem`, `## Research Question` or `## Hypothesis` (choose the applicable framing). State what needs to be addressed and why.
- `## Intended Outcome`: a separate required level-two section stating the desired result (no assumed positive scientific finding). Do not combine it with the preceding section.
- `## Objectives`: a separate required level-two section following Intended Outcome. `### O01 — Name` etc. Each states the human-level obligation, **Dependencies** (one required input per item, referenced O-ID or external prerequisite; say none if none), then **References** (source, precise locator and why it establishes the requirement).
- Shared scope, exclusions and constraints; Objective-specific exceptions beside that Objective. Preserve any human-required use of particular Tools or Skills as an applicable constraint, not merely a suggested method.
- References source register: **Authoritative** (human-designated governing sources/amendments, precedence/conflicts) and **Context** (prior results, drafts and unconfirmed material). Draft classification is proposed until approved.
- Genuine decisions requiring confirmation only.

## Task Plan — strategic HOW

Same header plus link to corresponding Brief. Include a single `## Reviewer Profiles` section per [Reviewers](reviewers.md), then overall strategy, an optional `## Tools & Skills` section for shared or cross-cutting choices, Objectives, shared decisions/limitations and real pending choices as relevant.

Match every top-level Brief Objective ID **and exact name** one-to-one. Each Objective contains:
- **Dependencies:** required previous Objective outputs/external inputs, one per item.
- **Strategy:** essential methods, alternatives, rationale and trade-offs.
- **Tools & Skills** (where applicable): material choices specific to this Objective, not repetitions of applicable Task-level choices.
- **Key Assumptions / Decisions:** established vs proposed vs pending material choices.
- **Expected Evidence:** what output, finding or record demonstrates completion, including valid negative/inconclusive findings.
- **Verification:** how to verify the evidence (validity, comparability, provenance, reproducibility, timing or relevant criteria); never omit the basis for any mandatory Objective.
- **References:** precise sources supporting strategy or method, not merely a repeated requirement citation.

### Tools & Skills at both levels

Explicitly identify strategically significant tools, frameworks and additional Skills in the applicable block. State each one's purpose, applicable Objectives or activity scope (Task-level does not necessarily mean every activity), and material constraints, outputs or evidence implications where relevant. Objective-level choices supplement shared choices; identify any justified exception explicitly and resolve conflicts before acceptance. Omit empty blocks and avoid listing routine commands, interchangeable utilities or every library. Distinguish proposed choices from established or human-required ones; assess availability, suitability and compatibility proportionately during Definition. Selection does not itself grant access, disclosure, installation, external-action or other permissions. Apply additional Skills only within their accepted scope, project rules, human authority and this lifecycle's Single Focus, independent review and checkpoint requirements. If a workflow cannot be applied compatibly, resolve the conflict or block affected work; do not bypass either a human requirement or a lifecycle gate. Preserve required workflows and their evidence without duplicating external artifacts; reference them from existing Task records. No particular tool or additional Skill is mandatory by default.

Omit empty boilerplate; explain no dependencies/check separately applicable where useful. Allocate stable O-IDs monotonically; never recycle retired IDs. Resolve contradictory, circular or missing strategic prerequisites. Do not silently add Objectives, import past decisions as binding or defer major methodology to the Execution Plan. No fine-grained steps, runtime state or Executor profile in Task Plan.

## Source navigation

Preserve human references or link their authoritative location; corrections are explicit amendments, never edits to the original source. Discovered sources are evidence/context, not automatic instructions. Use local relative links and actual heading anchors; for PDF use supported page fragments or page locators, for notebooks use supported cell/section links or cell number/ID, for other artifacts use precise format-appropriate locators. External sources use stable URLs with date/version as relevant. If a deep link is unsupported, use file link and human-readable location; never invent one. A reference explains its role. Use only material spans, not unnecessary copies. Sources need recoverable identity; if unavailable, label the gap. [Examples](examples/README.md) are optional illustrations.
