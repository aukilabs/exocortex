# Exocortex

Every time you start a conversation with an AI agent, it knows nothing about you. Not your name, not your role, not what you're working on, not what you care about. You start from zero, every single time.

That means every conversation is generic. The agent can't challenge your assumptions because it doesn't know what you assume. It can't keep you focused because it doesn't know what you're focused on. It can't align its work with your values because it doesn't know what you value.

You are strangers, every time.

An exocortex fixes this. It's a structured external memory — a set of files that give your AI agent persistent context about who you are, what you're working on, and why it matters. Your agent reads these files at the start of every session and becomes a collaborator that knows you, challenges you, and holds you accountable.

You are not the author of your own thoughts. But you can write the prompt that prompts you back.

## The vision

Every employee at Auki has an exocortex. Every function has an exocortex. Every project has an exocortex.

Individual exocortices carry identity (including values), role, goals, and attention. They make each person more productive and more aligned with the mission.

The organization's exocortex — shared files like `organization.md`, `skills/`, and team role files — gives every agent on the team the same foundational context through a symlinked org repo. Alignment isn't a quarterly exercise. It's continuous, maintained by the system itself.

When we get this right, our intercognitive bandwidth increases: our ability to think, experience, and solve problems together with each other and AI.

## Four levels

The exocortex exists at four levels, each a different scope of shared context:

- **User level** — a single person and their AI agent. Where identity, role, goals, and daily attention live. Each person has their own personal exocortex repo.
- **Organization level** — context shared across everyone at the company. Mission, strategy, team, conventions. Lives in the org repo (e.g. `aukilabs/org`) and is symlinked into each person's exocortex as `org/`.
- **Project level** — an individual repo or piece of work, usually with its own team. Lives in that project's own repo (e.g. `aukilabs/relay`).
- **Quest level** — a cross-repo project where no single repo can own the state. Lives under `org/src/quests/{slug}/` so every project lead has visibility.

When working, you open your personal exocortex and symlink in the organization repo plus whichever project and quest directories are active for you. Your agent then reads across all four levels to build its context.

### Structural files

Each level carries the same three structural files:

- `AGENTS.md` — the entry point for the AI agent at that level. Session behavior, read order, alignment rules.
- `CONTRIBUTING.md` — logging conventions (changelog; promptlog at user level). May extend what the enclosing level says.
- `CHANGELOG.md` — append-only record of what changed and why, latest on top.

And one identity file per level, answering "what is this?":

| Level | Identity file |
|-------|---------------|
| User | `user.md` + `user_role.md` |
| Organization | `organization.md` |
| Project | `vision.md` (distinct from GitHub's `README.md`) |
| Quest | `README.md` |

`vision.md` at the project level is separate from `README.md` because a project repo's root `README.md` is GitHub's landing page — that slot is already doing discovery and setup work. `vision.md` holds the aspirational "why this exists" without competing for it.

Quests live inside `org/src/quests/{slug}/`, not at a repo root, so `README.md` at the quest level has no such conflict and serves as the identity file directly.

## Current state

The `src/` directory contains the exocortex template — the set of files that any Auki employee can clone to set up their own exocortex. See [src/README.md](src/README.md) for a file-by-file description and how `setup.sh` works.

See [roadmap.md](roadmap.md) for the project roadmap and [sprint.md](sprint.md) for the current week's focus.

## Setup

**You’ll need**

- A **GitHub account**.  
  - **Auki employees:** access to the private [aukilabs/org](https://github.com/aukilabs/org) repo.  
  - **Public:** clone the public [aukilabs/org-auki](https://github.com/aukilabs/org-auki) repo — it is the public counterpart to `org` (same role in your exocortex; symlinked as `org/` after setup).

**Steps**

1. **Clone repositories**  
   Clone this **exocortex** repo and **one** org repo next to it (same parent directory).

   Open your terminal and go to the desired parent directory, for example `aukilabs` (create it if needed).

       cd ~/aukilabs

   **Auki employees:**

       git clone git@github.com:aukilabs/org.git
       git clone git@github.com:aukilabs/exocortex.git

   **External contributors:**

       git clone git@github.com:aukilabs/org-auki.git
       git clone git@github.com:aukilabs/exocortex.git

2. **Run the setup script**  
   In your terminal, go into the exocortex project. Then run the setup script. 
   
       cd exocortex
       bash src/setup.sh

   The script is **interactive**. It will ask where to create your personal exocortex (don't choose the same `aukilabs` directory), then ask simple questions: your name, role, what you care about, what you’re working toward, and what you’re focused on today. Your responses will be recorded in the starter files for you.
3. **Open your new exocortex in Cursor or give it to your agent**
  When the script finishes, navigate to where you specified your personal exocortex should be and open that folder in Cursor. Over time you’ll edit the markdown files there; the AI reads them at the start of sessions so it stays aligned with you.
   Alternatively, you can give your AI agent access to your exocortex and let it manage it for you.

4. **Link your active projects**  
   Your exocortex is also where your active project work lives. After setup, open `org/src/projects.md` inside the org repo you cloned — the canonical list of project repos where applicable. Clone the projects relevant to your work into a sibling directory, then symlink each one into your exocortex root:

       ln -s ~/path/to/project-repo ~/my-exocortex/project-name

   Every project follows a standard structure (`readme.md`, `roadmap.md`, `src/sprint.md`, etc.) so the agent always knows where to look. To create a new project from scratch, see `org/src/CONTRIBUTING.md` § *Creating a new project*.

5. **Keep shared context fresh**  
   When the org repo is updated, pull the latest changes in the clone you symlinked (your exocortex always sees it as `org/`).

   In the terminal, go to that directory — e.g. `org` or `org-auki` next to `exocortex` — and run `git pull`.
