#!/bin/bash

# Exocortex Setup
# Walks you through personalizing your exocortex template files.

set -e

echo ""
echo "=== Exocortex Setup ==="
echo ""
echo "This will walk you through personalizing your exocortex."
echo "Each file has guiding prompts inside — this script helps you"
echo "get started by filling in the basics. You can always edit the"
echo "files directly afterward."
echo ""

# --- identity.md ---
echo "--- Identity ---"
echo ""
read -r -p "What is your name? " name
read -r -p "What do you do? (e.g. 'engineer at Acme Corp') " role_desc
read -r -p "What lens or discipline shapes your thinking? (e.g. engineering, design, biology) " lens

cat > identity.md << EOF
Who are you? Write a short description of yourself — your name, what you do, and how you see the world.

What lens or discipline shapes your thinking? (e.g. engineering, design, biology, economics, memetics)

If you have a public bio, paste it here.

##Identity

I am ${name}, ${role_desc}. I see the world through the lens of ${lens}.
EOF

echo "  ✓ identity.md updated"
echo ""

# --- values.md ---
echo "--- Values ---"
echo ""
read -r -p "What is your most important guiding value? " value1
read -r -p "Why does it matter to you? " value1_why

cat > values.md << EOF
What are your guiding values? List each one and explain what it means to you personally — not the dictionary definition, but why it matters and how it shows up in your decisions.

### ${value1}

${value1_why}
EOF

echo "  ✓ values.md updated"
echo ""

# --- organization.md ---
echo "--- Organization ---"
echo ""
read -r -p "What is your organization's name? " org_name
read -r -p "What is your organization's mission? " org_mission

cat > organization.md << EOF
# Welcome to ${org_name}

What is the mission of your organization? What are you collectively trying to accomplish?

${org_mission}

What are you building, and why does it matter?

What context about the world or your industry is important for understanding why this work is valuable?


# Our Values

What values guide how your organization operates? List them and explain what each one means in practice — not just as slogans, but as behaviors you expect to see.

## Value 1

What does this look like in practice? What behaviors does it encourage or discourage?

## Value 2

What does this look like in practice? What behaviors does it encourage or discourage?
EOF

echo "  ✓ organization.md updated"
echo ""

# --- role.md ---
echo "--- Role ---"
echo ""
read -r -p "What is your role/title? " role_title

cat > role.md << EOF
What is your role? State your title and what your organization does, so your role has context.

I am ${role_title} at ${org_name}.

As ${role_title}, you have responsibilities and routines. Responsibilities are overarching, while routines are methods you use to execute your responsibilities.

## Responsibilities

What are the core responsibilities of your role? For each one, describe what it means and why it matters.

## Routines

What are the recurring activities you perform to fulfill your responsibilities? Be specific — include cadences, times, and what good execution looks like.
EOF

echo "  ✓ role.md updated"
echo ""

# --- goals.md ---
echo "--- Goals ---"
echo ""
read -r -p "What is your current main goal or project? " goal1

cat > goals.md << EOF
# Goals

**${goal1}**
EOF

echo "  ✓ goals.md updated"
echo ""

# --- attention.md ---
echo "--- Attention ---"
echo ""
read -r -p "What is your focus right now? (one thing) " focus

cat > attention.md << EOF
${focus}
EOF

echo "  ✓ attention.md updated"
echo ""

# --- Done ---
echo "=== Setup complete ==="
echo ""
echo "Your exocortex is ready. Here's what to do next:"
echo ""
echo "  1. Review and expand each file — the guiding prompts will help"
echo "  2. Check out examplenils/ for a filled-in example"
echo "  3. Push to your own repo and start working with your AI agent"
echo ""
echo "Files you should flesh out:"
echo "  - identity.md    Add your bio and worldview"
echo "  - values.md      Add more values"
echo "  - organization.md Fill in your org's values"
echo "  - role.md        Add responsibilities and routines"
echo "  - methods.md     Add your mental models and frameworks"
echo "  - glossary.md    Add domain-specific terms"
echo ""
