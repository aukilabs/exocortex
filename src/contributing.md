# Contributing

Every change to any document in this repo should be logged in changelog.md and promptlog.md.
If we are editing a file in a loaded repo, make sure to respect the changelog conventions of that repo. Project-level repos use an **Author** field instead of PromptID in their changelogs, since they have multiple contributors and no single promptlog.

**Always update promptlog.md before changelog.md.** The changelog references PromptIDs, so the promptlog entry must exist first to avoid dangling references.

---

## Promptlog

Append-only, prepend latest entry on top.

| Field | Description |
|-------|-------------|
| **Timestamp** | When the prompt was sent |
| **PromptID** | Sequential ID |
| **Prompt** | The original prompt (summarized if long) |
| **Relevance** | 0–1 score against the current attention goal in attention.md |

The relevance score resets each session (since attention goals change between sessions). If the last 10 prompts in the current session have a cumulative relevance below 0.5, Claude should challenge the owner to refocus.

## Changelog

Append-only, prepend latest entry on top.

| Field | Description |
|-------|-------------|
| **Timestamp** | When it happened (e.g. `Apr 2, 21:03 HKT, 2026`) |
| **Change** | What changed |
| **Justification** | Why it changed |
| **PromptID** | Sequential ID matching the promptlog, or a name for human entries |

Humans may manually add to the changelog using their name as the PromptID. Human entries do not count towards the PromptID sequence counter.

## Claude.md

Instructions for how Claude should collaborate with the owner. See the file for details.
