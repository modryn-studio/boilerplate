# Modryn Studio — Copilot Context

## Who I Am
Solo builder at Modryn Studio (modrynstudio.com). I build AI-powered micro-SaaS tools
targeting trending search markets. I ship in 48 hours, not months.
I'm not a traditional developer — I build fast using AI-assisted development.

## Stack
- Next.js 15 (App Router) with TypeScript
- Tailwind CSS for styling
- Vercel for deployment
- Resend for email capture
- Vercel Analytics for tracking
- MDX for build log content
- No database yet — flat files in `/content`

## Project Structure
```
/app                    → Next.js App Router pages
/content/tools/*.json   → Tool data (adding a tool = adding a JSON file)
/content/log/*.mdx      → Build log posts (adding a post = adding an MDX file)
/components             → Reusable UI components
/lib                    → Utilities, helpers, data fetching
```

## Route Map
- `/`                → Hero + tools grid + build log preview + email signup
- `/tools`           → All tools (live, beta, coming soon)
- `/tools/[slug]`    → Individual tool page (SEO magnet + launch page)
- `/log`             → Build in public feed
- `/log/[slug]`      → Individual log post
- `/about`           → Who I am, how I work, my stack
- `/privacy`         → Privacy policy
- `/terms`           → Terms of service

## API Route Logging

Every new API route (`app/api/**/route.ts`) MUST use `createRouteLogger` from `@/lib/route-logger`.

```typescript
import { createRouteLogger } from '@/lib/route-logger';
const log = createRouteLogger('my-route');

export async function POST(req: Request): Promise<Response> {
  const ctx = log.begin();
  try {
    log.info(ctx.reqId, 'Request received', { /* key fields */ });
    // ... handler body ...
    return log.end(ctx, Response.json(result), { /* key result fields */ });
  } catch (error) {
    log.err(ctx, error);
    return Response.json({ error: 'Internal error' }, { status: 500 });
  }
}
```

- `begin()` prints the `─` separator + START line with a 5-char `reqId`
- `info()` / `warn()` log mid-request milestones
- `end()` logs ✅ with elapsed ms and returns the response
- `err()` logs ❌ with elapsed ms
- Never use raw `console.log` in routes — always go through the logger

## Dev Server

Start with `Ctrl+Shift+B` (default build task). This runs:
```
npm run dev -- --port 3000 2>&1 | Tee-Object -FilePath dev.log
```
Tell Copilot **"check logs"** at any point — it reads `dev.log` and flags errors or slow requests.

## Code Style
- Comments explain WHY, not what
- One file = one responsibility
- Prefer early returns for error handling
- Never break existing functionality when adding new features
- Leave TODO comments for post-launch polish items

## Core Rules
- Every page earns its place — no pages for businesses not yet running
- Ship fast, stay honest — empty is better than fake
- The site is a launchpad, not a portfolio
- Ugly is acceptable, broken is not — polish the core action ruthlessly
- Build in public — every launch, kill, and milestone gets a log post
- Instrument analytics before features — data from day one
- Onboard users to value in under 2 minutes
