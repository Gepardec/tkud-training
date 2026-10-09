# Seeing the change

A layout is not done when the code looks right. Slidev composes markdown, Vue
and CSS at runtime, and the failures that matter here — an unregistered
stylesheet, a slot that never receives content, a turn cropped off the tape —
all render without an error.

## Run the decks

```bash
pnpm dev:gallery     # gallery.md — the exhaustive render, use this first
pnpm dev             # example.md — does it still read like a real talk?
```

`gallery.md` is the right deck for checking a change, because every layout and
slot is on screen. Use `example.md` to judge whether the theme still works in
narrative flow.

## Export and screenshots

```bash
pnpm build           # example.md to static
pnpm screenshot      # PNG per slide, via playwright-chromium
pnpm screenshot:gallery
```

`slidev export` needs a browser, which is why `playwright-chromium` is a dev
dependency with an `allowBuilds` entry in `pnpm-workspace.yaml`.

## The clicks caveat

The `conversation` layout is a rolling window: each click reveals a turn and
slides the stack so that turn sits flush with the bottom, with history scrolling
off the top under a gradient. Every turn is fully visible at the click that
introduces it, so the crop is temporal, not lossy — **but only if each click
becomes its own page**:

```bash
npx slidev export example.md --with-clicks
```

The packaged `pnpm export` does not pass `--with-clicks`, so a conversation
slide exports as a single page showing its final state. That is a documented
choice, not a bug; check the README's wording still matches if you change it.

Export navigates a real page per click, so the layout's measurement code runs
per page — a change to how it measures needs checking in an export, not only in
dev.
