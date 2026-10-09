---
name: gepardec-slidev-theme-dev
description: "Build and extend the slidev-theme-gepardec theme itself — adding or changing a layout, a component, a slot, a prop or a CSS variable, and propagating that change to every surface that describes the API (README.md, example.md, gallery.md, the authoring skill's contract). Use this skill when working inside the theme repository, when `pnpm check:surfaces` or the pre-push hook reports drift, and before pushing anything under layouts/, components/ or styles/. This is maintainer-side work on the theme, not writing a deck with it."
---

# Working on the theme

The repo-wide invariants are in `CLAUDE.md` and always apply — official Slidev
bindings only, built-in layout names honour built-in contracts, headlines come
from the markdown flow, `feat:`/`fix:` on `main` publishes to npm. This skill is
the choreography those invariants sit inside.

## A new layout is not one file

Adding the `conversation` layout touched eleven. That is the normal footprint,
and the steps that get skipped are the quiet ones — a layout with no registered
stylesheet renders unstyled with no error at all.

1. `layouts/<name>.vue` — the layout. Props as a `defineProps<{…}>` type
   literal, one per line with a `/** doc comment */`; the check script reads
   this and the doc comments are the source for the contract doc.
2. `styles/<name>.css` if it needs more than the shared chrome, **and register
   it in `styles/index.ts`** — an unregistered stylesheet is silently dead.
3. `components/<Name>.vue` if authors write a tag by hand. Classify it in the
   `COMPONENTS` map in `scripts/check-surfaces.mjs` as `public` or `internal`;
   an unclassified component fails the check by design, because new API surface
   arrived and nobody decided whether it is public.
4. New dev tooling goes in `package.json`, and anything with a postinstall
   build step also needs `allowBuilds` in `pnpm-workspace.yaml` — that is why
   `playwright-chromium` is listed there.
5. Then the four surfaces — see `references/surfaces.md`.
6. Then verify it renders — see `references/verifying.md`.

## Decisions worth not re-litigating

These cost real work to arrive at, and the reasoning is not visible in the code:

- **The `conversation` layout never registers clicks.** It reads the classes
  `v-click` leaves on the DOM, so whatever an author writes — one turn per
  click, two, a range — is what the tape follows. There is deliberately no
  second description of the conversation to keep in sync with the turns.
- **One background component, three layouts.** `cover`, `section` and `contact`
  share `CheetahSujet` because the master reuses one background across the title
  slide, the Zwischenfolie and the contact slide. Placement lives in the
  component, not three times in the layouts.
- **Empty slots cost no space.** `quadrants` renders only the blocks it is
  given; a block that outgrows its box deepens its row rather than spilling.
  Layouts degrade by omission, never by cropping.
- **Geometry is measured, not chosen.** Margins, insets and type sizes in
  `styles/layout.css` come off the corporate master. Changing one is a brand
  decision, not a taste decision.

## Do not write the layout contract here

`skills/gepardec-slidev-authoring/references/layouts.md` is the contract — every
layout, slot, prop and edge case. This skill holds choreography and decisions
only. Anything that explains *what a layout does* belongs there, and duplicating
it here just creates a second thing to keep in sync.

## Finishing

```bash
pnpm check:surfaces
```

Green means the names are present, not that the prose is right. Read
`references/surfaces.md` for the half a string match cannot see, then commit —
`feat:` for a new layout or prop, `fix:` for a rendering bug, `chore(skills):`
for anything under `skills/`.

## Editing this skill

Authored at `.apm/skills/gepardec-slidev-theme-dev/`. `apm install` **copies**
it to `.claude/skills/`; the copy is a build artifact APM tracks by content
hash. Edit the source and re-run `apm install` — editing the copy changes what
the agent reads right now, then collides on the next install.
