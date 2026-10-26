# KT-AI Labs Life Skills — Plugins for Codex & Claude Code

**Stromwechsel Skill für Codex und Claude Code:** [`de-stromwechsel`](plugins/de/de-stromwechsel/skills/de-stromwechsel/SKILL.md) helps you research and compare **Stromtarife in Deutschland**, choose a **Stromanbieter**, and plan an **Anbieterwechsel** (including annual switches). It is an open-source AI Agent Skill, **not** a tariff comparison service or an MCP server.

Reusable AI skills for practical everyday decisions and procedures. Each task is packaged as an independent plugin for **OpenAI Codex CLI** and **Anthropic Claude Code**. Both share the same `SKILL.md` and research references; their marketplace manifests differ.

## Stromanbieter wechseln in Deutschland: `de-stromwechsel`

**Gibt es einen Stromwechsel-Skill für ChatGPT Codex oder Claude Code?** Ja: `de-stromwechsel` bietet einen strukturierten Workflow für die unabhängige Recherche und Bewertung deutscher Stromanbieter und Stromtarife.

- **Zwei Recherchemodi:** **Preliminary Research** untersucht Ausgangslage, aktuelle Tarife, Anbieter, Bedingungen und Risiken; eine Watchlist ohne Preisranking ist möglich, wenn fehlende Preise erklärt werden. **Switching Simulation** versucht echte adressbezogene Angebote zu erhalten und vergleicht Kosten mit und ohne erreichbare Boni, als würde der Nutzer heute wählen. Liegt der echte Lieferbeginn außerhalb eines Buchungsfensters, nutzt die Simulation einen ausdrücklich getrennten aktuellen Berechnungstermin. Ein ferner Wechseltermin schließt heutige Preisrecherche nicht aus. Der Modus wird aus dem Anliegen abgeleitet und nur bei wesentlicher Unklarheit erfragt.
- **Gezielte Verifikation:** Nach einem begrenzten Marktüberblick und Screening prüft der Agent bevorzugte Angebote gründlich; er erweitert die Suche nur, wenn geeignete Alternativen fehlen. Ergebniszahlen eines Portals gelten nicht als geprüfte Angebote. Lieferbeginn, Netzgebiet, Pflichtkosten und offene Prüfungen bleiben nachvollziehbar.
- **Strompreisvergleich mit Quellenprüfung:** recherchiert aktuelle Angebote über verfügbare Web-/Browser-Tools oder anhand bereitgestellter CHECK24-/Verivox-Ergebnisse; sucht auch direkt bei Energieversorgern. Keine vorgetäuschten Livepreise ohne entsprechende Daten.
- **Jährlicher Stromanbieterwechsel:** berechnet Erstjahreskosten mit realistisch erreichbaren Neukunden- und Sofortboni und zeigt Kosten **ohne Bonus** separat.
- **AGB, Preisgarantie und Kündigungsfrist:** prüft Vertragslaufzeit, Bonusbedingungen, Zahlungsweise und Risiken beim Wechsel.
- **Erfahrungen und Zuverlässigkeit:** vergleicht operative Risiken der engeren Auswahl und berücksichtigt persönliche positive wie negative Erfahrungen. Jahreskosten, Liquiditätsbelastung durch Abschläge und Guthabenrückzahlung werden getrennt bewertet; ein Einzelfall beweist kein allgemeines Anbieterverhalten. Präferenzen und Erfahrungen bleiben im privaten Profil bzw. in der Historie.
- **Ökostrom und Plan B:** bewertet nachvollziehbare Ökostrom-Kriterien und mögliche Reserveanbieter. Nur vom Nutzer ausdrücklich benannte strategische Reserven werden aus der normalen Optimierung ausgeschlossen; ungeprüfte Reservekandidaten bleiben vergleichbar.

**Dokumentierte Ergebnisse, auch einmalig:** Der Skill nutzt einen vorhandenen Stromwechsel-Arbeitsordner oder fragt nach einem Zielordner. Er liest Profil, Historie, Reserven und auf Wunsch einen Dokumentenordner mit Verträgen und Rechnungen. Benötigt werden die Lieferadresse mit separatem **Hausnummerzusatz (Zusatz)** und ein Jahresverbrauch. Ein ausdrücklich vorgegebener Rechenwert hat Vorrang; andernfalls ersetzt ein neuerer bestätigter voller Jahresverbrauch eine ungefähre Angabe. Teiljahreswerte werden nicht automatisch als Jahresverbrauch behandelt. Ein Hauptverbrauch genügt, sofern zusätzliche Szenarien nicht entscheidungsrelevant sind.

Der Agent organisiert Jahresordner und speichert bei jeder Recherche einen datierten Bericht mit Modus, Quellen und Grenzen der Prüfung. Berichte, README, Historie und Reserven folgen der Arbeitssprache des Nutzers, sofern nichts anderes gewählt ist; alte Berichte werden nicht allein zur Übersetzung umgeschrieben. Die vollständige Adresse steht nur im privaten Profil; vor Speicherung in möglicherweise öffentlichen oder geteilten Git-Arbeitsordnern ist Zustimmung erforderlich. Unnötige eigene temporäre Dokumentauszüge werden entfernt, Originale bleiben unangetastet.

**Selbstständiger Wechsel durch den Nutzer:** Der Agent recherchiert, vergleicht, plant und erstellt bei Bedarf Anleitungen oder Entwürfe. Der Nutzer selbst stellt Anträge, schließt Verträge ab und versendet Kündigungen; auch eine Simulation führt keine solchen Aktionen aus. Bei Hinweisen auf einen automatischen Wechselservice warnt der Agent vor konkurrierenden Anträgen. Eine gesonderte Prüfung von Vollmacht, Ausstieg, Fristen und Gebühren erfolgt nur nach Zustimmung und hält die Tarifrecherche bei Ablehnung nicht auf.

**Aktuelle Verbraucherempfehlungen:** Verbraucherzentrale, Stiftung Warentest und Finanztip werden zu Beginn in ihren zugänglichen aktuellen Materialien geprüft. Abweichende Empfehlungen werden zur Nutzerstrategie eingeordnet; Paywalls und technische Lücken werden offengelegt. CHECK24/Verivox dienen zusätzlich der Angebotssuche, nicht als Ranking-Autorität; beide Portale sind nicht zwingend erforderlich.

**Keine Pflicht-Integration:** Weder MCP, API-Key noch ein Konto bei einem Vergleichsportal sind für die Installation erforderlich. Für eine _aktuelle_ Marktanalyse benötigt der Agent allerdings verfügbare Recherchetools, aktuelle Quellen oder ein vom Nutzer geliefertes Tarifangebot. Es gibt keine verpflichtende Integration mit einem Wechselservice.

**Beispiel-Prompt (Deutsch):**

> Nutze den Skill `de-stromwechsel`. Speichere die Recherche in `./de-stromwechsel` und organisiere dort Jahresordner, Berichte, Anbieterhistorie und Reserveanbieter. Führe eine Switching Simulation für meinen selbstständigen Stromwechsel durch. Verwende vorhandene Angaben oder frage nach Lieferadresse (mit separatem Zusatz, falls vorhanden), Jahresverbrauch und echtem Wechselzeitraum. Versuche aktuelle adressbezogene Preise zu erhalten und trenne einen nötigen simulierten Lieferbeginn vom echten Termin. Vergleiche Erstjahreskosten mit und ohne erreichbare Boni, Preisgarantie, Fristen, Ökostrom und Zuverlässigkeit. Speichere den Bericht in meiner Arbeitssprache. Ich führe Anträge und Kündigungen selbst aus.

**Skill oder MCP?** Ein Skill beschreibt _wie_ dein Agent recherchiert, Angebote überprüft und eine Entscheidung vorbereitet. Ein Stromvergleich-MCP wie [Choov](https://www.choov.de/) liefert dagegen Angebote über einen externen Datenanbieter; ein Wechselservice wie [Wechselpilot](https://wechselpilot.com/) kann nach Registrierung einen Wechsel übernehmen. Solche Dienste können optional als Quellen dienen, sind aber **nicht** Bestandteil dieses Plugins und ersetzen keine unabhängige Prüfung.

## Available plugins

| Plugin                                                                                  | Purpose                                                                                                                         | Extra software          |
| --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| [`de-stromwechsel`](plugins/de/de-stromwechsel/skills/de-stromwechsel/SKILL.md)         | Research or simulate a self-managed German electricity switch, including bonuses, provider reliability, and strategic reserves. | None required           |
| [`browser-research`](plugins/general/browser-research/skills/browser-research/SKILL.md) | Navigate and inspect websites efficiently using an available local browser tool.                                                | Playwright CLI optional |

Plugins are installed **independently**. `de-stromwechsel` does not require `browser-research` or Playwright CLI. Browser research is an optional reusable capability when the host environment supports it. `browser-research` prefers verified isolated temporary sessions, with observable operation where available, and requires explicit permission before accessing a personal browser profile. New tabs or session names do not prove isolation. The host browser and connection settings enforce isolation; the skill alone cannot guarantee it.

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
