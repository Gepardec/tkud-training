# Slides: Dokumentation mit KI (TKuD, Tag 2)

Slidev-Deck für den KI-Teil des Trainings „Technische Kommunikation und Dokumentation“, im Gepardec-Branding ([`@gepardec/slidev-theme-gepardec`](https://www.npmjs.com/package/@gepardec/slidev-theme-gepardec)).

Inhaltliche Grundlage: [`documents/ai/ai-part.md`](../documents/ai/ai-part.md) und der Abschnitt „Dokumentation mit KI“ im Hauptdokument unter `documents/`.

## Voraussetzungen

- Node.js (getestet mit v26)
- pnpm (getestet mit v12)

## Befehle

Alle Befehle im Ordner `slides-ai/` ausführen.

| Befehl | Wirkung |
|---|---|
| `pnpm install` | Abhängigkeiten installieren (beim ersten Mal; lädt auch Chromium für den Export) |
| `pnpm dev` | Dev-Server starten, Deck öffnet sich unter <http://localhost:3030> |
| `pnpm build` | Statische Web-Version nach `dist/` bauen |
| `pnpm export` | PDF exportieren (`slides-export.pdf`) |

Nützliche Varianten:

```bash
# Präsentationsmodus mit Moderationsnotizen
# Im laufenden Dev-Server: http://localhost:3030/presenter

# Folien als PNG, z. B. um Überlauf zu prüfen
pnpm exec slidev export slides.md --format png --output export-png

# Nur bestimmte Folien exportieren
pnpm exec slidev export slides.md --range 1,5-8

# PowerPoint-Export
pnpm exec slidev export slides.md --format pptx
```

## Aufbau

```
slides-ai/
├── slides.md              Das Deck (Headmatter: Theme, erste Folie layout: cover)
├── public/
│   └── contact_mfankhauser.jpg   Foto für die contact-Folie
├── package.json
└── pnpm-workspace.yaml    erlaubt das Build-Skript von playwright-chromium
```

Logo, Schriften und Gepard-Sujet bringt das Theme mit. Eigene Bilder kommen nach `public/` und werden mit führendem Slash referenziert, z. B. `/contact_mfankhauser.jpg`.

## Folien schreiben

- **Layouts des Themes:** `cover`, `section`, `agenda`, `default`, `quadrants`, `two-cols`, `two-cols-header`, `statement`, `contact`, `conversation`, `document`. Die Doku zu allen Layouts steht im README des Themes.
- **Headline:** Die erste Überschrift einer Folie ist die Headline. Es gibt kein `title:` im Frontmatter.
- **Platz:** Auf eine `default`-Folie passen gut fünf Bullets, höchstens acht. Für dichte Folien `class: gepardec-text-sm` setzen.
- **Moderationsnotizen:** Als HTML-Kommentar ans Ende der Folie, im Format `<!-- Moderation: … -->`. Offene Punkte stehen dort mit `OFFEN` oder `TODO`.
- **Vertraulichkeit:** Praxisbeispiele aus Kundenprojekten stehen auf den Folien nur anonymisiert.

## Hinweise

- `dist/` und `node_modules/` sind nicht im Repo.
- Kommt beim `pnpm install` ein Fehler zu Build-Skripten, prüfen, ob `pnpm-workspace.yaml` vorhanden ist.
- Das Deck für Tag 1 liegt in [`../slides/`](../slides/).
