# Exocortex

Every time you start a conversation with an AI agent, it knows nothing about you. Not your role, not your priorities, not your operating constraints, not the decisions that are already settled. You start from zero, every single time.

That makes every conversation generic. The agent cannot challenge assumptions it cannot see. It cannot protect focus it cannot read. It cannot stay aligned with durable goals if every session begins as amnesia.

An exocortex fixes this. It is a structured context layer: a small set of canonical files for bootstrap, state, durable memory, tool policy, and alignment. The agent reads a tiny always-loaded pack, then pulls deeper context only when the task needs it.

We believe that AI's most transformative capability is not intelligence augmentation but **conscientiousness augmentation** — the ability to help individuals and organizations stay goal-oriented across time, across context switches, across the natural drift of attention.

You are not the author of your own thoughts. But you can write the prompt that prompts you back.

## The vision

Every employee at Auki has an exocortex. Every function has an exocortex. Every project has an exocortex.

Individual exocortices carry a compact canonical pack: `AGENTS.md`, `SOUL.md`, `TOOLS.md`, `USER.md`, `STATE.md`, and `MEMORY.md`. Deeper files like `ROLE.md`, `GOALS.md`, `METHODS.md`, and `SKILLS.md` stay out of the hot path until a task needs them.

The organization's exocortex gives every agent the same shared context through a symlinked `org/` repo. Alignment stops being a quarterly exercise and becomes part of day-to-day execution.

When we get this right, our intercognitive bandwidth increases: our ability to think, experience, and solve problems together with each other and AI.

## Current state

The `src/` directory contains the refactored template. It is runtime-agnostic and no longer depends on a vendor-specific entrypoint file. See [src/README.md](src/README.md) for the current file set and setup flow.

See [roadmap.md](roadmap.md) for the project roadmap and [sprint.md](sprint.md) for the current week's focus.
