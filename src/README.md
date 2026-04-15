# src/

This directory is the exocortex template. When a new colleague runs `git clone` and `bash setup.sh`, these files become their personal exocortex.

## What's here


| File              | Function                                                                                                                                                   |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AGENTS.md`       | Single entry point for AI agents: session behavior (read order, alignment, tasks, docs). Includes an **Autonomous-only** subsection for background agents — interactive tools follow the rest. |
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

## Projects

Active project work doesn't live in this template — it lives in separate project repos that you symlink into your exocortex root. The agent reads each linked project's `readme.md` and `src/sprint.md` at session start so it knows what you're working on without having to be told.

**The canonical list of Auki project repos lives in `org/src/projects.md`** — clone URLs and one-line descriptions for each. After running `setup.sh`, that's the file to read to find projects you should pull in.

**Standard project structure** (every project follows this so agents always know where to look) is documented in `org/src/contributing.md` § *Creating a new project*. The short version: `readme.md`, `roadmap.md`, `glossary.md`, `changelog.md`, `parking_lot.md`, `src/`, `src/readme.md`, `src/sprint.md`.

To symlink an existing project into your exocortex:

    ln -s ~/path/to/project-repo ~/my-exocortex/project-name

The agent's `CLAUDE.md` already knows to look for projects in the exocortex root — this section is here so you, the human, know it too.

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
- An AI coding tool that loads `AGENTS.md` (Cursor, Claude Code, Hermes, etc.)
