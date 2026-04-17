# Radiant — behavioral alignment for the ExoCortex

## What the ExoCortex already does brilliantly

The ExoCortex gives every AI on the team persistent context. It learns about your business. It shares what it learned with colleagues. Contributors can point at your repos, ask "how can I help?" and get real answers. You're already testing the future of decentralized AI coordination — building in public, asking each other's exocortex what people are working on, what they're struggling with, how to help.

That's working. That's real. Don't change any of it.

## The one thing it doesn't do

The ExoCortex gives AI memory. But it doesn't tell AI what that memory **means** — relative to what Auki actually stands for.

When an AI learns from your Swedish retail customer on his morning commute, what governs what it absorbs? When a contributor asks "how can I help?" and the exocortex answers, what ensures the answer reflects Auki's actual priorities — cognitive liberty, decentralization, perception-first, protocol-not-product — and not just whatever's in the latest commit?

The ExoCortex remembers. But who makes sure the memory stays aligned with the mission?

## What Radiant adds

Radiant is the alignment layer. It doesn't replace the ExoCortex — it reads the ExoCortex alongside the activity and tells you whether the work matches what you said you'd do.

Two different intelligences are working together at Auki every day — human intelligence and artificial intelligence. Each has its own strengths. Each operates differently. Neither is a lesser version of the other.

<p align="center">
  <img src="./images/neuroverse-two-gyroscopes.png" alt="The NeuroVerse — human intelligence and AI intelligence as two systems inside a shared universe" width="600" />
</p>

NeuroverseOS is the universe these two intelligences meet inside — defined by the behaviors Auki has agreed upon: the vision, the strategy, the non-negotiables. All organizations gather people around declared shared intent. NeuroverseOS tools define those intentions into behaviors — and those behaviors become a constitution carried out at runtime.

## Built for Auki specifically

Radiant ships with two worldmodels authored for Auki:

**Auki Vanguard** — the leadership model. Three domains that define how Auki leads: the skills needed for strategic thinking and systems design, the skills needed for authentic storytelling and community building, the skills needed for collaboration, fairness, and shared wealth creation. When these three work together, trust, inspiration, and hope emerge. When all three integrate fully, the team operates as a collective vanguard leader.

<p align="center">
  <img src="./images/auki-vanguard-diagram.png" alt="Auki Vanguard Model — three domains with overlap states" width="48%" />
  &nbsp;
  <img src="./images/auki-vanguard-skills.png" alt="Auki Vanguard Skills — 30 skills across three domains" width="48%" />
</p>

**Auki Strategy** — the goals and required behaviors. Posemesh, Sixth Protocol, cognitive liberty, DePIN, Intercognitive coalition. The invariants: cognitive liberty preserved, decentralization before aggregation, perception before locomotion, protocol not product, sovereignty over convenience.

These worldmodels aren't generic templates. They were authored from Auki's actual strategy documents, glossary, blog posts, and the Intercognitive Foundation thesis. When Radiant reads your team's activity, it reads it through THIS frame — your frame.

## Five sources, one behavioral read

Radiant doesn't just read GitHub. It reads across every tool your team uses and produces one integrated behavioral read:

| Source | What it reads | What it reveals |
|---|---|---|
| **GitHub** | Commits, PRs, reviews, comments | What was SHIPPED |
| **ExoCortex** | attention.md, goals.md, sprint.md | What was STATED — the gap between intent and action is drift |
| **Discord** | Channel messages, threads, help requests | How the team COMMUNICATES — response times, newcomer welcome, debate resolution |
| **Slack** | Workspace messages, partner channels | How you COORDINATE with partners — FairPrice, Intercognitive coalition, external contributors |
| **Notion** | Page creation, updates, doc freshness | How you DOCUMENT — knowledge crystallization, stale docs, decision records |

High code shipping + low documentation = building without recording. Active Discord + empty GitHub = talking without shipping. Sprint goals in the ExoCortex + zero matching activity = stated intent with no follow-through. Radiant names every gap.

One command reads all configured sources:

```bash
npx @neuroverseos/governance radiant emergent aukilabs/ \
  --lens auki-builder --worlds ./worlds/ --view team
```

## What you get immediately (zero install)

A `CLAUDE.md` file goes into the org repo. Every Auki employee's exocortex picks it up on their next `git pull` — because the org repo is already symlinked into every personal exocortex.

After that: every Claude Code session across the entire team starts with Auki's invariants, vocabulary, voice rules, and decision priorities loaded. Nobody installs anything. Nobody changes a workflow. The AI just starts thinking in Auki's frame.

Try this: ask Claude *"I want to centralize the spatial data for easier queries."*

Without Radiant's governance frame, Claude helps you build it.

With the governance frame, Claude pushes back — cites `sovereignty_over_convenience` and `decentralization_before_aggregation`, calls centralization "the failure mode, not a neutral choice," and proposes a Posemesh-native alternative using domains, DHT, and the discovery service.

Same Claude. Same model. Different frame. The CLAUDE.md is the difference.

## What you get with the behavioral dashboard

Radiant doesn't just read behavior — it tells you **where to build next**, grounded in your own declared strategy. Point it at any repo and get a read on what's actually happening, what it means for the mission, and what to do about it:

```bash
npx @neuroverseos/governance radiant emergent aukilabs/reconstruction-server \
  --lens auki-builder --worlds ./worlds/
```

Real output from the reconstruction-server repo (21 events, 14-day window):

```
EMERGENT

  architectural_shipping_without_strategic_framing
    Technical work is shipping fast with clear ownership, but nobody is
    telling the story of how reconstruction improvements connect to
    spatial computing territory capture. The work is good; the strategic
    narrative is missing.

  dependency_automation_functioning
    Automated dependency updates are merging cleanly without human
    intervention. The infrastructure maintenance is working as intended.

  follow_through_gap_across_domains
    Work is getting done but completion tracking is broken. PRs merge,
    commits land, but the follow-through signal reads zero everywhere —
    either the measurement is wrong or important work isn't being closed
    out properly.

MEANING

  The team is shipping reconstruction improvements at good velocity with
  clear ownership, but the strategic story connecting this work to spatial
  territory capture isn't being told. Technical architecture is advancing
  without corresponding narrative about why these specific improvements
  matter for the mission.

MOVE

  Consider framing recent reconstruction improvements in mission terms:
  how do cleaner topography meshes and faster global refinement advance
  spatial computing territory? The follow-through measurement needs
  investigation — either fix the tracking or establish explicit completion
  practices.

ALIGNMENT

  Human work:                31 · concerning
  AI work:                   not enough signal to call yet
  Human–AI collaboration:    not enough signal to call yet
  Composite:                 31 · concerning
```

Every pattern is grounded in real events from the repo. The MEANING section tells you what it means for the mission — not "what happened" but "what it means and what to do." The MOVE section is specific and actionable.

## Command reference

| Command | What it does |
|---|---|
| `neuroverse radiant think --query "..."` | Ask any question through the worldmodel + lens |
| `neuroverse radiant emergent owner/repo` | Behavioral read on a single repo |
| `neuroverse radiant emergent org/` | Behavioral read across an entire GitHub organization |
| `neuroverse radiant emergent ... --exocortex ~/exo/` | Add stated-intent comparison (sprint goals vs actual work) |
| `neuroverse radiant emergent ... --view community` | Public repos + public channels only |
| `neuroverse radiant emergent ... --view team` | + private repos + team channels |
| `neuroverse radiant emergent ... --view full` | + cross-exocortex (compare everyone's intent) |
| `neuroverse radiant lenses list` | Show available rendering lenses |
| `neuroverse radiant lenses describe auki-builder` | Inspect a lens (domains, vocabulary, forbidden phrases) |
| `neuroverse radiant mcp` | Start MCP server for Claude Code integration |

**Environment variables (set once in ~/.zshrc):**

| Variable | What it connects | Required for |
|---|---|---|
| `ANTHROPIC_API_KEY` | Claude AI for interpretation | `think`, `emergent` |
| `GITHUB_TOKEN` | GitHub repos | `emergent` |
| `DISCORD_TOKEN` | Discord server | `emergent` with Discord channels |
| `SLACK_TOKEN` | Slack workspace | `emergent` with Slack channels |
| `NOTION_TOKEN` | Notion workspace | `emergent` with Notion pages |

## What the report looks like with all five sources connected

With GitHub only (above), Radiant sees what was shipped. With all five sources, the report transforms:

```
EMERGENT

  architectural_shipping_without_strategic_framing
    Technical shipping is high (21 GitHub commits) but the strategic
    narrative is missing. Discord shows a 47-message debate about
    reconstruction priorities in #architecture — but the outcome
    never landed as a commit message or Notion doc.

  strategy_debate_to_action_gap
    The spatial sovereignty discussion in Discord ran for 3 days.
    Two Slack messages to the Intercognitive coalition referenced it.
    But zero code changes followed.

  documentation_lag
    3 Notion pages about reconstruction pipeline are stale (untouched
    34 days). Meanwhile 8 commits improved that exact pipeline this
    week. The docs describe a system that no longer exists.

  partner_engagement_without_follow_through
    FairPrice asked 4 questions in Slack about the deployment timeline.
    Average response time: 3 hours. Two questions still unanswered.

  newcomer_onboarding_success
    New contributor @mika-haak asked 12 questions in Discord
    #onboarding. Got responses within 20 minutes from 4 team members.
    First PR submitted on day 3.

MEANING

  Three bridges are weak: Discord debates aren't becoming GitHub code.
  GitHub improvements aren't becoming Notion docs. Slack partner
  questions aren't getting timely responses. Each tool is active, but
  the connections between them are where the work is falling through.
  The good news: newcomer onboarding is working. The community cocoon
  is holding.

MOVE

  Connect the Discord architecture debate to a GitHub PR this week.
  Update the 3 stale Notion pages about reconstruction. Respond to
  the FairPrice Slack questions before end of day.
```

GitHub alone gives you Future Foresight signals (architecture, systems design). Discord and Slack add Narrative Dynamics (communication, debate resolution) and Shared Prosperity (partner engagement, newcomer welcome). Notion adds documentation behavior. All three domains of the vanguard model become measurable — not just one.

## The three alignment scores

- **Human work (L)** — is human activity aligned with what Auki declared? Not "are people productive" — "are they working inside the frame?"
- **AI work (C)** — is AI output aligned with the worldmodel? Right vocabulary? Invariants respected? Or generic, ungoverned output?
- **Human–AI collaboration (N)** — when human and AI work together, is shared meaning preserved? This score only exists because the worldmodel provides a shared frame to measure against.

## What's pushing against the alignment

The scores tell you where you are. The governance audit trail tells you **what's testing the frame** — and whether it's humans or AI doing the testing.

Every event Radiant reads gets evaluated against the worldmodel's invariants. When something pushes against one — a commit that skips a consent check, a PR that introduces centralization, an AI output that uses the wrong vocabulary — it gets recorded: which invariant, which side (human or AI), how many times.

The GOVERNANCE section of each read shows:

```
GOVERNANCE

  52 events evaluated.

  Human side:
    49 ALLOW · 2 MODIFY · 1 BLOCK
    BLOCK: commit touched spatial observation pipeline
           without consent check → sovereignty_over_convenience

  AI side:
    3 voice violations caught in AI output (all corrected)

  Balance: human side tested the frame 3 times.
  AI side tested the frame 3 times. Roughly balanced.
```

But the real value isn't one week's report — it's what happens **when the same thing keeps pushing.**

## When the team keeps pushing against the same invariant

If three engineers independently ask about centralizing spatial data in the same month, the invariant catches it every time. Good. But Radiant tracks this persistence across reads and surfaces the harder question:

> *"decentralization_before_aggregation has triggered 8 times across 3 reads. Always on the human side. The team keeps pushing against this invariant. Either the team needs alignment on WHY decentralization matters — or the team is telling you something the worldmodel hasn't absorbed yet."*

Three possible responses:

1. **The model is right, the team needs alignment.** People don't understand why decentralization matters. Training needed. Don't change the invariant.
2. **The team is right, the model needs updating.** There's a legitimate use case the invariant is too blunt to accommodate. Refine it.
3. **Both are partly right.** The invariant holds for custody but the team needs a centralized index. Add nuance to the worldmodel.

Radiant doesn't decide which. It surfaces the question and shows the evidence. The leader decides. The worldmodel evolves — or the team aligns. Either way, the cocoon adapts because the system told you where the pressure was.

## It works the other direction too

When an invariant **stops** firing — hasn't been tested in weeks — Radiant surfaces that as well:

> *"perception_before_locomotion hasn't triggered in 12 reads. Either the team has internalized it (the rule is redundant) or no one has done locomotion-adjacent work (the rule hasn't been tested). Review whether it still earns its place."*

A worldmodel that only grows eventually governs nothing. Radiant proposes what to add (persistent patterns) AND what to remove (silent invariants). Lean and sharp beats comprehensive and ignored.

## How it connects to the ExoCortex

Radiant reads the ExoCortex as **stated intent** — what people say they're focused on (attention.md, goals.md, sprint.md). It reads GitHub as **observed behavior** — what people actually did. The gap between those two is drift.

No other tool measures this. GitHub alone doesn't know what you said you'd do. The ExoCortex alone doesn't know what you actually did. Radiant reads both and tells you where they match and where they don't.

You said *"not AI governance, but AI coordination."* Radiant is the piece that makes coordination **aligned** — so when the AI learns about your business, and shares what it learned, and answers contributor questions, and helps your Swedish customer capture his retail knowledge on his morning commute — it does all of that inside the behavioral frame Auki declared, not outside it.

## Three views — community, team, full

As an org leader, you need to know different things at different scopes. Radiant gives you three views with simple commands:

### Community view — public only

*"How is the open source community engaging with our work?"*

```bash
neuroverse radiant emergent aukilabs/ --view community
```

Reads only public repos and public Discord channels. Anyone can reproduce this read. Transparent. Verifiable. Shows contributor patterns, community alignment, newcomer engagement.

### Team view — public + private

*"How is my team aligned internally?"*

```bash
neuroverse radiant emergent aukilabs/ --view team
```

Reads public AND private repos, team Discord channels. Shows internal coordination, sprint alignment, human-AI collaboration quality across the full team. Output goes to the team exocortex — not publicly visible.

### Full view — everything + cross-exocortex

*"How is the whole organization doing — every person's stated focus compared against every repo's activity?"*

```bash
neuroverse radiant emergent aukilabs/ --view full \
  --team-exocortex ~/team-exocortices/
```

Reads all repos, all configured channels, AND every team member's exocortex. Compares everyone's stated intent against observed behavior. Surfaces where people are aligned, where they're siloed, where they're duplicating, and where critical work has no one carrying it.

Output goes to the leader's personal exocortex only.

### What each view reveals

| | Community | Team | Full |
|---|---|---|---|
| Public repos | ✅ | ✅ | ✅ |
| Private repos | ❌ | ✅ | ✅ |
| Public Discord | ✅ | ✅ | ✅ |
| Team Discord | ❌ | ✅ | ✅ |
| One exocortex | optional | ✅ | ✅ |
| Cross-exocortex | ❌ | ❌ | ✅ |
| Output visibility | Public (anyone can reproduce) | Team (shared exocortex) | Leader (personal exocortex) |
| What it answers | "Is the community engaging?" | "Is the team aligned?" | "Is the whole org coherent?" |

The access token you use determines what's available. Community view works with a public GitHub token. Team view needs an org-member token. Full view needs admin access + team exocortex paths.

### Why it matters to see both

If the team is internally aligned but the community isn't engaging — the team might be building in private without telling the story publicly. Narrative Dynamics gap.

If the community is active but the team is drifting — the open source contributors are more aligned with the mission than the core team. That's a signal worth catching early.

Both views together tell you whether alignment is holding at every layer.

## Discord integration

Radiant reads Discord alongside GitHub — conversational behavior alongside shipping behavior. Same pipeline, richer signal.

**What it adds that GitHub can't see:**

- Who helps whom and how fast (response time patterns)
- Whether decisions in conversation become commits in code
- How newcomers are welcomed (the Narrative Dynamics signal currently invisible)
- Repeated questions nobody's documenting (doc gaps)
- Strategy debates that haven't resolved into action

**Setup (one-time, admin):**

1. Create a read-only Discord bot at discord.com/developers (free, 2 minutes)
2. Set `DISCORD_TOKEN` in your environment
3. Configure which channels to read — public channels for community view, team channels for team view

**Privacy (cognitive liberty applied internally):**

- **Public channels:** readable in community view. Anyone who runs Radiant sees patterns from public conversation — same principle as public repos.
- **Team channels:** readable in team view only. Output goes to team exocortex, not public reads.
- **Private channels / DMs:** never read unless explicitly configured by the channel owner. Cognitive liberty preserved.
- **The bot token IS consent.** Same boundary Discord already enforces. Radiant doesn't add permissions — it respects the ones that exist.

If the read includes private channel data, Radiant auto-detects and warns:

```
⚠ This read includes team-only channels.
Output scoped to team exocortex. Not publicly visible.
```

## Cross-exocortex reads (coming Q3 2026)

Auki is building cross-exocortex queries — asking colleagues' exocortices what they're working on. Radiant extends this with behavioral comparison:

```bash
neuroverse radiant emergent aukilabs/ --view full \
  --team-exocortex ~/team-exocortices/
```

Where `~/team-exocortices/` contains each person's exocortex (symlinked or subdirectories). Radiant reads every person's attention, goals, role, and sprint — then compares them all against the shared activity.

**What it surfaces:**

- *"Two people declared the same focus. Zero shared activity. They don't know about each other's work."*
- *"Portal work is the real focus this sprint. The sprint.md doesn't mention it. Name the pivot."*
- *"Nobody on the team is carrying the communication work. Architecture and partnerships are covered. Storytelling has no one assigned."*
- *"New contributor's stated interest matches an open team gap. Route them there."*

This is organizational consciousness — not just what people are doing, but whether their intentions align with each other and with the declared model.

## The cocoon

Together, the ExoCortex and Radiant put you in a cocoon of behavior. Not a cage — a cocoon. Something you grow inside. Something that holds your shape while you're becoming what you said you'd become. The worldmodel defines the cocoon. The ExoCortex carries the memory. Radiant tells you whether you're growing inside it or pushing through it.

And when you push through — that's evolution, not violation. The cocoon adapts. The worldmodel updates. New shape, same principle.

## What's in this PR

```
governance/
├── CLAUDE.md              Governance frame (loaded by Claude Code at session start)
├── README.md              This file
├── worldmodels/
│   ├── auki-vanguard.worldmodel.md    Culture / leadership model
│   └── auki-strategy.worldmodel.md    Strategy / goals + required behaviors
└── images/
    ├── neuroverse-two-gyroscopes.png  The NeuroVerse model
    ├── auki-vanguard-diagram.png      Vanguard three-domain diagram
    └── auki-vanguard-skills.png       Vanguard skills breakdown
```

Once merged, every Auki employee's exocortex picks up the governance frame on their next `git pull`. No install. No config. It just shows up.

For the behavioral dashboard and MCP server: `npm install @neuroverseos/governance` — published at npm, runs on your machine, nothing hosted by us.

## Full documentation

- [Radiant for Auki — full README](https://github.com/NeuroverseOS/Neuroverseos-governance/blob/main/src/radiant/examples/auki/README.md)
- [Radiant PROJECT-PLAN — architecture, math, build order](https://github.com/NeuroverseOS/Neuroverseos-governance/blob/main/src/radiant/PROJECT-PLAN.md)
- [@neuroverseos/governance on npm](https://www.npmjs.com/package/@neuroverseos/governance)
