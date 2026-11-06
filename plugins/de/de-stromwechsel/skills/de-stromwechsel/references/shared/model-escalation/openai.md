# OpenAI Escalation

Use with the [shared escalation procedure](instructions.md) in OpenAI/Codex environments.

- Initial review: request **GPT-6.1 Sol**, reasoning effort **Medium**, using the model identifier and effort parameter accepted by the available tool (for example, `gpt-6.1-sol` and `medium`). The main agent stays on the user's selected model.
- Higher review: request **GPT-6.1 Sol**, reasoning effort **High**, only if a specific material uncertainty remains after the Medium result. Ask for an independent review of the sources and Medium's conclusion.
- A documented model-selection or escalation parameter is evidence that a request can be made. Actual model assignment need not be observable or guaranteed. Make the request and await its result without model-verification probes.
- If the runtime exposes only same-model subagents, or no documented way to request Sol, do not substitute one and call it Sol escalation. Tell the user that Sol is recommended for this question but cannot be requested here, then continue in the current session. Apply the same fallback to a failed request.

A suitable notice is: “These sources leave <specific material question> unresolved. I am requesting a Sol Medium review.” On failure: “I recommend Sol for <question>, but this session could not request/launch it. I will continue with the currently selected model.” Use the run's user-facing language.
