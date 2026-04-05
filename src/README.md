**Welcome to Auki's exocortex — a mission-driven AI copilot that prompts you back.**

# Exocortex

Every time you start a conversation with an AI agent, it knows nothing about you. Not your name, not your role, not what you're working on, not what you care about. You start from zero, every single time.

That means every conversation is generic. The agent can't challenge your assumptions because it doesn't know what you assume. It can't keep you focused because it doesn't know what you're focused on. It can't align its work with your values because it doesn't know what you value. You are strangers, every time.

Now imagine the opposite. Your AI agent starts every session by reading your identity, your values, your role at Auki, your current goals, and your stated focus for this session. It knows our mission, our strategy, our products, and the specific terms our team uses. It doesn't just answer your questions — it pushes back when your work drifts from your goals. It knows how to talk to you.

That's an exocortex: a structured external memory that turns a generic AI assistant into an intercognitive collaborator.

## Getting started

```bash
git clone https://github.com/aukilabs/exocortex.git my-exocortex
cd my-exocortex
bash setup.sh
```

The setup script asks you a few questions — your name, role, values, and current focus — and populates the template files with your answers. After that, open each file and expand on it. The guiding prompts inside each file will help. Check out `examplenils/` for a filled-in example.

`organization.md` is already populated with Auki's mission, protocol, economy, strategy, and values — so your agent has full organizational context from the start.

Then open the repo in your AI coding tool (Claude Code, Cursor, etc.) and start working. Your agent will read `claude.md` and orient itself automatically.

## How it works

An exocortex is a set of markdown files in a git repo. Each file gives your AI agent a different layer of context:

| File | What it tells your agent |
|------|--------------------------|
| `attention.md` | What you're working on *right now* — one thing, updated by you at the start of each session |
| `identity.md` | Who you are, how you see the world, what skills you bring |
| `values.md` | What you care about and why — not slogans, but principles you actually use to make decisions |
| `organization.md` | Auki's mission, protocol, economy, strategy, and values — pre-populated for you |
| `role.md` | Your responsibilities and routines — what you're accountable for |
| `goals.md` | Your current projects and their status |
| `methods.md` | Mental models and frameworks you rely on, so your agent can apply them too |
| `glossary.md` | Domain-specific language, so your agent speaks the way our team speaks |

Your agent reads these files at the start of every session through `claude.md` — a file that tells the agent how to use the exocortex: what to read, in what order, and what alignment checks to run before responding.

The richer your exocortex, the better your agent collaborates with you. But even a sparse one — just a name, a role, and a current focus — is a dramatic improvement over starting from nothing.

## Your first task

Before anything else: **write your `role.md`.** Describe your responsibilities and routines at Auki in your own words. This is the file that turns a generic AI into a collaborator that understands your job.

Ask the CEO for your draft role file if one has been prepared for you — then rewrite it in your own words. The draft is a starting point, not a prescription.

## What changes

Once your agent has context, the collaboration shifts:

- **It holds you accountable.** If your attention says "ship the onboarding flow" and you start bikeshedding color schemes, it will call that out.
- **It challenges you.** It knows your values and goals well enough to ask whether what you're doing actually serves them.
- **It gets better over time.** As you add to your methods, refine your goals, and update your role, the agent's judgment improves because its context improves.
- **It remembers across sessions.** Your goals, your changelog, your diary — they persist in the repo. Every new session picks up where the last one left off.

## For the team

When everyone on the team maintains their own exocortex, collaboration becomes legible without status meetings. You can read someone's `attention.md` to see what they're focused on. You can read their `goals.md` to see what they're working toward. Their agent knows who they are and what they're doing — and so can yours.

The CEO's exocortex references your role files in the `team/` directory. When you update your role, goals, or attention, that context is available for alignment.

## Philosophy

**Singular attention.** You can only focus on one thing at a time. `attention.md` forces that choice.

**Values-driven work.** Every goal should trace back to a value. If it doesn't, question why you're doing it.

**Your content, your structure.** The template provides scaffolding, but the content must be yours. An exocortex only works if it reflects how you actually think and what you actually care about.

**Intercognitive collaboration.** The most human thing is shared intersubjective experience — perceiving the world together through shared language and context. An exocortex extends that to human-AI pairs.
