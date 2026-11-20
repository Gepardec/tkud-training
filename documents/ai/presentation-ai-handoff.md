# Handoff: KI-Teil (TKuD, Tag 2)

> **Pflegeregel:** Dieses Dokument wird bei **jeder** Änderung an Deck, Demo oder Entscheidungen zum KI-Teil mitgezogen: Folienliste, Entscheidungen, offene Punkte und Änderungslog. Es ist der Einstieg für alle, die am KI-Teil weiterarbeiten – Mensch oder Agent.

Stand: 2026-11-20 · Verantwortlich: Mattias Fankhauser · Branch: `setup/mf-ai-part`

## Worum es geht

Ca. 4–5 h am zweiten Trainingstag „Technische Kommunikation und Dokumentation“. Der KI-Teil führt keine neuen Doku-Konzepte ein, sondern legt eine KI-Schicht über Tag 1: Sichten/C4, arc42 und ADRs mit KI erstellen und vor allem aktuell halten.

**Didaktischer Ablauf:** IST-/Wunschstand → Beispiel aus der Praxis → erst dann Theorie → Phasen → Übung → Transfer und Muster.

## Grobe Agenda (ca. 4:30 h)

| Start | Block | Inhalt | Folien | Dauer |
|---|---|---|---|---|
| 0:00 | Einstieg | Rahmen, IST- und Wunschstand schreiben | 1–3 | 10 min |
| 0:10 | Aus der Praxis | Projekt A (15), Projekt B (10), gemeinsames Muster (5) | 4–9 | 30 min |
| 0:40 | Einordnung | Phasen, Einstiege, zwei Leser, Bausteine, Skills, Vertraulichkeit | 10–17 | 10 min |
| 0:50 | Phase 1: Vorprojekt | Unbequeme Fragen, Live-Demo Brainstorming-Skill | 18–19 | 15 min |
| 1:05 | Phase 2: Architektur | arc42-Toolkit, Structurizr mit Live-Demo (20), Diagramm-Werkzeug (5), Übung „Finde die Fehler“ mit Auflösung (15) | 20–30 | 40 min |
| 1:45 | Pause | | | 15 min |
| 2:00 | Phase 3: Entscheiden | ADRs mit KI | 31–32 | 10 min |
| 2:10 | Phase 4: Umsetzung | Workflow OpenSpec, Workflow grill-with-docs, Vergleich | 33–36 | 15 min |
| 2:25 | Übung | Greenfield-Durchstich in Teams | 37–39 | 90 min |
| 3:55 | Transfer | Muster aus IST-/Wunschstand, eigenes Projekt, Abschluss | 40–41 | 20 min |
| 4:15 | Puffer | für Demos, Fragen, Überzug der Übung | | 15 min |
| 4:30 | Ende | | | |

> **Abgestimmt (2026-11-20):** Rahmen für den KI-Teil sind 4–5 h. Greenfield-Durchstich bleibt bei 90 min, 15 min Puffer am Ende. Gegenüber dem Kapitel im Hauptdokument (3:45 h) neu: gemeinsames Muster, zwei Leser, Diagramm-Werkzeug, Übung „Finde die Fehler“, Phase 4 mit zwei Workflows.

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
| [`../../demo/uebung-kritisch-pruefen/`](../../demo/uebung-kritisch-pruefen/arc42-auszug.md) | Übung „Finde die Fehler“: `arc42-auszug.md` für Teilnehmende, `LOESUNG.md` nur für die Moderation |
| Hauptdokument `../Technische Dokumentation und Kommunikation_ Reboot - Ausarbeitung.md` | Kapitel „Dokumentation mit KI“ (Langtext; Ablauf-Tabelle und Dauer aktuell, Rest noch Stand vor diesen Entscheidungen) |
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
| Kritisch prüfen | Übung „Finde die Fehler“ (10 min, Ende Phase 2): KI-generierter arc42-Auszug mit sechs eingebauten Fehlern, erst ohne, dann mit Agent prüfen. Deckt Lernziel 5 der Spec ab |
| Gemeinsames Muster | Nach den Praxisbeispielen: Mensch setzt Standard → Agent arbeitet ab → Gate entscheidet |
| Zwei Leser | Doku für Menschen und für Agenten (`AGENTS.md`, Guidelines, Skills) – Rückbezug auf Zielgruppen von Tag 1 |
| Diagramm-Werkzeug | Structurizr vs. Draw.io vs. Mermaid als Entscheidung, Diskussionsfrage |
| Vertraulichkeit | Vertieft: Tabelle „Was geht wohin“ (Modell-Anbieter, gehosteter MCP, Repo, Beispieldaten) |
| Workflow-Folien | Einheitliche Farblogik: gelb = Vorgabe bzw. OpenSpec, weiß umrandet = Agent/Skill, gestrichelt = automatisch ohne KI, graue Raute = Entscheidung Mensch; jeweils mit Legende |
| Deck | Eigenes Slidev-Deck in `slides-ai/`, Gepardec-Theme, erste Folie `cover`, letzte `contact` |

## Folienliste (41)

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
| 9 | Das gemeinsame Muster | default (Tabelle) | fertig |
| 10 | Einordnung | section | fertig |
| 11 | KI bringt keine neuen Konzepte | statement | fertig |
| 12 | Vier Phasen | default (Mermaid) | fertig |
| 13 | Zwei Einstiege | default (Tabelle) | fertig |
| 14 | Doku hat jetzt zwei Leser | two-cols-header | fertig |
| 15 | Die Bausteine | quadrants | fertig |
| 16 | Nützliche Skills | quadrants | fertig |
| 17 | Vertraulichkeit: Was geht wohin? | default (Tabelle) | Verweis auf interne KI-Richtlinie fehlt |
| 18 | Phase 1 | section | fertig |
| 19 | Die KI stellt die unbequemen Fragen | default | fertig |
| 20 | Phase 2 | section | fertig |
| 21 | arc42-Toolkit ins Repo holen | default | fertig |
| 22 | Structurizr: Architektur als Code | two-cols-header | fertig |
| 23 | Structurizr-MCP | default | fertig |
| 24 | Demo: Pflanzenbewässerung | default (DSL) | fertig |
| 25 | Ergebnis: Kontextsicht | default (Mermaid) | fertig |
| 26 | Live-Demo: Structurizr mit dem Agenten | default | fertig |
| 27 | Orchestrierung: arc42-with-structurizr | default (Mermaid) | fertig |
| 28 | Welches Diagramm-Werkzeug? | default (Tabelle) | fertig |
| 29 | Übung: Finde die Fehler | default | fertig |
| 30 | Auflösung | default (Tabelle) | fertig |
| 31 | Phase 3 | section | fertig |
| 32 | ADRs mit KI | two-cols-header | fertig |
| 33 | Phase 4 | section | fertig |
| 34 | Workflow 1: OpenSpec | default (Mermaid) | fertig |
| 35 | Workflow 2: grill-with-docs | default (Mermaid) | fertig |
| 36 | Zwei Workflows im Vergleich | default (Tabelle) | fertig |
| 37 | Übung | section | fertig |
| 38 | Greenfield-Durchstich | default (Tabelle) | Domäne offen |
| 39 | Qualitätsziele sind Entscheidungen | statement | fertig |
| 40 | Transfer aufs eigene Projekt | default | fertig |
| 41 | Danke! | contact | fertig |

## Offene Punkte

- [ ] **Projekt B:** anonymisierten Ausschnitt einer echten Route-Doku (Decision Tree oder Diagramm) für die Folie
- [ ] **Projekt A:** konkrete Ergebnisse (Anzahl ADRs, Sektionen, Erfahrungen) und anonymisierte Ausschnitte
- [ ] **Datum** von Tag 2 (Cover)
- [ ] **Demo-Repo:** URL auf GitHub (Folie Vertraulichkeit)
- [ ] **Domäne** des fiktiven Kunden-Briefs für die Übung
- [ ] **IST-/Wunschstand:** Format (Karten, Board, Datei im Demo-Repo?) und genauer Zeitpunkt der Auswertung
- [ ] **Junie-Spike** (`openspec/changes/ki-junie-spike`): laufen Skills und Structurizr-MCP in Junie? Davon hängt die Live-Demo mit Junie ab
- [ ] **Hauptdokument:** Kapitel „Dokumentation mit KI“ an die Entscheidungen oben anpassen (nennt noch AI Assistant, nur OpenSpec, Klarnamen)
- [ ] **Brainstorming-Skill** (Phase 1, obra/superpowers) liegt nicht im Repo: einbinden oder auf der Folie als Plugin nennen
- [ ] **Vertraulichkeit:** Verweis auf interne KI-Richtlinie bzw. freigegebene Werkzeuge ergänzen
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
| 2026-11-20 | Neu: „Das gemeinsame Muster“, „Doku hat jetzt zwei Leser“, „Vertraulichkeit: Was geht wohin?“ (ersetzt alte Folie), „Welches Diagramm-Werkzeug?“, Übung „Finde die Fehler“ + Auflösung (`demo/uebung-kritisch-pruefen/`); jetzt 41 Folien |
| 2026-11-20 | Grobe Agenda mit Zeiten und Folienbereichen ergänzt; abgestimmt: Rahmen 4–5 h, Greenfield-Durchstich 90 min, 15 min Puffer, Ende 4:30 |
| 2026-11-20 | Agenda übertragen: Zeiten in die Moderationsnotizen der Agenda-Folie, Ablauf-Tabelle und Dauer (ca. 4:30 h) im Kapitel des Hauptdokuments; dort Praxisbeispiele als Projekt A/B anonymisiert |
