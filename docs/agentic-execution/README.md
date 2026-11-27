# Agentic Execution — maintenance and project-local use

Life Skills owns the canonical operational Skill, example formats, plugin metadata and releases. The current package version is `0.1.8`. It explicitly records strategic Tools & Skills at Task and Objective levels, preserves human-required workflows through planning and independent acceptance, and illustrates both levels without introducing a mandatory integration. Version `0.1.7` makes artifact-contract verification explicit in Final Task Definition review, clarifies continuation after partial or rejected human responses, and reconciles superseded pending review rounds without redundant invocation. Version `0.1.6` requires separate Task Brief framing, Intended Outcome and Objectives sections and aligns both examples. Version `0.1.5` explicitly resumes authorized work in the answering turn after a requested human decision or clarification, without a separate continuation command or weakening distinct approval, launch or pause restrictions. Version `0.1.4` clarified cross-operation verification reuse and consolidated waiting guidance. Version `0.1.3` addressed observed no-progress verification loops, preparation versus actual invocation, and redundant profile confirmations. It preserves independent review, human approval and launch, evidence and recovery requirements. Version `0.1.1` corrected the proposed Codex Batch Reviewer default from Sol Medium to Sol High, matching the other Codex reviewer roles and Claude Code's Opus High default for all three roles. Existing confirmed Task profiles are unchanged unless explicitly revised under the operational contract. The Skill is instruction-only and has no mandatory MCP server, hooks, scripts or extra software. The actual host must support the independent review and recovery capabilities required by its operational contract.

## Maintain the Skill

- The [entrypoint](../../plugins/general/agentic-execution/skills/agentic-execution/SKILL.md) and its phase references are the operational authority. Preserve the single sequential Executor, Single Focus, independent review gates, explicit human Definition approvals and launch, recoverable evidence, one active executable batch, and distinct same-state final reviews.
- Consumer projects own their Task artifacts, project-specific instructions, observations, experimental evidence and proposals. Do not copy their private histories, source data, review records or proposal collections into the public package. Collect and reconcile authorized, generalized feedback when deciding a future release. Do not implement proposals simply because they exist.
- Keep examples fictional, consistent with the currently distributed artifact and review contracts, and explicitly unapproved. No example grants real work authorization.
- Keep package name and version consistent in both manifests and the Skill entrypoint; update marketplace registration and docs when needed. Preserve recoverable source revisions of each release; never change the content behind an existing published version. Separate packaging changes from a lifecycle redesign. Preserve the MIT notice shipped with the Skill in every distributed copy; confirm rights to publish new or imported material before any public commit.
- Audit the complete affected Skill and architecture after substantive changes, correcting Critical, High and Medium findings before repeating the full audit. Validate manifests, reference paths, example consistency, disclosure boundaries and actual client behavior. Static checks do not prove host capabilities.

## Consume a pinned release inside a project

Use a released, unmodified package or complete Skill copy from a recoverable public source revision. Project-local installation and updates belong to the consumer project. The default recommendation for independently pinned versions is a project-local copy of the complete Skill directory; this Skill does not require plugin-only capabilities.

### Direct project-local Skill installation

From a verified Life Skills source revision, copy the complete `plugins/general/agentic-execution/skills/agentic-execution/` folder, including its references, metadata and LICENSE, into the consumer's `.agents/skills/agentic-execution/` (Codex) or `.claude/skills/agentic-execution/` (Claude Code). For both clients, use the same pinned revision in both locations or a supported project-local link to one copy; verify discovery of links, particularly on Windows. Do not copy only SKILL.md. Record the source revision in the consumer's existing Git history or installation record. Avoid modifying the copied instructions in place; project-specific rules belong in project instructions. Do not enable a competing marketplace copy in that project.

### Project-local plugin installation

If the consumer needs marketplace packaging rather than a direct Skill copy:

- **Codex:** Put the pinned plugin folder in the consumer repository. Register its relative source in that project's `.agents/plugins/marketplace.json`, using the catalog format in this repository. Give it a project-specific marketplace identity. In the trusted project's `.codex/config.toml`, enable the qualified ID, for example:

  ```toml
  [plugins."agentic-execution@my-project-skills"]
  enabled = true
  ```

  See [Codex packaging and repository enablement](https://developers.openai.com/plugins/build/plugins). The host may load an installed cache copy, so compare the actual discovered files to the pinned source rather than assuming a project configuration proves isolation.
- **Claude Code:** Put the pinned plugin folder in a project-local marketplace root with `.claude-plugin/marketplace.json` and a project-specific marketplace name. From the consumer project, register the actual marketplace root (for example `claude plugin marketplace add ./.local-marketplace` if that is the directory created) and install with `claude plugin install agentic-execution@my-project-skills --scope project` (shared settings) or `--scope local` (personal settings for that project). Substitute the actual marketplace identity. Each collaborator must install locally; a committed enabled setting alone does not download the plugin. Marketplace registration and cached plugin content may be shared across projects. See [Claude Code installation scopes](https://code.claude.com/docs/en/plugins/install). For marketplace installs the Skill is normally namespaced, e.g. `/agentic-execution:agentic-execution`; verify the installed client's actual discovery and invocation.

For either client, inspect all effective scopes and disable conflicting global, project-local or synced copies for the affected project where supported; do not remove another project's installation without authority. At installation or update, verify the discovered copy matches the pinned source, not just the advertised version. Keep updates deliberate, disable automatic updates where applicable, and retain the governing version for unfinished Tasks. If the host cannot establish independent versions or unambiguous discovery, use the direct project-local Skill option or report the blocker. These are configuration options supported by documentation, not a claim that the actual client release has been tested.

## Consumer project guidance

Keep project-specific Task paths, authority, checkpoints and domain rules in AGENTS.md or the applicable host instructions. A short continuity rule can be added there:

> Once Agentic Execution is activated for a Task, keep it active throughout that Task's lifecycle unless explicitly discontinued by the human. After compaction, interruption or resumption, locate the governing installed Skill release, reread its entrypoint and follow its Recovery procedure, loading only applicable references before continuing. Preserve permissions, approvals and restrictions; do not silently substitute another release. If the required release is unavailable or identity is uncertain, stop affected work and reconcile it with the human.

That rule preserves an existing activation; it does not activate the Skill for ordinary work or authorize a Task. The Executor records the governing recoverable revision in existing Task records per [Start and resume](../../plugins/general/agentic-execution/skills/agentic-execution/references/start-and-resume.md#skill-identity-and-continuity); the host does not guarantee continuity automatically. Normally update for new Tasks only. Verify discovery, invocation, independent review, interruption and recovery on the actual installed clients before relying on them.

For domain-specific work, apply the relevant domain Skill (for example de-stromwechsel) separately. Agentic Execution governs the lifecycle, not tariff methodology, browser policy or personal research data.
