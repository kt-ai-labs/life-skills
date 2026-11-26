# Agentic Execution — maintenance and project-local use

Life Skills owns the canonical operational Skill, example formats, plugin metadata and releases. The initial package version is `0.1.0`, implementing the V2 lifecycle contract. The Skill is instruction-only and has no mandatory MCP server, hooks, scripts or extra software. The actual host must support the independent review and recovery capabilities required by its operational contract.

## Maintain the Skill

- The [entrypoint](../../plugins/general/agentic-execution/skills/agentic-execution/SKILL.md) and its phase references are the operational authority. Preserve the single sequential Executor, Single Focus, independent review gates, explicit human Definition approvals and launch, recoverable evidence, one active executable batch, and distinct same-state final reviews.
- Consumer projects own their Task artifacts, project-specific instructions, observations, experimental evidence and proposals. Do not copy their private histories, source data, review records or proposal collections into the public package. Collect and reconcile authorized, generalized feedback when deciding a future release. Do not implement proposals simply because they exist.
- Keep examples fictional, consistent with the currently distributed artifact and review contracts, and explicitly unapproved. No example grants real work authorization.
- Keep package name and version consistent in both manifests and the Skill entrypoint; update marketplace registration and docs when needed. Preserve recoverable source revisions of each release; never change the content behind an existing published version. Separate packaging changes from a lifecycle redesign. Preserve the MIT notice shipped with the Skill in every distributed copy; confirm rights to publish new or imported material before any public commit.
- Audit the complete affected Skill and architecture after substantive changes, correcting Critical, High and Medium findings before repeating the full audit. Validate manifests, reference paths, example consistency, disclosure boundaries and actual client behavior. Static checks do not prove host capabilities.

## Consume a pinned release inside a project

Use a released, unmodified package or complete Skill copy from a recoverable public source revision. Project-local installation and updates belong to the consumer project. The default recommendation for independently pinned versions is a project-local copy of the complete Skill directory; this Skill does not require plugin-only capabilities.

### Direct project-local Skill installation

From a verified Life Skills source revision, copy the complete `plugins/general/agentic-execution/skills/agentic-execution/` folder, including its references, metadata and LICENSE, into the consumer's `.agents/skills/agentic-execution/` (Codex) or `.claude/skills/agentic-execution/` (Claude Code). A supported project-local link to the same pinned Skill source is another option; verify host discovery of links, particularly on Windows. Do not copy only SKILL.md. Keep the public source revision and a recoverable content identity in the consumer's existing version history or installation record. Avoid modifying the copied instructions in place; project-specific rules belong in project instructions. Do not enable a competing marketplace copy in that project.

### Project-local plugin installation

If the consumer needs marketplace packaging rather than a direct Skill copy:

- **Codex:** Put the pinned plugin folder in the consumer repository. Register its relative source in that project's `.agents/plugins/marketplace.json`, using the catalog format in this repository. Give it a project-specific marketplace identity. In the trusted project's `.codex/config.toml`, enable the qualified ID, for example:

  ```toml
  [plugins."agentic-execution@my-project-skills"]
  enabled = true
  ```

  See [Codex packaging and repository enablement](https://developers.openai.com/plugins/build/plugins). The host may load an installed cache copy, so compare the actual discovered files to the pinned source rather than assuming a project configuration proves isolation.
- **Claude Code:** Put the pinned plugin folder in a project-local marketplace root with `.claude-plugin/marketplace.json` and a project-specific marketplace name. From the consumer project, register the actual marketplace root (for example `claude plugin marketplace add ./.local-marketplace` if that is the directory created) and install with `claude plugin install agentic-execution@my-project-skills --scope project` (shared settings) or `--scope local` (personal settings for that project). Substitute the actual marketplace identity. Each collaborator must install locally; a committed enabled setting alone does not download the plugin. Marketplace registration and cached plugin content may be shared across projects. See [Claude Code installation scopes](https://code.claude.com/docs/en/plugins/install). For marketplace installs the Skill is normally namespaced, e.g. `/agentic-execution:agentic-execution`; verify the installed client's actual discovery and invocation.

For either client, inspect all effective scopes and disable conflicting global, project-local or synced copies for the affected project where supported; do not remove another project's installation without authority. Check the actual discovered entrypoint and full operational content, not just the plugin list or reported version. Keep updates deliberate, disable automatic updates for a pinned source where applicable, and retain the prior governing version before changing any active Task's installation. If the host cannot establish independent versions or unambiguous discovery, use the direct project-local Skill option or report the blocker. These are configuration options supported by documentation, not a claim that the actual client release has been tested.

## Consumer project guidance

Keep project-specific Task paths, authority, checkpoints and domain rules in AGENTS.md or the applicable host instructions. A short continuity rule can be added there:

> Once Agentic Execution is activated for a Task, keep it active throughout that Task's lifecycle unless explicitly discontinued by the human. After compaction, interruption or resumption, locate and reread the governing installed Skill release and follow its Recovery procedure before continuing. Preserve permissions, approvals and restrictions; do not silently substitute another release. If the required release is unavailable or identity is uncertain, stop affected work and reconcile it with the human.

That rule preserves an existing activation; it does not activate the Skill for ordinary work or authorize a Task. The Executor verifies and stores the complete recoverable governing Skill identity in existing Task records before substantive Task work; the host does not guarantee this automatically. Preserve or recover the original release for an active Task; adopt a different release only after explicit authorization and reconciliation of pending gates and compatibility. Historical artifacts and approvals must not be rewritten. Verify discovery, invocation, independent review, interruption and recovery on the actual installed clients before relying on them.

For domain-specific work, apply the relevant domain Skill (for example de-stromwechsel) separately. Agentic Execution governs the lifecycle, not tariff methodology, browser policy or personal research data.
