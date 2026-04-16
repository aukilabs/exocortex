#!/bin/bash

# Exocortex Setup
# Waslks you t hrough creating a personal exocortex from the org template.

set -e

TEMPLATE_REPO="$(cd "$(dirname "$0")/.." && pwd)"
TEMPLATE_DIR="$TEMPLATE_REPO/src"
ORG_PRIMARY="$TEMPLATE_REPO/../org"
ORG_PUBLIC="$TEMPLATE_REPO/../org-auki"

echo ""
echo "=== Exocortex Setup ==="
echo ""
echo "This will create your personal exocortex — a new directory"
echo "with your user profile, role, goals, and focus. It symlinks back"
echo "to shared org context."
echo ""

# --- Where to create the personal exocortex ---
echo "--- Location ---"
echo ""
echo "Choose a parent directory. Your exocortex will be created"
echo "as an 'exocortex' folder inside it."
echo ""
read -re -p "Parent directory (e.g. ~): " parent_path

parent_path="${parent_path/#\~/$HOME}"
parent_path="${parent_path%/}"
exo_path="$parent_path/exocortex"

echo ""
echo "  → Will create: $exo_path"

if [ -f "$exo_path/user.md" ] || [ -f "$exo_path/identity.md" ]; then
  echo ""
  echo "  ⚠ An exocortex already exists at $exo_path."
  read -re -p "  Re-run setup and replace its files? (y/N) " confirm
  if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "  Aborting."
    exit 1
  fi
fi

mkdir -p "$exo_path"
echo "  ✓ Directory ready at $exo_path"
echo ""

# --- Find the org repo: sibling ../org (Auki private), else ../org-auki (public), else prompt ---
echo "--- Organization ---"
echo ""

ORG_REPO="$ORG_PRIMARY"
if [ ! -d "$ORG_REPO/src" ]; then
  ORG_REPO="$ORG_PUBLIC"
fi

if [ ! -d "$ORG_REPO/src" ]; then
  echo "  Could not find a sibling org repo at:"
  echo "    $ORG_PRIMARY   (Auki employees: aukilabs/org)"
  echo "    $ORG_PUBLIC  (open source: aukilabs/org-auki)"
  read -re -p "  Path to org repo (or leave blank to skip): " custom_org
  if [ -n "$custom_org" ]; then
    custom_org="${custom_org/#\~/$HOME}"
    ORG_REPO="$custom_org"
  fi
fi

org_file="$ORG_REPO/src/organization.md"
if [ -f "$org_file" ]; then
  ORG_REPO="$(cd "$ORG_REPO" && pwd)"
  org_name=$(head -1 "$org_file" | sed 's/^# Welcome to //' | sed 's/!$//')
  ln -sf "$ORG_REPO" "$exo_path/org"
  echo "  ✓ org/ symlinked to $ORG_REPO"
  echo "  Organization: $org_name"
else
  echo "  ⚠ No organization.md found. Skipping org symlink."
  read -re -p "  What is your organization's name? " org_name
fi
echo ""

# --- User profile & role ---
echo "--- User profile (user.md) ---"
echo ""
read -re -p "What is your name? " name
read -re -p "What is your role/title? (e.g. 'Engineer') " role_title
read -re -p "What lens or discipline shapes your thinking? (e.g. engineering, design, biology) " lens
echo ""
read -re -p "What is your most important guiding value? " value1
read -re -p "Why does it matter to you? " value1_why

cat > "$exo_path/user.md" << EOF
Who are you? Write a short description of yourself — your name, what you do, and how you see the world.

What lens or discipline shapes your thinking? (e.g. engineering, design, biology, economics, memetics)

If you have a public bio, paste it here.

What are your skills and capabilities? Identity is what you bring — your expertise, tools you're proficient with, languages you speak, domains you've worked in. Your user_role.md describes what the job demands; your user.md describes what you supply. The gap between the two is where growth happens.

## Identity

I am ${name}, ${role_title} at ${org_name}. I see the world through the lens of ${lens}.

## Skills

(List your skills and capabilities here.)

## Values

### ${value1}

${value1_why}
EOF

echo "  ✓ user.md created"
echo ""

echo "--- Role (user_role.md) ---"
echo ""

cat > "$exo_path/user_role.md" << EOF
What is your role? State your title and what your organization does, so your role has context.

I am ${role_title} at ${org_name}.

As ${role_title}, you have responsibilities and routines. Responsibilities are overarching, while routines are methods you use to execute your responsibilities.

## Responsibilities

What are the core responsibilities of your role? For each one, describe what it means and why it matters.

## Routines

What are the recurring activities you perform to fulfill your responsibilities? Be specific — include cadences, times, and what good execution looks like.
EOF

echo "  ✓ user_role.md created"
echo ""

# --- Goals ---
echo "--- Goals ---"
echo ""
read -re -p "What is your current main goal or project? " goal1

cat > "$exo_path/goals.md" << EOF
# Goals

**${goal1}**
EOF

echo "  ✓ goals.md created"
echo ""

# --- Attention ---
echo "--- Attention ---"
echo ""
read -re -p "What is your focus right now? (one thing) " focus

cat > "$exo_path/attention.md" << EOF
${focus}
EOF

echo "  ✓ attention.md created"
echo ""

# --- Copy template files that don't need personalization ---
echo "--- Copying templates ---"
echo ""

for file in AGENTS.md methods.md glossary.md contributing.md changelog.md promptlog.md; do
  if [ -f "$TEMPLATE_DIR/$file" ]; then
    cp "$TEMPLATE_DIR/$file" "$exo_path/$file"
    echo "  ✓ $file"
  fi
done

if [ -f "$TEMPLATE_REPO/README.md" ]; then
  cp "$TEMPLATE_REPO/README.md" "$exo_path/README.md"
  echo "  ✓ README.md"
fi
echo ""

# --- Init git ---
if [ ! -d "$exo_path/.git" ]; then
  read -re -p "Initialize a git repo in your exocortex? (Y/n) " init_git
  if [[ ! "$init_git" =~ ^[Nn]$ ]]; then
    git init "$exo_path" > /dev/null 2>&1
    echo "  ✓ Git repo initialized"
  fi
fi
echo ""

# --- Done ---
echo "=== Setup complete ==="
echo ""
echo "Your exocortex is at: $exo_path"
echo ""
echo "Next steps:"
echo ""
echo "  1. cd $exo_path"
echo "  2. Open it in your AI coding tool (Cursor, Claude Code, etc.)"
echo "  3. Review and expand each file — the guiding prompts will help"
echo ""
echo "Files to flesh out:"
echo "  - user.md        Add your bio, worldview, and more values"
echo "  - user_role.md   Add responsibilities and routines"
echo "  - methods.md     Add your mental models and frameworks"
echo "  - glossary.md    Add domain-specific terms"
echo ""
echo "Shared context (read-only, via org/ symlink):"
echo "  - org/src/organization.md   Mission, strategy, values"
echo "  - org/src/team/             Your colleagues' role files"
echo "  - org/src/methods.md        Shared heuristics"
echo "  - org/src/contributing.md   Shared logging conventions"
echo ""
