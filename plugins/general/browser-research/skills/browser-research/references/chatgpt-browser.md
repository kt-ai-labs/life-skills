# Native browser / computer use

Use this reference when the host exposes native interactive browser capabilities, including ChatGPT or Codex environments. Product names do not establish capability. Use only the actual tools and their returned documentation; this reference does not define tool commands or guarantee a particular browser implementation.

## Capability and session boundary

Before claiming or opening a tab, establish which exposed surfaces permit navigation, observation and interaction, and whether they access a managed browser or an existing personal profile. Follow SKILL.md's authorization boundary. Treat the native profile as potentially persistent unless stronger isolation is verified; an unknown profile lifetime is not evidence of temporary isolation.

Do not assume that opening a new tab creates a temporary profile, or that closing it deletes cookies, authentication, history or downloaded files. Do not create extensions, CDP connections, imported profiles or personal Chrome integrations. If a capability is undocumented or unavailable, state the limitation instead of inventing an API, isolation setting or cleanup behavior.

## Navigation and dynamic websites

- Identify the relevant browser, tab, URL and source before interacting. Reuse completed navigation in the task's authorized tab; create a separate task tab only if supported and useful. Do not change unrelated tabs.
- Use the host's supported page observations and targeted extraction. If only visual interaction is available, inspect the visible state and narrowly scoped screenshots; do not assume DOM evaluation is supported.
- After typing or clicking, observe application acceptance, not just tool success. Wait for the required suggestion and select it, verify committed values and dependent fields, enabled controls and completed calculations, then check results against current inputs.
- Use condition-based waiting where exposed, otherwise bounded fresh observations of the relevant UI. Network idle alone does not prove debounce or calculation completion. Diagnose readonly/disabled fields and stale results without forcing DOM values or unnecessarily changing a valid calculation.

## Cookies and consent

Follow SKILL.md's blocking-banner policy and its ordered rejection, necessary-only and preferences paths. Ignore a non-blocking banner completely; never automatically Accept All. Apply this conservatively even if the native profile is described as isolated.

Inspect the resulting page to confirm the obstruction is resolved. If safe completion is not possible, keep the original page available and use [human assistance](human-assistance.md), letting the user choose consent settings. A difficult banner is not permission to abandon the selected source or provider. After explicit user completion, verify fresh page state and resume the original research.

## Human assistance and control handoff

Read [human assistance and downloads](human-assistance.md) before requesting help. A visible browser does not prove that the user can control it. Offer shared control only when the host actually supports it, explaining the real mechanism; otherwise provide the independent-browser route. Do not imply that all ChatGPT or Codex browsers support handoff.

Once assistance is requested, enforce **Full Research Pause** for every tab, session and other research activity. Leave the relevant page available where supported, do not switch or close it, and wait for explicit user completion or return of control. Then inspect the same page or supplied evidence, verify the result and continue the original task. Tool retry approval is not handoff completion.

## Downloads and file verification

Use exposed download capabilities only when available. A browser click is not proof of a completed download, and browser access is not proof of filesystem access. Check the reported download status/location and accessible file; do not assume native downloads are in the user's system Downloads folder or remain available after session cleanup.

If direct retrieval or file access is unavailable, request assistance through the shared protocol, accepting any suitable form or accessible location. After explicit return, verify content, source, version and applicability, and preserve the original file without alteration when the task requires retention. Copy only to authorized storage and verify the copy; never move or delete a user's original without separate permission. Document-retention conventions belong to the calling task, not this reference.

## Cleanup

Outside a Full Research Pause, close only task-created tabs/sessions when the host supports it and after necessary downloads are verified and retained. Never close a handed-over tab while waiting or close unrelated tabs. Do not clear unrelated browsing data, change accounts/settings, or claim profile deletion without verified support. Report persistence or retrieval limitations that affect the evidence or privacy boundary.
