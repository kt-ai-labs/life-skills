# Codex harness

Read for Codex Executor invocations and recovery as directed by the [Skill](../../SKILL.md#pending-work-and-waiting). This reference describes host-specific mechanisms, not additional lifecycle gates. The common [Reviewer configuration](../reviewers.md), [Review protocol](../review-protocol.md) and pending-work rules remain authoritative. Do not apply these Codex-specific settings to other harnesses.

## Installed capabilities

Inspect the actually installed client/session's subagent tools, agent/default overrides, supported model and effort selection, and fresh non-forked context option before invoking the confirmed Reviewer. Retain the actual thread handle for supported follow-up, wait and close. A shared-context fork or a prose model request does not establish independent review or supported profile selection.

Determine the supported waiting mechanism before dispatch when possible, and reuse established capability facts while current. Distinguish the CLI, IDE extension, app, session mode, feature flags, tool schemas and invocation types where relevant; a CLI feature or config file alone does not establish effective behavior in another client. Do not run repeated feature/status probes.

## Preferred: verified event-driven continuation

For a supported agent invocation, prefer automatic continuation without parent inference while idle, when established for this installed client, session mode and invocation type. Codex has an experimental `wake_on_agent_messages` feature in some versions. It is not a guarantee of automatic continuation in every session or for arbitrary shell jobs or separately created threads.

Before relying on it, establish effective enablement and automatic continuation through actual supported host evidence or a relevant authorized client test. If the capability is unknown, unverified, disabled or unavailable, use native blocking waiting instead; do not end a pending turn in the hope of being resumed.

When the mechanism is verified and applicable:

1. Follow the common submission rules: persist/read back pending intent, invoke once, record the actual invocation and available handle/receipt, and correlate the Ledger event. If the result is already available, handle it rather than yielding.
2. With the pending records durable and no independent authorized obligation or material event requiring action under the Skill, yield/end the current turn using the host-supported mechanism. Report the pending state accurately if needed. Do not call `wait_agent`, shell timers, status probes or no-op tools merely to keep the turn alive.
3. On automatic continuation, honor new human restrictions and reconcile the wake event with the actual pending invocation, its round and submitted versions. A child message may not be a final response. If completion is verified, process the actual response under the applicable protocol; otherwise handle the material event or return to genuine waiting. Do not replay an invocation or accept merely because a wake occurred.
4. An interrupt, pause, mode change or loss of the verified capability invalidates the affected automatic-continuation assumption. Honor restrictions; recover under the Skill on authorized Resume. Do not change host mode to bypass restrictions or rely on automatic restart after interruption.

This feature concerns agent messages; use it for other long jobs only if the host establishes an equivalent automatic continuation mechanism for that operation. Completion notifications alone do not establish automatic continuation.

## Fallback: native blocking wait

When event-driven continuation is not established, use the installed native blocking tool on the actual pending invocation. Where `wait_agent` supports `timeout_ms`, prefer a suitable explicit 300000–600000 ms (5–10 minutes) or the longest suitable supported interval; shorten for actual safety, responsiveness, host limits or expected duration. Inspect the installed schema and target/mailbox semantics, rather than inventing arguments. Prefer direct native waits over prematurely returning wrappers; where a wrapper is necessary, verify its outer wait also blocks for a suitable interval.

A real elapsed timeout is not completion or a reason to run additional routine status checks. Use the Skill's no-progress reassessment rules. Retrieve the actual response correlated to the current round, not merely the retained thread; partial, unrelated, prior-round and superseded events are not completion.

Never use `true`, empty echo/printf, speculative shell commands, repeated unchanged reads or simulated status text as a substitute for waiting. Do not substitute shell sleeps for agent-aware waits without evidence of safe, effective blocking and reliable delivery of relevant agent/human events; long shell cells may delay delivery. A bounded genuine blocking process wait can be appropriate for a long-running process when supported, but a timer does not establish liveness or completion. Reconcile ineffective waits once, switch to a supported effective mechanism if available, or report the concrete wait blocker and preserve pending state for Resume. Do not cancel, relaunch or advance merely because a wait returned.

## Optional host configuration and verification

For a Codex installation that actually supports the experimental feature, the operator may authorize enabling it at the appropriate supported configuration scope (for example the user's Codex config, commonly `~/.codex/config.toml`):

```toml
[features]
wake_on_agent_messages = true
```

Merge the setting into an existing features table rather than duplicating it. Respect managed settings, host support, applicable permissions and the operator's scope. Do not silently edit global/project configuration, enable extra experimental features, change modes or restart a running Task. If a configuration change requires restarting the client, preserve the governing revision and pending state under [Recovery](../state-and-recovery.md). This optional setup is not a new Task approval gate or mandatory dependency; use the fallback if unavailable. Avoid repeatedly asking to enable it.

Before relying on automatic continuation, verify in an authorized isolated client test or equivalent reliable actual-client evidence: an independent child invocation remains pending after the parent ends its turn, the host resumes the parent automatically on the relevant message/completion without another human turn, the response correlates to the invocation, and interrupt/pause and message delivery behave correctly. Use a harmless synthetic workload, not a live Task review or private artifacts. Scope evidence to the tested client/version, relevant features, mode and invocation type. Recheck only when material conditions change or actual behavior contradicts it. The optional flag does not authorize an independent Reviewer to take Executor actions or weaken any review gate.

References (capability leads, not proof of local support):

- [Codex multi-agent documentation](https://developers.openai.com/codex/multi-agent)
- [Codex wait guidance](https://github.com/openai/plugins/blob/main/plugins/superpowers/skills/using-superpowers/references/codex-tools.md)
- [Codex PR #56330: interrupt and Plan mode handling](https://github.com/openai/codex/pull/56330)
- [Codex issue #64090: reported idle wake experiment and waiting limitations](https://github.com/openai/codex/issues/64090)
