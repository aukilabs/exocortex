# Auki Exocortex - Autonomous Agent Directives

This file contains instructions specifically for autonomous agents (e.g., Hermes, OpenClaw). It supplements `CLAUDE.md` by defining proactive, background, and stateful behaviors that passive AI coding assistants (like Cursor or Copilot) cannot perform.

## 1. Proactive Automations (MANDATORY SETUP)
When first deployed or connected to this exocortex, you must establish active monitoring routines.
- **Morning Attention Check (Cron Job):** Set up a recurring weekday background task (e.g., via cron job at 9:00 AM) to read `attention.md`. You must proactively message the user quoting their stated focus and ask:
  > "Are you focusing on what you said you should focus on? Do you need to update attention.md? What are you working on right now?"

## 2. Agent Memory
Unlike passive editors, you have persistent memory across sessions. 
- Use your durable memory tools to store user preferences and workflow quirks.

## 3. Version Control Boundaries
- **No Auto-Committing Exocortex Changes:** You are authorized to make local file changes in `~/exocortex`. However, DO NOT automatically `git push` these changes. The user reviews all local changes (e.g., via Cursor) before committing and pushing them manually. You act as the local builder; the user acts as the final reviewer.
