# Agent-Agnostic Exocortex Refactor Proposal

## Goal

Refactor the current exocortex so that:

- the shared memory model is not tied to Claude or any single model/runtime
- Hermes, OpenClaw, Codex, Claude Code, Cursor, and similar agents can share the same canonical files
- the always-loaded context stays small and predictable
- durable memory is separated from audit logs and vendor/runtime instructions
- proactive agents degrade gracefully when a capability is missing instead of breaking the whole contract

The current repo already has the right instinct: local, org, and project layers. The main refactor is to separate **memory**, **policy**, **capabilities**, and **loading strategy**.

## What Works Today

- The three-layer model is sound: personal, org, and project context are separated.
- Symlinked org/project layers are the right direction for shared context.
- `attention.md` is cheap and operationally useful.
- `role.md`, `goals.md`, and `methods.md` are meaningful categories.
- `AGENTS.md` is the start of a runtime distinction between passive and proactive agents.

## Gaps In The Current Design

### 1. The canonical entrypoint is vendor-specific

Today the real bootstrap lives in `CLAUDE.md`, and the rest of the repo treats that as the universal entrypoint. That is visible in:

- `src/CLAUDE.md`
- `src/README.md`
- `src/setup.sh`
- `src/contributing.md`

This is the main source of model/runtime coupling.

### 2. `CLAUDE.md` mixes four different concerns

`src/CLAUDE.md` currently contains:

- boot instructions
- behavioral norms
- project schema
- task-generation logic
- logging policy
- a documentation style rule

Those are not all the same thing. A portable system needs them separated so different runtimes can apply only the parts they support.

### 3. `AGENTS.md` is still runtime-specific, not capability-specific

`src/AGENTS.md` assumes:

- cron exists
- background jobs are allowed
- durable memory tools exist
- the agent can proactively message the user

Those are runtime capabilities, not universal truths. The file should describe desired behaviors and fallbacks by capability, not implementation details like cron.

### 4. The default read path is too large

The current model asks the agent to read, at session start:

- attention
- identity
- org organization
- role
- goals
- the whole team directory
- org methods
- personal methods
- org contributing
- personal contributing

That is already expensive before project docs or the actual conversation are loaded.

Measured in this repo:

- `src/CLAUDE.md`: 3435 bytes
- `src/AGENTS.md`: 1326 bytes
- `src/contributing.md`: 1646 bytes
- example `src/examplenils/identity.md`: 3741 bytes
- example `src/examplenils/role.md`: 7290 bytes
- example `src/examplenils/methods.md`: 3818 bytes

The example cortex is already large enough that "read everything every session" will waste context on most tasks.

### 5. Prompt logs are being used like memory

`promptlog.md` is useful for auditability, but it is poor shared memory:

- it grows without bound
- it stores prompt history, not distilled durable facts
- it is high-noise and low-signal for future sessions

Durable memory should be summarized and curated. Audit logs should stay out of the hot path.

### 6. Some operational state is overloaded into the wrong files

- `attention.md` is transient state, not durable memory
- proactive routines are in `AGENTS.md`, but should live in a scheduling contract
- tool policy is implicit and scattered, not explicit
- style/voice is currently mixed into identity and general instructions

### 7. Precedence is not explicit

The roadmap already notes unresolved precedence questions. The system needs a hard order for conflicts between:

- platform/system rules
- agent/runtime adapter rules
- user hard rules
- org policy
- project instructions
- retrieved memory

Without this, two agents can read the same files and still behave differently.

## Target Architecture

## Core Principle

Use `AGENTS.md` as the **portable router**, not the personality dump.

`AGENTS.md` should answer only:

- what files exist
- what each file means
- what to load first
- what is always loaded vs on-demand
- how to interpret missing capabilities
- what file precedence to follow

Everything else should move into dedicated files.

## Canonical Personal Files

These are the files I would standardize around for the personal layer.

| File | Purpose | Load policy | Mutable by agent? |
|------|---------|-------------|-------------------|
| `AGENTS.md` | Bootstrap, load order, precedence, capability negotiation | Always | Rarely |
| `SOUL.md` | Identity of the agent partner: personality, hard rules, non-negotiables | Always | No |
| `USER.md` | Stable facts about the human: role, timezone, preferences, working style | Always, but summary-first | Rarely |
| `TOOLS.md` | Tool permissions, channel policy, side-effect rules | Always | Rarely |
| `MEMORY.md` | Curated durable memory: preferences, decisions, open loops, recent facts | Always, but capped | Yes |
| `HEARTBEAT.md` | Desired scheduled/proactive behaviors and escalation logic | Only if runtime is proactive | Yes |
| `STYLE.md` | Output voice and writing guidance | Load only when producing user-facing writing | Rarely |
| `SKILLS.md` | Task-specific capabilities and playbooks the human-agent pair can reliably execute | Load by task match | Rarely |
| `STATE.md` | Current attention, active task, last-updated timestamp | Always | Yes |

I recommend adding `STATE.md` even if you want the public framework to emphasize seven files. It solves a real problem: current focus is ephemeral and should not live in the same artifact as durable memory.

If you want `SKILLS` to grow beyond a compact index, keep `SKILLS.md` as the overview and split detailed skill modules into `skills/*.md`.

If you insist on exactly seven files, merge `STATE.md` into the top of `MEMORY.md`. I would not recommend it.

## Methods vs Skills

These should be separate concepts.

- `METHODS.md` is how to think: heuristics, mental models, decision frameworks, narrative structures.
- `SKILLS.md` is what the pair can do: recurring tasks, operational playbooks, domain procedures, output recipes.

Examples:

- `METHODS.md`: Why / How / What, prioritization rules, persuasion models, decision hygiene.
- `SKILLS.md`: write a weekly investor update, prepare a Fika briefing, triage a GitHub PR, onboard a new teammate, summarize competitor signals.

This distinction matters for context efficiency:

- methods are broad and relatively stable, so they should usually be lazy-loaded
- skills are task-selective, so the agent should load only the matched skill entry or module

## Supporting Reference Files

These still matter, but they should usually be lazy-loaded:

- `ROLE.md`
- `GOALS.md`
- `METHODS.md`
- `skills/*.md`
- `ORG.md` or `org/src/organization.md`
- `TEAM_INDEX.md`
- individual team files
- project `README.md`
- project `ROADMAP.md`
- project `SPRINT.md`
- project `GLOSSARY.md`
- `CHANGELOG.md`
- archived logs

The current `identity.md`, `role.md`, `goals.md`, and `methods.md` do not need to disappear. They need to stop being in the mandatory bootstrap path.

## Capability Model

`AGENTS.md` should describe capabilities, not brands.

Recommended capability flags:

- `can_read_files`
- `can_write_files`
- `can_run_commands`
- `can_use_git`
- `can_access_network`
- `has_durable_memory`
- `can_schedule_jobs`
- `can_send_proactive_messages`

Then the behavior becomes portable:

- If `can_schedule_jobs=false`, do not attempt heartbeat jobs. Surface the desired jobs to the user instead.
- If `has_durable_memory=false`, persist to `MEMORY.md`.
- If `can_run_commands=false`, do not attempt repo syncs or automation setup.
- If `can_send_proactive_messages=false`, only schedule reminders into `HEARTBEAT.md` or report unmet capability.

This lets Hermes and OpenClaw use the same shared files without forcing Codex or Cursor into fake behavior.

## Context Window Strategy

The refactor should be optimized around load tiers.

### Tier 0: Bootstrap Pack

Target: less than 1k tokens total.

Load:

- `AGENTS.md`
- `STATE.md`
- `SOUL.md`
- `TOOLS.md`
- `USER.md` summary block
- `MEMORY.md` active summary block
- `SKILLS.md` index only when the task is ambiguous and capability selection is needed

This is the only pack that should be assumed every session.

### Tier 1: Work Framing Pack

Load only when needed:

- `ROLE.md` summary
- `GOALS.md` summary
- `ORG.md` summary
- `TEAM_INDEX.md`
- relevant `SKILLS.md` section if the task maps to a known playbook

Use when planning work or checking alignment.

### Tier 2: Task Pack

Load only the relevant project:

- project `README.md`
- project `SPRINT.md`
- project `ROADMAP.md` when the task is strategic
- project `TOOLS.md` if repo-specific rules exist

Never scan all linked projects unless the explicit task is global planning.

### Tier 3: Deep Reference Pack

Load only for deeper reasoning:

- full `METHODS.md`
- full skill modules from `skills/*.md`
- full long-form user/org docs
- individual team files
- changelogs
- raw logs

### Tier 4: Archive

Do not preload:

- old prompt logs
- full change history
- stale task lists
- obsolete sprint files

Archive them for audit, not context.

## Summary-First Document Shape

Long files should all adopt the same shape:

1. `Summary`
2. `Stable facts`
3. `Operational details`
4. `Reference detail`
5. `Archive` or external link

Example rule:

- first screen of any file must fit in 8 bullets or less
- everything below that is optional deep context

This preserves human readability while giving agents a predictable skim path.

## Durable Memory Model

`MEMORY.md` should not be a transcript. It should be a compact, curated memory register with sections such as:

- `Stable Preferences`
- `Standing Decisions`
- `Open Loops`
- `Recent Important Events`
- `Known Frictions`
- `Do Not Forget`

Each entry should be:

- short
- dated
- specific
- removable once obsolete

A good rule is to keep the active `MEMORY.md` within a fixed size budget and roll older items into `memory/archive/`.

## Scheduling Model

Move proactive routines out of the core bootstrap and into `HEARTBEAT.md`.

That file should express intent like this:

- trigger
- cadence
- channel
- message goal
- prerequisites
- fallback if capability missing

Example:

| Job | Trigger | Channel | Requires | Fallback |
|-----|---------|---------|----------|----------|
| Morning attention check | Weekdays 09:00 local | chat | `can_schedule_jobs`, `can_send_proactive_messages` | remind user on next active session |

This is portable. "Set up a cron job" is not.

## Adapter Strategy

The agent-specific files should become thin wrappers.

Examples:

- `CLAUDE.md`
- `COPILOT.md`
- `CURSOR.md`
- `HERMES.md`
- `OPENCLAW.md`

Each wrapper should be minimal:

1. identify the runtime
2. declare capability flags if needed
3. point to `AGENTS.md` as canonical policy

That is how you get true cross-agent compatibility without duplicating the whole system prompt in five places.

## Mapping From The Current Repo

| Current file | Proposed role |
|--------------|---------------|
| `src/CLAUDE.md` | split into `AGENTS.md` bootstrap, `SOUL.md`, `TOOLS.md`, `HEARTBEAT.md`, `SKILLS.md`, plus project/task rules |
| `src/AGENTS.md` | keep name, but rewrite around capabilities and scheduling contract |
| `src/identity.md` | split into `USER.md` and possibly `SOUL.md`; keep long narrative as reference |
| `src/role.md` | keep as reference; add a short summary block |
| `src/goals.md` | keep as reference; add a short summary block |
| `src/methods.md` | keep as cognitive framework reference; lazy-load only |
| `src/SKILLS.md` | add as task-playbook index; optionally expand to `skills/*.md` |
| `src/attention.md` | replace with `STATE.md` or absorb into `MEMORY.md` header |
| `src/contributing.md` | reduce to repo maintenance rules; remove bootstrap importance |
| `src/promptlog.md` | demote to audit trail; never part of default context load |
| `src/changelog.md` | keep as repo history, not memory |

## Recommended Precedence Order

1. Platform/system safety rules
2. Runtime adapter file for the active agent
3. `AGENTS.md`
4. `SOUL.md`
5. `TOOLS.md`
6. `USER.md`
7. `STATE.md`
8. `MEMORY.md`
9. matched `SKILLS.md` entry or skill module
10. org policies and summaries
11. project docs
12. deep reference docs

The important change is that memory and project content should never outrank tools policy or hard behavioral rules.

## Migration Plan

### Phase 1: Non-Breaking Compatibility

- Keep the current files so existing users are not disrupted.
- Add the new canonical files: `SOUL.md`, `USER.md`, `TOOLS.md`, `MEMORY.md`, `HEARTBEAT.md`, `STYLE.md`, `SKILLS.md`, `STATE.md`.
- Rewrite `AGENTS.md` to be the real portable router.
- Shrink `CLAUDE.md` into a Claude adapter that says to follow `AGENTS.md`.

### Phase 2: Context Optimization

- Add summary headers to `role.md`, `goals.md`, `methods.md`, org files, and project files.
- Replace "read the whole team directory" with `TEAM_INDEX.md`.
- Replace "scan all projects" with explicit task-based retrieval rules.
- Move prompt history into archive or telemetry, not shared memory.

### Phase 3: Runtime Capability Support

- Introduce capability flags in adapter files.
- Convert proactive routines from cron instructions into `HEARTBEAT.md` jobs.
- Let Hermes/OpenClaw bind those jobs to their own schedulers.
- Let passive tools surface unmet jobs instead of attempting them.

### Phase 4: Optional Machine-Readable Manifest

Add a generated `context.manifest.yaml` describing:

- file purpose
- scope
- load tier
- mutability
- summary location
- token budget

Humans still edit markdown. Agents get a stable machine-readable map.

## Minimal Bootstrap Flow

This is the behavior I would standardize:

1. Read `AGENTS.md`.
2. Detect runtime capabilities.
3. Load `STATE.md`, `SOUL.md`, `TOOLS.md`, `USER.md` summary, and `MEMORY.md` summary.
4. Match the task against `SKILLS.md`; load only the relevant skill entry or module if one exists.
5. If the task involves writing external-facing prose, load `STYLE.md`.
6. If the task involves alignment/planning, load `ROLE.md`, `GOALS.md`, and org summaries.
7. If the task touches a project, load only that project's summary and sprint.
8. Write back only distilled durable facts to `MEMORY.md`, transient focus to `STATE.md`, and audit logs only when needed.

## Concrete Recommendations For This Repo

If I were refactoring this repo next, I would do it in this order:

1. Introduce the new canonical files in `src/`, including `SKILLS.md`.
2. Rewrite `src/AGENTS.md` as the portable router.
3. Reduce `src/CLAUDE.md` to a thin adapter.
4. Replace `attention.md` with `STATE.md`.
5. Demote `promptlog.md` from memory to audit.
6. Add summary headers to `identity.md`, `role.md`, `goals.md`, and `methods.md`.
7. Create `SKILLS.md` as a compact playbook index, with `skills/*.md` reserved for deeper modules.
8. Create `org/src/team/index.md` so agents stop loading the full team directory by default.
9. Update `setup.sh` to scaffold the new files and adapters.

## Bottom Line

The current exocortex is a strong first-generation design, but it is still mostly a **Claude-oriented prompt pack** with an extra autonomous-agent addendum.

The next version should be a **portable context operating system**:

- `AGENTS.md` is the router
- `SOUL`, `USER`, `TOOLS`, `MEMORY`, `HEARTBEAT`, `STYLE`, `SKILLS`, and `STATE` are the canonical personal interfaces
- org and project layers are summaries plus lazy-loaded references
- logs are audit artifacts, not memory
- capabilities replace vendor assumptions
