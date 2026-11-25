# Handoff: KI-Teil (TKuD, Tag 2)

> **Pflegeregel:** Dieses Dokument wird bei **jeder** Änderung an Deck, Demo oder Entscheidungen zum KI-Teil mitgezogen: Folienliste, Entscheidungen, offene Punkte und Änderungslog. Es ist der Einstieg für alle, die am KI-Teil weiterarbeiten – Mensch oder Agent.

Stand: 2026-11-20 · Verantwortlich: Mattias Fankhauser · Branch: `setup/mf-ai-part`

## Worum es geht

Ca. 4–5 h am zweiten Trainingstag „Technische Kommunikation und Dokumentation“. Der KI-Teil führt keine neuen Doku-Konzepte ein, sondern legt eine KI-Schicht über Tag 1: Sichten/C4, arc42 und ADRs mit KI erstellen und vor allem aktuell halten.

**Didaktischer Ablauf:** IST-/Wunschstand → Beispiel aus der Praxis → erst dann Theorie → Phasen → Übung → Transfer und Muster.

## Grobe Agenda (ca. 4:45 h)

| Start | Block | Inhalt | Folien | Dauer |
|---|---|---|---|---|
| 0:00 | Einstieg | Rahmen (3), IST-/Wunschstand auf Karten schreiben (8), gemeinsam clustern und benennen (9) | 1–3 | 20 min |
| 0:20 | Aus der Praxis | Projekt A (15), Projekt B (10), gemeinsames Muster (5) | 4–9 | 30 min |
| 0:50 | Einordnung | Phasen, Einstiege, zwei Leser, Bausteine, Skills | 10–16 | 10 min |
| 1:00 | Phase 1: Vorprojekt | Unbequeme Fragen, Live-Demo grill-me + arc42-section-01/-10 | 17–18 | 15 min |
| 1:15 | Phase 2: Architektur | arc42-Toolkit, Structurizr mit Live-Demo (20), Zoo-Demo Brownfield (Zeit offen), Diagramm-Werkzeug (5), Übung „Finde die Fehler“ mit Auflösung (15) | 19–30 | 40 min |
| 1:55 | Pause | | | 15 min |
| 2:10 | Phase 3: Entscheiden | ADRs mit KI | 31–32 | 10 min |
| 2:20 | Phase 4: Umsetzung | Workflow OpenSpec, Workflow grill-with-docs, Vergleich | 33–36 | 15 min |
| 2:35 | Übung | Greenfield-Durchstich in Teams | 37–39 | 90 min |
| 4:05 | Transfer | Cluster besprechen (10), Wunschstand optimieren + erster Schritt (10), Abschluss (5) | 40–41 | 25 min |
| 4:30 | Puffer | für Demos, Fragen, Überzug der Übung | | 15 min |
| 4:45 | Ende | | | |

> **Abgestimmt (2026-11-20):** Rahmen für den KI-Teil sind 4–5 h. Greenfield-Durchstich bleibt bei 90 min, 15 min Puffer am Ende. Gegenüber dem Kapitel im Hauptdokument (3:45 h) neu: gemeinsames Muster, zwei Leser, Diagramm-Werkzeug, Übung „Finde die Fehler“, Phase 4 mit zwei Workflows.

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
| [`../../demo/uebung-kritisch-pruefen/`](../../demo/uebung-kritisch-pruefen/arc42-auszug.md) | Übung „Finde die Fehler“: `arc42-auszug.md` für Teilnehmende, `LOESUNG.md` nur für die Moderation |
| Hauptdokument `../Technische Dokumentation und Kommunikation_ Reboot - Ausarbeitung.md` | Kapitel „Dokumentation mit KI“ (Langtext; Ablauf-Tabelle und Dauer aktuell, Rest noch Stand vor diesen Entscheidungen) |
| `../../openspec/specs/training/ki-kapitel/spec.md` | Anforderungen ans KI-Kapitel |
| `../how-tos/` | Setup Junie, arc42-Toolkit, Structurizr |
| Zoo-Repo `~/IdeaProjects/openspec-quarkus-angular` (GitHub `Gepardec/openspec-quarkus-angular`) | Brownfield-Beispiel: Branch `arc42` (arc42-Doku + Structurizr-Workspace unter `docs/architecture/`, 4 nachträgliche ADRs, `GLOSSARY.md`, Skills unter `.agents/skills/`), Tag `arc42-demo-start` (Startpunkt Live-Demo), Branch `arc42-unique-names` (Change umgesetzt, Doku bewusst nicht nachgezogen) |

## Entscheidungen

| Thema | Entscheidung |
|---|---|
| Werkzeuge | Showcase und alle Übungen mit **Junie oder Claude**. IntelliJ AI Assistant ist raus. |
| Einstieg | **TKuD-IST-/Wunschstand:** Jede:r schreibt IST- und Wunschstand auf Karten, gemeinsames Clustern direkt danach. Besprechung, Zuordnung zu Phasen/Skills und Optimierung des eigenen Wunschstands im Transfer am Ende. |
| Anonymisierung | Praxisbeispiele auf Folien und in Unterlagen nur anonymisiert: Media Data → **Projekt A**, MM → **Projekt B**. Keine Kunden- oder Projektnamen (auch nicht ITSV/SAK) auf Folien. |
| Structurizr | Erklärung (ein Modell, viele Sichten, MCP) plus Live-Demo am fiktiven System **Pflanzenbewässerung** aus Tag 1 (Greenfield). Dazu **Zoo-Verwaltung** aus der OpenSpec-Schulung als Brownfield-Beispiel, das sich durch Phase 2 (Sichten aus dem Code), 3 (nachträgliche ADRs) und 4 (`arc42-change-sync` an `unique-animal-names`) zieht |
| Doku aktuell halten | **Zwei Workflows:** OpenSpec (spec-driven, inkl. `arc42-change-sync`) und **grill-with-docs** (Interview, Glossar und ADRs entstehen nebenbei). Phase 4 dafür ca. 15 statt 10 min. |
| Skill-Beispiele | grilling / grill-me, grill-with-docs, domain-modeling, arc42-adr / arc42-change-sync |
| arc42-Ablage | Ein `workspace.dsl` für alle Sichten, Sektionen als Markdown unter `docs/architecture/sections/`. `arc42-with-structurizr`, `arc42-adr` und `arc42-change-sync` sind darauf umgestellt; die Diagramm-Anweisungen der Section-Skills (`docs/diagrams/*.puml`) gelten in diesem Workflow nicht |
| Projekt A | Agentischer Workflow aus dem Projekt als Praxisbeispiel (OpenSpec → arc42-Sync bei Relevanz → QS → Commit) |
| Projekt B | Route-Doku-Workflow als Praxisbeispiel (Guideline → Skill pro Route → Compliance-Check → Skript-Gate; Orchestrator mit Sub-Agents fürs ganze Repo) |
| Kritisch prüfen | Übung „Finde die Fehler“ (10 min, Ende Phase 2): KI-generierter arc42-Auszug mit sechs eingebauten Fehlern, erst ohne, dann mit Agent prüfen. Deckt Lernziel 5 der Spec ab |
| Gemeinsames Muster | Nach den Praxisbeispielen: Mensch setzt Standard → Agent arbeitet ab → Gate entscheidet |
| Zwei Leser | Doku für Menschen und für Agenten (`AGENTS.md`, Guidelines, Skills) – Rückbezug auf Zielgruppen von Tag 1 |
| Diagramm-Werkzeug | Structurizr vs. Draw.io vs. Mermaid als Entscheidung, Diskussionsfrage |
| Vertraulichkeit | Keine eigene Folie mehr (2026-11-25, nicht relevant). Regel „kein Kundencode, nur Demo-Repo“ bleibt (Übung, Transfer), Hinweis zum gehosteten Structurizr-MCP in den Moderationsnotizen |
| Workflow-Folien | Einheitliche Farblogik: gelb = Vorgabe bzw. OpenSpec, weiß umrandet = Agent/Skill, gestrichelt = automatisch ohne KI, graue Raute = Entscheidung Mensch; jeweils mit Legende |
| Deck | Eigenes Slidev-Deck in `slides-ai/`, Gepardec-Theme, erste Folie `cover`, letzte `contact` |

## Folienliste (40)

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
| 20 | arc42-Toolkit ins Repo holen | default | fertig |
| 21 | Structurizr: Architektur als Code | two-cols-header | fertig |
| 22 | Structurizr-MCP | default | fertig |
| 23 | Demo: Pflanzenbewässerung | default (DSL) | fertig |
| 24 | Ergebnis: Kontextsicht | default (Mermaid) | fertig |
| 25 | Live-Demo: Structurizr mit dem Agenten | default | fertig |
| 26 | Orchestrierung: arc42-with-structurizr | default (Mermaid) | fertig |
| 27 | Demo: Zoo-Verwaltung (Brownfield) | default | fertig, Zeitbedarf offen |
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
- [ ] **Demo-Repo:** URL auf GitHub (z. B. auf der Folie Greenfield-Durchstich)
- [ ] **Domäne** des fiktiven Kunden-Briefs für die Übung
- [ ] **IST-/Wunschstand:** Karten physisch an der Wand oder digital (Miro o. Ä.)?
- [ ] **Junie-Spike** (`openspec/changes/ki-junie-spike`): laufen Skills und Structurizr-MCP in Junie? Davon hängt die Live-Demo mit Junie ab
- [ ] **Hauptdokument:** Kapitel „Dokumentation mit KI“ an die Entscheidungen oben anpassen (nennt noch AI Assistant, nur OpenSpec, Klarnamen)
- [x] **Brainstorming-Skill** (Phase 1, obra/superpowers) lag nicht im Repo: Folie 18 nutzt jetzt grill-me + arc42-section-01/-10, Brainstorming nur noch als Alternative in der Moderationsnotiz
- [x] **Hauptdokument:** Phase 1 (Agenda, Abschnitt, Übungsschritt 1) auf grill-me + arc42-section-01/-10 umgestellt
- [ ] **Zoo-Demo (Folie 27):** Zeitbedarf ca. 10 min – aus dem Puffer nehmen oder die Pflanzenbewässerungs-Demo kürzen
- [ ] **Zoo-Repo pushen:** Branches `arc42`, `arc42-unique-names` und Tag `arc42-demo-start` liegen nur lokal in `openspec-quarkus-angular`; Push nach `Gepardec/openspec-quarkus-angular` erst nach Abnahme. Vorher: Lizenz von mattpocock/skills (domain-modeling) prüfen, bevor `NOTICE` sie nennt; nur den eigenen Tag pushen (`git push origin arc42-demo-start`), nicht `--tags`. Hinweis: `.mcp.json` und `openspec/changes/unique-animal-names/` waren auf `loesung` ungetrackt und sind jetzt auf `arc42` committet
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
