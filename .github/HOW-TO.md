# Copilot Setup — How To Use

## Modes (built into VS Code)

| Mode | When to use | How |
|------|-------------|-----|
| **Ask** | Quick questions about your codebase | Chat → select "Ask" |
| **Plan** | Blueprint a feature before building | Chat → select "Plan" |
| **Agent** | Build, edit files, run commands | Chat → select "Agent" |

Open chat: `Ctrl+Alt+I`

## Custom Agent

**`@launch-check`** — Pre-ship quality gate. Scans → fixes → lints → builds → commits. Never pushes.

Usage: switch to Agent mode, then type:
```
@launch-check run the pre-ship checklist
```

## Slash Commands

**`/review`** — Quick read-only scan (runs in Ask mode). Reports issues without touching code.

**`/check-deps`** — Check all dependencies for newer versions. Shows outdated packages, asks before updating.

Usage: type `/review` or `/check-deps` in chat.

## Hooks (auto-runs after edits)

**PostToolUse** — Auto-formats files with Prettier after the agent edits them.
Configured in `.github/hooks/post-edit-format.json`. Requires Prettier installed (`npm i -D prettier`).

## MCP Servers

- **GitHub** — create issues, PRs, manage repos from chat (type `http`)
- **Fetch** — pull live web pages into context (requires `uvx` / `uv` installed)

## File Map

```
.github/
├── copilot-instructions.md        ← Always-on context (edit per project)
├── instructions/
│   ├── nextjs.instructions.md     ← Auto-applied to .ts/.tsx files
│   └── seo.instructions.md        ← Auto-applied to .ts/.tsx files
├── agents/
│   └── launch-check.agent.md      ← @launch-check agent
├── prompts/
│   ├── review.prompt.md           ← /review command (ask mode, read-only)
│   └── check-deps.prompt.md       ← /check-deps command (update checker)
├── hooks/
│   └── post-edit-format.json      ← Auto-format after agent edits
.vscode/
├── settings.json                  ← Agent mode enabled
└── mcp.json                       ← MCP server config (http + stdio)
```

## New Project Setup

1. Copy `.github/` and `.vscode/` folders into the new project
2. Edit `.github/copilot-instructions.md` — update project name, stack, routes, and rules
3. Run `npm i -D prettier` (for the post-edit hook)
4. Done — everything else applies automatically

## Day-to-Day Workflow

1. **Plan** → use Plan mode to scope the feature
2. **Build** → switch to Agent mode and execute
3. **Check** → type `/review` for a quick scan
4. **Ship** → type `@launch-check run the pre-ship checklist`
5. **Push** → review the commit diff, then `git push` yourself

## Useful Commands

- `/init` — auto-generate copilot-instructions.md from your project
- `/hooks` — configure hooks interactively
- `/agents` — manage custom agents
- `/prompts` — manage prompt files
- `Configure Chat (gear icon) > Diagnostics` — see loaded configs and errors
