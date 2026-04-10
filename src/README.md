# src/

This directory is the template for a personal exocortex. The refactor is intentionally lean:

- a tiny canonical bootstrap pack
- explicit separation between durable memory and transient state
- on-demand loading for deeper alignment and skill files
- no vendor-specific entrypoint

## File Set

| File | Purpose | Default load |
|------|---------|--------------|
| `AGENTS.md` | Universal bootstrap, precedence, and write-back rules | Always |
| `SOUL.md` | Collaboration contract and hard rules | Always |
| `TOOLS.md` | Tool permissions and side-effect policy | Always |
| `USER.md` | Stable facts and preferences | Always |
| `STATE.md` | Current focus and active work | Always |
| `MEMORY.md` | Curated durable memory | Always |
| `SKILLS.md` | Reusable procedure index | On demand |
| `STYLE.md` | Writing guidance | On demand |
| `ROLE.md` | Role responsibilities and routines | On demand |
| `GOALS.md` | Current goals and commitments | On demand |
| `METHODS.md` | Mental models and decision heuristics | On demand |
| `HEARTBEAT.md` | Desired proactive routines and fallbacks | Runtime-dependent |
| `context.manifest.yaml` | Machine-readable load map | Optional |
| `setup.sh` | Interactive scaffold for a new personal exocortex | N/A |

## Setup Flow

`bash src/setup.sh` does the following:

1. Creates a new `exocortex/` directory under the chosen parent path.
2. Optionally symlinks `org/` to a sibling org repo.
3. Copies the stable template files.
4. Writes personalized `USER.md`, `STATE.md`, `ROLE.md`, and `GOALS.md`.
5. Creates an empty `skills/` directory for future playbooks.
6. Optionally initializes a git repo.

## Org Layer

Org-level context is still expected to live in a separate repo, exposed through `org/`.

- `org/src/organization.md` is the primary org summary
- `org/src/team/index.md` is the preferred entrypoint for team context
- `org/src/methods.md` and other deep docs should be lazy-loaded

The local exocortex stays small. Org and project context are pulled in only when the task needs them.
