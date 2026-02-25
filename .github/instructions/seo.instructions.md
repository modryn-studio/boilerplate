---
name: "SEO Rules"
description: "Metadata exports, Open Graph, semantic HTML, heading hierarchy, and accessibility rules"
applyTo: "**/*.ts,**/*.tsx"
---
# SEO Rules

- Every route must export a `metadata` object or `generateMetadata` function.
- Include `title`, `description`, and `openGraph` properties in all metadata.
- Open Graph must include `title`, `description`, and `images`.
- Use semantic HTML5 elements: `<main>`, `<article>`, `<section>`, `<nav>`, `<header>`, `<footer>`.
- One `<h1>` per page. Headings must follow sequential order (h1 → h2 → h3).
- Target keyword should appear in the first 100 words of body copy.
- All images must have descriptive `alt` text — never empty or decorative-only.
- No render-blocking JavaScript — keep client components minimal.
- Use `<Link>` with descriptive anchor text — avoid "click here".
