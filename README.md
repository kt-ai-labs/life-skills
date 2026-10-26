# KT-AI Labs Life Skills

Reusable AI skills for practical everyday decisions and procedures. Each independent user task is packaged as its own installable plugin. The same `SKILL.md` and its references are shared between **Codex** and **Claude Code**; only their plugin manifests and marketplace catalogs differ.

## Available plugins

| Plugin                                                                                  | Purpose                                                                                                                            | Extra software          |
| --------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| [`de-stromwechsel`](plugins/de/de-stromwechsel/skills/de-stromwechsel/SKILL.md)         | Research and plan a German household electricity-provider switch, including bonuses, provider reliability, and strategic reserves. | None required           |
| [`browser-research`](plugins/general/browser-research/skills/browser-research/SKILL.md) | Navigate and inspect websites efficiently using an available local browser tool.                                                   | Playwright CLI optional |

Plugins are installed **independently**. `de-stromwechsel` does not require `browser-research` or Playwright CLI. Browser research is an optional reusable capability when the host environment supports it.

## Install in Codex (CLI / VS Code workflow)

Register this GitHub marketplace in a terminal where Codex CLI is installed:

```bash
codex plugin marketplace add kt-ai-labs/life-skills --ref main
codex plugin marketplace list
```

In Codex CLI, use `/plugins` to browse/install available plugins, or use a supported Plugins Directory in your Codex client. Registering the marketplace does **not** automatically install every plugin. Start a new Codex session after installation.

To refresh the catalog:

```bash
codex plugin marketplace upgrade kt-ai-labs-life-skills
```

For a project-specific Codex CLI configuration in a trusted project, plugins from a marketplace can also be enabled using the documented `[plugins."plugin-name@marketplace-name"]` config key. Exact UI availability in VS Code depends on the installed Codex extension; use the CLI in the VS Code terminal if the extension does not expose the marketplace browser.

## Install in Claude Code

```bash
claude plugin marketplace add kt-ai-labs/life-skills
claude plugin install de-stromwechsel@kt-ai-labs-life-skills
# Optional, independent plugin:
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
