# Plan Decisions

Record only decisions that materially affect architecture, scope, phases, data or privacy boundaries, or the shared knowledge workflow. Group entries by date and give each a stable sequential ID. Keep each entry concise; use the living plan documents for detail.

When a decision fully replaces an earlier one, the new entry links to its dated heading with **Supersedes**, and the earlier entry links back with **Superseded by**. For a partial change, use **Overrides**, state its scope, and mark the earlier entry **Partially overridden by** with a Markdown link. Preserve the earlier decision text so the history remains clear.

## 2026-11-05

### D-001: Project documentation workflow

**Status:** Current

Start each repository work session with `README.md`; consult the other plan documents when relevant. Update affected plan documents as soon as material decisions or durable findings arise, briefly inform the user, and record important decisions here. Prefer the existing topic document; create and link a focused document when durable detail needs its own format or procedure. Omit routine implementation details.

### D-002: Traceable decision changes

**Status:** Current

Give each important decision a stable ID and a dated subsection. Link later decisions to earlier ones with **Supersedes** for full replacement or **Overrides** for a scoped change, and add a reverse link on the earlier entry. Preserve the earlier decision text.

### D-003: User-selected Stromwechsel workspace

**Status:** Current

Create lowercase `de-stromwechsel/` under the user's selected working folder, with `internal/` for agent-managed state and `reports/` for user-readable Markdown. Year folders for documents the skill handles sit alongside it. Inventory old user documents where they are and record their locations; do not sort, move, copy, or rename them. Reuse suitable year folders for skill-handled documents, keep personal paths and cloud-provider choices out of shared instructions, and leave the exact internal state format open.
