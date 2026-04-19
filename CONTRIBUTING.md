# Contributing to exocortex

Every change to a document in this repo should be logged in `changelog.md`.

## Changelog

This project uses a **table format** for changelog entries — different from the heading-per-entry format used in most other Auki repos. Append-only, latest entry on top — prepend your row just below the column headers.

Column format:

```
| Timestamp | Change | Justification | Author |
|-----------|--------|---------------|--------|
```

Columns:

- **Timestamp** — e.g. `Apr 2 HKT, 2026`
- **Change** — what was changed (1–2 tight sentences)
- **Justification** — why (1 sentence)
- **Author** — your name

See existing entries in `changelog.md` for the house style. Keep each column tight; the changelog is a decision record, not a transcript.

## Project-specific conventions

This template has a unique constraint: files under `src/` are copied into every new Auki employee's personal exocortex via `setup.sh`. Changes to those files propagate to every new onboarding. Before making sweeping changes under `src/`, consider:

- Is this a change every new exocortex should have by default?
- Does it require a matching update to `setup.sh` (if file shapes change)?
- Does it require a matching change to `aukilabs/org/src/` (if the template interacts with shared org content)?
- Does it need to stay in sync with `.cursor/rules/` or other agent-specific mirrors?

Sweeping `src/` changes are effectively a migration for every existing exocortex. Changelog the reasoning clearly so future maintainers can reconstruct the decision.
