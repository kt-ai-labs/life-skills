#!/usr/bin/env bash
set -euo pipefail

# macOS environment bootstrap + repeatable updater for Life Skills.
# Runs from any working directory; only the optional npm step uses $PWD.
# Usage: ./scripts/update-env.sh [--all-brew]
#        curl -fsSL https://raw.githubusercontent.com/kt-ai-labs/life-skills/main/scripts/update-env.sh | bash

usage() {
  echo "Usage: update-env.sh [--all-brew]"
  echo "By default only Life Skills CLI tools are upgraded."
  echo "--all-brew additionally upgrades every outdated Homebrew package and cask."
}

mode="selected"
case "${1:-}" in
  "") ;;
  --all-brew) mode="all" ;;
  -h|--help) usage; exit 0 ;;
  *) usage >&2; exit 2 ;;
esac
if [[ $# -gt 1 ]]; then
  usage >&2
  exit 2
fi

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "Error: this script supports macOS only." >&2
  exit 1
fi
if ! command -v brew >/dev/null 2>&1; then
  echo "Error: Homebrew is required. Install it from https://brew.sh/ and rerun." >&2
  exit 1
fi

# Homebrew may prompt for upgrades on newer versions. Keep this local to the process.
export HOMEBREW_NO_ASK=1
marketplace_name="kt-ai-labs-life-skills"
marketplace_source="kt-ai-labs/life-skills"
brew_prefix="$(brew --prefix)"

echo "==> Updating Homebrew metadata"
brew update
if [[ "$mode" == "all" ]]; then
  echo "==> Upgrading all Homebrew-managed software (--all-brew)"
  brew upgrade
fi

# If a CLI exists outside Homebrew, do not install a duplicate or replace it.
# Homebrew-owned installations are updated via Homebrew.
ensure_formula() {
  local formula="$1" bin="$2"
  if brew list --formula "$formula" >/dev/null 2>&1; then
    if [[ "$mode" == "selected" ]]; then
      brew upgrade "$formula"
    fi
  elif command -v "$bin" >/dev/null 2>&1; then
    echo "==> $bin is installed outside Homebrew; leaving it unchanged"
  else
    echo "==> Installing $formula through Homebrew"
    brew install "$formula"
  fi
  if ! command -v "$bin" >/dev/null 2>&1; then
    echo "Error: $bin is missing from PATH after setup." >&2
    exit 1
  fi
}

ensure_cask() {
  local cask="$1" bin="$2"
  if brew list --cask "$cask" >/dev/null 2>&1; then
    if [[ "$mode" == "selected" ]]; then
      brew upgrade --cask "$cask"
    fi
  elif command -v "$bin" >/dev/null 2>&1; then
    echo "==> $bin is installed outside Homebrew; leaving it unchanged"
    echo "    Update it with its original installer if it is outdated."
  else
    echo "==> Installing $cask through Homebrew"
    brew install --cask "$cask"
  fi
  if ! command -v "$bin" >/dev/null 2>&1; then
    echo "Error: $bin is missing from PATH after setup." >&2
    exit 1
  fi
}

# Node is required for the Codex marketplace's JSON output. It is not a
# prerequisite for installing the Codex or Claude binaries via Homebrew.
echo "==> Ensuring Node.js is available"
ensure_formula node node
if ! command -v npm >/dev/null 2>&1; then
  echo "Error: npm is missing; check your Node.js installation." >&2
  exit 1
fi

echo "==> Ensuring Codex CLI, Claude Code and Playwright CLI"
ensure_cask codex codex
ensure_cask claude-code claude
ensure_formula playwright-cli playwright-cli

# If an older npm installation shadows Brew's Playwright binary, use the
# Homebrew-managed binary. Do not modify other installations.
playwright_cli="$(command -v playwright-cli)"
if brew list --formula playwright-cli >/dev/null 2>&1 &&
   [[ -x "$brew_prefix/bin/playwright-cli" ]]; then
  playwright_cli="$brew_prefix/bin/playwright-cli"
fi

echo "==> Preparing Playwright browser (download may be required)"
if ! "$playwright_cli" install-browser; then
  echo "Warning: Playwright browser installation failed; browser research may be unavailable." >&2
fi

# Keep the existing global Codex Playwright CLI skill setup. It is additional
# to the independent Life Skills browser-research plugin.
echo "==> Installing/updating global Playwright CLI skill for Codex"
if ! "$playwright_cli" install --skills=agents -g; then
  echo "Warning: Playwright CLI agent skill installation failed." >&2
fi

# npm belongs to the CURRENT working directory, not the script's location.
if [[ -f "$PWD/package.json" ]]; then
  echo "==> Installing project npm dependencies in: $PWD"
  if [[ -f "$PWD/package-lock.json" ]]; then
    npm install
  else
    npm install --no-package-lock
  fi
else
  echo "==> No package.json in $PWD; skipping npm install"
fi

echo "==> Configuring Life Skills for Codex CLI"
if ! codex plugin marketplace --help >/dev/null 2>&1; then
  echo "Error: this Codex CLI does not support plugins; update it via its installer." >&2
  exit 1
fi
marketplace_json="$(codex plugin marketplace list --json)"
registered="$(printf '%s' "$marketplace_json" | node -e '
  let input = "";
  process.stdin.setEncoding("utf8");
  process.stdin.on("data", chunk => input += chunk);
  process.stdin.on("end", () => {
    const parsed = JSON.parse(input);
    if (!Array.isArray(parsed.marketplaces))
      throw new Error("Unexpected Codex marketplace JSON");
    process.stdout.write(parsed.marketplaces.some(m => m.name === process.argv[1]) ? "yes" : "no");
  });
' "$marketplace_name")"
if [[ "$registered" == "yes" ]]; then
  codex plugin marketplace upgrade "$marketplace_name"
else
  codex plugin marketplace add "$marketplace_source" --ref main
fi

echo "==> Installing/updating available Life Skills plugins in Codex"
plugin_json="$(codex plugin list --marketplace "$marketplace_name" --available --json)"
plugin_actions="$(printf '%s' "$plugin_json" | node -e '
  let input = "";
  process.stdin.setEncoding("utf8");
  process.stdin.on("data", chunk => input += chunk);
  process.stdin.on("end", () => {
    const parsed = JSON.parse(input);
    if (!Array.isArray(parsed.installed) || !Array.isArray(parsed.available))
      throw new Error("Unexpected Codex plugin list JSON");
    const marketplace = process.argv[1];
    const installed = new Map(parsed.installed
      .filter(p => p.marketplaceName === marketplace)
      .map(p => [p.name, p]));
    const available = parsed.available
      .filter(p => p.marketplaceName === marketplace && p.installPolicy !== "NOT_AVAILABLE");
    if (!available.length) throw new Error("No installable Life Skills plugins found");
    const seen = new Set();
    for (const p of available) {
      if (!/^[a-z0-9][a-z0-9._-]*$/.test(p.name)) throw new Error("Invalid plugin name");
      if (seen.has(p.name)) continue;
      seen.add(p.name);
      const existing = installed.get(p.name);
      let action = "install";
      if (existing) {
        action = existing.version && p.version && existing.version !== p.version
          ? "upgrade" : "current";
      }
      process.stdout.write(p.name + " " + action + "\n");
    }
  });
' "$marketplace_name")"
while read -r plugin action; do
  [[ -n "$plugin" ]] || continue
  case "$action" in
    install) codex plugin add "${plugin}@${marketplace_name}" ;;
    upgrade)
      echo "==> Updating Codex plugin: $plugin"
      codex plugin remove "${plugin}@${marketplace_name}"
      codex plugin add "${plugin}@${marketplace_name}"
      ;;
    current) echo "==> Codex plugin up to date: $plugin" ;;
  esac
done <<< "$plugin_actions"

echo "==> Configuring Life Skills for Claude Code"
# Adding an existing marketplace from the same source is supported and reused.
claude plugin marketplace add "$marketplace_source"
claude plugin marketplace update "$marketplace_name"

# Claude Code's shell marketplace update refreshes the catalog but does NOT
# automatically update the plugins. Update installed plugins individually.
claude_plugins="$(claude plugin list)"
for plugin in de-stromwechsel browser-research; do
  qualified="${plugin}@${marketplace_name}"
  if printf '%s\n' "$claude_plugins" | grep -Fq "$qualified"; then
    echo "==> Updating Claude plugin: $plugin"
    claude plugin update "$qualified"
  else
    echo "==> Installing Claude plugin: $plugin"
    claude plugin install "$qualified" --scope user
  fi
done

echo "==> Finished"
echo "Codex: $(codex --version)"
echo "Claude: $(claude --version)"
echo "Playwright CLI: $("$playwright_cli" --version)"
echo "Codex Life Skills plugins:"
codex plugin list --marketplace "$marketplace_name"
echo "Claude Code plugins:"
claude plugin list
echo "Restart your CLI sessions to load updated plugins."
