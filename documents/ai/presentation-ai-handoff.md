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
| [`projekt-b-workflow.md`](projekt-b-workflow.md) | Praxisbeispiel Projekt B: Route-Dokumentations-Workflow (Handoff aus dem Projekt, anonymisiert, englisch) |
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
| Projekt B | Route-Doku-Workflow als Praxisbeispiel (Guideline → Skill pro Route → Compliance-Check → Skript-Gate; Orchestrator mit Sub-Agents fürs ganze Repo) |
| Workflow-Folien | Einheitliche Farblogik: gelb = Vorgabe bzw. OpenSpec, weiß umrandet = Agent/Skill, gestrichelt = automatisch ohne KI, graue Raute = Entscheidung Mensch; jeweils mit Legende |
| Deck | Eigenes Slidev-Deck in `slides-ai/`, Gepardec-Theme, erste Folie `cover`, letzte `contact` |

## Folienliste (36)

| # | Folie | Layout | Status |
|---|---|---|---|
| 1 | Dokumentation mit KI | cover | Datum fehlt |
| 2 | Agenda | agenda | fertig |
| 3 | Dein IST- und Wunschstand | default | Format offen |
| 4 | Aus der Praxis | section | fertig |
| 5 | Projekt A: arc42 aus Legacy-Code | default | Ergebnisse/Zahlen fehlen |
| 6 | Projekt A: Der Workflow | default (Mermaid, farbig + Legende) | fertig |
| 7 | Projekt B: Camel-Route-Guideline | default | anonymisierter Ausschnitt fehlt |
| 8 | Projekt B: Der Workflow | default (Mermaid, farbig + Legende) | fertig |
| 9 | Einordnung | section | fertig |
| 10 | KI bringt keine neuen Konzepte | statement | fertig |
| 11 | Vier Phasen | default (Mermaid) | fertig |
| 12 | Zwei Einstiege | default (Tabelle) | fertig |
| 13 | Die Bausteine | quadrants | fertig |
| 14 | Nützliche Skills | quadrants | fertig |
| 15 | Vertraulichkeit | default | Demo-Repo-URL fehlt |
| 16 | Phase 1 | section | fertig |
| 17 | Die KI stellt die unbequemen Fragen | default | fertig |
| 18 | Phase 2 | section | fertig |
| 19 | arc42-Toolkit ins Repo holen | default | fertig |
| 20 | Structurizr: Architektur als Code | two-cols-header | fertig |
| 21 | Structurizr-MCP | default | fertig |
| 22 | Demo: Pflanzenbewässerung | default (DSL) | fertig |
| 23 | Ergebnis: Kontextsicht | default (Mermaid) | fertig |
| 24 | Live-Demo: Structurizr mit dem Agenten | default | fertig |
| 25 | Orchestrierung: arc42-with-structurizr | default (Mermaid) | fertig |
| 26 | Phase 3 | section | fertig |
| 27 | ADRs mit KI | two-cols-header | fertig |
| 28 | Phase 4 | section | fertig |
| 29 | Workflow 1: OpenSpec | default (Mermaid) | fertig |
| 30 | Workflow 2: grill-with-docs | default (Mermaid) | fertig |
| 31 | Zwei Workflows im Vergleich | default (Tabelle) | fertig |
| 32 | Übung | section | fertig |
| 33 | Greenfield-Durchstich | default (Tabelle) | Domäne offen |
| 34 | Qualitätsziele sind Entscheidungen | statement | fertig |
| 35 | Transfer aufs eigene Projekt | default | fertig |
| 36 | Danke! | contact | fertig |

## Offene Punkte

- [ ] **Projekt B:** anonymisierten Ausschnitt einer echten Route-Doku (Decision Tree oder Diagramm) für die Folie
- [ ] **Projekt A:** konkrete Ergebnisse (Anzahl ADRs, Sektionen, Erfahrungen) und anonymisierte Ausschnitte
- [ ] **Datum** von Tag 2 (Cover)
- [ ] **Demo-Repo:** URL auf GitHub (Folie Vertraulichkeit)
- [ ] **Domäne** des fiktiven Kunden-Briefs für die Übung
- [ ] **IST-/Wunschstand:** Format (Karten, Board, Datei im Demo-Repo?) und genauer Zeitpunkt der Auswertung
- [ ] **Zeitplan:** Phase 4 auf ca. 15 min anheben, Gesamtablauf neu rechnen
- [ ] **Junie-Spike** (`openspec/changes/ki-junie-spike`): laufen Skills und Structurizr-MCP in Junie? Davon hängt die Live-Demo mit Junie ab
- [ ] **Hauptdokument:** Kapitel „Dokumentation mit KI“ an die Entscheidungen oben anpassen (nennt noch AI Assistant, nur OpenSpec, Klarnamen)
- [ ] **Brainstorming-Skill** (Phase 1, obra/superpowers) liegt nicht im Repo: einbinden oder auf der Folie als Plugin nennen
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
| 2026-11-20 | Skills der Folie „Nützliche Skills“ für Claude und Junie verlinkt (`.claude/skills/` ↔ `.junie/skills/`), kaputten Symlink `grill-with-docs` ersetzt |
| 2026-11-20 | Folie 6 „Projekt A: Der Workflow“: OpenSpec-Schritte gelb, weitere Skills weiß umrandet, Entscheidung Mensch grau, Git-Hooks gestrichelt; Legende ergänzt |
| 2026-11-20 | Projekt-B-Handoff übernommen (`projekt-b-workflow.md`), Folie 7 befüllt, Folie 8 „Projekt B: Der Workflow“ neu (farbig + Legende); Folien ab 8 um eins verschoben (jetzt 36) |
