# Handoff: KI-Teil (TKuD, Tag 2)

> **Pflegeregel:** Dieses Dokument wird bei **jeder** Änderung an Deck, Demo oder Entscheidungen zum KI-Teil mitgezogen: Folienliste, Entscheidungen, offene Punkte und Änderungslog. Es ist der Einstieg für alle, die am KI-Teil weiterarbeiten – Mensch oder Agent.

Stand: 2026-11-25 · Verantwortlich: Mattias Fankhauser · Branch: `setup/mf-ai-part`

## Worum es geht

Ca. 4–5 h am zweiten Trainingstag „Technische Kommunikation und Dokumentation“. Der KI-Teil führt keine neuen Doku-Konzepte ein, sondern legt eine KI-Schicht über Tag 1: Sichten/C4, arc42 und ADRs mit KI erstellen und vor allem aktuell halten.

**Didaktischer Ablauf:** IST-/Wunschstand → Beispiel aus der Praxis → erst dann Theorie → Phasen (mit Live-Demos) → Transfer und Muster.

## Grobe Agenda (ca. 3:20 h)

| Start | Block | Inhalt | Folien | Dauer |
|---|---|---|---|---|
| 0:00 | Einstieg | Rahmen (3), IST-/Wunschstand auf Karten schreiben (8), gemeinsam clustern und benennen (9) | 1–3 | 20 min |
| 0:20 | Aus der Praxis | Projekt A (15), Projekt B (10), gemeinsames Muster (5) | 4–9 | 30 min |
| 0:50 | Einordnung | Phasen, Einstiege, zwei Leser, Bausteine, Skills | 10–16 | 10 min |
| 1:00 | Phase 1: Vorprojekt | Unbequeme Fragen, Live-Demo grill-me + arc42-section-01/-10 | 17–18 | 15 min |
| 1:15 | Phase 2: Architektur | Live-Demo Zoo starten (3), während der Agent läuft: Structurizr mit Greenfield-Beispiel (10), arc42-Toolkit (5), Orchestrierung (2); Ergebnis Zoo (10) mit Statement „Qualitätsziele sind Entscheidungen“, Diagramm-Werkzeug (5), typische Fehler in KI-Doku (5) | 19–30 | 40 min |
| 1:55 | Pause | | | 15 min |
| 2:10 | Phase 3: Entscheiden | ADR-Grundlagen: Formate, Skills, Werkzeuge (5), ADRs mit KI (10) | 31–33 | 15 min |
| 2:25 | Phase 4: Umsetzung | Workflow OpenSpec, Workflow grill-with-docs, Vergleich | 34–37 | 15 min |
| 2:40 | Transfer | Cluster besprechen (10), Wunschstand optimieren + erster Schritt (10), Abschluss (5) | 38–39 | 25 min |
| 3:05 | Puffer | für Demos (v. a. Laufzeit der Zoo-Demo) und Fragen | | 15 min |
| 3:20 | Ende | | | |

> **Abgestimmt (2026-11-20):** Rahmen für den KI-Teil sind 4–5 h. Greenfield-Durchstich bleibt bei 90 min, 15 min Puffer am Ende. Gegenüber dem Kapitel im Hauptdokument (3:45 h) neu: gemeinsames Muster, zwei Leser, Diagramm-Werkzeug, Übung „Finde die Fehler“, Phase 4 mit zwei Workflows.

> **Abgestimmt (2026-11-25, später):** Übung **Greenfield-Durchstich gestrichen** (90 min, Folien „Übung“, „Greenfield-Durchstich“, „Qualitätsziele sind Entscheidungen“). Der KI-Teil dauert damit ca. 3:15 h statt 4:45 h; Greenfield wird nur noch gezeigt (Phase-1-Demo, Pflanzenbewässerung). Die Spec `openspec/specs/training/ki-kapitel/spec.md` ist über den Change `ki-kapitel-spec-abgleich` angepasst (Übung entfernt, Ablauf ohne Hands-on, Projekt A/B, Junie/Claude).

> **Abgestimmt (2026-11-25):** IST-/Wunschstand bei 12 Teilnehmenden: keine Einzelvorstellung. Karten schreiben und **gemeinsam clustern direkt im Einstieg** (20 min), Cluster bleiben den Tag über sichtbar. **Besprechung und Optimierung im Transfer** (25 min). Ende damit 4:45.

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
| [`../../demo/prompts/phase2-zoo-arc42.md`](../../demo/prompts/phase2-zoo-arc42.md) | Prompt und Vorbereitung der Live-Demo in Phase 2 (Zoo-Verwaltung vollständig dokumentieren), gleichlautend in den Notizen von Folie 20 |
| [`../../demo/uebung-kritisch-pruefen/`](../../demo/uebung-kritisch-pruefen/arc42-auszug.md) | Quelle der Beispiele auf der Folie „Typische Fehler in KI-Doku“: KI-generierter `arc42-auszug.md` mit sechs eingebauten Fehlern, Erklärung in `LOESUNG.md` (ehemals Übung „Finde die Fehler“) |
| Hauptdokument `../Technische Dokumentation und Kommunikation_ Reboot - Ausarbeitung.md` | Kapitel „Dokumentation mit KI“ (Langtext; Ablauf-Tabelle und Dauer aktuell, Rest noch Stand vor diesen Entscheidungen) |
| `../../openspec/specs/training/ki-kapitel/spec.md` | Anforderungen ans KI-Kapitel |
| `../how-tos/` | Setup Junie, arc42-Toolkit, Structurizr |
| Zoo-Repo `~/IdeaProjects/openspec-quarkus-angular` (GitHub `Gepardec/openspec-quarkus-angular`) | Brownfield-Beispiel: Branch `arc42` (arc42-Doku + Structurizr-Workspace unter `docs/architecture/`, 4 nachträgliche ADRs, `GLOSSARY.md`, Skills unter `.agents/skills/`), Tag `arc42-live-start` (Commit `6898c74` = `1b80931` plus aktualisierter ADR-Skill: Skills + MCP, noch keine Doku, Startpunkt der Live-Demo in Phase 2), Tag `arc42-demo-start` (Teil-Doku, aus der früheren Demo-Variante, nicht mehr verwendet), Branch `arc42-unique-names` (Change umgesetzt, Doku bewusst nicht nachgezogen) |

## Entscheidungen

| Thema | Entscheidung |
|---|---|
| Werkzeuge | Showcase und alle Demos mit **Junie oder Claude**. IntelliJ AI Assistant ist raus. |
| Einstieg | **TKuD-IST-/Wunschstand:** Jede:r schreibt IST- und Wunschstand auf Karten, gemeinsames Clustern direkt danach. Besprechung, Zuordnung zu Phasen/Skills und Optimierung des eigenen Wunschstands im Transfer am Ende. |
| Anonymisierung | Praxisbeispiele auf Folien und in Unterlagen nur anonymisiert: Media Data → **Projekt A**, MM → **Projekt B**. Keine Kunden- oder Projektnamen (auch nicht ITSV/SAK) auf Folien. |
| Structurizr | Erklärung (ein Modell, viele Sichten, MCP, Homepage im Browser) mit dem fiktiven System **Pflanzenbewässerung** aus Tag 1 als vorgestelltem Greenfield-Beispiel (nicht mehr live). **Live-Demo (2026-11-25) am Anfang von Phase 2:** Ein Prompt lässt den Agenten die vollständige arc42-Doku der **Zoo-Verwaltung** aus dem Code erzeugen (Start bei Tag `arc42-live-start`, ohne Rückfragen, Lücken als „Annahme:“); während er läuft, Theorie zu Structurizr und arc42-Toolkit, danach Ergebnis. Die Zoo-Verwaltung ist das Brownfield-Beispiel, das sich durch Phase 2 (Sichten aus dem Code), 3 (nachträgliche ADRs) und 4 (`arc42-change-sync` an `unique-animal-names`) zieht |
| Doku aktuell halten | **Zwei Workflows:** OpenSpec (spec-driven, inkl. `arc42-change-sync`) und **grill-with-docs** (Interview, Glossar und ADRs entstehen nebenbei). Phase 4 dafür ca. 15 statt 10 min. |
| Skill-Beispiele | grilling / grill-me, grill-with-docs, domain-modeling, arc42-adr / arc42-change-sync |
| arc42-Ablage | Ein `workspace.dsl` für alle Sichten, Sektionen als Markdown unter `docs/architecture/sections/`. `arc42-with-structurizr`, `arc42-adr` und `arc42-change-sync` sind darauf umgestellt; die Diagramm-Anweisungen der Section-Skills (`docs/diagrams/*.puml`) gelten in diesem Workflow nicht |
| Projekt A | Agentischer Workflow aus dem Projekt als Praxisbeispiel (OpenSpec → arc42-Sync bei Relevanz → QS → Commit) |
| Projekt B | Route-Doku-Workflow als Praxisbeispiel (Guideline → Skill pro Route → Compliance-Check → Skript-Gate; Orchestrator mit Sub-Agents fürs ganze Repo) |
| Kritisch prüfen | Keine eigene Übung mehr (2026-11-25 gestrichen). Stattdessen eine Folie „Typische Fehler in KI-Doku“ (5 min, Ende Phase 2) mit den sechs Fehlerarten und Beispielen aus dem KI-Auszug zur Pflanzenbewässerung. Lernziel 5 der Spec damit nur noch gezeigt, nicht geübt |
| ADR-Format | **Schlankes Format** von Tag 1 durchgängig (2026-11-25): Titel/Status, Kontext, Entscheidung, Alternativen, Konsequenzen, Bezüge (Qualitätsziele, Risiken, andere ADRs). Skill `arc42-adr` umgestellt („Implications“ → „Bezüge“), Folien 31/32 und Hauptdokument nennen es; Nygard und MADR nur als Hintergrund |
| Gemeinsames Muster | Nach den Praxisbeispielen: Mensch setzt Standard → Agent arbeitet ab → Gate entscheidet |
| Zwei Leser | Doku für Menschen und für Agenten (`AGENTS.md`, Guidelines, Skills) – Rückbezug auf Zielgruppen von Tag 1 |
| Diagramm-Werkzeug | Structurizr vs. Draw.io vs. Mermaid als Entscheidung, Diskussionsfrage |
| Vertraulichkeit | Keine eigene Folie mehr (2026-11-25, nicht relevant). Regel „kein Kundencode, nur Demo-Repo“ bleibt (Demos, Transfer), Hinweis zum gehosteten Structurizr-MCP in den Moderationsnotizen |
| Workflow-Folien | Einheitliche Farblogik: gelb = Vorgabe bzw. OpenSpec, weiß umrandet = Agent/Skill, gestrichelt = automatisch ohne KI, graue Raute = Entscheidung Mensch; jeweils mit Legende |
| Deck | Eigenes Slidev-Deck in `slides-ai/`, Gepardec-Theme, erste Folie `cover`, letzte `contact` |

## Folienliste (39)

| # | Folie | Layout | Status |
|---|---|---|---|
| 1 | Dokumentation mit KI | cover | Datum fehlt |
| 2 | Agenda | agenda | fertig |
| 3 | Dein IST- und Wunschstand | default | fertig (physisch oder Miro offen) |
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
| 17 | Phase 1 | section | fertig |
| 18 | Die KI stellt die unbequemen Fragen | default | fertig |
| 19 | Phase 2 | section | fertig |
| 20 | Live-Demo: Zoo-Verwaltung dokumentieren | default (Prompt in den Notizen) | Probelauf mit Zeitmessung und Startbefehl offen |
| 21 | Structurizr: Architektur als Code | two-cols-header | fertig |
| 22 | Structurizr-MCP | default | fertig |
| 23 | Greenfield: Pflanzenbewässerung | default (DSL) | fertig |
| 24 | Ergebnis: Kontextsicht | default (Mermaid) | fertig |
| 25 | arc42-Toolkit: ein Skill pro Sektion | default | fertig |
| 26 | Orchestrierung: arc42-with-structurizr | default (Mermaid) | fertig |
| 27 | Ergebnis: Zoo-Verwaltung (Brownfield) | default | fertig |
| 28 | Qualitätsziele sind Entscheidungen (Code) | statement | fertig |
| 29 | Welches Diagramm-Werkzeug? | default (Tabelle) | fertig |
| 30 | Typische Fehler in KI-Doku | default (Tabelle) | fertig |
| 31 | Phase 3 | section | fertig |
| 32 | ADRs: Format, Skills, Werkzeuge | default | fertig |
| 33 | ADRs mit KI | two-cols-header | fertig |
| 34 | Phase 4 | section | fertig |
| 35 | Workflow 1: OpenSpec | default (Mermaid) | fertig |
| 36 | Workflow 2: grill-with-docs | default (Mermaid) | fertig |
| 37 | Zwei Workflows im Vergleich | default (Tabelle) | fertig |
| 38 | Transfer aufs eigene Projekt | default | fertig |
| 39 | Danke! | contact | fertig |

## Offene Punkte

- [x] **Zoo-Repo, ADR-Format:** neuer Skill-Stand übernommen: Commit `6898c74` auf `1b80931` (Tag `arc42-live-start` dorthin verschoben), Cherry-Pick auf `arc42` (`f312889`) und `arc42-unique-names` (`a7fd3d1`). Noch zu pushen. Die vier ADRs auf `arc42` haben weiter „Implications“ (bewusst nicht umgeschrieben, ADRs sind unveränderlich)
- [ ] **Live-Demo Phase 2:** Probelauf mit Zeitmessung (Ziel ca. 20 min). Startbefehl/Berechtigungen für Claude Code festlegen (Edits, `plantuml`, `render.sh` ohne Freigabe) und in die Notiz von Folie 20 eintragen. Prüfen, ob der Agent ohne Rückfragen durchläuft und die offenen Changes ignoriert. Tag `arc42-live-start` liegt nur lokal (Commit ist über `arc42-unique-names` schon auf origin)
- [ ] **Projekt B:** anonymisierten Ausschnitt einer echten Route-Doku (Decision Tree oder Diagramm) für die Folie
- [ ] **Projekt A:** konkrete Ergebnisse (Anzahl ADRs, Sektionen, Erfahrungen) und anonymisierte Ausschnitte
- [ ] **Datum** von Tag 2 (Cover)
- [x] **Demo-Repo:** URL auf GitHub – https://github.com/Gepardec/openspec-quarkus-angular, auf Folie 20 verlinkt (2026-11-25)
- [x] ~~**Domäne** des fiktiven Kunden-Briefs für die Übung~~ → entfällt, Übung gestrichen (2026-11-25)
- [ ] **IST-/Wunschstand:** Karten physisch an der Wand oder digital (Miro o. Ä.)?
- [ ] **Junie-Spike** (`openspec/changes/ki-junie-spike`): laufen Skills und Structurizr-MCP in Junie? Davon hängt die Live-Demo mit Junie ab
- [x] **Hauptdokument:** Kapitel „Dokumentation mit KI“ an die Entscheidungen angepasst (2026-11-25): Projekt A/B statt Klarnamen, Junie/Claude, zwei Workflows, schlankes ADR-Format, Statement Phase 2, Übung entfernt
- [x] **Brainstorming-Skill** (Phase 1, obra/superpowers) lag nicht im Repo: Folie 18 nutzt jetzt grill-me + arc42-section-01/-10, Brainstorming nur noch als Alternative in der Moderationsnotiz
- [x] **Hauptdokument:** Phase 1 (Agenda, Abschnitt, Übungsschritt 1) auf grill-me + arc42-section-01/-10 umgestellt
- [ ] **Zoo-Repo pushen:** Stand 2026-11-25: `arc42-unique-names` **ist bereits auf origin** und enthält alle Commits von `arc42` und `arc42-live-start` (Skills inkl. domain-modeling sind damit schon öffentlich). Nur lokal: Branch `arc42` (Teilmenge von `arc42-unique-names`), Tags `arc42-live-start` (Live-Demo) und `arc42-demo-start` (nicht mehr verwendet). Vorher: Lizenz von mattpocock/skills (domain-modeling) prüfen, bevor `NOTICE` sie nennt; nur den benötigten Tag pushen (`git push origin arc42-live-start`), nicht `--tags`. Hinweis: `.mcp.json` und `openspec/changes/unique-animal-names/` waren auf `loesung` ungetrackt und sind jetzt auf `arc42` committet
- [ ] **Zoo, Change `unique-animal-names`:** Task 4.1 (Browser-Check der Fehlermeldung) noch offen; Tests, `ng build` und `ng lint` grün
- [ ] **Zoo, Archiv-Ziel:** Der Change `unique-animal-names` hat ein ADDED-Delta auf `animal-management`; Archive legt dadurch eine neue Capability neben `animal-registration`/`animal-editing` an (im Probelauf geprüft). Bewusst so lassen oder Delta vorher auf die bestehenden Capabilities umschreiben?
- [ ] **Evals von `arc42-with-structurizr`** (`.claude/skills/arc42-with-structurizr/evals/`) beschreiben noch die alte Ablage (adoc, eine DSL pro Sicht)
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
| 2026-11-25 | IST-/Wunschstand: Einstieg auf 20 min (schreiben + gemeinsam clustern), Transfer auf 25 min (Cluster besprechen, Wunschstand optimieren); Folien 2, 3, 40, Agenda und Hauptdokument angepasst; Ende 4:45 |
| 2026-11-25 | Cover: „TKuD“ ausgeschrieben als Untertitel „Technische Dokumentation und Kommunikation“, „Tag 2“ in den Namens-/Datumsblock (dort später das Datum ergänzen) |
| 2026-11-25 | Folie 15 „Die Bausteine“: Agent „Junie, Claude usw.“ statt „Junie oder Claude“ (werkzeugneutral) |
| 2026-11-25 | Folie 17 „Vertraulichkeit: Was geht wohin?“ entfernt (nicht relevant); Folien ab 18 um eins vorgerückt, jetzt 40; Agenda-Folienbereiche angepasst |
| 2026-11-25 | Phase 1: Brainstorming-Skill (nicht im Repo) ersetzt durch grill-me für die Fragen und arc42-section-01/-10 für das Ergebnis; Folie „Die KI stellt die unbequemen Fragen“, Agenda und Hauptdokument (Agenda, Abschnitt Phase 1, Übungsschritt 1) angepasst |
| 2026-11-25 | Zoo-Verwaltung als Brownfield-Beispiel: im Zoo-Repo Branch `arc42` (Skills, Workspace mit Context/Container/Component/Dynamic/Deployment, Sektionen 1/3/5/6/7/8/9/12, 4 ADRs, Glossar, Lint sauber bis auf fehlende Sektion 11), Tag `arc42-demo-start`, Branch `arc42-unique-names` (Change umgesetzt). Im Training-Repo: `arc42-with-structurizr`, `arc42-adr`, `arc42-change-sync` auf einen Workspace + Markdown umgestellt; neue Folie 27 „Demo: Zoo-Verwaltung (Brownfield)“, Verweise in Phase 3 und 4; Folien ab 27 um eins verschoben, jetzt 41 |
| 2026-11-25 | Übung „Finde die Fehler“ gestrichen: Folien „Übung: Finde die Fehler“ und „Auflösung“ ersetzt durch eine Folie „Typische Fehler in KI-Doku“ (Fehlerarten mit Beispielen); die frei gewordenen 10 min gehen an die Zoo-Demo; jetzt 40 Folien |
| 2026-11-25 | Phase 2 umgebaut: Live-Demo am Anfang (Folie 20, Prompt in den Notizen), die vollständige arc42-Doku der Zoo-Verwaltung aus dem Code erzeugt, Start bei neuem lokalem Tag `arc42-live-start`. Während der Agent läuft: Structurizr (mit Links, Homepage), Pflanzenbewässerung als vorgestelltes Greenfield-Beispiel, arc42-Toolkit (Infos aus dem README, GitHub-Link), Orchestrierung. Folie 27 zeigt jetzt das Ergebnis. Folie „Live-Demo: Structurizr mit dem Agenten“ (Pflanzenbewässerung) entfernt; weiter 40 Folien |
| 2026-11-25 | Prompt der Live-Demo Phase 2 zusätzlich als `demo/prompts/phase2-zoo-arc42.md` abgelegt (mit Vorbereitung), Verweis in den Notizen von Folie 20 |
| 2026-11-25 | Korrektur Zoo-Repo: `arc42-unique-names` ist bereits gepusht (enthält `arc42` und `arc42-live-start`), offener Punkt „Zoo-Repo pushen“ angepasst |
| 2026-11-25 | `demo/prompts/phase2-zoo-arc42.md`: Abschnitt Nachbereitung (Demo-Stand verwerfen, Tag neu setzen bei Skill-Updates) und Hinweis zur MCP-Freigabe auf frischem Klon ergänzt |
| 2026-11-25 | Folie 21 „Structurizr: Architektur als Code“: Link docs.structurizr.com/example ergänzt, Notizen mit Browser-Ablauf (Beispiele, Getting started, interaktives Beispiel auf c4model.com) |
| 2026-11-25 | Restliche „Brainstorming“-Stellen aus Branch `mf/phase1-skills` übernommen (Folie 15, Notiz Folie 16, Übungsschritt 1 auf Folie 37 → grill-me); Worktree und Branch `mf/phase1-skills` entfernt |
| 2026-11-25 | Übung Greenfield-Durchstich gestrichen: Folien „Übung“, „Greenfield-Durchstich“, „Qualitätsziele sind Entscheidungen“ entfernt, Agenda (Folie + Notiz), „Zwei Einstiege“ und „Die Bausteine“ angepasst; Hauptdokument: Überblick, Zwei Einstiege, Ablauf, Abschnitt Übung entfernt; Ende jetzt 3:15, 37 Folien |
| 2026-11-25 | Neue Folie 31 „ADRs: Format, Skills, Werkzeuge“ (Nygard/MADR, Skills, Structurizr `!adrs`, Links) vor „ADRs mit KI“; Phase 3 auf 15 min, Ende 3:20; jetzt 38 Folien |
| 2026-11-25 | ADR-Format vereinheitlicht auf das schlanke Format von Tag 1: Skill `arc42-adr` (Reihenfolge wie Tag 1, „Bezüge“ statt „Implications“), `arc42-change-sync`, Folien 16, 31, 32, Hauptdokument (neuer Abschnitt „Im Training: das schlanke Format“) |
| 2026-11-25 | Zoo-Repo: ADR-Skill im schlanken Format übernommen, Tag `arc42-live-start` auf `6898c74`, Branches `arc42` und `arc42-unique-names` je ein Commit dazu; Verweise in Folie 20 und Prompt-Datei angepasst |
| 2026-11-25 | Notiz Folie 21: Structurizr-Oberfläche (local, server, statischer Export) kurz erklärt und gegen unseren Export-Workflow abgegrenzt |
| 2026-11-25 | Statement „Der Code zeigt, was gebaut wurde – nicht, worauf es ankommt. Qualitätsziele sind Entscheidungen, keine Ableitungen.“ als Folie 28 nach dem Zoo-Ergebnis (ersetzt die Pointe der gestrichenen Übung); jetzt 39 Folien |
| 2026-11-25 | Folie 23: DSL-Auszug an `demo/structurizr/workspace.dsl` angeglichen (Bezeichner, `!identifiers hierarchical`, Containersicht), Hinweis und Link auf IntelliJ-Plugin „Structurizr DSL“ (Live-Vorschau Kontext/Container); README der Demo ergänzt |
| 2026-11-25 | Folie 24 „Ergebnis: Kontextsicht“: mit MCP-Export des Workspaces abgeglichen (Elemente und Beziehungen identisch), Technologie-Labels „Annahme: MQTT“ an den drei Pfeilen ergänzt |
| 2026-11-25 | Hauptdokument bereinigt: Überblick (Projekt A/B, zwei Workflows), Werkzeuge (Junie/Claude statt AI Assistant), Praxis-Einstieg mit Projekt A/B und gemeinsamem Muster befüllt, Phase 2 (Prompt-Datei, Statement, Abschluss), Phase 3 (ADR-Grundlagen, schlankes Format), Phase 4 (zwei Workflows), Inhaltsverzeichnis ohne Übung; veraltete TODO-Notiz auf Folie 37 entfernt |
| 2026-11-25 | Hauptdokument: Hinweise „In Ausarbeitung → Change `ki-kapitel-phasen`“ entfernt (Change existiert nicht, Inhalte stehen im Text) |
| 2026-11-25 | OpenSpec-Change `ki-kapitel-spec-abgleich` umgesetzt und archiviert: Spec `training/ki-kapitel` ohne Übung, Ablauf mit Live-Demo je Phase, Projekt A/B anonymisiert, Junie oder Claude Code, Kundencode-Regel für Demos |
| 2026-11-25 | Folie 20: Link zum Demo-Repo Gepardec/openspec-quarkus-angular ergänzt |
| 2026-11-25 | Folie 22 „Structurizr-MCP“: Befehl `claude mcp add … structurizr` eingebunden (analog Plugin-Befehl auf Folie 25), Notiz zu Scope und Junie |
