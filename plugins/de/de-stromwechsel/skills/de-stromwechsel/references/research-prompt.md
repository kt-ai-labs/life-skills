# Research protocol: German household electricity switching

Use this protocol for substantive market research under the **de-stromwechsel** skill. Adapt all variables to the user's actual context and never carry personal values from a previous user into a new run.

## Contents

1. Objective
2. Input variables
3. Current-guidance check and baseline enforcement
4. Portal snapshot workflow
5. Market discovery
6. Pricing and first-year economics
7. Bonus safety
8. Preisgarantie and contract terms
9. Ökostrom quality
10. Operational reliability
11. Frequent-switcher / acceptance risk
12. Strategic reserve providers
13. Evidence hierarchy
14. Decision model
15. Required output
16. Final verification checklist

## 1. Objective

Find a small, actionable shortlist of German household electricity offers that fit the user's constraints and switching strategy.

Do not merely reproduce a comparison portal. Independently verify the terms that matter, search for direct-provider offers, assess operational failure modes, and keep strategic reserve providers separate from ordinary annual-switch candidates.

For intentional annual switchers, optimize the first contract year without treating a safe Neukundenbonus or Sofortbonus as a defect. For users who prefer stability, shift weight toward ongoing/base economics and operational reliability.

## 2. Input variables

Establish or infer only from supplied context:

- **Location:** PLZ, Ort, and exact supply address when necessary.
- **Consumption:** exact annual kWh value to use consistently in all calculations.
- **Current provider/tariff:** use as an economic and operational benchmark when available.
- **Desired supply start / current contract end.**
- **Recent provider history:** especially providers used in the last few years.
- **Switching strategy:** intentional annual switcher vs. longer-term customer.
- **User overrides:** contract, payment, sustainability, provider, or other constraints that replace the baseline declared in SKILL.md.
- **Existing strategic reserve providers:** if any.
- **Excluded providers:** user choice or evidence-based exclusions.

If a provider's exact price depends on street, house number, Netzgebiet, MaLo-ID, or an interactive calculator, do not fabricate a PLZ-only price. State what is missing or ask the user for the provider quote/screenshot when necessary.

## 3. Current-guidance check and baseline enforcement

Start from the consumer-friendly defaults declared in SKILL.md unless the user overrides them.

At the beginning of a substantive research run, check whether current general consumer guidance from **Verbraucherzentrale** and **Stiftung Warentest** has materially changed that baseline. Use them as the primary external sanity check for consumer-facing selection criteria. Use CHECK24, Verivox, and other comparison portals as secondary operational sources for current market controls and discovery mechanics, not as authorities on which offer is best.

If current authoritative guidance materially conflicts with a stored default, tell the user and adapt rather than silently following stale skill text.

Do not silently relax a hard filter because a tariff is cheap. Put near-misses in a separate section.

## 4. Portal snapshot workflow

A portal snapshot is optional input. Use it to broaden discovery and capture current market offers; do not require the user to perform portal work before research can proceed.

When a fresh snapshot would help, offer concise portal-specific instructions based on the portal's **current UI**. Verify labels and controls at the time of use rather than relying on stale screenshots or remembered names.

As a broad-discovery baseline:

- set the user's exact consumption and location;
- cap Erstlaufzeit at 12 months while allowing shorter terms;
- keep Kündigungsfrist at no more than 1 month where the portal exposes that control;
- require Preisgarantie through the initial term where the portal supports it;
- show Festpreistarife only;
- include bonuses for an intentional annual switcher;
- select the portal option corresponding to stronger/sustainable Ökostrom when the user has not overridden the skill's sustainability default;
- avoid restrictive **high customer satisfaction**, **recommended tariffs**, portal-only ranking, **regional-only**, or **direct-switch-only** filters unless the user explicitly wants them;
- show all tariffs per provider when the portal offers that option.

The goal is a broad candidate pool. Apply quality, operational, and bonus-safety screening independently afterward.

### Export and copy/paste quirks

Portal PDF exports, print views, and copied text may omit or ambiguously render checkbox/radio-button state.

Treat Verivox PDF/print and copy-paste filter states cautiously:

- if the user explicitly states which options were selected, treat that statement as authoritative;
- if a visible exported filter state materially conflicts with the agreed settings, flag it and ask or remind the user if necessary;
- if control state is absent or blank, do **not** infer that the option was disabled;
- do not restart the whole portal search merely because the export cannot prove UI state.

Accept PDF, screenshot, copied text, or equivalent structured results. Extract the market candidates that are actually visible and continue with independent verification.

## 5. Market discovery

Use multiple routes:

1. User-supplied CHECK24 / Verivox / other portal snapshots, if current.
2. Fresh portal discovery when needed.
3. Provider-direct websites and calculators.
4. Local and regional providers that portals may under-rank or omit.
5. Independent search for tariffs outside the portal seed set.

Portal ranking, badges, popularity, sponsored placement, portal star scores, and portal recommendations are discovery signals only. They are not evidence that a tariff is best.

When a portal and the provider's direct site differ, investigate both. A direct offer may be materially better or have different bonus/Öko terms.

## 6. Pricing and first-year economics

For every serious candidate, capture or calculate:

- Arbeitspreis in ct/kWh
- Grundpreis per month or year
- annual cost before bonuses at the user's exact consumption
- Sofortbonus
- Neukundenbonus
- other one-time credits or discounts
- effective first-year cost using only bonuses classified as realistically attainable
- base/no-bonus annual cost as downside and second-year indicator
- expected monthly Abschlag if available
- source date

Use transparent arithmetic. Do not rely on a portal's displayed monthly average if the underlying components allow independent calculation.

### Annual-switch strategy

For an intentional annual switcher, **effective first-year cost after safe bonuses is the primary economic metric**.

A bonus is not negative merely because it makes the first year unusually cheap. The relevant question is whether it can be obtained safely under the user's intended switching behavior.

Base/no-bonus cost remains important as:

- downside if the bonus is lost;
- indicator of second-year economics;
- signal of how aggressively the tariff depends on acquisition subsidies.

For a non-annual customer, rebalance toward ongoing/base price and expected multi-year economics.

## 7. Bonus safety

Classify each economically relevant bonus.

### A — safe enough for primary economics

Use in effective first-year cost when evidence supports that:

- Neukunde eligibility is clear;
- required Belieferungsdauer is compatible with the intended contract term;
- ordinary Kündigung for the end of the first year does not void the bonus;
- no requirement effectively forces supply materially beyond the first year;
- no `ungekündigt` condition conflicts with timely cancellation;
- payout timing is clear enough;
- no strong repeated pattern of disputed or withheld bonus payout is found.

### B — usable with caveat

The bonus looks compatible, but an offer-specific clause or eligibility detail must be preserved and checked before Abschluss.

Show both economics with and without the bonus.

### C — risky or unresolved

Do not include the bonus in the primary effective-cost comparison.

Investigate:

- exact definition of Neukunde;
- look-back period for the same provider or corporate group;
- minimum continuous supply period;
- whether the contract must still be active or ungekündigt at payout;
- whether moving, early termination, Sonderkündigung, or delayed start affects eligibility;
- payout channel and timing;
- known complaint patterns about bonus denial.

Preserve the offer-specific Vertragszusammenfassung, Preisblatt, AGB, or bonus terms before contract completion whenever possible.

## 8. Preisgarantie and contract terms

For every candidate verify:

- Erstlaufzeit
- Kündigungsfrist
- automatic continuation after initial term
- Preisgarantie duration
- Preisgarantie type/scope
- excluded components such as Steuern, Abgaben, Umlagen, Netzentgelte, Messstellenbetrieb
- any special iMS/mME or meter-related charges
- payment cadence and Abschlag logic

Do not summarize a partial guarantee as if the total customer price were completely fixed.

Online cancellation is convenient but not automatically a hard requirement. Reliable written cancellation methods can be acceptable.

## 9. Ökostrom quality

Apply the sustainability default from SKILL.md unless the user overrides it.

Distinguish:

1. 100% renewable electricity / Herkunftsnachweise only;
2. tariffs with independently evidenced additional Energiewende contribution;
3. stronger labels or mechanisms such as Grüner Strom Label, ok-power, newer-plant criteria, provider investment in renewable generation, or equivalent evidence.

Do not infer environmental additionality from a green brand name or portal badge alone.

For each shortlisted tariff, state the evidence actually found. Keep ecological quality separate from price. Do not reject a materially better overall option solely because the strongest additionality product is unavailable; explain the trade-off.

## 10. Operational reliability

Annual switchers are especially exposed to operational problems at the end of a contract. Search specifically for recurring patterns involving:

- Kündigung ignored or not confirmed
- unexpected extension
- Zählerstand not transmitted or ignored
- consumption estimated despite supplied readings
- wrong Schlussrechnung
- delayed Schlussrechnung
- excessive or poorly adjusted Abschläge
- delayed Guthaben refunds
- bonus disputes
- correction delays
- ineffective support
- failed or delayed supplier switch

Distinguish isolated complaints from repeated patterns.

Do not use generic review averages as proof. Search for concrete failure modes and date the evidence.

## 11. Frequent-switcher / acceptance risk

For users who switch frequently, investigate evidence that a provider may reject customers based on previous contracts, promotional history, or perceived Bonusjäger behavior.

Important:

- distinguish current evidence from old historical reports;
- do not assume an old policy is still active;
- note provider-group relationships when relevant;
- record explicit rejections from the user's own history as stronger personal evidence;
- do not treat low household consumption itself as evidence of rejection risk without support.

When acceptance uncertainty is meaningful, keep at least 2–3 ordinary candidates available in sequence.

If repeated applications fail, stop optimizing rather than drifting accidentally into an unsuitable fallback.

## 12. Strategic reserve providers

Evaluate reserves separately from the ordinary shortlist.

### Purpose

A strategic reserve provider is a provider deliberately kept unused during normal annual switching so the user has a credible fallback if frequent switching becomes difficult.

The reserve is selected at **provider level**, not as one temporary tariff.

### Selection principles

If the user has no reserves, identify **1–2** suitable providers.

A reserve should:

- be a provider the user could reasonably stay with for about **2–3 years**;
- have broadly reasonable, normal-market pricing rather than an obvious high-price outlier;
- not need to be among the cheapest providers;
- have a sensible ordinary tariff structure that does not depend on a one-year promotional trick;
- show acceptable operational reliability;
- be likely to serve the user's location;
- have contract terms that are understandable and manageable;
- ideally diversify the fallback set when there is a useful local/regional vs. nationwide distinction.

Do not select reserves primarily by current Neukundenbonus.

Consider the user's provider history. A provider used recently may have reduced strategic value because of Neukunde rules, acceptance history, or simply because the reserve has already been consumed.

### Preservation rule

Once a provider is designated as strategic reserve:

- exclude it from the normal annual-switch candidate pool;
- do not consume it merely because one year's promotional price is attractive;
- keep it visible in a separate **Strategic Reserve — do not use in normal switching** section.

### Activation rule

Switch from **optimize** to **stabilize** when repeated rejections, clear Bonusjäger friction, or other market failures make further optimization unattractive.

Roughly 2–3 failed applications can be a useful trigger, but do not turn this into an inflexible rule. Consider timing, reason for rejection, contract deadline, and remaining candidate quality.

When a reserve is activated, select a reasonable ordinary tariff from that provider and accept a moderate price premium in exchange for reliability.

## 13. Evidence hierarchy

Use evidence according to purpose:

1. **Offer-specific facts:** provider AGB, Preisblatt, Vertragszusammenfassung, official tariff calculator, and official bonus terms.
2. **Consumer/regulatory baseline:** Verbraucherzentrale/vzbv, Bundesnetzagentur, Schlichtungsstelle Energie, court/regulator material, and Stiftung Warentest.
3. **Independent specialist context:** Finanztip and high-quality specialist or mainstream reporting.
4. **Operational pattern evidence:** large review platforms, Google reviews, Reddit, forums, and community reports.

For reviews:

- search by failure mode, not just star rating;
- look for repeated, recent patterns;
- separate allegations from documented findings;
- do not imply that an undetected complaint means the problem does not exist.

Use citations for factual claims and include the date/time relevance of market data.

## 14. Decision model

Keep hard filters separate from ranking criteria.

### Hard filters

Reject candidates that violate the user's explicit constraints or the baseline contract-safety defaults the user has not overridden: Festpreis, Erstlaufzeit up to 12 months, Kündigungsfrist up to 1 month, Preisgarantie through the initial term, monthly Abschläge, and no Vorkasse/Kaution/Pakettarif. Treat the stronger Ökostrom baseline as a preference unless the user explicitly makes it a hard requirement.

### Primary factors for an annual switcher

- effective first-year cost with safe bonuses
- bonus safety
- contract and Preisgarantie fit
- operational reliability
- acceptance/frequent-switcher risk where evidenced

### Secondary factors

- no-bonus/base price
- Ökostrom quality according to the default or user preference
- regionality / municipal ownership / local value
- evidenced Energiewende investment
- social or corporate behavior when supported by concrete evidence

Do not let soft tie-breakers override a serious operational or contractual problem.

## 15. Required output

Produce a compact decision report with:

### A. Assumptions and current benchmark

State:

- location basis
- consumption
- supply start
- switching strategy
- baseline defaults and user overrides
- current-contract benchmark if known

### B. Normal shortlist

Return no more than **3–5** serious candidates unless the user explicitly requests more.

For each show:

- Anbieter / Tarif
- Arbeitspreis
- Grundpreis
- annual base cost
- bonuses
- effective first-year cost
- bonus-safety classification
- Erstlaufzeit / Kündigungsfrist
- Preisgarantie and scope
- Ökostrom evidence
- operational-risk summary
- acceptance-risk note if relevant
- source / offer date
- important caveat

### C. Strategic reserves

List 1–2 provider-level reserves separately.

For each explain:

- why it is suitable for a 2–3 year fallback;
- whether its ordinary pricing is broadly market-reasonable;
- relevant operational evidence;
- why it should remain unused during normal optimization.

Label clearly:

**Strategic Reserve — do not use in normal switching**

### D. Near-misses / rejected candidates

Include only candidates whose rejection teaches something useful: failed hard filter, unsafe bonus, weak guarantee, operational pattern, or reserve-preservation rule.

### E. Decision and next action

Give a practical recommendation or small set of choices with trade-offs.

Before Abschluss, tell the user exactly what still needs offer-specific confirmation. Prefer the provider's official checkout path.

## 16. Final verification checklist

Before finalizing:

- [ ] Exact user consumption used consistently.
- [ ] Location/address specificity is sufficient for quoted prices.
- [ ] Current benchmark included when available.
- [ ] Applied baseline defaults and user overrides stated.
- [ ] Current Verbraucherzentrale / Stiftung Warentest guidance checked for material changes when doing substantive research.
- [ ] Portal rankings treated as leads, not authority.
- [ ] Portal snapshot controls interpreted cautiously; missing checkbox/radio state not treated as evidence.
- [ ] Direct-provider offers checked.
- [ ] Hard filters enforced.
- [ ] First-year and no-bonus economics both shown.
- [ ] Every counted bonus has a safety classification.
- [ ] Kündigung compatibility checked for annual switching.
- [ ] Preisgarantie scope checked, not merely duration.
- [ ] Ökostrom additionality checked under the default or user override.
- [ ] Operational failure modes researched.
- [ ] Review evidence distinguished from regulator/documentary evidence.
- [ ] Frequent-switcher evidence dated and not overgeneralized.
- [ ] Strategic reserves separated from normal candidates.
- [ ] Reserved providers excluded from ordinary optimization.
- [ ] Major uncertainties and missing offer-specific documents stated.
