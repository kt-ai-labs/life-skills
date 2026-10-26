---
name: de-stromwechsel
description: Research, compare, and plan German household electricity-provider switches, especially recurring annual switches. Use for Stromanbieter search, tariff comparison, bonus and Preisgarantie checks, Ökostrom evaluation, direct-provider offer research, portal-assisted market snapshots, switching-risk analysis, Bonusjäger/Ablehnung concerns, and selection or activation of strategic reserve providers in Germany.
---

# Jährlicher Stromwechsel (DE)

Help the user choose and switch German household electricity providers with a repeatable, evidence-based process rather than blindly following comparison-portal rankings.

## Core workflow

1. Reuse context the user already supplied. Ask only for missing inputs that materially change the result:
   - supply location (at least PLZ/Ort; exact address when provider pricing or availability requires it)
   - annual consumption in kWh
   - current provider/tariff and intended switch date
   - recent provider history when available
   - switching strategy: annual optimization or longer-term stability
   - explicit constraints or preferences the user wants to override

2. Unless the user specifies otherwise, use this consumer-friendly baseline:
   - Festpreistarif
   - Erstlaufzeit no longer than 12 months
   - Preisgarantie covering the whole initial term, with scope checked explicitly
   - Kündigungsfrist no longer than 1 month
   - monthly Abschläge
   - no Vorkasse, Kaution, or Pakettarif
   - stronger Ökostrom preference: 100% renewable electricity plus independently evidenced additional Energiewende contribution where reasonably available
   - for intentional annual switchers, count realistically attainable bonuses in first-year economics

   Briefly tell the user which defaults you are applying. Do not force a questionnaire when the defaults are acceptable; let the user override them.

3. Before substantive market research or producing a shortlist, read [references/research-prompt.md](references/research-prompt.md) and apply its protocol to the user's current context.

4. Treat CHECK24, Verivox, and similar portals as optional discovery inputs, not ranking authorities. If a fresh portal snapshot would improve coverage, offer to guide the user through the current filter settings. When the user supplies an export, use it as a seed and never infer that an omitted checkbox/radio state means the option was disabled. Follow the detailed portal workflow in the research protocol.

5. Search provider-direct offers as well as portal-discovered tariffs. Prefer official provider documents for price, Laufzeit, Kündigung, Preisgarantie, and bonus conditions. Use independent sources for operational and complaint evidence.

6. For an intentional annual switcher, optimize primarily for effective first-year cost after realistically attainable bonuses. Do not penalize a large bonus merely because it is large. Verify that bonus conditions are compatible with ordinary termination after roughly 12 months, and always show no-bonus/base cost as downside and second-year context.

7. Keep financial attractiveness separate from operational reliability. Check recurring evidence around Kündigung, Zählerstand, Schätzung, Schlussrechnung, Guthaben, bonus payout, correction delays, support, and failed switches.

## Strategic reserve providers

Use reserve providers as a provider-level risk-control mechanism, not another tariff recommendation.

- If the user has no reserves, identify 1–2 suitable providers using the selection method in the research protocol.
- Preserve providers that are dependable, broadly market-reasonable, and acceptable to stay with for roughly 2–3 years; do not choose them for the lowest first-year price.
- Once designated, exclude a reserve provider from normal annual-switch optimization even if it temporarily becomes attractive.
- When repeated rejections or clear frequent-switcher friction make further optimization unattractive, switch from **optimize** to **stabilize** and consider activating a reserve.

## Output

Keep the decision practical:

- state assumptions and any missing data;
- return no more than 3–5 normal candidates unless the user asks for more;
- show first-year effective cost, base/no-bonus cost, key terms, bonus safety, Ökostrom quality, operational risk, and important caveats;
- list strategic reserve providers separately and mark them as **do not use in normal switching**;
- include attractive near-misses or rejected candidates when the rejection reason teaches something important;
- give the concrete next step for contract verification or Abschluss.

At the end of a completed switching cycle, if the information is not already stored somewhere, remind the user to consider preserving for the next cycle:

1. the chosen provider/tariff and actual economics;
2. the current Strategic Reserve Provider(s), including any reserve added, replaced, consumed, or activated;
3. bonus payout outcome and acceptance/rejection history;
4. Kündigung outcome and material meter-reading, billing, or service problems.

Do not impose a storage format; let the user choose a spreadsheet, Markdown, notes, another system, or nothing.

Respond in the user's language. Preserve German market and legal terms where they are clearer than translations.
