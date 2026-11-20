# Handoff: KI-Teil (TKuD, Tag 2)

> **Pflegeregel:** Dieses Dokument wird bei **jeder** Änderung an Deck, Demo oder Entscheidungen zum KI-Teil mitgezogen: Folienliste, Entscheidungen, offene Punkte und Änderungslog. Es ist der Einstieg für alle, die am KI-Teil weiterarbeiten – Mensch oder Agent.

Stand: 2026-11-20 · Verantwortlich: Mattias Fankhauser · Branch: `setup/mf-ai-part`

## Worum es geht

Halber Tag (ca. 3:45 h) am zweiten Trainingstag „Technische Kommunikation und Dokumentation“. Der KI-Teil führt keine neuen Doku-Konzepte ein, sondern legt eine KI-Schicht über Tag 1: Sichten/C4, arc42 und ADRs mit KI erstellen und vor allem aktuell halten.

**Didaktischer Ablauf:** IST-/Wunschstand → Beispiel aus der Praxis → erst dann Theorie → Phasen → Übung → Transfer und Muster.

## Dateien

| Datei | Inhalt |
|---|---|
| [`ai-part.md`](ai-part.md) | Arbeitsdokument: Vorgaben, initiale Notizen, offene Punkte |
| [`presentation-ai-handoff.md`](presentation-ai-handoff.md) | dieses Dokument |
| [`projekt-a-workflow.md`](projekt-a-workflow.md) | Praxisbeispiel Projekt A: agentischer Workflow (anonymisiert) |
| [`../../slides-ai/slides.md`](../../slides-ai/slides.md) | das Slidev-Deck |
| [`../../slides-ai/README.md`](../../slides-ai/README.md) | Befehle (dev, build, export) und Konventionen fürs Deck |
| [`../../demo/structurizr/workspace.dsl`](../../demo/structurizr/workspace.dsl) | Structurizr-Demo: Pflanzenbewässerung (fiktiv) |
| Hauptdokument `../Technische Dokumentation und Kommunikation_ Reboot - Ausarbeitung.md` | Kapitel „Dokumentation mit KI“ (Langtext, Stand vor diesen Entscheidungen) |
| `../../openspec/specs/training/ki-kapitel/spec.md` | Anforderungen ans KI-Kapitel |
| `../how-tos/` | Setup Junie, arc42-Toolkit, Structurizr |

## Entscheidungen

| Thema | Entscheidung |
|---|---|
| Werkzeuge | Showcase und alle Übungen mit **Junie oder Claude**. IntelliJ AI Assistant ist raus. |
| Einstieg | **TKuD-IST-/Wunschstand:** Jede:r schreibt IST- und Wunschstand nieder. Auswertung auf Muster im Transfer am Ende. |
| Anonymisierung | Praxisbeispiele auf Folien und in Unterlagen nur anonymisiert: Media Data → **Projekt A**, MM → **Projekt B**. Keine Kunden- oder Projektnamen (auch nicht ITSV/SAK) auf Folien. |
| Structurizr | Erklärung (ein Modell, viele Sichten, MCP) plus Live-Demo am fiktiven System **Pflanzenbewässerung** aus Tag 1 |
| Doku aktuell halten | **Zwei Workflows:** OpenSpec (spec-driven, inkl. `arc42-change-sync`) und **grill-with-docs** (Interview, Glossar und ADRs entstehen nebenbei). Phase 4 dafür ca. 15 statt 10 min. |
| Skill-Beispiele | grilling / grill-me, grill-with-docs, domain-modeling, arc42-adr / arc42-change-sync |
| Projekt A | Agentischer Workflow aus dem Projekt als Praxisbeispiel (OpenSpec → arc42-Sync bei Relevanz → QS → Commit) |
| Deck | Eigenes Slidev-Deck in `slides-ai/`, Gepardec-Theme, erste Folie `cover`, letzte `contact` |

## Folienliste (35)

| # | Folie | Layout | Status |
|---|---|---|---|
| 1 | Dokumentation mit KI | cover | Datum fehlt |
| 2 | Agenda | agenda | fertig |
| 3 | Dein IST- und Wunschstand | default | Format offen |
| 4 | Aus der Praxis | section | fertig |
| 5 | Projekt A: arc42 aus Legacy-Code | default | Ergebnisse/Zahlen fehlen |
| 6 | Projekt A: Der Workflow | default | fertig |
| 7 | Projekt B: Camel-Route-Guideline | default | **Platzhalter** |
| 8 | Einordnung | section | fertig |
| 9 | KI bringt keine neuen Konzepte | statement | fertig |
| 10 | Vier Phasen | default (Mermaid) | fertig |
| 11 | Zwei Einstiege | default (Tabelle) | fertig |
| 12 | Die Bausteine | quadrants | fertig |
| 13 | Nützliche Skills | quadrants | fertig |
| 14 | Vertraulichkeit | default | Demo-Repo-URL fehlt |
| 15 | Phase 1 | section | fertig |
| 16 | Die KI stellt die unbequemen Fragen | default | fertig |
| 17 | Phase 2 | section | fertig |
| 18 | arc42-Toolkit ins Repo holen | default | fertig |
| 19 | Structurizr: Architektur als Code | two-cols-header | fertig |
| 20 | Structurizr-MCP | default | fertig |
| 21 | Demo: Pflanzenbewässerung | default (DSL) | fertig |
| 22 | Ergebnis: Kontextsicht | default (Mermaid) | fertig |
| 23 | Live-Demo: Structurizr mit dem Agenten | default | fertig |
| 24 | Orchestrierung: arc42-with-structurizr | default (Mermaid) | fertig |
| 25 | Phase 3 | section | fertig |
| 26 | ADRs mit KI | two-cols-header | fertig |
| 27 | Phase 4 | section | fertig |
| 28 | Workflow 1: OpenSpec | default (Mermaid) | fertig |
| 29 | Workflow 2: grill-with-docs | default (Mermaid) | fertig |
| 30 | Zwei Workflows im Vergleich | default (Tabelle) | fertig |
| 31 | Übung | section | fertig |
| 32 | Greenfield-Durchstich | default (Tabelle) | Domäne offen |
| 33 | Qualitätsziele sind Entscheidungen | statement | fertig |
| 34 | Transfer aufs eigene Projekt | default | fertig |
| 35 | Danke! | contact | fertig |

## Offene Punkte

- [ ] **Projekt B (MM, Camel-Route-Guideline):** Ausgangslage, KI-Einsatz, Ergebnis – Material fehlt
- [ ] **Projekt A:** konkrete Ergebnisse (Anzahl ADRs, Sektionen, Erfahrungen) und anonymisierte Ausschnitte
- [ ] **Datum** von Tag 2 (Cover)
- [ ] **Demo-Repo:** URL auf GitHub (Folie Vertraulichkeit)
- [ ] **Domäne** des fiktiven Kunden-Briefs für die Übung
- [ ] **IST-/Wunschstand:** Format (Karten, Board, Datei im Demo-Repo?) und genauer Zeitpunkt der Auswertung
- [ ] **Zeitplan:** Phase 4 auf ca. 15 min anheben, Gesamtablauf neu rechnen
- [ ] **Junie-Spike** (`openspec/changes/ki-junie-spike`): laufen Skills und Structurizr-MCP in Junie? Davon hängt die Live-Demo mit Junie ab
- [ ] **Hauptdokument:** Kapitel „Dokumentation mit KI“ an die Entscheidungen oben anpassen (nennt noch AI Assistant, nur OpenSpec, Klarnamen)
- [ ] **Skills im Repo vervollständigen:** grilling, domain-modeling, arc42-adr, arc42-change-sync liegen nur unter `.junie/skills/`, nicht unter `.claude/skills/`; `.claude/skills/grill-with-docs` ist ein kaputter Symlink auf das leere `.agents/skills/`; der Brainstorming-Skill (Phase 1, obra/superpowers) fehlt im Repo
- [ ] Freigabe, ob Kundennamen (ITSV/SAK) im Transfer genannt werden dürfen – bis dahin generisch

## Konventionen fürs Deck

- du-Ansprache, Doppelpunkt-Gendern, kurze Bullets (max. ca. 5 pro Folie)
- Moderationsnotizen als `<!-- Moderation: … -->`, offene Punkte darin mit `OFFEN` oder `TODO`
- Dichte Folien: `class: gepardec-text-sm`
- Headline ist immer die erste Überschrift, kein `title:` im Frontmatter
- Nach Änderungen: `pnpm build` und PNG-Export prüfen (Überlauf ist im Markdown nicht sichtbar), siehe `slides-ai/README.md`

## Änderungslog

| Datum | Änderung |
|---|---|
| 2026-11-20 | Arbeitsdokument `ai-part.md` angelegt, Vorgaben Junie/Claude und IST-/Wunschstand |
| 2026-11-20 | Slidev-Deck `slides-ai/` mit Gepardec-Theme (27 Folien), README |
| 2026-11-20 | Structurizr-Erklärung und Demo (`demo/structurizr/`), zweiter Workflow grill-with-docs, Folie „Nützliche Skills“ |
| 2026-11-20 | Projekt-A-Workflow anonymisiert übernommen (`projekt-a-workflow.md`), Folie 5 befüllt, Folie 6 „Projekt A: Der Workflow“ neu; Handoff-Dokument angelegt |
| 2026-11-20 | Folie „Nützliche Skills“: Quellen-Links (mattpocock/skills) und Pfade der eigenen Skills ergänzt |
