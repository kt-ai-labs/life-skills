# Human assistance and downloads

Use when a material research check needs human interaction or a manually saved file. Follow the browser-session boundary in SKILL.md; no particular browser tool is required.

## Agent-first handoff

1. **Diagnose:** inspect current state and try reasonable permitted alternatives. Identify what actually failed and the evidence still needed. Do not ask for help on every transient error or use a human to bypass an explicit access/security restriction.
2. **Request assistance:** if a person could close the material gap safely, explain the exact page/action, expected result, what was tried and actions outside the authorized scope. Offer the existing isolated session where supported. Confirm actual sharing/retention capabilities; a visible browser alone does not prove the user can control it. Use the host's handoff/retention mechanism if available, without inventing one.
3. **Yield control:** leave that page open where supported and stop automated interactions with it, including background navigation/reloads, until the user confirms completion or returns control. Continue only independent work that cannot interfere. Do not close a handed-over session through routine cleanup; explain if session lifetime cannot be guaranteed.
4. **Resume and verify:** after the user confirms, obtain fresh state from the same session/tab and inspect the result. Reuse the navigation already completed; do not restart without cause. A click or downloaded file is not proof that the research question is answered. If the session expired, explain the loss and restore only what is needed.

If shared control is unavailable, provide a source link and navigation steps verified on the current site, or clearly label steps that could not be checked. Ask the user to provide the document or an accessible saved path. Do not silently attach to their personal profile. Keep the gap open if help fails or is declined; report a concrete next step without repeated requests. Domain-specific legal and authorization boundaries still apply.

For Playwright CLI capabilities, use [the CLI reference](playwright-cli.md) only when that tool is available and permitted. Distinguish official documentation, installed-version support and behavior actually tested in this environment.

## Receiving a manually saved document

Ask where the file was saved if the location is not clear. Check actual filesystem/sandbox access; browser access does not imply access to the user's Downloads. On denial ask for an explicit file transfer or an accessible path, without broadening access silently.

For a known download folder, such as `~/Downloads`, prefer a bounded before/after listing of names and metadata around the handoff when feasible. Examine recently added/modified suitable files and only a small set of likely candidates using filename, type, size and timestamps. Do not scan the home directory or unrelated document contents. The newest file is only a candidate: verify content, publisher/provider, document version and applicability to the target offer. If ambiguous, ask which file rather than guessing.

Browser-managed downloads may be in temporary storage, not system Downloads. Use the tool's reported path/location and check the file is accessible before closing the session. If needed, copy it to the task's authorized durable storage and verify the copy. Never delete or move the user's original download without separate permission. Preserve source/retrieval context and distinguish receiving a file from validating its contents; retention/naming belong to the task's workspace rules.
