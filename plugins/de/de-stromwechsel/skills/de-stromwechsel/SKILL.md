---
name: de-stromwechsel
description: Research German household electricity tariffs and plan a self-managed Stromwechsel, from preliminary market research to a simulation using current address-specific offers. Use for annual switching, bonus and contract checks, provider reliability, Ökostrom, and strategic reserves.
---

# Self-managed Stromwechsel (DE)

Help the user investigate and compare German household electricity providers and prepare their own switch. Before substantive research, read [the research protocol](references/research-prompt.md); it owns tariff checks, economics, evidence standards and report contents.

## Research mode

Infer the mode from the request and existing context. If the choice materially changes the scope or result and intent is unclear, briefly offer both options. Do not repeat a settled mode question. Record the mode in each report; a later run can change mode while reusing the workspace and history.

- **Preliminary Research:** reconstruct the starting situation and investigate promising providers, current tariffs, material conditions, risks and limitations. A watchlist without a complete price ranking is acceptable. State what was checked, which prices were obtained or not obtained, and why. A distant switch date alone is no reason to skip today's available tariffs.
- **Switching Simulation:** simulate choosing a supplier now using real address-specific current offers. Attempt to obtain Arbeitspreis, Grundpreis, bonuses and contract terms, and compare first-year costs with and without attainable bonuses. If the real switch date is outside booking windows, use a suitable current quotation scenario and distinguish its Lieferbeginn from the actual intended date. A provider's application window limits the real switch, not research into current simulation prices. A list of provider names without attempts to obtain prices is insufficient; disclose concrete blockers if attempts fail.

## Scope and authority

The user performs contract applications, submissions, signatures, Kündigung, service registration and other legally consequential actions. Do not execute these actions on their behalf as part of this skill, even in Switching Simulation. Recommendations, instructions, checklists and drafts are in scope. Do not submit personal data through a transaction; use only the location and consumption needed for non-binding quotation research.

If documents reveal an active or possibly active automatic switching service, report it with the uncertainty about its current status and warn about conflicting automatic and independent applications. Offer a **separate, opt-in investigation** of exit terms, Vollmacht, automatic applications, Kündigungsfrist and remaining fees. Start that investigation only after user agreement. If declined, record the unresolved dependency and continue the tariff research. Do not turn this workflow into a comparison of switching intermediaries or require their APIs/MCP.

## Workspace and inputs

Every research run, including a preliminary or one-off comparison, produces a dated saved report. Use the expressly supplied directory or an unambiguous existing Stromwechsel workspace; otherwise ask where to save results before substantive research. Keep persistent outputs within that directory. If persistence is unavailable, provide the report in the response and disclose that it could not be saved.

Read existing root and yearly README files, history, reserves, the latest useful research and any existing yearly action-required.md first. Reuse verified inputs; stored prices and conditions remain historical until refreshed. Ask only for missing information that affects the research:

- **Supply address:** PLZ, Ort, Straße, Hausnummer and separate **Hausnummerzusatz (Zusatz)**, or explicitly none. For `Musterstraße 22C`, Hausnummer is `22` and Zusatz is `C`. Calculator fields may say only `Zusatz`; leave them empty when absent. Do not confuse it with an apartment, floor or other address addition, and do not substitute a billing address. Use the full location when a calculator requires it.
- **Jahresverbrauch:** select one primary annual figure using the rules below.
- **Switching context:** current supplier/tariff, contract end or intended Lieferbeginn (approximate is acceptable for exploration), recent providers, exclusions, switching strategy and already designated reserves where known.
- **Personal provider experience:** reuse known positive/negative service experiences and stable preferences; ask about them only when relevant information is missing. Keep preferences in the private root README and dated experiences, their evidence and outcomes in history.md. A reported event is not automatically document-verified or a provider exclusion; apply the targeted assessment in the research protocol.
- **Historical documents:** offer the option to supply an existing archive directory for contracts, Rechnungen, Schlussrechnungen, switch confirmations and bonus terms. Reuse its location if already documented instead of asking again.

### Consumption basis

1. Honor an explicitly required calculation value from the user. Merely providing a number does not make it a required scenario.
2. Otherwise use the latest reliable complete annual Verbrauch unless there is reason to consider it unrepresentative; briefly explain any difference from the reported figure.
3. Without a suitable complete-year document, use the reported figure with its actual provenance. Unknown provenance is neither confirmed measurement nor a confirmed estimate.

Keep the user-reported figure, documented annual figure and selected calculation basis distinct in the private profile. Never record the agent's selection as a user requirement or infer provenance solely from how round a number looks. Do not automatically annualize a partial-year bill. Use one primary Jahresverbrauch consistently; add another scenario only if it materially affects the choice or the user requests it.

### Documents and privacy

Start with the current contract, latest annual/final bills, switch confirmations and bonus conditions. Extend to older records only as needed to establish history, eligibility, calculations or service problems. Prefer corrected documents over superseded versions and distinguish invoice credits/promises from verified payments.

Use existing PDF capabilities; no particular PDF tool or new script is required. Minimize temporary extracts containing personal data, restrict their exposure and remove the agent's own unnecessary temporary copies after processing. Never delete or alter the user's source archive.

When a material verification needs human help, documents or material web evidence are retained, or yearly user actions exist, read [documents and user actions](references/documents-and-actions.md). It owns domain-specific evidence retention and persistent action states.

Store the full address once in the root profile of a private workspace, not in each report. Before writing it in a potentially public/shared Git workspace, flag exposure and obtain a private location or informed approval. Do not silently commit or publish personal data.

### Durable layout

Reuse a compatible organization or initialize:

```text
<target>/
  README.md                 # supply profile, consumption basis, archive location, current cycle
  history.md                # confirmed suppliers, bonuses, acceptance and service outcomes
  fallback.md               # reserve candidates and user-designated reserve status
  <target-year>/
    README.md               # cycle status, milestones, options and latest report link
    research/YYYY-MM-DD.md
    docs/<provider>/        # optional: retained research documents, created on receipt
    action-required.md      # optional: one yearly register of unresolved user actions
```

Use the intended actual new-supply year, even for a simulation with an earlier quotation date. If that year is unknown, use the research year and explain. Preserve prior reports with a suffix/time on date collisions. Update the annual overview and changed verified profile inputs. Keep history and designated reserve status factual: update only for confirmed events or explicit user decisions; label unknowns rather than inventing them.

## Communication and language

Give brief, substantive updates at meaningful points: reconstructed context, important contradictions, price results or blockers, and decisions about the next research step. Explain a material scope change promptly, especially a retreat from price comparison to a watchlist; avoid narration of every technical operation.

Use the user's working language for responses and all new household documents: profile, history, fallback, yearly overview, report and user-action register, unless they explicitly choose another. A general preference for English code or technical documentation does not automatically determine the language of these household reports. On continuation, honor explicit language choices and write each updated semantic section coherently in that language, without translating historical reports solely for consistency. Preserve precise German contract terms.

The final response must give the result, main options and confirmed comparative costs where available, or clearly say that reliable prices were not obtained. State the principal uncertainties and next action; list saved report paths separately. File paths alone are not a result.
