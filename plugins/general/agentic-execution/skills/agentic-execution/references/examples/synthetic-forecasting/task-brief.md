# Task Brief — Compare daily demand forecasting methods

**Task:** `synthetic-demand-forecasting`  
**Status:** Illustrative draft — not approved  
**Created:** 2026-01-01 09:00:00Z (fictional)  
**Last Updated:** 2026-01-01 09:00:00Z (fictional)

## Research question

Do more complex daily visitor-count forecasts improve on simple baselines under a reproducible chronological evaluation?

## Intended outcome

An evidence-backed comparison of the three requested forecasting methods, with reproducible data and evaluation, comparable predictions, and honest conclusions including negative or inconclusive findings.

## Objectives

### O01 — Establish a valid evaluation dataset and protocol

**Dependencies**

- None beyond the authorized synthetic-data generation scope.

**References**

- [R2 — evaluation constraints](request.md#r2--evaluation-constraints): governs data generation, chronological isolation and comparable forecast dates.
- [R4 — deliverables](request.md#r4--deliverables): requires reproducibility and excludes real data.

### O02 — Produce comparable forecasts for all candidate methods

**Dependencies**

- O01: validated generated dataset and fixed evaluation protocol.

**References**

- [R1 — forecasting question](request.md#r1--forecasting-question): establishes comparative purpose.
- [R3 — candidate methods](request.md#r3--candidate-methods): specifies candidates and forecast-time feature availability.
- [R2 — evaluation constraints](request.md#r2--evaluation-constraints): requires a common evaluation population and no hidden exclusions.

### O03 — Assess performance and limitations

**Dependencies**

- O01: evaluation protocol and period definitions.
- O02: identifiable comparable forecasts and failure records.

**References**

- [R3 — candidate methods](request.md#r3--candidate-methods): establishes primary metric and period-specific reporting.
- [R4 — deliverables](request.md#r4--deliverables): requires reproducible evidence and comparative report; no assumed positive outcome.

## Shared scope, exclusions and constraints

Use only synthetic counts; no personal or external data, real staffing recommendations or operational changes. Preserve failed or missing prediction evidence. Report uncertainty rather than asserting real-world generalization.

## References

**Authoritative for this fictional scenario:** [Illustrative request, R1–R4](request.md). Its constraints take precedence over illustrative Plan proposals.

**Context:** No prior work or real observations.
