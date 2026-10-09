# Tasks

Legende: **[Agent]** bereitet vor bzw. dokumentiert, **[Mensch]** testet in IntelliJ/Junie und meldet das Ergebnis (Bildschirmtext oder Screenshot) zurück.

## 1. Testprojekt vorbereiten

- [x] 1.1 [Agent] `spikes/junie/` anlegen mit `README.md` (Zweck, Hinweis „nur fiktive Systeme“), fiktiver `workspace.dsl` mit System-Context-View und absichtlich fehlerhafter `broken.dsl`; verifizieren, dass `structurizr validate` bzw. der Structurizr-MCP in Claude Code `workspace.dsl` mit OK und `broken.dsl` mit Fehler meldet
- [x] 1.2 [Agent] `spikes/junie/PRUEFSCHRITTE.md` schreiben: je Prüfschritt (Skill-Erkennung, Section-Skill, MCP gültig/ungültig, Export, Orchestrierungs-Skill) exakter Prompt, erwartetes Ergebnis und Feld für das tatsächliche Ergebnis; verifizieren, dass jedes Szenario der Spec `training/demo-tooling` mindestens einem Prüfschritt zugeordnet ist

## 2. Skill-Verteilung (D2)

- [ ] 2.1 [Mensch] Weg 1: arc42-Toolkit über den Junie-Marketplace installieren (`MSiccDev/arc42-toolkit`) und Prüfschritt „Skill-Erkennung“ ausführen; verifiziert, wenn das Ergebnis (gefunden ja/nein, Aufrufname mit/ohne Namespace) in `PRUEFSCHRITTE.md` eingetragen ist
- [ ] 2.2 [Agent] Falls 2.1 scheitert: `spikes/junie/.junie/skills/` mit Symlinks anlegen – absolute Links auf den Toolkit-Klon (per `.git/info/exclude` ausgeschlossen), relativer Link auf `.claude/skills/arc42-with-structurizr` (committbar); verifizieren mit `ls -l` und `git status` (nur der relative Link ist sichtbar). Entfällt, wenn 2.1 erfolgreich war – dann als erledigt mit Vermerk „nicht nötig“ markieren
- [ ] 2.3 [Mensch] Falls 2.2 angelegt: Prüfschritt „Skill-Erkennung“ erneut ausführen und Ergebnis eintragen; entfällt wie 2.2
- [ ] 2.4 [Agent] Falls 2.1 und 2.3 scheitern: Kopierskript `spikes/junie/sync-skills.sh` (rsync nur `arc42-*`-Ordner, ohne `--delete` auf fremde Skills) schreiben, ausführen und Prüfschritt durch den Menschen wiederholen lassen; verifiziert, wenn Skills erkannt werden. Entfällt bei Erfolg eines früheren Wegs
- [x] 2.5 [Agent] APM klären: `apm install --runtime intellij` in einem Wegwerf-Verzeichnis (Scratchpad) ausführen und festhalten, in welche Ordner es schreibt; verifiziert, wenn das Zielverzeichnis notiert und mit den Junie-Skill-Ordnern verglichen ist

## 3. Skill-Ausführung

- [ ] 3.1 [Mensch] Prüfschritt „Section-Skill fragt zuerst“ mit `arc42-section-01` ausführen; verifiziert, wenn eingetragen ist, ob Junie die Skill-Fragen stellt, ohne eine Sektion zu erzeugen

## 4. Structurizr-MCP (D3)

- [x] 4.1 [Agent] Junie-MCP-Konfiguration für den gehosteten Server (HTTP) vorbereiten – projektweit in `spikes/junie/.junie/`, falls Junie das unterstützt, sonst Anleitung für die globale Einrichtung – und die Fundstelle der Konfigurationsform (Junie-Doku) notieren; verifiziert, wenn die Datei bzw. Anleitung vorliegt
- [ ] 4.2 [Mensch] Prüfschritte „MCP gültig“, „MCP ungültig“ und „Export“ ausführen; verifiziert, wenn alle drei Ergebnisse eingetragen sind
- [ ] 4.3 [Agent] Falls 4.2 scheitert: stdio-Brücke mit `mcp-remote` konfigurieren und den Menschen die Prüfschritte wiederholen lassen; entfällt bei Erfolg von 4.2
- [x] 4.4 [Agent] CLI-Fallback (lokale Structurizr-CLI) unabhängig vom MCP-Ergebnis einrichten und `validate` sowie einen Export für `workspace.dsl` ausführen; verifiziert, wenn beide Befehle im Terminal erfolgreich laufen und die Befehle notiert sind
- [x] 4.5 [Agent] (nachträglich ergänzt) `theme default` aus dem Minimalbeispiel in `documents/how-tos/structurizr-setup.md` entfernen und Hinweis auf das Cloud-EOL (30.09.2026) ergänzen; verifiziert mit `structurizr validate` auf dem Beispiel (Exit 0)

## 5. Orchestrierungs-Skill (D4)

- [x] 5.1 [Agent] In `.claude/skills/arc42-with-structurizr/SKILL.md` die Verweise auf `opencode.json` und `.opencode/skills/` werkzeugneutral formulieren und auf `documents/how-tos/` verweisen; verifizieren mit `grep -n 'opencode' .claude/skills/arc42-with-structurizr/SKILL.md` (keine Treffer) und `git diff` (nur diese Textstellen geändert)
- [ ] 5.2 [Mensch] Prüfschritt „Orchestrierungs-Skill“ ausführen (Kontextdiagramm zu `workspace.dsl` für arc42-Sektion 3) – einmal mit verbundenem MCP, einmal mit getrenntem MCP; verifiziert, wenn eingetragen ist, ob ein Diagramm entsteht bzw. der werkzeugneutrale Hinweis erscheint

## 6. Anleitung und Entscheidung (D5, D6)

- [ ] 6.1 [Agent] `documents/how-tos/junie-setup.md` schreiben: funktionierender Weg für Skills und MCP, Prüfschritte zur Selbstkontrolle, bekannte Grenzen mit Fallback je Baustein, Datenschutzhinweis zum gehosteten MCP mit Verweis auf Self-hosted, Abschnitt „Getestet“ mit Datum, Junie- und IntelliJ-Version und Ergebnis je Prüfschritt; verifizieren gegen alle Requirements der Spec `training/demo-tooling`
- [ ] 6.2 [Agent] Go/No-Go nach D5 aus den eingetragenen Ergebnissen ableiten und in `junie-setup.md` (Abschnitt „Getestet“) festhalten; bei No-Go den Werkzeug-Abschnitt in `ki-kapitel-rahmen` als betroffen markieren; verifiziert, wenn die Entscheidung mit Begründung dort steht
- [ ] 6.3 [Agent] Junie-Abschnitt in `documents/how-tos/arc42-toolkit-setup.md` auf `junie-setup.md` verweisen lassen und den offenen Punkt „Symlinks“ mit dem Testergebnis schließen; verifizieren, dass keine widersprüchlichen Aussagen zu Junie zwischen beiden Dateien bleiben
- [ ] 6.4 [Agent] `openspec validate ki-junie-spike --strict` ausführen; verifiziert, wenn „valid“ gemeldet wird

## Workflow follow-up

- Ergebnis an die Folge-Changes weitergeben: `ki-brainstorming-skill` (Skill-Ort und Aufrufform in Junie), `ki-demo-repo` (übernimmt `spikes/junie/` als Ausgangspunkt).
- Change nach Review mit `/opsx:archive` archivieren; danach liegt die Spec unter `openspec/specs/training/demo-tooling/spec.md`.
