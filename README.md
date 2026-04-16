# Exocortex

Every time you start a conversation with an AI agent, it knows nothing about you. Not your name, not your role, not what you're working on, not what you care about. You start from zero, every single time.

That means every conversation is generic. The agent can't challenge your assumptions because it doesn't know what you assume. It can't keep you focused because it doesn't know what you're focused on. It can't align its work with your values because it doesn't know what you value.

You are strangers, every time.

An exocortex fixes this. It's a structured external memory — a set of files that give your AI agent persistent context about who you are, what you're working on, and why it matters. Your agent reads these files at the start of every session and becomes a collaborator that knows you, challenges you, and holds you accountable.

We believe that AI's most transformative capability is not intelligence augmentation but **conscientiousness augmentation** — the ability to help individuals and organizations stay goal-oriented across time, across context switches, across the natural drift of attention.

You are not the author of your own thoughts. But you can write the prompt that prompts you back.

## The vision

Every employee at Auki has an exocortex. Every function has an exocortex. Every project has an exocortex.

Individual exocortices carry identity (including values), role, goals, and attention. They make each person more productive and more aligned with the mission.

The organization's exocortex — shared files like `organization.md`, `methods.md`, and team role files — gives every agent on the team the same foundational context through a symlinked org repo. Alignment isn't a quarterly exercise. It's continuous, maintained by the system itself.

When we get this right, our intercognitive bandwidth increases: our ability to think, experience, and solve problems together with each other and AI.

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

   Every project follows a standard structure (`readme.md`, `roadmap.md`, `src/sprint.md`, etc.) so the agent always knows where to look. To create a new project from scratch, see `org/src/contributing.md` § *Creating a new project*.

5. **Keep shared context fresh**  
   When the org repo is updated, pull the latest changes in the clone you symlinked (your exocortex always sees it as `org/`).

   In the terminal, go to that directory — e.g. `org` or `org-auki` next to `exocortex` — and run `git pull`.
