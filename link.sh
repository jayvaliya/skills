#!/bin/zsh
# Link every skill in this folder into the folders agents read.
# ~/.agents/skills: Codex, Gemini CLI, Copilot CLI, opencode. ~/.claude/skills: Claude Code.
set -e
root=${0:A:h}
for dir in ~/.agents/skills ~/.claude/skills; do
  mkdir -p $dir
  for skill in $root/*/SKILL.md(N); do
    name=${skill:h:t}
    target=$dir/$name
    if [[ -e $target && ! -L $target ]]; then
      echo "skip $target: a real folder is in the way" >&2
      continue
    fi
    ln -sfn ${skill:h} $target
    echo "$target -> ${skill:h}"
  done
done
