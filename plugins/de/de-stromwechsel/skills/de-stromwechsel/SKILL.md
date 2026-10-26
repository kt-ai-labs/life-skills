---
name: de-stromwechsel
description: Research, compare, and plan German household electricity-provider switches, especially recurring annual switches. Use for Stromanbieter search, tariff comparison, bonus and Preisgarantie checks, Ökostrom evaluation, direct-provider offer research, portal-assisted market snapshots, switching-risk analysis, Bonusjäger/Ablehnung concerns, and selection or activation of strategic reserve providers in Germany.
---

# Jährlicher Stromwechsel (DE)

Help the user choose and switch German household electricity providers with a repeatable, evidence-based process rather than blindly following comparison-portal rankings.

## Workspace and required inputs

**Every run, including a one-off comparison, must produce a dated, saved research report.** The agent owns the document structure; do not ask the user to create README files or organize reports manually.

1. **Find the target directory.** Use a target folder expressly supplied by the user or an unambiguous existing Stromwechsel workspace in the current project. Otherwise ask where to save reports *before starting substantive research*. Work only within the agreed directory. If file tools are unavailable or the directory is not writable, provide the report in the response and clearly disclose that it could not be saved; never claim it was written.
2. **Read relevant prior state first.** If present, read the target `README.md`, `history.md`, `fallback.md`, the relevant yearly `README.md` and the most recent useful dated research reports. Reuse known details instead of asking repeatedly. Treat saved prices, dates and contract conditions as historical evidence, not current quotes; verify again before recommending.
3. **Collect essential inputs not already documented:**
   - Full **supply** address: `PLZ`, `Ort`, `Straße`, `Hausnummer`, and separate `Hausnummerzusatz` (ask whether none exists). Example: Hausnummer `19` plus Hausnummerzusatz `C`, not a single combined field. Do not substitute a billing address.
   - `Jahresverbrauch` in kWh: last measured year, an average or a user estimate are all acceptable. Record which it is and label prices based on estimated consumption accordingly.
   - For a planned change: current provider/tariff and `Vertragsende` or desired `Lieferbeginn`, to the extent known. An exploratory one-off market comparison can use an approximate target period with that uncertainty declared.
   - Provider history, switching strategy, explicit exclusions and user overrides where relevant; infer from existing files when reliable, and ask only missing details that change the research.
4. **Protect personal data.** Store the full address in one reusable workspace profile (the root `README.md` in a private workspace), not in each research report. Before recording it in a Git-tracked workspace that might be public or shared, flag the exposure risk and obtain a private storage location or the user's informed approval. Do not silently commit or publish personal addresses; keep report copies free of unnecessary identifying details.

### Default workspace layout

Initialize or reuse the following structure in the agreed target directory, respecting any compatible existing organization:

```text
<target-directory>/
  README.md                    # reusable supply profile, consumption basis, current cycle
  history.md                   # previous providers, contracts, bonus and service outcomes
  fallback.md                  # designated Strategic Reserve providers and their status
  <target-year>/
    README.md                  # current contract, switch milestones, shortlist and decision
    research/
      YYYY-MM-DD.md            # dated research with evidence and recommendations
```

The year is the **intended new supply/contract year**, even when research starts during the preceding year. If the target year is genuinely unknown, use the year of the research and explain that choice. Initialize useful headings and links without inventing prior contracts, reserves or decisions. When an entry is unknown, label it `not yet established` rather than making one up.

For every research run, create a dated report under the corresponding `research/` folder; use a disambiguating suffix/time if the date filename already exists and preserve previous reports. Update the yearly `README.md` with the latest status, shortlist and link to the new report, and keep root `README.md` current without duplicating the full address in each report. Treat `history.md` and `fallback.md` as durable cross-year records: read them for context, and change provider history or reserve membership/status only when there is a confirmed event or an explicit user decision. Do not silently replace a strategic reserve with an ordinary cheap candidate.

## Core workflow

1. Apply the workspace and input rules above: confirm the target directory, reuse relevant saved files, obtain the complete supply address and kWh basis, then ask only for missing material switching context. Do not perform a full market comparison using only a PLZ when a provider requires street, number or suffix.

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

**Persist this output for every run**, including preliminary or one-time research, in the dated report described above. Include researched-at date, assumptions, kWh basis (measured/average/estimated), verifiable sources and offer dates, uncertainty, candidate comparison, and next steps. Do not present an estimated tariff as a guaranteed offer. Return a concise summary and the actual saved file path to the user.

At the end of a switching cycle, keep the durable records up to date when the relevant facts become known: chosen provider/tariff and economics, bonus payment and acceptance outcomes, reserve status, Kündigung, meter-reading and billing problems. Do not manufacture outcomes or overwrite previous research.

Do not submit a contract, cancel a supply agreement, sign up for services, or send personal information to third-party providers as a transaction without specific user authorization.

Respond in the user's language. Preserve German market and legal terms where they are clearer than translations.
