# DaemonCore Visual Style Guide

This document defines the visual language for DaemonCore public materials.
All design decisions should reinforce the positioning: infrastructure-grade,
calm, precise, trustworthy.

---

## Design Philosophy

DaemonCore is a governance layer — foundational infrastructure that operates
beneath the surface. The visual language reflects this:

- **Calm, not flashy** — No gradients, no glow effects, no visual noise
- **Precise, not playful** — Sharp corners, consistent spacing, clear hierarchy
- **Dark, not dramatic** — Obsidian backgrounds suggest depth without theatrics
- **Mineral, not neon** — Colors reference geological stability, not tech hype

---

## Color Palette

### Foundation Colors

| Token | Hex | Usage |
|-------|-----|-------|
| `--color-obsidian` | `#0D0E14` | Primary background |
| `--color-celestine` | `#92A8D1` | Primary text |
| `--color-amethyst` | `#6C5B7B` | Muted text, borders |

### Highlight Colors

| Token | Hex | Usage |
|-------|-----|-------|
| `--color-gold` | `#F7B801` | Primary accent, CTAs |
| `--color-gold-bright` | `#FFD54F` | Hover states |
| `--color-quartz` | `#E8D7D7` | Subtle emphasis |

### Status Colors

| Token | Hex | Usage |
|-------|-----|-------|
| `--color-healthy` | `#33FF00` | Success/active states |
| `--color-warning` | `#F7B801` | Caution states |
| `--color-critical` | `#FF5252` | Error states |

---

## Typography

### Font Families

- **Headings**: Inter (weight 300)
- **Body**: Inter (weight 400)
- **Code**: JetBrains Mono (weight 400)

### Hierarchy

| Element | Size | Weight | Tracking |
|---------|------|--------|----------|
| H1 | 3rem | 300 | -0.03em |
| H2 | 1.5rem | 300 | -0.02em |
| H3 | 1.25rem | 300 | -0.02em |
| Body | 1rem | 400 | normal |
| Small | 0.9rem | 400 | normal |
| Code | 0.9rem | 400 | normal |

### Guidelines

- **No italics** — Use `--color-quartz` for emphasis instead
- **No bold headings** — Weight 300 conveys precision
- **Tight line-height** for headings (1.2), relaxed for body (1.6)

---

## Spacing

All spacing uses an 8px quantum system:

| Token | Value | Common Usage |
|-------|-------|--------------|
| `--space-1` | 8px | Inline elements, tight gaps |
| `--space-2` | 16px | Paragraph margins, card padding |
| `--space-3` | 24px | Section gaps, card padding |
| `--space-4` | 32px | Major section breaks |
| `--space-6` | 48px | Hero padding, major sections |
| `--space-10` | 80px | Page-level vertical rhythm |

---

## Borders & Corners

- **No border-radius** — Sharp corners throughout (0px)
- **Border color**: `--color-amethyst` for standard borders
- **Border width**: 1px standard, 2px for emphasis

This sharp aesthetic reinforces the infrastructure positioning —
precision over friendliness.

---

## Motion

Transitions are functional, not decorative:

| Token | Value | Usage |
|-------|-------|-------|
| `--duration-fast` | 150ms | Hovers, micro-interactions |
| `--duration-normal` | 250ms | State changes |
| `--duration-slow` | 400ms | Page transitions |

Easing: `cubic-bezier(0.4, 0.0, 0.2, 1)` — smooth deceleration

---

## Component Patterns

### Cards

- Background: `--color-bg-elevated`
- Border: 1px `--color-amethyst`
- No shadow by default
- On hover: border becomes `--color-accent`

### Buttons

**Primary:**
- Background: `--color-accent`
- Text: `--color-bg`
- No border-radius

**Secondary:**
- Background: transparent
- Border: 1px `--color-text`
- Text: `--color-text`

### Links

- Default: `--color-text`
- Hover: `--color-accent`
- No underlines (rely on color change)

---

## Diagrams

### Stack Diagrams

- Use horizontal layers (not boxes with arrows)
- No internal component names
- Label layers with public terms only
- Colors: `--color-amethyst` for borders, `--color-accent` for DaemonCore layer

### Conceptual Diagrams

- Minimal detail
- No flow arrows showing data/control flow
- Labels should use plain English, not technical jargon
- Consistent stroke widths (1-2px)

---

## What NOT to Do

- No gradient backgrounds
- No glow effects or neon colors
- No rounded corners
- No playful illustrations
- No stock photography
- No excessive whitespace (this isn't a lifestyle brand)
- No animated backgrounds or particles
- No "tech startup" visual tropes

---

## Implementation

Design tokens are defined in `src/styles/variables.css`.

All components should reference these tokens rather than hardcoding values.
This ensures consistency and makes future refinements straightforward.

---

*This guide reflects the current visual direction. Updates should maintain
the core philosophy: infrastructure-grade software deserves infrastructure-grade
design.*
