# The four surfaces

The API lives in `layouts/*.vue`, `components/*.vue` and `styles/*.css`. Four
places describe it, and each rots differently when a prop is renamed. A change
is finished when all four agree — not when the layout renders.

`scripts/check-surfaces.mjs` (`pnpm check:surfaces`, and pre-push for changes
under `layouts/` or `components/`) reads props and slots straight out of the
SFCs and asserts the names appear where they must. It checks only what is
exhaustive by construction, so green means the names are present, not that the
prose is right.

## What each surface owes

**`gallery.md` — exhaustive.** Every layout, every slot, every variant. A new
layout gets a slide using it, followed by a `default` slide carrying the
markdown that produced it — that pairing is the gallery's convention, and where
a layout has no room for prose (`cover`, `section`, `contact`) the source slide
always follows. A new slot gets used on a slide. Add the slide that shows the
thing actually behaving differently, not just one that mentions it.

**`skills/gepardec-slidev-authoring/references/layouts.md` — exhaustive and
precise.** The authoring contract, and the most expensive thing in the repo to
get wrong: Slidev silently ignores frontmatter keys a layout does not declare,
so a wrong prop name here yields a slide that renders and is subtly wrong.
Write every layout name and prop as a `code span` — the check matches the
backticks, not the bare word, because prose that merely contained the word
"model" once masked a genuinely missing `model` prop.

That skill ships to repos that consume the published theme, which have the npm
package but none of this source, no `gallery.md` and no `example.md`. So the
contract has to stand alone, and its examples must stay free of real names and
addresses — they get copied verbatim into decks.

**`README.md` — representative.** The layout table near the top, plus a usage
snippet per layout. Snippets illustrate; not every prop needs to appear. Update
the table whenever the roster changes and the snippet whenever the shape an
author writes changes. CSS variable changes reach the customization section and
nothing else automatically.

**`example.md` — narrative.** A realistic sample deck, not a feature checklist.
Only touch it when a realistic deck would now be written differently. Resist
adding a slide because a feature exists — that is what `gallery.md` is for, and
padding the example is how it stops reading like a real talk.

## What the check cannot see

- **The authoring skill's `description:` enumerates layouts by name.** The check
  compares the count word ("ten layouts") against `ls layouts/*.vue`, but the
  name list — `cover`, `agenda`, `quadrants`, `section`, `statement`, `contact`,
  `conversation` — is judgment. If the new layout is one an author would name
  out loud, add it, or the skill will not trigger for what you just built.
- **A prop named but described wrongly.** Existence is all a string match
  proves. Read the surrounding sentence.
- **`README.md` and `example.md` entirely.** They are representative and
  narrative on purpose; asserting every prop against them would flag prose that
  is deliberately not an enumeration, and that noise trains everyone to skip the
  check. They are a human step.

The script under-reports on purpose. Silence beats crying wolf — the checklist
above covers the rest.
