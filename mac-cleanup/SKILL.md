---
name: mac-cleanup
description: Safely free space on a Mac by removing confirmed disposable agent testing resources in Docker and unused temporary files or package download caches. Use when asked to clean temporary development files or reclaim disk space.
---

# Mac cleanup

Perform the cleanup when invoked; inspecting and reporting alone is insufficient.
Invocation authorizes deletion of confirmed disposable resources within this scope without another confirmation.
If ownership, contents, or current use are uncertain, skip the resource and continue with safe targets.
Do not run cleanup while merely creating, reviewing, or editing this skill.

## Local context

If `local.md` exists next to this file, read it first: it describes this machine's projects, past test stacks, and anything the owner wants kept.
Treat its names as clues for inspection, not as deletion patterns.

## Inspect before deleting

Record `df -h /System/Volumes/Data` before cleanup.
Inspect allocated sizes with `du -sk` or a shallow `du -k -d 1` of candidate directories.
Inspect processes and fresh `lsof -n -P -F n` output to identify resources in use.
Check directory identities, contents, and symlinks before removing anything.
If open-file inspection fails or permissions prevent inspection, skip affected targets.
Never follow a cache symlink into an installed tool, project, or personal directory.
Do not request administrator access just to expand this cleanup.

## Docker

Inventory all containers, images, volumes, networks, and build cache using Docker's read-only listing and space-usage commands.
If Docker Desktop is stopped, starting the installed app is authorized; allow startup to finish and re-inventory before mutations.
Do not restart or stop running workloads to enable cleanup.
Use names, Compose labels, mounts, and image references to establish which resources belong to disposable agent testing.
Remove confirmed stopped test database, backend, and proxy containers by explicit name or ID.
Remove their confirmed disposable volumes, including database data and test-only dependency volumes, once detached.
Inspect orphan volumes before deletion; a small anonymous name alone is insufficient evidence.
When necessary, identify PostgreSQL data by mounting a volume read-only in a transient `--rm --network none --read-only` container using an existing image.
Do not print database contents or secrets; directory markers such as `PG_VERSION` suffice.
Remove confirmed test networks after removing their containers.
Keep one existing reusable PostgreSQL image, preferring `postgres:17-alpine` when present.
Remove other confirmed test images and unused test build cache without deleting images or caches belonging to unrelated work.
Avoid global prune commands unless the entire affected inventory has been verified as disposable and the retained image will survive.
Never use Docker factory reset, delete `Docker.raw`, or remove unrelated resources to force disk compaction.

## Mac files

The following previously inspected locations contain regenerable downloads, not project source:

- `~/.npm/_cacache`
- `~/Library/Caches/Homebrew`
- `~/Library/Caches/CocoaPods`
- `~/Library/Caches/electron`

Re-inspect these exact locations and remove them only when no installer, updater, build, or other process is using their contents.
Keep npm configuration, credentials, and `~/.npm/_npx`, which may contain executable tools.
Skip partial downloads and pending app updates.
Inspect `/private/tmp` and the current `$TMPDIR` for abandoned agent-generated scratch files and reproducible test copies.
Delete only enumerated targets whose contents and lack of current use confirm they are disposable.
Preserve unique edits, reports, PDFs, or other outputs that might be valuable, even under a temporary directory.
Never delete everything in `/private/tmp`, `$TMPDIR`, `~/Library/Caches`, or `~/.cache` with a blanket wildcard.
Keep project directories, Git worktrees, installed `node_modules`, applications, SDKs, emulator data, backups, Trash, browser profiles, personal files, and macOS-managed data.
In particular, keep `~/.cache/codex-runtimes`, `~/.cache/gitstatus`, and Playwright browser installations.
Leave Gradle and Android resources alone while Android testing or Java build processes are running.

## Verify and report

Recheck deleted targets, Docker inventory, and `df -h /System/Volumes/Data` after cleanup.
Do not count shared Docker image/build layers twice or count a sparse VM disk's apparent size as reclaimed space.
Report measured cache/resource sizes separately from the observed change in filesystem free space when they differ.
Finish with a concise summary of space freed, resources removed, the retained database image, and material skipped targets or access limitations.
Mention that download caches regenerate when needed.
Do not commit, push, deploy, install cleanup software, or add scheduled cleanup jobs.
