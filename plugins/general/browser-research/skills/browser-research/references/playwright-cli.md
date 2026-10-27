# Playwright CLI: minimal browser-research recipes

Use this reference only after confirming that an executable is available. Check its `--help` for current syntax; do not invent options.

## Availability and installation

- Project-local: check the project's Playwright CLI executable, commonly `./node_modules/.bin/playwright-cli` on Unix-like systems (Windows uses platform-specific launchers).
- Global: check `playwright-cli --help` when the command is on PATH.
- The presence of `SKILL.md`, `playwright.config.ts`, or a Playwright test dependency does not prove that `@playwright/cli` is installed.
- If not installed, request permission before suggesting any package change. An optional global install is `npm install -g @playwright/cli@latest`; a project-local install is `npm install -D @playwright/cli@latest` and modifies project dependencies. Prefer not to modify an unrelated project for one-off research.

## Isolation and visibility

CLI 0.1.22 help and the [official manual](https://github.com/microsoft/playwright-cli#sessions) document an in-memory profile and `open --headed`. Recheck the installed version and configuration on other hosts. For a fresh, uniquely named task session, create a temporary config such as:

```json
{
  "browser": {
    "isolated": true,
    "launchOptions": { "headless": false }
  }
}
```

Use this config in the launch example below, only where CLI browser control is permitted. Inspect effective configuration and relevant environment overrides for extension/CDP/remote attachment, persistent user-data directories and loaded storage state; do not import personal state. Do not use `attach`, `--persistent`, `--profile` or `state-load` as an isolation recipe. A reused session name is not proof of a fresh profile. Verify the actual launch mode; these documented settings are not a runtime isolation test. Close only the task session and remove its own temporary config when done.

## Interactive handoff capabilities

The [official monitoring documentation](https://github.com/microsoft/playwright-cli#monitoring) describes Dashboard control of a selected session. CLI 0.1.22 locally exposes named sessions, `open --headed`, `show` and `snapshot` in its help; this establishes command support, not successful shared control. Verify behavior on the actual host before promising it.

When permitted and available, keep the same isolated session open, use `playwright-cli show` to expose the Dashboard, and identify the task session for the user. The documented Dashboard lets the user select its viewport to take control and release it with Escape. Pause agent page actions during that interaction. After confirmation, `playwright-cli -s=research1 snapshot --depth=3` reads fresh state for continuing the existing session. These are ordinary commands around a conversational handoff, not a `handoff` or human-handoff `resume` command. Do not use the CLI debugger's unrelated resume controls for this workflow. If Dashboard control is unavailable, use the link/manual-file fallback in [human assistance](human-assistance.md).

## Efficient commands

The examples below use `playwright-cli` to mean the selected, verified executable. For local installs, substitute its executable path. Replace `research1` with a unique session name.

```bash
playwright-cli -s=research1 open https://example.com --config=/absolute/path/to/task-config.json --headed
playwright-cli -s=research1 find "Pricing"
playwright-cli -s=research1 snapshot --depth=3
playwright-cli -s=research1 snapshot e12
playwright-cli -s=research1 --raw eval "document.title"
playwright-cli -s=research1 close
```

Prefer `find` to locating one node in a full snapshot. Take a targeted snapshot of a relevant element or selector. Use `--raw` when you only need a scalar value; extract small fields rather than printing massive DOM dumps.

Never save login state, cookies, or session tokens without the user's specific request. Remove temporary screenshots and snapshots when finished; do not run `close-all` or `kill-all` in a shared environment.

Official manual: https://github.com/microsoft/playwright-cli
