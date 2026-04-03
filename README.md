# Exocortex

A personal exocortex — an external memory and focus system for knowledge workers, designed to be read and written by both humans and AI agents.

## What is an exocortex?

An exocortex is a structured external memory that helps you:

- **Stay focused** — your `attention.md` declares what you're working on right now
- **Track progress** — your `goals.md` tracks daily habits and long-term goals
- **Stay aligned** — your `values.md` keeps your work connected to what matters
- **Build accountability** — your `accountability.md` tracks daily consistency
- **Collaborate with AI** — your `CLAUDE.md` teaches AI agents how to work with you

## Getting started

1. Fork or clone this repo
2. Fill in `values.md` — what do you care about?
3. Fill in `goals.md` — what are you working toward?
4. Set your first `attention.md` — what are you focused on right now?
5. Start a conversation with your AI agent — it will read your exocortex and help you stay on track

## Structure

```
exocortex/
├── README.md              ← You are here
├── CLAUDE.md              ← Instructions for AI agents
├── attention.md           ← Current focus (one thing, right now)
├── goals.md               ← Daily habits and long-term goals
├── values.md              ← Guiding principles
├── accountability.md      ← Daily accountability tracker
└── projects/              ← Symlinks or subfolders for active projects
```

## Philosophy

The exocortex is built on a few principles:

**Singular attention.** You can only focus on one thing at a time. `attention.md` forces that choice and helps both you and your AI agent resist drift.

**Honest tracking.** Goals have progress percentages and dates. The red/green calendar doesn't lie. You either did the thing or you didn't.

**Values-aligned work.** Every goal should connect to a value. If it doesn't, question why you're doing it.

**AI as collaborator.** Your AI agent reads your exocortex at the start of every session. It knows your focus, your goals, and your values. It will nudge you back on track when you drift and challenge your assumptions when you need it.

## For teams

When everyone on a team maintains their own exocortex, collaboration becomes legible without meetings or status updates. You can see what someone is focused on by reading their `attention.md`. Project repos can have their own cortex-like structure (README as aspiration, status docs for current state, todo files for next steps) that individual exocortices point into.
