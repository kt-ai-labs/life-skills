# Example — electricity supplier research

Fictional German household scenario. This is a format illustration, not a real tariff quotation, completed research, approved Task, or authorization to switch providers.

## Illustrative request

**R1:** Run a non-binding Switching Simulation for a household electricity supply scenario to be specified during Definition. Compare first-year costs of real current address-specific offers with and without attainable bonuses, and distinguish simulated quotation timing from feasibility at the actual intended start.

**R2:** Check contractual conditions and explain material operational risks using dated evidence; distinguish unavailable evidence from confirmed failure.

**R3:** Recommend a suitable option for the quotation scenario, or explain why no suitable option can be established. This fictional request is limited to the annual tariff choice; strategic reserve assessment and designation are out of scope. No application, contract acceptance, cancellation or supplier switch is authorized. Keep personal supply details and records in authorized private storage; use only the minimum inputs needed for non-binding quotations.

# Task Brief — Compare household electricity offers

**Task:** `synthetic-electricity-comparison`  
**Status:** Illustrative draft — not approved  
**Created:** 2026-01-01 09:00:00Z (fictional)  
**Last Updated:** 2026-01-01 09:00:00Z (fictional)

## Research Question

Which eligible electricity offer, if any, best satisfies the consumption, timing, price and risk constraints to be established for the scenario, and what is known about feasibility at the actual intended start?

## Intended Outcome

A reproducible comparison and justified recommendation, including a no-suitable-offer or insufficient-evidence outcome if warranted.

## Objectives

### O01 — Identify comparable eligible offers

Establish comparable current address-specific offers, including first-year costs with and without attainable bonuses, applicable contractual conditions and material operational risks; distinguish quotation eligibility from actual-start feasibility and document gaps and exclusions.

**Dependencies**

- Authorized supply-point scenario and applicable eligibility inputs.
- Confirmed primary annual consumption basis.
- Actual intended supply start.

**References**

- [Illustrative request](#illustrative-request), R1 and R2: establish offer eligibility, costs and contract/risk checks.

### O02 — Recommend a suitable contract

Compare the eligible options and justify a suitable choice or the absence of a verified suitable offer; do not take contractual action.

**Dependencies**

- O01: offer and eligibility evidence, verified terms where available, exclusions and evidence gaps (including a documented absence of comparable eligible offers).

**References**

- [Illustrative request](#illustrative-request), R3: requires a justified recommendation or an honest negative outcome without taking contractual action.

**Shared constraints:** No applications, contract acceptance, cancellations, supplier switches, strategic reserve assessment or designation. Keep household details in authorized private storage; disclose only minimum inputs for non-binding quotations. Do not invent live offers or verification.

## References

**Authoritative for this fictional scenario:** [Illustrative request](#illustrative-request), R1–R3.

**Context:** No actual provider evidence is supplied in this example.

# Task Plan — Compare household electricity offers

**Task:** `synthetic-electricity-comparison`  
**Status:** Illustrative draft — not approved  
**Created:** 2026-01-01 09:00:00Z (fictional)  
**Last Updated:** 2026-01-01 09:00:00Z (fictional)  
**Task Brief:** [Task Brief](#task-brief--compare-household-electricity-offers)

## Reviewer Profiles

Proposed — pending human confirmation for both harnesses. Illustrative requested defaults; verify actual model/effort support in each harness when used.

- **Batch:** Discovery and Execution Batch planning/execution.
  - Codex: Sol High
  - Claude Code: Opus High
- **Final Substantive:** Task Definition and final substantive correctness.
  - Codex: Sol High
  - Claude Code: Opus High
- **Final Completeness:** Final obligation and evidence completeness.
  - Codex: Sol High
  - Claude Code: Opus High

## Overall strategy

Use the Switching Simulation mode of the applicable electricity-research domain method within the explicitly narrowed annual-tariff scope. Collect cheap evidence first and deepen checks only where they can change suitability or the decision. Definition-stage Discovery establishes scenario, strategy, source availability and evidence requirements; the approved offer investigation is Execution.

## Tools & Skills

- de-stromwechsel Skill — proposed domain workflow for offer research and recommendation (O01–O02); use the applicable version confirmed during Definition.

## Objectives

### O01 — Identify comparable eligible offers

**Dependencies**

- Authorized supply-point scenario and applicable eligibility inputs.
- Confirmed primary annual consumption basis.
- Actual intended supply start.

**Strategy**

Attempt real current non-binding address-specific quotations and obtain applicable contractual terms. Screen eligibility and compare costs for consistent consumption, quotation start, period and mandatory charges; distinguish attainable bonuses from uncertain or excluded ones. Investigate risk and contract conditions proportionately. If the actual intended start is outside booking windows, choose and justify a separate current quotation scenario; assess real-start limitations separately. Where interactive browser research is necessary, use the applicable authorized browser method.

**Tools & Skills**

- browser-research Skill — proposed for interactive offer-source inspection if needed and supported; use authorized browser access only.

**Key Assumptions / Decisions**

- Confirm consumption, start scenario and selection constraints during Definition. Unavailable price or contract data is not verified evidence.
- If a separate quotation date is needed, distinguish modelled timing, date selected in the calculator and timing compatibility established by applicable terms. None establishes a binding supplier acceptance.

**Expected Evidence**

- Dated quotation records or documented blocked attempts, source locators, scenario and input basis (without duplicating private address details), eligibility/exclusion reasons, cost components, contractual conditions, relevant risk evidence and gaps.

**Verification**

- Check source dates and supply-point applicability, consistent quotation start and consumption, price components and bonus attainability; verify material contract conditions, risk evidence and actual-start limitations separately. Reconcile missing evidence and exclusions.

**References**

- [Illustrative request](#illustrative-request), R1–R2: establishes offer and evidence requirements.
- [de-stromwechsel Skill](https://github.com/kt-ai-labs/life-skills/blob/main/plugins/de/de-stromwechsel/skills/de-stromwechsel/SKILL.md), Research mode and linked research protocol: proposed domain method; confirm the actual applicable version during Definition.

### O02 — Recommend a suitable contract

**Dependencies**

- O01: verified offer/eligibility records where available, exclusions and documented evidence gaps, including the absence of comparable eligible offers if applicable.

**Strategy**

Compare eligible offers for the quotation scenario using the user's approved constraints. Keep tariff cost distinct from risk and uncertainty, and distinguish the simulated recommendation from actual-start feasibility. If reasonable authorized alternatives are exhausted without a defensible choice, report the simulation as incomplete, with concrete blockers and next actions; do not mislabel it as a completed simulation.

**Key Assumptions / Decisions**

- No recommendation constitutes permission to switch or accept a contract. Strategic reserve research is outside this illustrative request.

**Expected Evidence**

- Dated report with reproducible comparison, reasoned recommendation or documented negative/inconclusive investigation outcome, actual-start limitations, and the domain simulation's actual completion status.

**Verification**

- Recompute available comparable first-year costs with and without attainable bonuses; check consistency with source conditions, constraints, limitations and the full Brief. Verify the report and applicable domain records are saved within authorized storage. If no comparable eligible offer can be verified, verify the recorded attempts, alternatives, exclusions and gaps instead of inventing prices or a recommendation. A verified inconclusive investigation does not establish a completed Switching Simulation.

**References**

- [Illustrative request](#illustrative-request), R1–R3: establishes comparison, risk assessment and the authority boundary.
- [de-stromwechsel research protocol](https://github.com/kt-ai-labs/life-skills/blob/main/plugins/de/de-stromwechsel/skills/de-stromwechsel/references/research-prompt.md): proposed method for costs, terms and risk checks; actual offers remain Execution evidence.

## Lifecycle notes

Neither draft is approved. In an actual Task initialize the root Task Ledger and Agentic Decisions before D00 and record material lifecycle starts/outcomes, including review and human decisions by reference. Apply independent Definition review, separate Brief/Plan approvals and explicit launch under the current Skill before substantive Execution. Use ordinary batch planning, independent acceptance, durable checkpoints and both final reviews. Do not treat this example as evidence of actual offers or execution.

### Illustrative Risk Tripwires and Agentic Decisions

If material, RT001 (O01/O02): a quotation cannot be made for the actual intended start; risk of confusing scenario suitability with feasibility. Tripwire: provider booking window excludes actual start. Response: use a separately identified authorized quotation scenario if within approved strategy, retain the actual-start limitation, stop unsupported recommendation claims; otherwise re-enter Definition. Store the definition in the living risk artifact, not as evidence of actual trigger. A material Executor decision to select a different quotation scenario would be appended to Agentic Decisions with actual time, rationale, authority and references; a later human override is a new linked disposition. No actual decision, trigger or approval is asserted in this fictional example.
