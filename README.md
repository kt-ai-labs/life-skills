# KT-AI Labs Life Skills — Plugins for Codex & Claude Code

**German Stromwechsel skill for Codex and Claude Code:** [`de-stromwechsel`](plugins/de/de-stromwechsel/skills/de-stromwechsel/SKILL.md) helps you research and compare **Stromtarife in Deutschland**, choose a **Stromanbieter**, and plan an **Anbieterwechsel** (including annual switches). It is an open-source AI Agent Skill, **not** a tariff comparison service or an MCP server.

Reusable AI skills for practical everyday decisions and procedures. Each task is packaged as an independent plugin for **OpenAI Codex CLI** and **Anthropic Claude Code**. Both share the same `SKILL.md` and research references; their marketplace manifests differ.

## Switching electricity providers in Germany: `de-stromwechsel`

**Is there a Stromwechsel skill for ChatGPT Codex or Claude Code?** Yes: `de-stromwechsel` provides a structured workflow for independent research and assessment of German electricity providers and tariffs.

- **Two research modes:** **Preliminary Research** investigates the starting situation, current tariffs, providers, conditions and risks; a watchlist without a price ranking is acceptable if missing prices are explained. **Switching Simulation** attempts real supply-point-specific offers and compares costs with and without attainable bonuses as if the user were choosing today. If the actual Lieferbeginn is outside a booking window, it uses an explicitly separate current quotation scenario. A distant switch date does not preclude today's price research. The mode follows user intent and is only queried when materially unclear.
- **Focused verification:** after a quick market scan and screening, the agent prioritizes questions that can change suitability, costs or the choice, checking public offer details before seeking further evidence. It expands discovery only if viable alternatives are lacking. Portal result counts do not count as inspected offers. Lieferbeginn, Netzgebiet, mandatory costs and unresolved checks remain explicit.
- **Source-based price comparison:** uses available web/browser tools or supplied CHECK24/Verivox results, and searches suppliers directly. It never claims live prices without evidence.
- **Annual switching:** calculates first-year costs with attainable Neukundenbonus and Sofortbonus, showing costs **without bonuses** separately.
- **AGB, Preisgarantie and Kündigungsfrist:** checks contract duration, bonus conditions, payment terms and switching risks.
- **Experience and reliability:** compares finalists' operational risks and considers positive and negative personal experiences. Annual costs, liquidity tied up in Abschläge and Guthaben refunds are assessed separately; an individual incident does not establish a company-wide pattern. Preferences and experiences stay in the private profile/history.
- **Ökostrom and plan B:** assesses evidenced environmental criteria and possible reserve providers. Only explicitly designated strategic reserves are excluded from ordinary optimization; unconfirmed reserve candidates remain eligible for comparison.

**Saved results, including one-off research:** the skill reuses an existing Stromwechsel workspace or asks for a destination. It reads the profile, history, reserves and, when supplied, an archive of contracts and bills. Inputs include the supply address with separate **Hausnummerzusatz (Zusatz)** and annual consumption. An explicitly required calculation value takes priority; otherwise use the latest reliable representative full-year Verbrauch. A reported number alone is not a required scenario; keep reported, documented and selected figures distinct. Partial-year amounts are not automatically annualized. One primary consumption figure suffices unless another scenario materially affects the decision.

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

Plugins are installed **independently**. `de-stromwechsel` does not require `browser-research` or Playwright CLI. Browser research is an optional reusable capability when the host environment supports it. `browser-research` prefers verified isolated temporary sessions, with observable operation where available, and requires explicit permission before accessing a personal browser profile. New tabs or session names do not prove isolation. The host browser and connection settings enforce isolation; the skill alone cannot guarantee it. If safe agent attempts fail, it supports an explicit human handoff where the tool allows shared control, alongside an independent-browser link/navigation route accepting copied text, screenshots or PDFs. Page automation pauses while the user acts; results are verified before research resumes. Dashboard support, filesystem access and download locations depend on the actual environment.

## Getting started on macOS

### Quick setup — one command

[Review the setup script](scripts/update-env.sh) before running it. This convenience script is for macOS: it can install Homebrew, run **`brew update` and `brew upgrade` on all Homebrew packages**, install RTK and Playwright CLI, configure available coding agents and update Life Skills plugins.

Run without cloning the repository:

```bash
curl -fsSL https://raw.githubusercontent.com/kt-ai-labs/life-skills/main/scripts/update-env.sh | bash
```

It displays the following overview and asks for confirmation **before changing anything**:

```text
Life Skills — Environment Setup & Update

This script will:
- Install Homebrew if it is missing
- Run brew update and brew upgrade
- Ask to install Codex CLI and/or Claude Code if neither is installed
- Install missing recommended tools (RTK, Playwright CLI)
- Set up or update Life Skills plugins
- Install npm dependencies if package.json exists

Do you want to continue? [y/N]:
```

If at least one agent is already installed, only the installed agents are configured; no second agent is installed automatically. If neither is found, the script separately asks **Install Codex CLI? [y/N]** and **Install Claude Code? [y/N]**. Answering No to both ends the script without changes.

Skip **only the first confirmation** with `-y` or `--yes`; the two agent-installation questions still appear if neither CLI exists:

```bash
curl -fsSL https://raw.githubusercontent.com/kt-ai-labs/life-skills/main/scripts/update-env.sh | bash -s -- --yes
```

If you have cloned this repository, run the same script locally:

```bash
./scripts/update-env.sh
```

Both methods use the **current working directory**. If there is a `package.json`, the script runs `npm install` (or `npm install --no-package-lock` when no `package-lock.json` exists); otherwise it skips npm dependencies. Run the remote shortcut from a directory without an unrelated `package.json`.

The script leaves existing non-Homebrew Codex, Claude Code, Playwright and RTK executables alone rather than installing duplicate copies. If Homebrew was newly installed, follow its printed shell PATH instructions for future terminals (the script configures PATH for its own run). Restart coding-agent sessions after plugin and RTK hook updates. For installation choices that you want to control individually, follow the manual steps below.

### Manual setup

These steps prepare a Mac for **any** Life Skills plugin, not just `de-stromwechsel`. **Homebrew is the default installer and updater** for all available CLI tools. Open **Terminal** and work through the steps you actually need. If a command is already installed, skip its installation step.

**Basic setup:** Codex CLI **or** Claude Code, plus the desired Life Skills plugins. **Recommended browser setup:** add Playwright CLI for skills that inspect interactive sites. Playwright is **optional but strongly recommended**, not a required dependency of either plugin.

### 1. Check what's already installed

Run these checks individually. A `command not found` or missing path simply means that tool needs setup; you do **not** need both Codex and Claude Code.

```bash
command -v brew
command -v node
command -v npm
command -v codex
command -v claude
command -v playwright-cli
command -v rtk
```

### 2. Homebrew (only if missing)

[Homebrew](https://brew.sh/) is a macOS package manager. If `brew` is unavailable, follow its official installer:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Review the installer before confirming it. **Follow the terminal's post-install `shellenv` / PATH instructions** and open a new terminal before continuing. Administrator approval or developer tools may be needed.

### 3. Choose your coding agent

Use **Homebrew** for the CLI that you want. Codex and Claude Code are alternatives; installing both is optional. The packages below are command-line agents, not the similarly named desktop applications.

**Codex CLI:**

```bash
brew install --cask codex
```

```bash
codex --version
```

**Claude Code:**

```bash
brew install --cask claude-code
```

```bash
claude --version
```

Start the chosen CLI and complete its normal sign-in. See [Codex CLI](https://developers.openai.com/codex/cli/), [Claude Code setup](https://code.claude.com/docs/en/setup), and the [Homebrew Codex](https://formulae.brew.sh/cask/codex) / [Claude Code](https://formulae.brew.sh/cask/claude-code) listings.

### 4. Node.js — optional for other tools

**Node.js/npm are not prerequisites for installing these two agent CLIs via Homebrew.** Homebrew handles dependencies of its formulae. If a separate project requires Node.js and you do not have Node.js installed, you can install it through Homebrew:

```bash
brew install node
```

```bash
node --version
npm --version
```

### 5. Playwright CLI — optional, **strongly recommended**

For browser-heavy skills, Playwright CLI can inspect dynamic pages through targeted snapshots and commands, potentially using fewer tokens than repeatedly reading full pages or screenshots. A headed browser or the Dashboard can make the agent's work observable. An appropriately configured **isolated** session separates research from your personal browser profile; visibility alone does **not** establish isolation. The `browser-research` skill handles browser selection, isolation checks, cookie consent and human handoff where supported.

Install Playwright CLI via Homebrew if you want this browser capability:

```bash
brew install playwright-cli
```

```bash
playwright-cli --help
```

Install its browser binary (a separate download, not an npm installation):

```bash
playwright-cli install-browser
```

Optional example using a public, non-personal page and a named browser session:

```bash
playwright-cli -s=life-skills-demo open https://example.com --headed
```

To watch running sessions through the visual Dashboard, when supported:

```bash
playwright-cli show
```

When finished with the example:

```bash
playwright-cli -s=life-skills-demo close
```

Use an isolated temporary browser configuration for real research, verify the effective connection mode, and do not attach to a personal browser profile without explicit permission. Playwright can help handle cookie dialogs but cannot guarantee that every site works. The browser extension, shared-control Dashboard and downloads may behave differently across host environments. See [Playwright CLI](https://github.com/microsoft/playwright-cli).

### 6. RTK — recommended CLI output optimization

[RTK (Rust Token Killer)](https://github.com/rtk-ai/rtk) reduces the output sent back to coding agents for supported shell commands. It is a separate CLI and agent hook, **not** a plugin in our Life Skills marketplace. Install it using the official Homebrew tap:

```bash
brew install rtk-ai/tap/rtk
```

Verify you installed Rust Token Killer rather than the unrelated Rust Type Kit:

```bash
rtk --version
rtk gain
```

Enable the global RTK integration for the agent(s) you actually use.

**Codex CLI:**

```bash
rtk init --global --codex
```

**Claude Code:**

```bash
rtk init --global --auto-patch
```

These commands update global agent hook settings. See the [RTK installation guide](https://www.rtk-ai.app/docs/getting-started/installation/) and [supported agents](https://github.com/rtk-ai/rtk/blob/develop/docs/guide/getting-started/supported-agents.md).

### 7. Install the Life Skills plugins

Continue with **one** of the installation sections below: Codex CLI or Claude Code. Both `de-stromwechsel` and `browser-research` are installed in the examples so browser research is ready to use. The plugins remain independent; installing them **does not** install Playwright CLI automatically.

## Install Life Skills plugins in Codex CLI

Register the GitHub plugin marketplace, then install both plugins:

```bash
codex plugin marketplace add kt-ai-labs/life-skills --ref main
codex plugin add de-stromwechsel@kt-ai-labs-life-skills
codex plugin add browser-research@kt-ai-labs-life-skills
```

Check installs with `codex plugin list`; start a new session to pick up the skills. Adding a marketplace alone does **not** install its plugins.

To refresh the Git-backed marketplace:

```bash
codex plugin marketplace upgrade kt-ai-labs-life-skills
```

**Client compatibility:** Codex Plugins are available through supported clients such as **Codex CLI**; as of October 2026, the **Codex VS Code IDE extension does not support Plugins**. You can manage and run the plugin through Codex CLI in the VS Code terminal, but don't assume a CLI-installed plugin will be loaded by the IDE extension. See [OpenAI's Plugins documentation](https://learn.chatgpt.com/docs/plugins).

## Install Life Skills plugins in Claude Code

```bash
claude plugin marketplace add kt-ai-labs/life-skills
claude plugin install de-stromwechsel@kt-ai-labs-life-skills
claude plugin install browser-research@kt-ai-labs-life-skills
```

Check installed plugins with `claude plugin list`, then start a new session. Claude Code provides `claude plugin validate .` to validate the marketplace locally.

## Update your macOS environment and plugins

**Homebrew updates the CLI tools; Codex/Claude manage their installed plugins separately.** Use either Option A or Option B for Homebrew, then update any Life Skills plugins you installed. Close active agent/browser sessions before replacing CLI binaries, and start new sessions after plugin changes.

### Option A — update all Homebrew software

First refresh Homebrew's package information:

```bash
brew update
```

Optional: see which installed packages have updates:

```bash
brew outdated
```

Upgrade all outdated Homebrew packages (not just tools used by Life Skills):

```bash
brew upgrade
```

### Option B — update selected Homebrew tools

First refresh package information:

```bash
brew update
```

Then choose the blocks for the **tools you have installed**:

Codex CLI:

```bash
brew upgrade --cask codex
```

Claude Code:

```bash
brew upgrade --cask claude-code
```

Playwright CLI:

```bash
brew upgrade playwright-cli
```

RTK:

```bash
brew upgrade rtk-ai/tap/rtk
```

Optional Node.js:

```bash
brew upgrade node
```

Or upgrade multiple installed tools together (remove names of anything you don't have):

```bash
brew upgrade codex claude-code playwright-cli rtk-ai/tap/rtk
```

If Playwright needs to refresh its downloaded browser after upgrading the CLI, run:

```bash
playwright-cli install-browser
```

### Check your CLI versions

Run checks only for the CLIs you use:

```bash
codex --version
```

```bash
claude --version
```

```bash
playwright-cli --help
```

RTK:

```bash
rtk --version
```

Avoid installing the **same CLI** through multiple package managers: duplicate binaries can cause confusing PATH conflicts.

### Update Codex Life Skills plugins

First refresh the Git-backed marketplace, then inspect installed plugins:

```bash
codex plugin marketplace upgrade kt-ai-labs-life-skills
```

```bash
codex plugin list
```

**Marketplace refresh is not a promise that every installed plugin was replaced.** If an installed plugin is still out of date, reinstall **that plugin only** after checking its installed version and accepting that the operation removes/re-adds its local installation:

```bash
codex plugin remove de-stromwechsel@kt-ai-labs-life-skills
codex plugin add de-stromwechsel@kt-ai-labs-life-skills
```

For an outdated optional browser plugin, do the same separately:

```bash
codex plugin remove browser-research@kt-ai-labs-life-skills
codex plugin add browser-research@kt-ai-labs-life-skills
```

### Update Claude Code Life Skills plugins

Refresh the marketplace catalog:

```bash
claude plugin marketplace update kt-ai-labs-life-skills
```

Update each plugin **that you actually installed**; updating a marketplace listing from the shell alone does not upgrade installed plugins:

```bash
claude plugin update de-stromwechsel@kt-ai-labs-life-skills
```

Optional browser plugin:

```bash
claude plugin update browser-research@kt-ai-labs-life-skills
```

Check the installed plugins:

```bash
claude plugin list
```

Start a **new** Codex or Claude Code session after installing or updating a plugin. See [Codex plugin commands](https://learn.chatgpt.com/docs/developer-commands) and [Claude Code plugin management](https://code.claude.com/docs/en/discover-plugins).

## Troubleshooting setup and research access

- **No built-in web search:** that alone is not a blocker. If an approved browser is available, the agent can navigate directly to known websites or use a search engine in the browser. `browser-research` provides a reusable approach; without any accessible live source, the agent must disclose that current prices or guidance could not be verified.
- **Plugin is not detected:** make sure you installed the plugin (not just the marketplace), are using the relevant **CLI** and started a new session. The Codex VS Code IDE extension does not currently load Codex CLI plugins.
- **`brew` or a CLI command is missing:** revisit the Homebrew installation/PATH instructions.
- **Playwright cannot open a browser:** check that `playwright-cli` is installed, run `playwright-cli install-browser`, and inspect the error. Do not attach a personal browser profile just to work around an isolation error.

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
