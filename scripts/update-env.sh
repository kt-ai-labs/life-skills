#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "Error: this script requires macOS and Homebrew." >&2
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Error: Homebrew is not installed or is not in PATH." >&2
  exit 1
fi

# Skip Homebrew 6+ default install/upgrade confirmation prompts.
# Keep this setting scoped to this script, not the user\'s shell.
export HOMEBREW_NO_ASK=1

echo "==> Updating Homebrew metadata"
brew update

echo "==> Upgrading Homebrew packages"
brew upgrade

echo "==> Ensuring Playwright CLI is managed by Homebrew"
if ! brew list --formula playwright-cli >/dev/null 2>&1; then
  brew install playwright-cli
fi

# Use Homebrew's binary even if a previous npm installation is earlier in PATH.
playwright_cli="$(brew --prefix)/bin/playwright-cli"
if [[ ! -x "$playwright_cli" ]]; then
  echo "Error: Playwright CLI is unavailable at $playwright_cli." >&2
  exit 1
fi

echo "==> Installing/updating the global Playwright CLI skill for Codex"
"$playwright_cli" install --skills=agents -g

echo "==> Installing/updating local npm dependencies"
# Resolve the repository root from the script location, regardless of caller cwd.
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
(
  cd "$repo_root"
  npm install --no-package-lock
)

# Codex CLI manages a user-level marketplace shared by local Codex clients.
marketplace_name="kt-ai-labs-life-skills"
marketplace_source="kt-ai-labs/life-skills"

echo "==> Ensuring Codex CLI is installed"
if ! command -v codex >/dev/null 2>&1; then
  brew install --cask codex
fi
if ! command -v codex >/dev/null 2>&1; then
  echo "Error: Codex CLI is still missing from PATH." >&2
  exit 1
fi

if ! codex plugin marketplace --help >/dev/null 2>&1; then
  echo "Error: Codex CLI does not support plugins. Update your Codex CLI." >&2
  exit 1
fi

echo "==> Registering/updating KT-AI Labs Life Skills marketplace"
marketplace_json="$(codex plugin marketplace list --json)"
registered="$(printf '%s' "$marketplace_json" | node -e '
  let data = "";
  process.stdin.setEncoding("utf8");
  process.stdin.on("data", chunk => data += chunk);
  process.stdin.on("end", () => {
    const parsed = JSON.parse(data);
    if (!Array.isArray(parsed.marketplaces)) throw new Error("Unexpected marketplace JSON");
    process.stdout.write(parsed.marketplaces.some(m => m.name === process.argv[1]) ? "yes" : "no");
  });
' "$marketplace_name")"
if [[ "$registered" == "yes" ]]; then
  codex plugin marketplace upgrade "$marketplace_name"
else
  codex plugin marketplace add "$marketplace_source" --ref main
fi

echo "==> Installing/updating ALL plugins from KT-AI Labs Life Skills"
plugin_json="$(codex plugin list --marketplace "$marketplace_name" --available --json)"
plugin_names="$(printf '%s' "$plugin_json" | node -e '
  let data = "";
  process.stdin.setEncoding("utf8");
  process.stdin.on("data", chunk => data += chunk);
  process.stdin.on("end", () => {
    const parsed = JSON.parse(data);
    if (!Array.isArray(parsed.installed) || !Array.isArray(parsed.available))
      throw new Error("Unexpected plugin list JSON");
    const names = [...parsed.installed, ...parsed.available]
      .filter(p => p.marketplaceName === process.argv[1] && p.installPolicy !== "NOT_AVAILABLE")
      .map(p => p.name);
    if (!names.length) throw new Error("No installable plugins found in marketplace");
    for (const name of names) {
      if (!/^[a-z0-9][a-z0-9._-]*$/.test(name))
        throw new Error(`Unexpected plugin name: ${name}`);
    }
    console.log([...new Set(names)].join("\n"));
  });
' "$marketplace_name")"
while IFS= read -r plugin; do
  [[ -n "$plugin" ]] || continue
  codex plugin add "${plugin}@${marketplace_name}"
done <<< "$plugin_names"

echo "==> Complete"
"$playwright_cli" --version
codex plugin list --marketplace "$marketplace_name"
echo "Codex Playwright skill: $HOME/.agents/skills/playwright-cli"
echo "Restart open Codex/VS Code sessions to load updated plugin capabilities."
