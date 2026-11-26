# Task Plan — Compare daily demand forecasting methods

**Task:** `synthetic-demand-forecasting`  
**Status:** Illustrative draft — not approved  
**Created:** 2026-01-01 09:00:00Z (fictional)  
**Last Updated:** 2026-01-01 09:00:00Z (fictional)  
**Task Brief:** [Task Brief](task-brief.md)

## Reviewer Profiles

Proposed — pending human confirmation. Illustrative V2 defaults; actual supported selection and human confirmation are required.

- **Batch:** Discovery and Execution Batch planning/execution.
  - Codex: Sol Medium
  - Claude Code: Opus High
- **Final Substantive:** Task Definition and final substantive correctness.
  - Codex: Sol High
  - Claude Code: Opus High
- **Final Completeness:** Final obligation and evidence completeness.
  - Codex: Sol High
  - Claude Code: Opus High

## Overall strategy

Use a deterministic synthetic dataset and a chronological split. Freeze the evaluation protocol before fitting candidates. Evaluate all methods on the same one-day-ahead forecast dates; do not tune using holdout outcomes. Preserve implementation, evidence and limitations. Model comparison is the goal, not a predetermined winner.

## Objectives

### O01 — Establish a valid evaluation dataset and protocol

**Dependencies**

- None.

**Strategy**

Generate 365 daily nonnegative counts from a documented seeded process with weekday effects, random noise and a demand change. Propose the final 90 days as a holdout excluded from fitting, tuning and feature selection, with training-only chronological validation. Define nonempty evaluation periods (for example, pre-change and post-change portions of the holdout if the planned change lies within it) before examining holdout outcomes.

**Key Assumptions / Decisions**

- Dataset length, seed, change timing, split and period boundaries are illustrative proposals. Specify and justify them during Discovery before requesting approval.
- The task measures synthetic performance, not real library behavior.

**Expected Evidence**

- Versioned generator and configuration; generated dataset with dates and generation provenance.
- Frozen split, forecast horizon, period definitions and validation protocol.

**Verification**

- Reproduce the same data from the same configuration; verify dates, counts and documented change.
- Verify nonoverlapping chronological ranges, validation restricted to training and that the holdout cannot affect fitted parameters or model selection.

**References**

- [R2 — evaluation constraints](request.md#r2--evaluation-constraints): supports the chronology and leakage-prevention strategy.
- [R4 — deliverables](request.md#r4--deliverables): supports the reproducible synthetic artifact design.

### O02 — Produce comparable forecasts for all candidate methods

**Dependencies**

- O01: validated dataset and frozen protocol.

**Strategy**

Compare same-weekday historical value, trailing historical average and regularized regression with weekday and lagged features. Select window lengths and regularization using training-only validation. For each one-day-ahead prediction, use only observations available before the forecast date. Freeze model choices and fitted parameters before the holdout; do not refit within it. Apply fixed baseline rules to the observations available before each date.

**Key Assumptions / Decisions**

- The request permits earlier observed holdout days only as forecast-time inputs for later predictions. The proposed fixed baseline and regression feature rules use that policy without refitting, tuning or feature selection. Confirm the exact feature and cutoff policy in Definition.
- Define missing-prediction handling before evaluating results. No post-hoc removal.

**Expected Evidence**

- Versioned code and candidate configurations.
- Predictions keyed by model and forecast date, actual counts, input cutoff and failures or missing predictions.

**Verification**

- Verify all three candidates against the same expected date set and horizon, with no future inputs.
- Check forecast calculations independently on selected cases; reconcile missing predictions without silently restricting comparison.

**References**

- [R3 — candidate methods](request.md#r3--candidate-methods): establishes candidate families.
- [R2 — evaluation constraints](request.md#r2--evaluation-constraints): establishes comparable dates and forecast-time availability.

### O03 — Assess performance and limitations

**Dependencies**

- O01: evaluation protocol and period definitions.
- O02: comparable forecast records and failure evidence.

**Strategy**

Calculate mean absolute error on the predeclared comparable evaluation population and each declared period. Report coverage and failures separately; if missing predictions prevent a fair primary comparison, report the limitation rather than presenting a misleading ranking. Compare against both baselines and discuss whether gains are meaningful for this synthetic scenario.

**Key Assumptions / Decisions**

- Any additional diagnostic metric is secondary and disclosed; no retrospective replacement of the primary metric.
- No conclusion about real-world generalization is justified by synthetic results alone.

**Expected Evidence**

- Reproducible metric tables and calculation code with period coverage and model provenance.
- Comparative report with findings, negative/inconclusive outcomes and limitations.

**Verification**

- Recompute selected and aggregate errors from the actual predictions and actual values; verify denominator, dates, period coverage and agreement with the report.
- Check all three candidates and every Brief obligation; distinguish observed results from interpretation.

**References**

- [R3 — candidate methods](request.md#r3--candidate-methods): establishes the primary metric and period reporting.
- [R4 — deliverables](request.md#r4--deliverables): establishes the comparative report and evidence requirements.
