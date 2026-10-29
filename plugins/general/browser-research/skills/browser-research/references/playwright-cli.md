# Playwright CLI: minimal browser-research recipes

Use this reference only after confirming that an executable is available. Check its `--help` for current syntax; do not invent options.

## Availability

- Project-local: check the project's Playwright CLI executable, commonly `./node_modules/.bin/playwright-cli` on Unix-like systems (Windows uses platform-specific launchers).
- Global: check `playwright-cli --help` when the command is on PATH.
- The presence of `SKILL.md`, `playwright.config.ts`, or a Playwright test dependency does not prove that `@playwright/cli` is installed.
- Use only an already-installed executable and browser runtime. Do not use a package runner that may download missing packages, install dependencies or change project configuration. If unavailable, report the interactive-verification limitation; installation is outside this workflow.

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

Use this config in the launch example below, only where CLI browser control is permitted. Inspect effective configuration and relevant environment overrides for extension/CDP/remote attachment, persistent user-data directories and loaded storage state. Do not launch with prohibited attachment modes or import personal state. Do not use `attach`, `--persistent`, `--profile` or `state-load` as an isolation recipe. A reused session name is not proof of a fresh profile. Verify the actual launch mode; these documented settings are not a runtime isolation test. Outside a Full Research Pause, close only the task session and remove its own temporary config when done.

## Interactive handoff capabilities

The [official monitoring documentation](https://github.com/microsoft/playwright-cli#monitoring) describes Dashboard control of a selected session. CLI 0.1.22 locally exposes named sessions, `open --headed`, `show` and `snapshot` in its help; this establishes command support, not successful shared control. Verify behavior on the actual host before promising it.

Before requesting help, read [human assistance](human-assistance.md). When permitted and supported on this host, keep the same isolated session open, use `playwright-cli show` to expose the Dashboard, and identify the exact task session, tab and item for the user. The documented Dashboard lets the user select its viewport to take control and release it with Escape; do not prescribe this mechanism unless available here.

After the request, enforce **Full Research Pause** across all tabs, sessions and research work, not merely the displayed page. Escape or a tool-retry approval alone is not explicit user confirmation. Only after the user confirms completion or returns control, `playwright-cli -s=research1 snapshot --depth=3` can read fresh state from the relevant tab for verification and continuation. These are ordinary commands around a conversational handoff, not a `handoff` or human-handoff `resume` command. Do not use the CLI debugger's unrelated resume controls. If Dashboard control is unavailable, use the independent-browser route in the shared protocol.

## Efficient commands

The examples below use `playwright-cli` to mean the selected, verified executable. For local installs, substitute its executable path. Replace `research1` with a unique session name. Use these commands only while research is active, never during a Full Research Pause.

```bash
playwright-cli -s=research1 open https://example.com --config=/absolute/path/to/task-config.json --headed
playwright-cli -s=research1 find "Pricing"
playwright-cli -s=research1 snapshot --depth=3
playwright-cli -s=research1 snapshot e12
playwright-cli -s=research1 --raw eval "document.title"
playwright-cli -s=research1 close
```

Prefer `find` to locating one node in a full snapshot. Take a targeted snapshot of a relevant element or selector. Use `--raw` when you only need a scalar value; extract small fields rather than printing massive DOM dumps.

## Dynamic forms and failed actions

Use fresh, targeted snapshots to locate inputs, autocomplete options, validation messages, buttons and the result section. After an action, observe the expected state change using condition/wait capabilities actually supported by the installed CLI. If none is exposed, make bounded fresh observations of the relevant state; do not substitute a fixed sleep or network idle for application acceptance.

- Select the required autocomplete suggestion, then confirm the committed value and dependent fields before calculating.
- If an input is readonly, find the site's selector or edit control; do not remove readonly attributes or force DOM values. A typing timeout is not proof that the calculator is unavailable.
- After a postal-code change, recheck district/locality selection and validation. Visible old tariffs do not prove that the new inputs are valid or priced.
- Confirm that calculation controls are enabled, pending indicators have finished, and the displayed offer matches the current accepted input set. Do not disturb a valid quote just to diagnose another control.

Where DOM inspection is available, use read-only `eval` for narrowly scoped observable facts. For example, after identifying the actual input name on the site, adapt this illustrative selector:

```bash
playwright-cli -s=research1 --raw eval "JSON.stringify(Array.from(document.querySelectorAll('input[name=postalCode]')).map(el => ({ value: el.value, readonly: el.readOnly, disabled: el.disabled, valid: el.validity.valid })))"
```

This is a diagnostic observation, not proof that suggestions were committed or a quote recalculated. Cross-check the relevant UI. After failures, inspect fresh state and configuration/error evidence, retarget a supported control and retry only with a reason. Do not repeatedly relaunch a disappearing session without new information or change the selected source because interaction is difficult.

## Consent, downloads and cleanup

Follow SKILL.md's blocking-banner consent policy; isolation is not permission to select Accept All. For human help or downloads, follow [human assistance and downloads](human-assistance.md). Verify the reported download location, actual file and applicability before closing temporary storage; preserve the user's original.

Never save login state, cookies, or session tokens without the user's specific request. Outside a Full Research Pause, remove the task's unnecessary temporary screenshots and snapshots when finished; do not run `close-all` or `kill-all` in a shared environment.

Official manual: https://github.com/microsoft/playwright-cli
