# KT-AI Labs Life Skills — Plugins for Codex & Claude Code

**German Stromwechsel skill for Codex and Claude Code:** [`de-stromwechsel`](plugins/de/de-stromwechsel/skills/de-stromwechsel/SKILL.md) helps you research and compare **Stromtarife in Deutschland**, choose a **Stromanbieter**, and plan an **Anbieterwechsel** (including annual switches). It is an open-source AI Agent Skill, **not** a tariff comparison service or an MCP server.

Reusable AI skills for practical everyday decisions and procedures. Each task is packaged as an independent plugin for **OpenAI Codex CLI** and **Anthropic Claude Code**. Both share the same `SKILL.md` and research references; their marketplace manifests differ.

## Switching electricity providers in Germany: `de-stromwechsel`

**Is there a Stromwechsel skill for ChatGPT Codex or Claude Code?** Yes: `de-stromwechsel` provides a structured workflow for independent research and assessment of German electricity providers and tariffs.

- **Two research modes:** **Preliminary Research** investigates the starting situation, current tariffs, providers, conditions and risks; a watchlist without a price ranking is acceptable if missing prices are explained. **Switching Simulation** attempts real supply-point-specific offers and compares costs with and without attainable bonuses as if the user were choosing today. If the actual Lieferbeginn is outside a booking window, it uses an explicitly separate current quotation scenario. A distant switch date does not preclude today's price research. The mode follows user intent and is only queried when materially unclear.
- **Focused verification:** after bounded market discovery and screening, the agent prioritizes detailed checks of promising offers and expands discovery only if viable alternatives are lacking. Portal result counts do not count as inspected offers. Lieferbeginn, Netzgebiet, mandatory costs and unresolved checks remain explicit.
- **Source-based price comparison:** uses available web/browser tools or supplied CHECK24/Verivox results, and searches suppliers directly. It never claims live prices without evidence.
- **Annual switching:** calculates first-year costs with attainable Neukundenbonus and Sofortbonus, showing costs **without bonuses** separately.
- **AGB, Preisgarantie and Kündigungsfrist:** checks contract duration, bonus conditions, payment terms and switching risks.
- **Experience and reliability:** compares finalists' operational risks and considers positive and negative personal experiences. Annual costs, liquidity tied up in Abschläge and Guthaben refunds are assessed separately; an individual incident does not establish a company-wide pattern. Preferences and experiences stay in the private profile/history.
- **Ökostrom and plan B:** assesses evidenced environmental criteria and possible reserve providers. Only explicitly designated strategic reserves are excluded from ordinary optimization; unconfirmed reserve candidates remain eligible for comparison.

**Saved results, including one-off research:** the skill reuses an existing Stromwechsel workspace or asks for a destination. It reads the profile, history, reserves and, when supplied, an archive of contracts and bills. Inputs include the supply address with separate **Hausnummerzusatz (Zusatz)** and annual consumption. An explicit required calculation value takes priority; otherwise a newer confirmed full-year Verbrauch replaces an approximate figure. Partial-year amounts are not automatically annualized. One primary consumption figure suffices unless another scenario materially affects the decision.

The agent organizes yearly folders and saves a dated report with mode, sources and verification limits on every run. Reports, README, history, reserves and user-action records follow the user's chosen working language; old reports are not rewritten solely for translation. The complete address is stored only in the private profile; potentially public/shared Git storage requires informed approval. Unnecessary agent-created temporary extracts are removed; originals are preserved.

**Research documents and human assistance:** when a material check remains blocked after diagnosis and safe alternatives, the agent offers help with obtaining evidence without applications or contract acceptance. Relevant documents can be retained in `<workspace>/<target-year>/docs/<provider>/`, using their own document dates and preserving versions. A single yearly `action-required.md` is created only for actual unresolved user actions; receiving a PDF, verifying it and closing the substantive gap are separate states. Storage can be any accessible filesystem location; Git, cloud APIs and additional services are not required.

**The user performs the switch:** the agent researches, compares, plans and prepares instructions or drafts. The user submits applications, signs contracts and sends Kündigungen; a simulation performs none of these actions. If an automatic switching service may be active, the agent warns about conflicting applications. Investigation of authority, exit terms, deadlines and fees is separate and opt-in; declining it does not stop tariff research. Neither the agent nor the user is asked to contract just to obtain research documents.

**Current consumer guidance:** accessible current materials from Verbraucherzentrale, Stiftung Warentest and Finanztip are checked at the start. Differences are interpreted for the user's strategy, and paywalls/technical gaps are disclosed. CHECK24/Verivox also provide discovery leads rather than ranking authority; using both portals is not mandatory.

**No mandatory integration:** installation requires no MCP, API key or comparison-portal account. A _current_ market assessment needs available research tools, current sources or a user-supplied offer. No switching-service integration is required.

**Example prompt (German):**

> Nutze den Skill `de-stromwechsel`. Speichere die Recherche in `./de-stromwechsel` und organisiere dort Jahresordner, Berichte, Anbieterhistorie und Reserveanbieter. Führe eine Switching Simulation für meinen selbstständigen Stromwechsel durch. Verwende vorhandene Angaben oder frage nach Lieferadresse (mit separatem Zusatz, falls vorhanden), Jahresverbrauch und echtem Wechselzeitraum. Versuche aktuelle adressbezogene Preise zu erhalten und trenne einen nötigen simulierten Lieferbeginn vom echten Termin. Vergleiche Erstjahreskosten mit und ohne erreichbare Boni, Preisgarantie, Fristen, Ökostrom und Zuverlässigkeit. Speichere den Bericht in meiner Arbeitssprache. Ich führe Anträge und Kündigungen selbst aus.

**Skill or MCP?** A skill describes _how_ the agent researches, verifies offers and prepares a decision. An electricity-comparison MCP such as [Choov](https://www.choov.de/) supplies offers through an external data provider; a switching service such as [Wechselpilot](https://wechselpilot.com/) may arrange a switch after registration. These can be optional sources, but are **not** part of this plugin and do not replace independent verification.

## Available plugins

| Plugin                                                                                  | Purpose                                                                                                                         | Extra software          |
| --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| [`de-stromwechsel`](plugins/de/de-stromwechsel/skills/de-stromwechsel/SKILL.md)         | Research or simulate a self-managed German electricity switch, including bonuses, provider reliability, and strategic reserves. | None required           |
| [`browser-research`](plugins/general/browser-research/skills/browser-research/SKILL.md) | Navigate and inspect websites efficiently using an available local browser tool.                                                | Playwright CLI optional |

Plugins are installed **independently**. `de-stromwechsel` does not require `browser-research` or Playwright CLI. Browser research is an optional reusable capability when the host environment supports it. `browser-research` prefers verified isolated temporary sessions, with observable operation where available, and requires explicit permission before accessing a personal browser profile. New tabs or session names do not prove isolation. The host browser and connection settings enforce isolation; the skill alone cannot guarantee it. If safe agent attempts fail, it supports an explicit human handoff where the tool allows shared control, or a link/manual-file fallback. Page automation pauses while the user acts; results are verified before research resumes. Dashboard support, filesystem access and download locations depend on the actual environment.

## Install the Stromwechsel Skill in Codex CLI

Register the GitHub plugin marketplace, then install `de-stromwechsel`:

```bash
codex plugin marketplace add kt-ai-labs/life-skills --ref main
codex plugin add de-stromwechsel@kt-ai-labs-life-skills
```

Optional browser research plugin: `codex plugin add browser-research@kt-ai-labs-life-skills`. Check installs with `codex plugin list`; start a new session to pick up the skills. Adding a marketplace alone does **not** install its plugins.

To refresh the Git-backed marketplace:

```bash
codex plugin marketplace upgrade kt-ai-labs-life-skills
```

**Client compatibility:** Codex Plugins are available through supported clients such as **Codex CLI**; as of October 2026, the **Codex VS Code IDE extension does not support Plugins**. You can manage and run the plugin through Codex CLI in the VS Code terminal, but don't assume a CLI-installed plugin will be loaded by the IDE extension. See [OpenAI's Plugins documentation](https://learn.chatgpt.com/docs/plugins).

## Install the Stromwechsel Skill in Claude Code

```bash
claude plugin marketplace add kt-ai-labs/life-skills
claude plugin install de-stromwechsel@kt-ai-labs-life-skills
# Optional, independent browser research plugin:
claude plugin install browser-research@kt-ai-labs-life-skills
```

Check installed plugins with `claude plugin list`, then start a new session. Claude Code provides `claude plugin validate .` to validate the marketplace locally.

## Repository layout

```text
.agents/plugins/marketplace.json             # Codex catalog
.claude-plugin/marketplace.json              # Claude catalog
plugins/
  de/
    de-stromwechsel/
      plugin.json                            # Portable Agent Plugins / Codex
      .claude-plugin/plugin.json             # Claude Code
      skills/de-stromwechsel/
        SKILL.md
        agents/openai.yaml
        references/research-prompt.md
        references/documents-and-actions.md
  general/
    browser-research/
      plugin.json
      .claude-plugin/plugin.json
      skills/browser-research/
        SKILL.md
        references/playwright-cli.md
        references/human-assistance.md
```

## Add a new plugin

1. Create `plugins/<category>/<plugin-name>/skills/<skill-name>/SKILL.md` and add references only when useful.
2. Add a portable `plugin.json` at the plugin root and a minimal `.claude-plugin/plugin.json` for Claude Code. Keep the manifest names consistent.
3. Add one entry to each of `.agents/plugins/marketplace.json` and `.claude-plugin/marketplace.json`, with paths relative to the repository root.
4. Update the table above; validate JSON, paths, and skill frontmatter. Run `claude plugin validate .` plus `claude plugin validate plugins/<category>/<plugin-name>` where available, and verify installation with real client tools.
5. Update the plugin version in **both** manifests when releasing changes.

Do not add empty plugin folders, MCP servers, hooks, runtime scripts, or mandatory dependencies without a real use case. Playwright CLI installations are initiated only after user approval, never by installing the browser-research plugin itself.

## License

MIT; see [LICENSE](LICENSE).
