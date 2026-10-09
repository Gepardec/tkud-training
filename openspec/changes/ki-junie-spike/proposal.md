# Proposal

## Why

Live-Demo und Hands-on des KI-Kapitels laufen mit JetBrains Junie bzw. IntelliJ AI Assistant (siehe Change `ki-kapitel-rahmen`). Alle bisherigen Skills und der Structurizr-MCP sind aber nur in Claude Code eingerichtet und erprobt. Ob sie in Junie genauso funktionieren, ist bisher nur recherchiert, nicht getestet – und die Quellen widersprechen sich teilweise. Bevor Brainstorming-Skill, Demo-Repo und Phasentexte darauf aufbauen, muss das geklärt sein.

## What Changes

- Spike in Junie (IDE) mit einem frischen Testprojekt, der klärt:
  - **Skill-Erkennung:** Liest Junie Skills aus `.junie/skills/`? Werden Symlinks erkannt? Liest Junie wirklich *nicht* `.claude/skills/` bzw. `.agents/skills/` (laut `documents/how-tos/arc42-toolkit-setup.md` nicht; eine Websuche behauptete Unterstützung für `.agents/skills/`)?
  - **arc42-Toolkit:** Lässt sich ein Section-Skill (z. B. `arc42-section-01`) in Junie aufrufen und führt er sein Frage-zuerst-Verhalten aus?
  - **Structurizr-MCP:** Lässt sich der gehostete HTTP-Server `https://mcp.structurizr.com/mcp` in Junie bzw. im AI Assistant einbinden, und liefern `validate` und ein Export ein Ergebnis?
  - **Orchestrierungs-Skill:** Läuft `arc42-with-structurizr` in Junie durch? Er verweist derzeit auf `opencode.json` und erwartet eine lokale `plantuml`-Installation.
  - **Verteilung:** Kann APM (`apm.yml`) Skills für Junie ausrollen, oder braucht es Symlinks bzw. ein Kopierskript?
- Ergebnis als How-to `documents/how-tos/junie-setup.md` im Stil der bestehenden How-tos: was funktioniert, wie man es einrichtet, was nicht geht und welcher Fallback gilt.
- Falls nötig, minimale Anpassungen, damit die Skills werkzeugneutral werden (z. B. MCP-Hinweis in `arc42-with-structurizr` ohne Bindung an `opencode.json`).
- Go/No-Go-Empfehlung für Junie als Live-Tool; bei No-Go ein konkreter Fallback (z. B. AI Assistant mit `.aiassistant/rules/`, Structurizr-DSL ohne MCP).

## Capabilities

### New Capabilities
- `training/demo-tooling`: Anforderungen an die Werkzeugumgebung für Demo und Hands-on des Trainings – welche Skills und MCP-Server in Junie verfügbar sein müssen, wie sie eingerichtet werden und welcher Fallback gilt.

### Modified Capabilities
<!-- keine -->

## Impact

- **Neu:** `documents/how-tos/junie-setup.md`.
- **Eventuell angepasst:** `.claude/skills/arc42-with-structurizr/SKILL.md` (werkzeugneutraler MCP-Hinweis), `apm.yml` (Ziel für Junie, falls APM es unterstützt), Junie-Abschnitt in `documents/how-tos/arc42-toolkit-setup.md` (offene Punkte schließen).
- **Abhängigkeiten:** Junie-Lizenz und -Plugin in IntelliJ, lokaler Klon des arc42-Toolkits (`~/IdeaProjects/arc42-toolkit`), gehosteter Structurizr-MCP.
- **Datenschutz:** Der gehostete Structurizr-MCP erhält die gesendete DSL. Im Spike und im Training nur fiktive Systeme verwenden.
- **Folge-Changes:** `ki-brainstorming-skill`, `ki-demo-repo` und `ki-kapitel-phasen` übernehmen das Setup und den Fallback aus diesem Spike.
- **Manuelle Arbeit:** Junie läuft in der IDE. Die Tests muss der Mensch in IntelliJ durchführen; der Agent bereitet Testprojekt, Prüfschritte und Dokumentation vor.
