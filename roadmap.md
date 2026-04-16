# Roadmap

## Done

- Three-layer architecture designed and documented (local/org/project)
- Org repo created (`aukilabs/org`) with organization.md, methods.md, contributing.md, glossary.md, team/
- Template restructured — clone, symlink org, populate user.md / user_role.md, go
- setup.sh creates org symlink
- CEO cortex running on the architecture (dog-fooding)
- 6 team role files written (BD, Marketing, DevRel, Spatial, Networking, Robotics)
- Johannes partially onboarded, Phil demoed

## Apr 6–12: Onboarding wave 1

**Owner:** Nils

- Onboard Freddie (COO) — first non-engineering exocortex, validates that the system works for ops/finance-adjacent roles
- Resync Jay (Marketing) — his exocortex predates the three-layer restructure, needs to pull latest template and symlink org
- Onboard Cherlin (Head of Finance) — stretch goal, same process as Freddie
- Create role files for Freddie and Cherlin in `org/src/team/`
- Complete Johannes onboarding (verify his exocortex is functional end-to-end)

**Done when:** 3+ colleagues have working exocortices that read from the shared org layer.

## Apr 13–30: Team-wide rollout

**Owner:** Nils

- Onboard remaining project leaders (Arshak, Robin, Matthieu, Phil) — everyone who has a role file should have a working exocortex
- Write onboarding guide — step-by-step doc that lets someone self-serve without Nils in the room
- First cross-exocortex audit — CEO reads each colleague's exocortex and checks alignment (role↔goals↔org mission)
- Resolve open design questions:
  - Auto-pull for org repo (git hook, cron, or manual?)
  - Should AGENTS.md have an org layer? (shared behavior rules everyone inherits)
  - Method/value precedence when personal conflicts with org

**Done when:** Every project leader has a working exocortex. Onboarding is documented well enough that the next hire can self-serve.

## May: Exocortex as infrastructure

**Owner:** Nils + Freddie (COO owns process adoption)

- Exocortex setup is part of day-one onboarding for every new hire
- Org-level AGENTS.md — shared behavior rules that every agent inherits, personal overrides on top
- Project exocortices for every active Auki project (readme, roadmap, sprint, glossary, changelog at repo root)
- Weekly CEO audit rhythm: review one colleague's exocortex per week, check goal↔mission alignment
- First structured Fika using exocortex context (agent prepares alignment briefing)

**Done when:** New hires get an exocortex on day one. Every active project has the standard file structure. Weekly audit is running.

## June: Async exocortex (WhatsApp/Telegram)

**Owner:** Matthieu + Tracy (building), Nils (design)

- AI partner reachable outside the IDE — async nudges, attention reminders, daily check-ins
- Matthieu and Tracy are already working on this
- Design the interaction model: what does a WhatsApp exocortex session look like? (not just "chat with Claude" — structured context must still load)
- Pilot with 2-3 colleagues before rolling out

**Done when:** At least one colleague is using their exocortex via messaging app for daily check-ins.

## Q3 2026: Scale and open-source

- Memetics book exocortex — Nils uses the architecture for long-form writing projects (articles are already being restructured as projects)
- Exocortex-to-exocortex queries — one agent can ask another's project context with permission
- Evaluate open-sourcing the framework beyond Auki
- Measure: are exocortex users more productive and more aligned? How do we know?

## Dependencies

| Milestone | Depends on |
|-----------|-----------|
| Team-wide rollout | Onboarding wave 1 proving the process works |
| Org-level AGENTS.md | Resolving method/value precedence design question |
| Async exocortex | Matthieu + Tracy's WhatsApp/Telegram work |
| Open-source | Team-wide adoption proving the system works at org scale |
