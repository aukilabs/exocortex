# Exocortex Context Contract

## Summary

- Treat this repository as the canonical local context layer.
- Always load `AGENTS.md`, `SOUL.md`, `TOOLS.md`, `USER.md`, `STATE.md`, and `MEMORY.md`.
- Load `SKILLS.md`, `STYLE.md`, `ROLE.md`, `GOALS.md`, `METHODS.md`, and org or project docs only when relevant.
- Prefer summary blocks first. Do not scan whole directories by default.
- Write transient focus to `STATE.md`, durable facts to `MEMORY.md`, and reusable procedures to `SKILLS.md` or `skills/*.md`.
- If a capability is missing, degrade cleanly and state the gap instead of inventing behavior.

## Precedence

1. Platform and system rules
2. Runtime-specific adapter rules
3. `AGENTS.md`
4. `SOUL.md`
5. `TOOLS.md`
6. `USER.md`
7. `STATE.md`
8. `MEMORY.md`
9. Matched skill entry
10. Org summaries and policies
11. Project docs
12. Deep reference docs

## Bootstrap Pack

Read this set at the start of each session:

- `AGENTS.md`
- `SOUL.md`
- `TOOLS.md`
- `USER.md`
- `STATE.md`
- `MEMORY.md`

Then load more only as needed:

- `SKILLS.md` when choosing a procedure
- `STYLE.md` when drafting user-facing writing
- `ROLE.md`, `GOALS.md`, `METHODS.md` when planning or checking alignment
- `org/src/organization.md` and `org/src/team/index.md` if org context matters
- project summaries only for the project being touched

## Capability Fallbacks

- No scheduler: do not create background jobs; surface pending heartbeat jobs to the user.
- No proactive messaging: keep reminders in `HEARTBEAT.md` or `STATE.md` for the next active session.
- No durable runtime memory: rely on repo files only.
- No file writes: return the suggested patch or text instead of pretending to persist it.
- No network: continue locally and say what could not be verified.

## Write-Back Rules

- Keep `STATE.md` short and current. Replace stale items instead of accumulating history.
- Keep `MEMORY.md` curated. Add dated facts, decisions, frictions, and open loops. Remove obsolete entries.
- Do not treat transcripts as memory.
- Do not edit `SOUL.md` unless the user explicitly wants to change the collaboration contract.
- Update `SKILLS.md` only for reusable procedures, not one-off tasks.

## File Map

| File | Purpose | Default load |
|------|---------|--------------|
| `SOUL.md` | Collaboration contract and non-negotiables | Always |
| `TOOLS.md` | Tool and side-effect policy | Always |
| `USER.md` | Stable facts about the human partner | Always |
| `STATE.md` | Current focus and active work | Always |
| `MEMORY.md` | Curated durable memory | Always |
| `SKILLS.md` | Task playbook index | On demand |
| `STYLE.md` | Writing guidance | On demand |
| `ROLE.md` | Responsibilities and routines | On demand |
| `GOALS.md` | Current goals and priorities | On demand |
| `METHODS.md` | Heuristics and mental models | On demand |
| `HEARTBEAT.md` | Desired proactive jobs and fallbacks | Runtime-dependent |
| `context.manifest.yaml` | Machine-readable load map | Optional |
