# Design

## Context

Motivation und Prüffragen: siehe `proposal.md`. Anforderungen: siehe `specs/training/demo-tooling/spec.md`.

Was bereits bekannt ist (Stand 2026-10-09, auf diesem Rechner geprüft):

- **Junie ist installiert** und hat eine Extension-/Marketplace-Funktion: `~/.junie/extensions/` enthält den Marketplace `anthropics/claude-plugins-official` mit installierter Extension `frontend-design`. Junie kann also Claude-Code-Plugins aus Marketplaces installieren. Das arc42-Toolkit ist ein solches Plugin (`.claude-plugin/plugin.json` + `marketplace.json`, siehe `documents/how-tos/arc42-toolkit-setup.md`).
- **Skill-Ordner:** Laut Junie-Doku liest Junie nur `.junie/skills/` und `~/.junie/skills/`, nicht `.claude/skills/` oder `.agents/skills/`. Ob Symlinks erkannt werden, ist undokumentiert. `~/.junie/skills/` existiert derzeit nicht.
- **MCP:** `~/.junie/mcp/` existiert, ist aber leer. Der Structurizr-MCP ist bisher nur für Claude Code in `.mcp.json` eingetragen (gehostet, HTTP, `https://mcp.structurizr.com/mcp`). Für stdio-only-Clients beschreibt `documents/how-tos/structurizr-setup.md` (1d) eine Brücke mit `mcp-remote`.
- **APM 0.30** kennt einen Runtime-Wert `intellij` und legt Skills standardmäßig im gemeinsamen Ordner `.agents/skills/` ab – den Junie laut Doku nicht liest. Ob `intellij` Junie oder das Copilot-Plugin meint, ist unklar.
- **`arc42-with-structurizr`** (in `.claude/skills/`) verweist auf `opencode.json` und `.opencode/skills/` und nutzt optional lokales `plantuml` (unter `/opt/homebrew/bin/plantuml` vorhanden).

Junie läuft in der IDE. Die eigentlichen Tests führt deshalb der Mensch in IntelliJ durch; der Agent bereitet vor, wertet aus und dokumentiert.

## Goals / Non-Goals

**Goals:**
- Für jeden Baustein (Skill-Verteilung, Skill-Ausführung, Structurizr-MCP, Orchestrierungs-Skill) einen getesteten Weg in Junie oder einen getesteten Fallback.
- Ein reproduzierbares Testprojekt, das `ki-demo-repo` später als Ausgangspunkt übernehmen kann.
- Eine Go/No-Go-Entscheidung nach festen Kriterien.

**Non-Goals:**
- Test des IntelliJ AI Assistant (Chat) als gleichwertiges Werkzeug – nur als Fallback, falls Junie scheitert.
- Inhaltliche Prüfung der arc42-Skills (Qualität der erzeugten Doku) – das gehört zu `ki-demo-repo` bzw. `ki-kapitel-phasen`.
- Self-hosted Structurizr-MCP einrichten – nur dokumentieren, dass er existiert.
- Brainstorming-Skill (→ `ki-brainstorming-skill`).

## Decisions

### D1: Testprojekt im Repo unter `spikes/junie/`
Ein eigener Ordner im Repo, der in IntelliJ als eigenes Projekt geöffnet wird. Er enthält eine fiktive `workspace.dsl` (System-Context-View), eine absichtlich fehlerhafte `broken.dsl`, eine `.junie/`-Konfiguration und ein Prüfprotokoll `PRUEFSCHRITTE.md` mit Prompts und erwarteten Ergebnissen. Alles ist fiktiv und darf committet werden.
*Alternative:* separates Projekt außerhalb des Repos – verworfen, weil es nicht versioniert wäre und `ki-demo-repo` nicht darauf aufbauen könnte.

### D2: Skill-Verteilung – Wege in fester Reihenfolge testen, erster funktionierender gewinnt

```
  1. Junie-Marketplace: arc42-toolkit als Plugin installieren
       (keine Kopien, Update ueber den Marketplace)
         | scheitert
         v
  2. Projekt-Symlinks in spikes/junie/.junie/skills/
       -> Toolkit-Klon (absolut, nicht committet)
       -> arc42-with-structurizr (relativ, committbar)
         | Symlinks werden nicht erkannt
         v
  3. Kopieren per Skript (rsync aus dem Klon) + Sync-Hinweis in der Anleitung
         |
  parallel, nur zur Klaerung: APM --runtime intellij -> wohin schreibt es?
```

Für das Training zählt, was Teilnehmende auf einem frischen Rechner am einfachsten schaffen. Deshalb kommt der Marketplace zuerst: Er wäre ein einzelner Schritt ohne lokalen Klon.
*Alternative:* nur Symlinks testen (wie im bestehenden How-to beschrieben) – verworfen, weil Teilnehmende sonst zusätzlich das Toolkit klonen müssten.

### D3: Structurizr-MCP – direkt, dann Brücke, dann ohne MCP

1. Gehosteter Server direkt als HTTP-MCP in Junie (Projekt-Konfiguration in `spikes/junie/.junie/`, falls Junie das unterstützt, sonst global).
2. Falls Junie kein HTTP-MCP kann: stdio-Brücke `npx mcp-remote https://mcp.structurizr.com/mcp` (wie `structurizr-setup.md`, 1d).
3. Fallback ohne MCP: lokale Structurizr-CLI (Homebrew, `structurizr-setup.md`, Abschnitt 5) zum Validieren und Exportieren; Junie ruft sie über das Terminal auf.

Geprüft wird jeweils: `validate` auf `workspace.dsl` → `OK`; `validate` auf `broken.dsl` → echte Fehlermeldung; ein Export (PlantUML oder Mermaid) der System-Context-View.

### D4: `arc42-with-structurizr` minimal werkzeugneutral machen
Nur die Textstellen ändern, die einen bestimmten Agenten voraussetzen (`opencode.json`, `.opencode/skills/`): Sie verweisen künftig allgemein auf „die MCP-Konfiguration deines Agenten“ bzw. „den Skill-Ordner deines Agenten“ und auf die Einrichtungsanleitungen in `documents/how-tos/`. Ablauf und Logik des Skills bleiben unverändert; die vorhandenen Evals werden nicht neu ausgeführt, weil sich das Verhalten nicht ändert.
*Alternative:* eigene Junie-Variante des Skills – verworfen, weil zwei Varianten auseinanderlaufen.

### D5: Go/No-Go-Kriterien

| Ergebnis | Bedingung | Folge |
| :---- | :---- | :---- |
| **Go** | Skills auffindbar und ausführbar (Weg 1 oder 2) **und** MCP nutzbar (Weg 1 oder 2) | Junie als Live-Tool, Setup laut Anleitung |
| **Go mit Einschränkung** | Skills nur per Kopie (Weg 3) **oder** Diagramme nur über CLI-Fallback | Junie als Live-Tool; Einschränkung in Anleitung und Trainer-Notizen; mehr Puffer im Hands-on |
| **No-Go** | Skills in Junie nicht nutzbar | Fallback AI Assistant mit `.aiassistant/rules/` prüfen; Ergebnis an `ki-kapitel-rahmen` zurückmelden (Werkzeug-Requirement) |

### D6: Ergebnisse landen in der Anleitung, nicht in einem separaten Bericht
`documents/how-tos/junie-setup.md` beschreibt den funktionierenden Weg und enthält einen Abschnitt „Getestet“ mit Datum, Junie-Version, IntelliJ-Version, Ergebnis je Prüfschritt und Go/No-Go. So bleibt eine Quelle, die bei neuen Junie-Versionen aktualisiert wird. Der Junie-Abschnitt in `arc42-toolkit-setup.md` verweist dann auf die neue Anleitung, statt die Inhalte zu doppeln.

## Risks / Trade-offs

- [Junie ändert sich schnell; ein heute funktionierender Weg bricht mit dem nächsten Update] → Versionen im Abschnitt „Getestet“ festhalten; vor jedem Training die Prüfschritte erneut durchlaufen (Hinweis für `ki-uebung-durchstich`).
- [Gehosteter Structurizr-MCP ist experimentell und kann ausfallen oder im Kundennetz blockiert sein] → CLI-Fallback (D3, Weg 3) ist Pflichtbestandteil der Anleitung, nicht optional.
- [Marketplace-Installation in Junie verhält sich anders als in Claude Code (z. B. Namespace `arc42-toolkit:arc42-section-01`)] → Aufrufe im Prüfprotokoll mit und ohne Namespace testen; das Ergebnis bestimmt die Prompts in den Übungsunterlagen.
- [Symlink mit absolutem Pfad auf den Toolkit-Klon ist nicht portabel] → nicht committen (`.git/info/exclude`); nur relative Links auf Skills im Repo committen.
- [Junie-Kontingente bzw. Modellkosten begrenzen viele Testläufe] → Prüfprotokoll mit kurzen, gezielten Prompts; Testläufe dokumentieren statt wiederholen.
- [Testergebnisse hängen vom Menschen ab, der testet; Agent kann nicht selbst prüfen] → Prüfprotokoll mit exakten Prompts und erwarteten Ergebnissen, Ergebnisse als Bildschirmtext oder Screenshot zurückmelden.
