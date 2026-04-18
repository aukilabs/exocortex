You are in the `exocortex` project — the canonical template for Auki employees setting up their personal exocortex. Listed in `aukilabs/org → src/projects.md`.

At session start, read:

- `vision.md` — why this template exists and what it aspires to
- `src/README.md` — what's in the template today (file-by-file breakdown)
- `sprint.md` — current work and next steps
- `changelog.md` — recent decisions (multi-author table format — see `CONTRIBUTING.md` for why)
- `parking_lot.md` — open questions needing input
- `roadmap.md` — where the template is headed
- `glossary.md` — project vocabulary

The template's purpose: when a new Auki employee runs `src/setup.sh`, the files under `src/` become their starter personal exocortex. `src/README.md` has the file-by-file description and how setup works.

Broader Auki context (mission, team, methods, skills library) lives in `aukilabs/org`. If you're running inside a personal exocortex, `org/` is already symlinked in. Otherwise clone `aukilabs/org` as a sibling directory and symlink it.

Log changes to `changelog.md` using the existing table format — `| Timestamp | Change | Justification | Author |` — with your name in the Author column. See `CONTRIBUTING.md` for details.
