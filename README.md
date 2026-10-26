# KT-AI Labs Life Skills — Plugins for Codex & Claude Code

**Stromwechsel Skill für Codex und Claude Code:** [`de-stromwechsel`](plugins/de/de-stromwechsel/skills/de-stromwechsel/SKILL.md) helps you research and compare **Stromtarife in Deutschland**, choose a **Stromanbieter**, and plan an **Anbieterwechsel** (including annual switches). It is an open-source AI Agent Skill, **not** a tariff comparison service or an MCP server.

Reusable AI skills for practical everyday decisions and procedures. Each task is packaged as an independent plugin for **OpenAI Codex CLI** and **Anthropic Claude Code**. Both share the same `SKILL.md` and research references; their marketplace manifests differ.

## Stromanbieter wechseln in Deutschland: `de-stromwechsel`

**Gibt es einen Stromwechsel-Skill für ChatGPT Codex oder Claude Code?** Ja: `de-stromwechsel` bietet einen strukturierten Workflow für die unabhängige Recherche und Bewertung deutscher Stromanbieter und Stromtarife.

- **Strompreisvergleich mit Quellenprüfung:** recherchiert aktuelle Angebote über verfügbare Web-/Browser-Tools oder anhand bereitgestellter CHECK24-/Verivox-Ergebnisse; sucht auch direkt bei Energieversorgern. Keine vorgetäuschten Livepreise ohne entsprechende Daten.
- **Jährlicher Stromanbieterwechsel:** berechnet Erstjahreskosten mit realistisch erreichbaren Neukunden- und Sofortboni und zeigt Kosten **ohne Bonus** separat.
- **AGB, Preisgarantie und Kündigungsfrist:** prüft Vertragslaufzeit, Bonusbedingungen, Zahlungsweise und Risiken beim Wechsel.
- **Erfahrungen und Zuverlässigkeit:** untersucht dokumentierte Probleme mit Kündigung, Schlussrechnung, Zählerstand, Guthaben und Bonusauszahlung.
- **Ökostrom und Plan B:** bewertet nachvollziehbare Ökostrom-Kriterien sowie strategische Reserveanbieter, die bewusst nicht für den normalen Jahreswechsel verbraucht werden.

**Dokumentierte Ergebnisse, auch einmalig:** Der Skill fragt nach einem Zielordner (`target directory`), der vollständigen Lieferadresse inklusive separatem Hausnummerzusatz und einem Jahresverbrauch in kWh (Messwert, Durchschnitt oder Schätzung). Er liest vorhandene Historie und Reserveanbieter, organisiert Jahresordner selbst und speichert einen datierten Bericht **bei jedem Durchlauf**. Persönliche Adressdaten gehören nicht ungefragt in öffentliche Git-Repositories.

**Keine Pflicht-Integration:** Weder MCP, API-Key noch ein Konto bei einem Vergleichsportal sind für die Installation erforderlich. Für eine *aktuelle* Marktanalyse benötigt der Agent allerdings verfügbare Recherchetools, aktuelle Quellen oder ein vom Nutzer geliefertes Tarifangebot. Der Skill schließt keinen Vertrag ab und kündigt keinen Stromvertrag automatisch.

**Beispiel-Prompt (Deutsch):**

> Nutze den Skill `de-stromwechsel`. Speichere die Recherche in `./de-stromwechsel` und organisiere dort Jahresordner, Berichte, Anbieterhistorie und Reserveanbieter. Ich möchte meinen Stromanbieter in Deutschland wechseln. Frage nach meiner vollständigen Lieferadresse (inklusive separatem Hausnummerzusatz, falls vorhanden), Jahresverbrauch in kWh und dem gewünschten Wechselzeitraum, soweit diese Angaben nicht bereits in den Dateien stehen. Vergleiche Tarife, prüfe Preisgarantie, Boni, Kündigungsfristen, Ökostrom und Zuverlässigkeit und speichere einen datierten Bericht.

**Skill oder MCP?** Ein Skill beschreibt *wie* dein Agent recherchiert, Angebote überprüft und eine Entscheidung vorbereitet. Ein Stromvergleich-MCP wie [Choov](https://www.choov.de/) liefert dagegen Angebote über einen externen Datenanbieter; ein Wechselservice wie [Wechselpilot](https://wechselpilot.com/) kann nach Registrierung einen Wechsel übernehmen. Solche Dienste können optional als Quellen dienen, sind aber **nicht** Bestandteil dieses Plugins und ersetzen keine unabhängige Prüfung.

## Available plugins

| Plugin | Purpose | Extra software |
| --- | --- | --- |
| [`de-stromwechsel`](plugins/de/de-stromwechsel/skills/de-stromwechsel/SKILL.md) | Research and plan a German household electricity-provider switch, including bonuses, provider reliability, and strategic reserves. | None required |
| [`browser-research`](plugins/general/browser-research/skills/browser-research/SKILL.md) | Navigate and inspect websites efficiently using an available local browser tool. | Playwright CLI optional |

Plugins are installed **independently**. `de-stromwechsel` does not require `browser-research` or Playwright CLI. Browser research is an optional reusable capability when the host environment supports it.

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
  general/
    browser-research/
      plugin.json
      .claude-plugin/plugin.json
      skills/browser-research/
        SKILL.md
        references/playwright-cli.md
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
