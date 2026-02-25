---
name: "Next.js 15 Conventions"
description: "App Router patterns, Server Components, metadata, and file conventions for Next.js 15"
applyTo: "**/*.ts,**/*.tsx,**/app/**"
---
# Next.js 15 App Router Conventions

## Components
- Server Components by default — only add `'use client'` when you need interactivity, hooks, or browser APIs
- Co-locate components with their route when they're route-specific
- Shared components go in `/components`

## Routing & Files
- Use file-based routing: `page.tsx`, `layout.tsx`, `loading.tsx`, `error.tsx`, `not-found.tsx`
- Every route segment should have an `error.tsx` boundary
- Use `loading.tsx` for streaming/suspense fallbacks
- Dynamic routes use `[param]` folder naming

## SEO & Metadata
- Export a `metadata` object or `generateMetadata()` function from every `page.tsx` — never use raw `<head>` or `<title>` tags
- Use `generateMetadata()` for dynamic routes (e.g., `/tools/[slug]`)
- Include `title`, `description`, and `openGraph` in every metadata export

## Data & Rendering
- Prefer Server Actions over API routes for mutations
- Use `fetch()` with caching in Server Components for data loading
- Static generation by default — only use `force-dynamic` when data changes per-request

## Images & Assets
- Always use `next/image` `Image` component — never raw `<img>` tags
- Specify `width` and `height` or use `fill` prop
- Use `priority` on above-the-fold images

## Styling
- Tailwind CSS utility classes — no CSS modules or styled-components
- Use `cn()` helper (clsx + tailwind-merge) for conditional classes
