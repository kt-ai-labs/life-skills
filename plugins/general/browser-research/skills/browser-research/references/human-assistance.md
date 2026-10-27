# Human assistance and downloads

Use when a material research check needs human interaction or a manually saved file. Follow the browser-session boundary in SKILL.md; no particular browser tool is required.

## Agent-first handoff

1. **Diagnose:** inspect current state and try reasonable permitted alternatives. Identify what actually failed and the evidence still needed. Do not ask for help on every transient error or use a human to bypass an explicit access/security restriction.
2. **Request assistance:** if a person could safely close the gap, explain the exact question/page/action, what was checked, where progress stopped, why help is needed and what result is sufficient. Accept a screenshot, copied text or PDF according to the evidence needed, and state actions outside the authorized scope. Present both routes together when available:
   - **Shared Browser:** leave the relevant public page in the existing isolated session and explain the actual control mechanism. Confirm sharing/retention support; visibility alone does not prove control. For Playwright Dashboard use the CLI reference below, not an invented handoff command.
   - **Independent Browser:** provide a source link, the search inputs needed to find the same item and brief navigation verified on the current site; label unverified steps. This fallback remains available even when shared control works.
3. **Yield control:** leave that page open where supported and stop automated interactions with it, including background navigation/reloads, until the user confirms completion or returns control. Continue only independent work that cannot interfere. Do not close a handed-over session through routine cleanup; explain if session lifetime cannot be guaranteed.
4. **Resume and verify:** inspect the supplied evidence and its applicability, then continue the substantive assessment. For shared control, after confirmation obtain fresh state from the same session/tab and reuse completed navigation. A click, screenshot or downloaded file alone is not proof the question is answered. If the session expired, explain the loss and restore only what is needed.

If shared control is unavailable, say so and use the independent-browser route; do not silently attach to a personal profile. Keep the gap open if help fails or is declined; report a concrete next step without repeated requests. Domain-specific legal and authorization boundaries still apply.

For Playwright CLI capabilities, use [the CLI reference](playwright-cli.md) only when that tool is available and permitted. Distinguish official documentation, installed-version support and behavior actually tested in this environment.

## Receiving a manually saved document

Ask where the file was saved if the location is not clear. Check actual filesystem/sandbox access; browser access does not imply access to the user's Downloads. On denial ask for an explicit file transfer or an accessible path, without broadening access silently.

For a known download folder, such as `~/Downloads`, prefer a bounded before/after listing of names and metadata around the handoff when feasible. Examine recently added/modified suitable files and only a small set of likely candidates using filename, type, size and timestamps. Do not scan the home directory or unrelated document contents. The newest file is only a candidate: verify content, publisher/provider, document version and applicability to the target offer. If ambiguous, ask which file rather than guessing.

Browser-managed downloads may be in temporary storage, not system Downloads. Use the tool's reported path/location and check the file is accessible before closing the session. If needed, copy it to the task's authorized durable storage and verify the copy. Never delete or move the user's original download without separate permission. Preserve source/retrieval context and distinguish receiving a file from validating its contents; retention/naming belong to the task's workspace rules.
