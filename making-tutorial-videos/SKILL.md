---
name: making-tutorial-videos
description: Use when making, re-recording, re-voicing, or re-editing tutorial or demo videos of a mobile app, AI voiceover or narration (including Hindi), Android emulator screen recordings, or a combined YouTube course video, or when touching a project's demo-recordings/ folder.
---

# Making tutorial videos

## Overview

Short app tutorials made by a pipeline: adb drives the app on an Android emulator against a local backend and records it, a text-to-speech voice reads the narration, and Remotion cuts the footage to the narration and renders.
If `local.md` exists next to this file, read it first: it names the project, its pipeline folder, its commands, and its voice and brand settings.
The pipeline's own READMEs hold the commands and file formats; this skill holds the editorial rules and the traps.

## Steps

1. Show only features on the branch the next release comes from, and record from that branch.
2. Start the local database, backend and emulator, and point the app at the local API; a release bundle usually needs a temporary allow-list edit that you revert afterwards.
3. For a new video, script the flow (taps by label, named narration beats), write one narration line per beat, and add camera zooms.
4. Probe the flow first so every tap resolves, then record it on a freshly seeded account; re-probe whenever the flow or the app's screens change.
5. Synthesize the narration, cut the footage to it, render, review a contact sheet of the render, adjust zooms and cuts, and render again.
6. For the long video, join the chapters and regenerate the chapter timestamps.
7. Copy finished files to the deliverables folder; copy anywhere else only when asked, with the next version number in the name.
8. Revert the temporary edits and stop the servers.

## Style

- Professional only: no cartoonish transitions or effects, no visible typing (cut to the filled-in value), and loading waits cut with a short dissolve.
- Each video shows where the feature lives and one clear path through it; around 30 seconds, not a hard limit.
- One voice for the whole series, chosen by the owner from samples.
- Give a line two spellings when needed: `say` is what the voice reads (the brand spelled phonetically), `show` is the caption.
  Put the brand at the start of a sentence or right after a comma; glued to the word before it, the voice slurs it.
  Verify every line with speech-to-text and retake until the brand is heard right.
- Hinglish: app labels stay in Latin script in captions; English words the voice mangles are respelled in Devanagari in `say`.
- Keep the opening line under about 4 seconds.
- Demo data and photos: no human faces, no stereotype imagery, no brand logos, and each photo matches its item.
- Plain hyphens, never em dashes, in captions and narration.

## Traps

- Local only: never record against production, never deploy, never migrate a remote database.
- An agent's shell may not load the user's zshrc: export `ANDROID_HOME` and use the SDK's adb.
- Signing in while Metro is still bundling fails quietly, and a System UI ANR dialog can appear; tap "Wait", let the first bundle finish, then start again on a fresh account.
- Drive the app by accessibility label from UI dumps, never by blind coordinates: a tap during loading opens stray sheets.
  A label shown twice needs an index, and a wait must name text that exists only on the destination screen.
- A seed script that ignores unknown options hides missing setup: check the seeded account before recording.
- In zsh, `$var:a…` is parsed as a modifier; write `${var}`.
- Keep text-to-speech and sound-effect API keys in a file outside the repo; never print or commit them.
- Footage recorded before a bug fix shows the bug: frame it out with a camera zoom or re-record.

## Done when

- A contact sheet of the rendered video shows no keyboard over a button, no dev toast, no clipped text, and every zoom lands on the control being tapped.
- The speech-to-text transcripts match every line, and the brand is heard right.
- If the course changed, the chapter timestamps were regenerated and a still of the finale shows every topic fitting, with a recap line that is still true.
- `git status` shows no leftover temporary edit.
