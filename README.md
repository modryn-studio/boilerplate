<picture>
  <img alt="Modryn Studio Boilerplate" src="public/brand/banner.png">
</picture>

# Modryn Studio — Boilerplate

Next.js starter for every Modryn Studio product. Pre-wired with the full stack, conventions, and Copilot context so new projects start at production-ready, not zero.

→ [modrynstudio.com](https://modrynstudio.com)

---

Next.js 16 · TypeScript · Tailwind CSS v4 · Vercel · GA4 · Resend

---

## Setup

### 1. Brand assets

Drop two files into `public/brand/`:

| File | Size | Notes |
|---|---|---|
| `logomark.png` | 1024×1024 | Dark mark, transparent background |
| `banner.png` | 1280×320 | README header image |

Then run the asset generator (requires [ImageMagick](https://imagemagick.org)):

```powershell
.\scripts\generate-assets.ps1
```

This produces all favicon, icon, and OG image files automatically. Re-run any time you update the logomark.

### 2. Fill in project context

Edit these files before running `/project-init`:

- `context.md` — product description, routes, stack additions
- `brand.md` — voice, colors, copy examples
- `src/config/site.ts` — site name, URL, OG metadata, brand colors

Then re-run the asset generator once `site.ts` is filled in — it reads the site name for the OG image.

### 3. Environment variables

Copy `.env.example` to `.env.local` and fill in:

```
NEXT_PUBLIC_GA_MEASUREMENT_ID=
GMAIL_USER=
GMAIL_APP_PASSWORD=
FEEDBACK_TO=
RESEND_API_KEY=
RESEND_SEGMENT_ID=
```

### 4. Install and run

```bash
npm install
npm run dev
```
