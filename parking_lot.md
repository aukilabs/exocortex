# Parking Lot

Open questions about the exocortex template that need human input before work can proceed. Append-only — park the question, resolve it in place or link to where it got resolved.

## Open

- How do we cleanly purge the remaining `methods.md` plumbing from the template? Phase 5 (Apr 18, 2026) removed it from `src/README.md`, but still remaining: `setup.sh` copy list (line ~172), `src/AGENTS.md` read of `@methods.md`, `src/attention.md` seed text, `examplenils/AGENTS.md` reference, `examplenils/readme.md` mention, `roadmap.md` line 6, root `README.md` line 19. Personal heuristics now live as skills in the user-level `~/.claude/skills/` / `~/.agents/skills/` paths.
- Should the template's `src/contributing.md` and `src/changelog.md` be case-normalized to `CONTRIBUTING.md` / `CHANGELOG.md` to match the 4-level spec? broodsugar was normalized in Phase 4 (Apr 18, 2026); the template still ships lowercase. Renaming requires updating `setup.sh` (copy list + heredocs) and every `examplenils/` reference.
- Should `aukilabs-org/src/contributing.md` be case-normalized to `CONTRIBUTING.md`? High blast radius — every exocortex reads `@org/src/contributing.md`, so renaming requires a coordinated rollout with updates to each employee's `AGENTS.md`.

## Resolved

_(Move items here with a one-line note on how they were resolved.)_
