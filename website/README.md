# DaemonCore Website

Static marketing site for DaemonCore, built with [Astro](https://astro.build) and deployed to GitHub Pages.

## Prerequisites

- Node.js 20+
- npm

## Local Development

```bash
# Install dependencies
npm install

# Start development server (http://localhost:4321)
npm run dev

# Build for production
npm run build

# Preview production build locally
npm run preview
```

## Project Structure

```
website/
├── public/              # Static assets (copied as-is to dist)
│   ├── favicon.svg
│   └── images/
├── src/
│   ├── components/      # Reusable Astro components
│   │   ├── Navbar.astro
│   │   └── Footer.astro
│   ├── content/         # Markdown content collections
│   │   └── docs/        # Documentation articles
│   ├── layouts/         # Page layouts
│   │   └── BaseLayout.astro
│   ├── pages/           # File-based routing
│   │   ├── index.astro
│   │   └── daemon/
│   └── styles/          # Global CSS
│       ├── variables.css
│       ├── base.css
│       └── components.css
├── astro.config.mjs     # Astro configuration
└── package.json
```

## Deployment

The site deploys automatically to GitHub Pages via GitHub Actions when changes are pushed to `main`.

- **Workflow**: `.github/workflows/deploy.yml`
- **Target branch**: `gh-pages`
- **Domain**: `stux.run`

### Base Path Configuration

The site is configured to deploy at the root of `stux.run`. The `astro.config.mjs` sets:

```js
site: 'https://stux.run'
```

All internal links should use absolute paths from root (e.g., `/daemon/overview`).

## Content Authoring

Content pages use Astro's content collections for type-safe markdown authoring:

1. Add markdown files to `src/content/docs/`
2. Use frontmatter for metadata (title, description, etc.)
3. Content renders automatically via dynamic routes

See `src/content/config.ts` for the content schema.

## Assets

Static assets live in `public/` and are served from the site root:

- **Favicon**: `public/favicon.svg`
- **Images**: `public/images/`
- **Diagrams**: `public/images/diagrams/`

Reference in pages: `<img src="/images/diagrams/architecture.svg" />`
