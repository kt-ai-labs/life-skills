# Illustrative request

## R1 — Forecasting question

Compare daily library-visitor forecasts for a synthetic dataset. Determine whether more complex forecasting methods improve on a simple baseline. Do not assume improvement in advance.

## R2 — Evaluation constraints

Use generated daily counts and a documented deterministic seed. Include weekly seasonality, random noise and a documented change in demand. The final chronological holdout must not influence model fitting, tuning or feature selection. Compare the same forecast dates and horizon for all candidates. Report missing or failed predictions; never remove them just to improve scores.

## R3 — Candidate methods

Compare a same-weekday seasonal baseline, a trailing-average baseline, and a regularized regression using features available at forecast time. Use mean absolute error as the primary metric; report performance across predeclared periods and limitations. Exact window lengths, holdout length and model tuning procedure are proposals for the Task Plan, not additional requester requirements.

## R4 — Deliverables

Provide reproducible generation and evaluation code, predictions and metrics, and an evidence-backed comparative report. A negative or inconclusive result is acceptable. No real visitor data, personal information, external data collection, or operational staffing changes are in scope.
