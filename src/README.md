# src/

This directory is the exocortex template. When a new colleague runs `git clone` and `bash setup.sh`, these files become their personal exocortex.

## What's here


| File              | Function                                                                                                                                                   |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CLAUDE.md`       | Tells the AI agent how to use the exocortex: reading order, alignment checks, behavior rules. This is the entry point — the agent reads this first.        |
| `attention.md`    | Single-line file. The owner writes what they're focused on this session. The agent reads it and nudges them back if they drift. Only the owner edits this. |
| `user.md`         | Template for the owner's background, skills, perspective, and values. Values live here — not in a separate file.                                           |
| `user_role.md`    | Template for the owner's responsibilities and routines. The CEO may provide a draft; the owner rewrites it in their own words.                             |
| `goals.md`        | Template for daily habits, weekly routines, responsibilities, and projects.                                                                                |
| `methods.md`      | Template for personal heuristics and mental models. Extends org-level methods.                                                                             |
| `glossary.md`     | Template for domain-specific vocabulary.                                                                                                                   |
| `contributing.md` | Logging rules: every change must be logged in the promptlog (first) and changelog. May extend org-level conventions.                                       |
| `changelog.md`    | Seed changelog with one example entry. Append-only, latest on top.                                                                                         |
| `promptlog.md`    | Seed promptlog with one example entry. Append-only, latest on top. Includes relevance scoring against attention.                                           |
| `setup.sh`        | Interactive setup script. Creates org symlink, asks name, role, values, goals, and first attention focus. Populates template files with answers.            |
| `examplenils/`    | Filled-in example of user.md, user_role.md showing what a populated exocortex looks like.                                                                   |


## The org layer

Organization-level context (mission, strategy, values, team role files, shared heuristics) lives in a separate org repo, symlinked into the exocortex as `org/`. The setup script creates this symlink. This means:

- `organization.md` is not in this template — it comes from the org repo
- Shared methods and contributing conventions come from `org/src/`
- Team role files live at `org/src/team/`
- When leadership updates org context, everyone sees the change after a `git pull` of the org repo

## How setup.sh works

1. Asks where you want your personal exocortex to live
2. Creates that directory and symlinks `org/` to the org repo (sibling directory)
3. Reads the org name from `org/src/organization.md`
4. Prompts for name, role, values, goals, and initial attention focus
5. Writes personalized files into the new directory
6. Copies template files (methods.md, glossary.md, etc.) that you fill in over time
7. Optionally initializes a git repo so you can track your own changes

The setup script never writes to this org repo — your personal files stay in your personal exocortex.

## Dependencies

- Git
- Bash (for setup.sh)
- A local clone of the [org](https://github.com/aukilabs/org) repo as a sibling directory (e.g. `aukilabs/org` next to `aukilabs/exocortex`)
- An AI coding tool that reads CLAUDE.md (Claude Code, Cursor, etc.)
