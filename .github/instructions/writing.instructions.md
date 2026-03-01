---
name: "Writing Style"
description: "Voice patterns, log post structure, and anti-patterns for all written content — log posts, social copy, and tool descriptions"
applyTo: "**/*.mdx"
---

# Writing Style Guide

Fill this in before writing log posts. Check `brand.md` for voice rules — they apply here too.

---

## The Core Rule

State what happened. Explain why it matters. Let it stand.
No build-up. No wrap-up. No copy that sounds like a startup.

---

## Voice

**Do:**
<!-- TODO: List 3-5 voice rules specific to this product/brand.
     Examples:
     - Short sentences. One clause when one will do.
     - Personal admissions without apology: "I built this for me first."
     - Honest about what's parked, blocked, or waiting for signal -->

**Don't:**
- "Powerful", "seamless", "revolutionary", "unlock", "game-changing"
- "I'm excited to announce" / "Today I'm launching"
- "In this post I'll explain..." — just start explaining
- Never summarize what you just wrote at the end
- No exclamation points
- Don't lead with tech — lead with outcome or tension

---

## Log Post Structure

### Opening (2–3 sentences max)
State the main thing directly. No preamble.
The second sentence adds the sharpest insight or the key tension.

### Body sections
Start each section with a direct statement, not a setup sentence.
Use `##` headings. Prefer: `## What shipped`, `## Why`, `## What's next`.
One idea per paragraph. Three sentences max per paragraph before you break it.

### The close (1–3 sentences)
No summary. State where things stand, or name the next decision point, or both.

---

## Tone by Post Type

| Type | Tone |
|------|------|
| `launch` | Direct. State what shipped. Why it matters. What's parked. |
| `milestone` | Honest assessment. What the signal says. What changed. |
| `killed` | Blunt. What didn't work. What the signal was. One forward-looking line. |
| `learning` | First-person. The mistake or insight. The actual lesson, not the moral. |
| `build` | In-progress. What shipped today. What's next. No spin. |

---

## Frontmatter

```mdx
---
title: "Short, direct — no question marks, no hype"
date: "YYYY-MM-DD"
tag: "launch | milestone | killed | learning | build"
---
```

Title rules:
- Plain statement or short take — not a question, not a tease
- No year in the title (it's in the date)
- Max 10 words

---

## Social Copy (reference — full rules in `.github/prompts/social.prompt.md`)

The same voice applies to social copy. When writing social copy:
- Pull the sharpest single take from the post — not a summary
- X hook = the tension or the outcome, one line
- Reddit body = state the situation, share your take, invite pushback
- shipordie.club = peer progress update, no selling
