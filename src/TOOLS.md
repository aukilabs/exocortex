# TOOLS

## Summary

- Local file edits are allowed unless the user says otherwise.
- Ask before destructive actions, external side effects, or long-running automation.
- Do not commit, push, purchase, message third parties, or schedule jobs without explicit permission.
- Use the network for research when needed, and cite sources for unstable facts.
- Prefer reversible steps and visible state over hidden automation.

## Local Defaults

| Capability | Default |
|------------|---------|
| Edit local files | Allowed |
| Run local commands | Allowed |
| Use git status and diff | Allowed |
| Commit changes | Ask first |
| Push branches | Ask first |
| Network research | Allowed when useful |
| Background jobs | Ask first |
| External messaging | Ask first |

## Notes

- Secrets stay in runtime-specific secure storage, not in markdown files.
- When a runtime supports its own memory or approvals, the repo files still remain the source of truth for shared context.
