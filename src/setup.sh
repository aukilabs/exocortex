#!/bin/bash

set -euo pipefail

TEMPLATE_REPO="$(cd "$(dirname "$0")/.." && pwd)"
TEMPLATE_DIR="$TEMPLATE_REPO/src"
ORG_REPO="$TEMPLATE_REPO/../org"

echo ""
echo "=== Exocortex Setup ==="
echo ""
echo "This creates a personal exocortex with a small canonical context pack:"
echo "AGENTS, SOUL, TOOLS, USER, STATE, MEMORY, plus on-demand reference files."
echo ""

echo "--- Location ---"
echo ""
read -re -p "Parent directory for the new exocortex (e.g. ~): " parent_path

parent_path="${parent_path/#\~/$HOME}"
parent_path="${parent_path%/}"
exo_path="$parent_path/exocortex"

echo ""
echo "  -> Will create: $exo_path"

if [ -f "$exo_path/AGENTS.md" ] || [ -f "$exo_path/USER.md" ]; then
  echo ""
  echo "  An exocortex already exists at $exo_path."
  read -re -p "  Replace its template-managed files? (y/N) " confirm
  if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "  Aborting."
    exit 1
  fi
fi

mkdir -p "$exo_path"
mkdir -p "$exo_path/skills"
echo "  Directory ready at $exo_path"
echo ""

echo "--- Organization ---"
echo ""

if [ ! -d "$ORG_REPO/src" ]; then
  echo "  Could not find the org repo at $ORG_REPO."
  echo "  The default is a sibling directory named 'org'."
  read -re -p "  Path to org repo (leave blank to skip): " custom_org
  if [ -n "$custom_org" ]; then
    custom_org="${custom_org/#\~/$HOME}"
    ORG_REPO="$custom_org"
  fi
fi

org_file="$ORG_REPO/src/organization.md"
if [ -f "$org_file" ]; then
  ORG_REPO="$(cd "$ORG_REPO" && pwd)"
  org_name=$(head -1 "$org_file" | sed 's/^# *//')
  ln -sfn "$ORG_REPO" "$exo_path/org"
  echo "  org/ symlinked to $ORG_REPO"
  echo "  Organization: $org_name"
else
  echo "  No org repo found. Continuing without org/."
  read -re -p "  Organization name: " org_name
fi
echo ""

echo "--- Personal Context ---"
echo ""
read -re -p "Name: " name
read -re -p "Role/title: " role_title
read -re -p "Thinking lens or discipline: " lens
default_tz="$(date +%Z 2>/dev/null || printf 'UTC')"
read -re -p "Timezone [$default_tz]: " timezone
timezone="${timezone:-$default_tz}"
read -re -p "Primary working style (e.g. concise, exploratory, visual): " working_style
read -re -p "Most important guiding value: " guiding_value
read -re -p "Current main goal or bet: " main_goal
read -re -p "Current focus right now: " current_focus
echo ""

for file in AGENTS.md SOUL.md TOOLS.md MEMORY.md HEARTBEAT.md SKILLS.md STYLE.md METHODS.md context.manifest.yaml; do
  cp "$TEMPLATE_DIR/$file" "$exo_path/$file"
  echo "  copied $file"
done

cat > "$exo_path/README.md" << EOF
# Exocortex

This is the personal exocortex for ${name}.

## Canonical Pack

- \`AGENTS.md\`
- \`SOUL.md\`
- \`TOOLS.md\`
- \`USER.md\`
- \`STATE.md\`
- \`MEMORY.md\`

## On-Demand Files

- \`SKILLS.md\`
- \`STYLE.md\`
- \`ROLE.md\`
- \`GOALS.md\`
- \`METHODS.md\`
- \`HEARTBEAT.md\`

## Notes

- Keep \`STATE.md\` short and current.
- Keep \`MEMORY.md\` curated and durable.
- Load org and project docs only when the task needs them.
EOF
echo "  wrote README.md"

cat > "$exo_path/USER.md" << EOF
# USER

## Summary

- Name: ${name}
- Role: ${role_title}
- Timezone: ${timezone}
- Primary working style: ${working_style}
- Known preferences: keep adding stable preferences here

## Stable Facts

| Field | Value |
|-------|-------|
| Name | ${name} |
| Role | ${role_title} |
| Organization | ${org_name} |
| Timezone | ${timezone} |
| Lens | ${lens} |

## Working Preferences

- Preferred level of detail:
- Preferred challenge level:
- Preferred meeting style:
- Preferred update cadence:

## Constraints

- Recurring constraints, obligations, or non-negotiables:
- Areas where the agent should be especially careful:

## Collaboration Notes

- Guiding value: ${guiding_value}
- Add durable preferences and quirks here over time.
EOF
echo "  wrote USER.md"

cat > "$exo_path/STATE.md" << EOF
# STATE

## Summary

- Current focus: ${current_focus}
- Active task: ${main_goal}
- Next milestone:
- Last updated:

## Current Focus

${current_focus}

## Active Work

- In progress: ${main_goal}
- Next step:

## Waiting On

- Person:
- Decision:
- Date:

## Immediate Risks

- What could derail current progress?
EOF
echo "  wrote STATE.md"

cat > "$exo_path/ROLE.md" << EOF
# ROLE

## Summary

- Title: ${role_title}
- Core responsibilities:
- Recurring routines:
- Success looks like:

## Responsibilities

I am ${role_title} at ${org_name}. Expand the durable responsibilities of this role and why they matter.

## Routines

List the recurring activities that keep the responsibilities moving.

## Boundaries

State what this role should not own by default.
EOF
echo "  wrote ROLE.md"

cat > "$exo_path/GOALS.md" << EOF
# GOALS

## Summary

- Current quarter:
- Current month:
- Current week:
- Main active bet: ${main_goal}

## Active Goals

- Goal: ${main_goal}
  Why it matters:
  Next concrete step:

## Commitments

- Recurring commitments that affect planning.

## Deferred

- Work that matters but is intentionally not active now.
EOF
echo "  wrote GOALS.md"
echo ""

if [ ! -d "$exo_path/.git" ]; then
  read -re -p "Initialize a git repo in your exocortex? (Y/n) " init_git
  if [[ ! "$init_git" =~ ^[Nn]$ ]]; then
    git init "$exo_path" > /dev/null 2>&1
    echo "  Git repo initialized"
  fi
fi
echo ""

echo "=== Setup complete ==="
echo ""
echo "Your exocortex is at: $exo_path"
echo ""
echo "Next steps:"
echo "  1. cd $exo_path"
echo "  2. Open AGENTS.md, USER.md, STATE.md, and GOALS.md first"
echo "  3. Tighten SOUL.md and TOOLS.md so the collaboration contract is explicit"
echo "  4. Add any reusable procedures to SKILLS.md"
echo ""
echo "Org context, when present, is available through org/."
echo ""
