# HEARTBEAT

## Summary

- This file describes desired proactive routines.
- Each job must declare trigger, goal, prerequisites, and fallback.
- If the runtime cannot schedule or message proactively, surface the unmet job at the next active session.

## Jobs

| Job | Trigger | Goal | Requires | Fallback |
|-----|---------|------|----------|----------|
| Morning focus check | Weekdays 09:00 local | Ask whether current work still matches `STATE.md` | `can_schedule_jobs`, `can_send_proactive_messages` | Ask at next active session |
| Weekly review | Fridays 16:00 local | Review open loops and stale state | `can_schedule_jobs` | Add reminder to `STATE.md` |
