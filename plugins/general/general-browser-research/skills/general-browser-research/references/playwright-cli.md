# Playwright CLI: minimal browser-research recipes

Use this reference only after confirming that an executable is available. Check its `--help` for current syntax; do not invent options.

## Availability and installation

- Project-local: check the project's Playwright CLI executable, commonly `./node_modules/.bin/playwright-cli` on Unix-like systems (Windows uses platform-specific launchers).
- Global: check `playwright-cli --help` when the command is on PATH.
- The presence of `SKILL.md`, `playwright.config.ts`, or a Playwright test dependency does not prove that `@playwright/cli` is installed.
- If not installed, request permission before suggesting any package change. An optional global install is `npm install -g @playwright/cli@latest`; a project-local install is `npm install -D @playwright/cli@latest` and modifies project dependencies. Prefer not to modify an unrelated project for one-off research.

## Efficient commands

The examples below use `playwright-cli` to mean the selected, verified executable. For local installs, substitute its executable path. Replace `research1` with a unique session name.

```bash
playwright-cli -s=research1 open https://example.com
playwright-cli -s=research1 find "Pricing"
playwright-cli -s=research1 snapshot --depth=3
playwright-cli -s=research1 snapshot e12
playwright-cli -s=research1 --raw eval "document.title"
playwright-cli -s=research1 close
```

Prefer `find` to locating one node in a full snapshot. Take a targeted snapshot of a relevant element or selector. Use `--raw` when you only need a scalar value; extract small fields rather than printing massive DOM dumps.

Never save login state, cookies, or session tokens without the user's specific request. Remove temporary screenshots and snapshots when finished; do not run `close-all` or `kill-all` in a shared environment.

Official manual: https://github.com/microsoft/playwright-cli
