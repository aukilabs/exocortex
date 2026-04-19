# Vision: Exocortex

Every time you start a conversation with an AI agent, it knows nothing about you. You start from zero, every single time. Every conversation is generic. The agent can't challenge your assumptions, keep you focused, or align with your values — because it doesn't know them.

The exocortex fixes this. It's a structured external memory — a set of files that give your AI agent persistent context about who you are, what you're working on, and why it matters. Your agent reads these files at the start of every session and becomes a collaborator that knows you, challenges you, and holds you accountable.

## Why this project exists

This repo is the **canonical template** for an Auki exocortex. When a new Auki employee runs `src/setup.sh`, the files under `src/` become their starter personal exocortex — pre-wired to symlink in the shared `aukilabs/org` context. The template encodes the four-level exocortex spec (user, organization, project, quest) so every Auki exocortex has the same shape.

Auki's mission is to increase civilization's intercognitive capacity — the ability to think, experience, and solve problems together with each other and with AI. Exocortices are one of the tactical mechanisms for that: they give every employee an AI collaborator who already has the full context the employee lives inside.

## Why a template (and not just ad-hoc instructions)

The template exists to lower the activation energy of adopting an exocortex. One `git clone` + `bash src/setup.sh` and a new employee is up and running — no wiki-trawling, no guessing at file structure, no drift between how one person uses their exocortex and how another does. The template is the interop layer that lets every Auki person's AI collaborator speak the same structural language.

## Who works on it

Project driver: **Tracy**. Contributors: Nils, Shuning, and others — see `changelog.md` for authorship history. Anyone building and using their own exocortex can contribute template improvements back here.
