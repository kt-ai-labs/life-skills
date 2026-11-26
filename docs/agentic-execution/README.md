# Agentic Execution — maintenance and project-local use

Life Skills owns the canonical operational Skill, example formats, plugin metadata and releases. The initial package version is `0.1.0`, implementing the V2 lifecycle contract. The Skill is instruction-only and has no mandatory MCP server, hooks, scripts or extra software. The actual host must support the independent review and recovery capabilities required by its operational contract.

## Maintain the Skill

- The [entrypoint](../../plugins/general/agentic-execution/skills/agentic-execution/SKILL.md) and its phase references are the operational authority. Preserve the single sequential Executor, Single Focus, independent review gates, explicit human Definition approvals and launch, recoverable evidence, one active executable batch, and distinct same-state final reviews.
- Consumer projects own their Task artifacts, project-specific instructions, observations, experimental evidence and proposals. Do not copy their private histories, source data, review records or proposal collections into the public package. Collect and reconcile authorized, generalized feedback when deciding a future release. Do not implement proposals simply because they exist.
- Keep examples fictional, consistent with the currently distributed artifact and review contracts, and explicitly unapproved. No example grants real work authorization.
- Keep package name and version consistent in both manifests and the Skill entrypoint; update marketplace registration and docs when needed. Preserve recoverable source revisions of each release; never change the content behind an existing published version. Separate packaging changes from a lifecycle redesign.
- Audit the complete affected Skill and architecture after substantive changes, correcting Critical, High and Medium findings before repeating the full audit. Validate manifests, reference paths, example consistency, disclosure boundaries and actual client behavior. Static checks do not prove host capabilities.

## Consume a pinned release inside a project

Use a released, unmodified package or Skill copy from a recoverable public source revision. Project-local installation and updates belong to the consumer project. Do not use global environment setup to assume that a particular version is pinned.

For Codex, a project can use a repo-local marketplace: put the pinned plugin folder in the project, register its relative source in that project's `.agents/plugins/marketplace.json` using the catalog format in this repository, and enable its qualified ID in the trusted project's `.codex/config.toml`. Use a project-specific marketplace identity when distinct projects need distinct sources or releases. See [Codex packaging and repository enablement](https://developers.openai.com/plugins/build/plugins). Alternatively, install only the complete `skills/agentic-execution/` folder under the project root's `.agents/skills/agentic-execution/` for direct project-local Skill discovery. Do not enable a competing copy through another marketplace.

For Claude Code, a project-local marketplace can point at the same pinned plugin folder. Register that marketplace and install the qualified plugin ID with `claude plugin install <plugin>@<project-marketplace> --scope project` (shared project settings), or `--scope local` for personal settings in that project. Use a project-specific marketplace identity if independent version control is needed. See [Claude Code installation scopes](https://code.claude.com/docs/en/plugins/install). A project-scoped enablement may still use a shared machine cache; it does not by itself establish isolated versions or physical project-local storage. For direct Skill discovery instead, use the project-local `.claude/skills/agentic-execution/` folder or a supported link to the same pinned Skill source. Verify the selected client, scope, installed version and actual entrypoint, and avoid competing active copies. These are configuration options, not a claim that a particular client release has been tested.

## Consumer project guidance

Keep project-specific Task paths, authority, checkpoints and domain rules in AGENTS.md or the applicable host instructions. A short continuity rule can be added there:

> Once Agentic Execution is activated for a Task, keep it active throughout that Task's lifecycle unless explicitly discontinued by the human. After compaction, interruption or resumption, locate and reread the governing installed Skill release and follow its Recovery procedure before continuing. Preserve permissions, approvals and restrictions; do not silently substitute another release. If the required release is unavailable or identity is uncertain, stop affected work and reconcile it with the human.

That rule preserves an existing activation; it does not activate the Skill for ordinary work or authorize a Task. The Skill stores its governing identity in existing Task records. Preserve or recover the original release for an active Task; adopt a different release only after explicit authorization and reconciliation of pending gates and compatibility. Historical artifacts and approvals must not be rewritten. Verify discovery, invocation, independent review, interruption and recovery on the actual installed clients before relying on them.

For domain-specific work, apply the relevant domain Skill (for example de-stromwechsel) separately. Agentic Execution governs the lifecycle, not tariff methodology, browser policy or personal research data.
