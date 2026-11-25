# Prompt: Live-Demo Phase 2 – Zoo-Verwaltung dokumentieren

Wird zu Beginn von Phase 2 gestartet (Folie „Live-Demo: Zoo-Verwaltung dokumentieren“). Während der Agent arbeitet, laufen die Folien zu Structurizr, arc42-Toolkit und Orchestrierung. Danach kommt das Ergebnis.

- **Repo:** `~/IdeaProjects/openspec-quarkus-angular` (GitHub `Gepardec/openspec-quarkus-angular`)
- **Startpunkt:** Tag `arc42-live-start` (Commit `6898c74` = `1b80931` plus aktualisierter ADR-Skill: Skills und Structurizr-MCP sind da, noch keine Doku)
- **Fallback:** fertiges Ergebnis auf Branch `arc42`

## Vorbereitung

```bash
cd ~/IdeaProjects/openspec-quarkus-angular
git switch -C live-demo arc42-live-start
git status && git clean -n docs/   # Reste aus einer Probe entfernen
which plantuml
```

Alles, was der Prompt braucht, ist im Commit enthalten:
- **Skills:** unter `.agents/skills/`, per Symlink in `.claude/skills/` und `.junie/skills/`. Das sind arc42-with-structurizr, arc42-section-01 bis -12, arc42-adr, arc42-lint und arc42-review.
- **Structurizr-MCP:** in `.mcp.json`.

Nicht im Repo ist die Freigabe des MCP-Servers. Sie steht nur lokal in `.claude/settings.local.json`. Auf einem frischen Klon fragt Claude Code deshalb beim ersten Start, ob es den Server `structurizr` verwenden darf. Das vor dem Training einmal bestätigen und mit `/mcp` prüfen.

Startbefehl und Freigaben für Claude Code: nach dem Probelauf festlegen (TODO).

## Prompt

```text
Dokumentiere die Architektur dieser Anwendung vollständig nach arc42. Nutze den Skill arc42-with-structurizr und die arc42-Section-Skills.
- Arbeite ohne Rückfragen, ich bin die nächsten 20 Minuten nicht erreichbar. Was der Code nicht hergibt (Qualitätsziele, Stakeholder, Randbedingungen, Motive hinter Entscheidungen), schreibst du als „Annahme:“ in die Sektion und sammelst es als offene Frage in docs/architecture/README.md.
- Quelle ist nur der Code auf diesem Stand. Offene Changes unter openspec/changes/ sind nicht umgesetzt und gehören nicht in die Doku.
- Alle C4-Sichten (Kontext, Container, Komponenten, Laufzeit, Verteilung) in einem einzigen docs/architecture/diagrams/structurizr/workspace.dsl. Mit dem Structurizr-MCP validieren, als PlantUML exportieren, als SVG rendern und in die Sektionen einbinden.
- Im Code erkennbare Architekturentscheidungen als ADRs mit arc42-adr, Motiv als „rekonstruiert, unbestätigt“ markieren.
- Zum Schluss arc42-lint und arc42-review ausführen und die Befunde auflisten. Nichts mehr nachfragen.
```

## Nachbereitung (für den nächsten Workshop)

Das Ergebnis der Demo ist Wegwerfmaterial. Den Branch `live-demo` nicht pushen. Der Startpunkt bleibt der Tag `arc42-live-start`, der fertige Stand der Branch `arc42`.

```bash
cd ~/IdeaProjects/openspec-quarkus-angular
# optional: Ergebnis zum Nachlesen sichern, z. B. als Patch außerhalb des Repos
git add -A && git diff --cached > ~/zoo-live-demo-$(date +%F).patch
# aufräumen
git reset --hard && git clean -fd
git switch main
git branch -D live-demo
# falls ein Fallback-Worktree angelegt wurde
git worktree remove ../zoo-arc42
```

Danach:
- Hat sich am Prompt etwas bewährt oder als Problem gezeigt (Laufzeit, Rückfragen, Fehlableitungen), diese Datei **und** die Notizen der Folie „Live-Demo: Zoo-Verwaltung dokumentieren“ anpassen.
- Typische Fehlableitungen dieses Laufs als Beispiele in die Notizen der Folie „Ergebnis: Zoo-Verwaltung“ übernehmen.
- Ändern sich Skills im Training-Repo (`.claude/skills/arc42-*`), müssen sie ins Zoo-Repo nach `.agents/skills/` kopiert werden. Danach den Tag neu setzen: `git tag -f arc42-live-start <neuer Commit>` und `git push -f origin arc42-live-start`. Bei arc42-Toolkit-Updates genauso.
- Änderungen im Handoff `documents/ai/presentation-ai-handoff.md` im Änderungslog festhalten.

> Der Prompt steht gleichlautend in den Moderationsnotizen der Folie. Bei Änderungen beide Stellen anpassen.
