# Model Escalation

Apply this procedure across phases. The user or a phase may require an escalation attempt for a specified step; otherwise use the criteria below. Escalation supports the current phase and does not authorize later-phase work or additional external access.

## Resolve source gaps first

Before discretionary model escalation, determine whether the unresolved point is an evidence gap or an interpretation question. Review relevant sources already authorized for the task. If a material gap may be resolved by an additional user-controlled folder or connected service, ask for access under the phase's source-permission rules and review any newly authorized evidence before deciding whether escalation is still useful. For Phase 0.1, the user may authorize an additional folder by providing its path after being told that its contents, including subfolders and all file types, may be reviewed for this task; the usual extraction-effort checkpoint still applies. Connected-mailbox access requires separate explicit permission. Do not use model review as a substitute for unavailable evidence. A user- or phase-required escalation attempt does not itself authorize access to new sources.

## When to escalate

After the source review above, compare the relevant primary sources, check arithmetic and dates, and apply the phase's evidence rules. Escalate only if a material interpretive uncertainty remains that could change a financial amount, contractual date or obligation, eligibility, required action, or recommendation. State the specific unresolved question and why it matters. Missing evidence alone, multiple documents, a large archive, routine extraction, or a desire for reassurance are insufficient triggers.

An explicit user or phase-specific mandatory trigger requires an attempt even without this discretionary threshold. Follow the shared request and fallback procedure; do not silently skip the attempt or claim that an unavailable review occurred.

## Request and review

1. For an OpenAI/Codex environment, read [openai.md](openai.md). Only the OpenAI adapter is currently implemented. For another provider without documented model routing, use the unavailable-request fallback; do not create skill resources during the user's research run.
2. Inspect the available delegation tool's documented parameters. Proceed only if there is explicit support for requesting the intended model or model escalation. A generic subagent tool alone is insufficient. Do not install tools, search for alternate runtimes, or create external API workflows to obtain that capability.
3. Briefly tell the user the unresolved question and which escalation you are requesting, then make one concrete request through the supported mechanism. Give the subagent a bounded question, relevant source files/pages, and the disputed interpretation. Ask for an evidence-backed conclusion and remaining uncertainties. Keep the review read-only; the main agent maintains the workspace artifacts.
4. The ability to request a model is sufficient. Do not probe, demand confirmation, or independently verify which model actually handled the request. Report the requested model honestly; do not describe the actual model as verified unless the tool supplies that information.
5. Assess the returned evidence. Use the higher review level only when a specific material doubt remains, not as routine validation of a satisfactory answer. Give that reviewer the original evidence and the prior result for independent assessment. Limit the sequence to one initial review and, if warranted, one higher review.
6. If there is no supported way even to request escalation, or a request fails, briefly tell the user that the recommended model could not be requested/launched and continue on the currently selected model. Do not ask for a manual model-switch sequence or repeatedly troubleshoot. Preserve any unresolved limitation in the result; absence of an escalation does not justify inventing a confident answer.
