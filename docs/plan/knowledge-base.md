# Shared Provider Knowledge

This document describes the future direction for provider-specific research knowledge and how it stays separate from a user's private research. The concept is not part of the first Phase 0.1 implementation.

## Agreed direction

- Later funnel phases are expected to use and incrementally improve shared knowledge about electricity providers.
- A user's personal contracts, address, meter identifiers, and other personal information must remain separate from shared provider material and must not be contributed to it.
- Shared observations are leads for later investigation, not facts that can be accepted without checking. Reassess whether they are current and verify claims independently against suitable evidence.
- The skill should not automatically overwrite shared knowledge during an individual's research.
- Future contributions should be reviewable by the skill maintainer before they are added. A central user database, feedback service, or similar infrastructure is not required by this direction.
- Phase 0.1 must work without an existing provider knowledge base.

## Proposed organization and use

The handoff proposes keeping shared material in the skill repository's `references`, with a provider folder that can hold separate, focused materials for distinct risks or assessments. This is a preferred direction, not an approved schema. It avoids requiring one large, all-purpose file per provider.

A research recipe may accompany an observation and explain how to check it again: which claims and sources to investigate, how to distinguish an isolated complaint from a recurring pattern, how to judge severity, and what evidence could confirm or disprove the earlier finding. Treat each recipe as a starting evaluation rubric, not as a guarantee that the old conclusion remains true.

In a later Discovery phase, the intended local workflow is to:

1. Read applicable shared references for a candidate provider.
2. Check whether their evidence is still relevant and current.
3. Gather new evidence for the user's scenario.
4. Produce an updated local result in a format compatible with the eventual shared materials.
5. Keep that local research from changing shared references automatically.

The format compatibility in step 4 depends on a future format decision; it is not a reason to choose a schema before testing the workflow.

## Contributions and privacy

**Proposed:** a user could later share new or updated research as a ZIP or through a GitHub Issue or pull request. The maintainer would review it and verify the evidence before incorporating it. These are possible contribution paths, not implemented workflows.

Only non-personal provider evidence belongs in shared knowledge. Exclude private contracts and bills, names, addresses, meter numbers, and other identifying or household-specific information. Keep private research in the user's own local workspace; its exact directory layout and file format remain open and are to be designed only as needed by the phase being implemented.

## Open questions

- What file structure and format best support focused provider observations and reproducible research recipes?
- How should source dates, evidence quality, applicability, confidence, and review freshness be represented?
- What contribution route is practical for the repository, and what review is required before a contribution is accepted?
- How should local research be reconciled with shared material when they conflict?
- What minimum provider knowledge, if any, is useful before the first market-discovery phase?

Resolve these questions when implementation reaches a phase that needs shared provider knowledge. Until then, avoid creating empty provider folders, schemas, contribution infrastructure, or future-phase instructions.
