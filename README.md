# Skills

Agent skills I wrote, one folder per skill with a `SKILL.md`.
They work with Claude Code, Codex, Gemini CLI, Copilot CLI and opencode.

Install with the [skills CLI](https://github.com/vercel-labs/skills):

```sh
npx skills add jayvaliya/skills
```

| Skill | Use |
| --- | --- |
| [mac-cleanup](mac-cleanup/SKILL.md) | Free disk space on a Mac by removing disposable agent test resources, temp files and download caches |
| [making-tutorial-videos](making-tutorial-videos/SKILL.md) | Record, narrate and edit short app tutorial videos with AI voiceover, and join them into a course video |

## Working on these skills

This folder is the source of truth on my machine; agents read the skills through symlinks.
Details that only make sense on my machine, such as paths, project names and ports, go in `<name>/local.md`, which is gitignored; each `SKILL.md` tells agents to read it when present.

1. Create `<name>/SKILL.md`, with `name` and a `description` that starts with "Use when".
2. Run `zsh link.sh`, which links every skill into `~/.agents/skills` (Codex, Gemini CLI, Copilot CLI, opencode) and `~/.claude/skills` (Claude Code).
3. Add a row to the table above and commit.
