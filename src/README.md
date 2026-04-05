# src/

This directory is the exocortex template. When a new colleague runs `git clone` and `bash setup.sh`, these files become their personal exocortex.

## What's here


| File              | Function                                                                                                                                                   |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CLAUDE.md`       | Tells the AI agent how to use the exocortex: reading order, alignment checks, behavior rules. This is the entry point — the agent reads this first.        |
| `attention.md`    | Single-line file. The owner writes what they're focused on this session. The agent reads it and nudges them back if they drift. Only the owner edits this. |
| `identity.md`     | Template for the owner's background, skills, perspective, and values. Values live here — not in a separate file.                                           |
| `role.md`         | Template for the owner's responsibilities and routines. The CEO may provide a draft; the owner rewrites it in their own words.                             |
| `goals.md`        | Template for daily habits, weekly routines, responsibilities, and projects.                                                                                |
| `methods.md`      | Template for personal heuristics and mental models. Extends org-level methods.                                                                             |
| `glossary.md`     | Template for domain-specific vocabulary.                                                                                                                   |
| `contributing.md` | Logging rules: every change must be logged in the promptlog (first) and changelog. May extend org-level conventions.                                       |
| `changelog.md`    | Seed changelog with one example entry. Append-only, latest on top.                                                                                         |
| `promptlog.md`    | Seed promptlog with one example entry. Append-only, latest on top. Includes relevance scoring against attention.                                           |
| `setup.sh`        | Interactive setup script. Creates org symlink, asks name, role, values, goals, and first attention focus. Populates template files with answers.            |
| `examplenils/`    | Filled-in example of identity.md, role.md showing what a populated exocortex looks like.                                                                   |


## The org layer

Organization-level context (mission, strategy, values, team role files, shared heuristics) lives in a separate org repo, symlinked into the exocortex as `org/`. The setup script creates this symlink. This means:

- `organization.md` is not in this template — it comes from the org repo
- Shared methods and contributing conventions come from `org/src/`
- Team role files live at `org/src/team/`
- When leadership updates org context, everyone sees the change after a `git pull` of the org repo

## How setup.sh works

1. Asks for the path to your local org repo clone and creates the `org/` symlink
2. Prompts for name, role, values, goals, and initial attention focus
3. Writes answers into the template files (identity.md, role.md, goals.md, attention.md)
4. User opens the repo in Claude Code or Cursor and starts working

## Dependencies

- Git
- Bash (for setup.sh)
- A local clone of the org repo
- An AI coding tool that reads CLAUDE.md (Claude Code, Cursor, etc.)
