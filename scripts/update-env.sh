#!/usr/bin/env bash
set -euo pipefail

# macOS environment bootstrap + repeatable updater for coding-agent tooling.
# The optional npm step uses the caller's working directory ($PWD).
# Works locally or when streamed into bash over curl.

usage() {
  echo "Usage: update-env.sh [-y|--yes] [-h|--help]"
  echo "  -y, --yes    Skip initial confirmation (not the agent-choice questions)"
  echo "  -h, --help   Show this help and exit"
}

assume_yes=false
while [[ $# -gt 0 ]]; do
  case "$1" in
    -y|--yes) assume_yes=true ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
  shift
done

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "Error: this script supports macOS only." >&2
  exit 1
fi

echo "Coding Agent Tools — Environment Setup & Update"
echo
echo "This script will:"
echo "- Install Homebrew if it is missing"
echo "- Run brew update and brew upgrade"
echo "- Ask to install Codex CLI and/or Claude Code if neither is installed"
echo "- Install missing recommended tools (RTK, Playwright CLI)"
echo "- Leave skills, plugins, and marketplaces to project-local or manual setup"
echo "- Install npm dependencies if package.json exists"
echo

ask_yes() {
  local answer
  if [[ ! -r /dev/tty ]]; then
    echo "Error: an interactive terminal is needed for this choice." >&2
    exit 1
  fi
  if ! read -r -p "$1 [y/N]: " answer </dev/tty; then
    echo "Error: could not read confirmation from terminal." >&2
    exit 1
  fi
  [[ "$answer" == [yY] || "$answer" == [yY][eE][sS] ]]
}

if [[ "$assume_yes" != true ]]; then
  if ! ask_yes "Do you want to continue?"; then
    echo "Cancelled. No changes made."
    exit 0
  fi
fi

install_codex=false
install_claude=false
if command -v codex >/dev/null 2>&1; then install_codex=true; fi
if command -v claude >/dev/null 2>&1; then install_claude=true; fi

if [[ "$install_codex" == false && "$install_claude" == false ]]; then
  echo "Neither Codex CLI nor Claude Code is installed."
  if ask_yes "Install Codex CLI?"; then install_codex=true; fi
  if ask_yes "Install Claude Code?"; then install_claude=true; fi
  if [[ "$install_codex" == false && "$install_claude" == false ]]; then
    echo "No coding agent selected. Exiting without changes."
    exit 0
  fi
fi

# Homebrew may have been installed but not added to the caller's PATH yet.
if ! command -v brew >/dev/null 2>&1; then
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    echo "==> Installing Homebrew"
    # Homebrew's installer may require a tty for confirmation or sudo.
    # Input cannot come from stdin, which may carry this script via curl.
    if [[ ! -r /dev/tty ]]; then
      echo "Error: Homebrew installation requires an interactive terminal." >&2
      exit 1
    fi
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/tty
    if [[ -x /opt/homebrew/bin/brew ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi
  fi
fi
if ! command -v brew >/dev/null 2>&1; then
  echo "Error: Homebrew is not available after setup." >&2
  exit 1
fi

# Homebrew may prompt for upgrades on newer versions. Keep this local to the process.
export HOMEBREW_NO_ASK=1
brew_prefix="$(brew --prefix)"

echo "==> Updating Homebrew metadata"
brew update
echo "==> Upgrading Homebrew packages"
brew upgrade

# If a CLI exists outside Homebrew, do not install a duplicate or replace it.
# Homebrew-owned installations are updated via Homebrew.
ensure_formula() {
  local formula="$1" bin="$2"
  if brew list --formula "$formula" >/dev/null 2>&1; then
    echo "==> $formula is managed by Homebrew"
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
    echo "==> $cask is managed by Homebrew"
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

# Node/npm supports optional dependency installation in the current project.
# It is not a prerequisite for installing Codex or Claude binaries via Homebrew.
echo "==> Ensuring Node.js is available"
ensure_formula node node
if ! command -v npm >/dev/null 2>&1; then
  echo "Error: npm is missing; check your Node.js installation." >&2
  exit 1
fi

if [[ "$install_codex" == true ]]; then
  ensure_cask codex codex
fi
if [[ "$install_claude" == true ]]; then
  ensure_cask claude-code claude
fi
ensure_formula playwright-cli playwright-cli

# RTK (Rust Token Killer) is a separate CLI, not a Life Skills plugin.
# The Homebrew tap avoids confusing it with the unrelated Rust Type Kit.
echo "==> Ensuring RTK token optimizer"
if brew list --formula rtk-ai/tap/rtk >/dev/null 2>&1; then
  echo "==> RTK is managed by Homebrew"
elif command -v rtk >/dev/null 2>&1; then
  echo "==> RTK already exists outside the expected Homebrew tap; leaving it unchanged"
else
  brew install rtk-ai/tap/rtk
fi
if ! command -v rtk >/dev/null 2>&1 || ! rtk gain >/dev/null 2>&1; then
  echo "Error: Rust Token Killer is missing or this 'rtk' binary is not the token optimizer." >&2
  echo "Check https://github.com/rtk-ai/rtk and resolve any name conflict manually." >&2
  exit 1
fi
echo "==> Registering global RTK integrations for detected coding agents"
if [[ "$install_codex" == true ]]; then
  rtk init --global --codex </dev/null
fi
if [[ "$install_claude" == true ]]; then
  rtk init --global --auto-patch </dev/null
fi

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

echo "==> Finished"
if [[ "$install_codex" == true ]]; then
  echo "Codex: $(codex --version)"
fi
if [[ "$install_claude" == true ]]; then
  echo "Claude: $(claude --version)"
fi
echo "Playwright CLI: $("$playwright_cli" --version)"
echo "RTK: $(rtk --version)"
echo "RTK savings: rtk gain"
echo "Skills, plugins, and marketplaces are not managed by this script."
echo "Restart your coding-agent sessions to load updated tool integrations."
