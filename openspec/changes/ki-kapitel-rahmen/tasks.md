# Tasks

Dokument: `documents/Technische Dokumentation und Kommunikation_ Reboot - Ausarbeitung.md` (im Folgenden „Dokument“).

## 1. Vorbereitung

- [x] 1.1 Dokument committen (auf Wunsch erst nach der Überarbeitung des KI-Abschnitts, siehe Risks in `design.md`); verifizieren mit `git log --oneline -- documents/` (Commit vorhanden) und `git status` (Dokument nicht mehr untracked)
- [x] 1.2 Klären, ob Markdown oder Google Docs die führende Quelle ist, und die Antwort in `design.md` unter Risks festhalten; verifiziert, wenn das Risiko dort als geklärt markiert ist

## 2. Kapitelkopf

- [x] 2.1 Abschnitt `# KI` samt Stichpunkten und „Ablauf“ durch die Überschrift `## Dokumentation mit KI` ersetzen (D2, D6); verifizieren, dass `grep -n '^# KI' Dokument` leer ist und `## Dokumentation mit KI` genau einmal vorkommt
- [x] 2.2 Überblick-Tabelle mit den Zeilen Inhalt, Lernziele (D3, alle fünf) und Übung (Greenfield-Durchstich) einfügen; verifizieren, dass die Tabelle vor dem ersten Fließtext steht und keine Zeile leer oder Platzhalter ist (Spec: Überblick-Tabelle)

## 3. Einleitung und Einordnung

- [x] 3.1 Einleitung schreiben, die das Kapitel als KI-Schicht über das bisherige Training einordnet und auf die Kapitel Sichtenmodell und ADR verweist; verifizieren, dass beide Kapitel namentlich verlinkt bzw. genannt sind (Spec: KI-Schicht)
- [x] 3.2 Phasenmodell (Vorprojekt → Architektur → Entscheiden → Umsetzung) als Diagramm oder Tabelle darstellen; verifizieren, dass alle vier Phasen in dieser Reihenfolge erscheinen
- [x] 3.3 Green-/Brownfield-Gegenüberstellung mit Quelle, Rolle der KI und Hauptrisiko je Einstieg sowie gemeinsamem Endpunkt „Dokumentation aktuell halten“ einfügen; verifizieren gegen beide Szenarien der Spec-Anforderung Brownfield- und Greenfield-Einstieg
- [x] 3.4 Werkzeug-Hinweis ergänzen: Junie/AI Assistant als Beispiel, Konzepte werkzeugneutral (Agent Skills, MCP, Spec-driven), Hands-on nur im Demo-Repo, kein Kundencode in KI-Tools; verifizieren gegen Spec-Anforderungen Werkzeug und Tool-Neutralität sowie Kein Kundencode in KI-Tools

## 4. Gerüst der Inhaltsabschnitte

- [x] 4.1 Abschnitt „Praxis-Einstieg: Brownfield“ mit Unterabschnitten Media Data und MM (je Ausgangslage, KI-Einsatz, Ergebnis) als „in Ausarbeitung → `ki-kapitel-phasen`“ anlegen; verifizieren, dass der Abschnitt vor dem ersten Phasenabschnitt steht (Spec: Praxis vor Theorie)
- [x] 4.2 Je einen Abschnitt für Vorprojekt, Architektur, Entscheiden und Umsetzung anlegen, jeweils mit einem Satz Zielbeschreibung, Rückverweis auf das passende frühere Kapitel (sofern vorhanden) und Markierung „in Ausarbeitung → `ki-kapitel-phasen`“; Vorprojekt nennt QS-Ziele, Anforderungen und Nicht-Ziele als Schwerpunkt; verifizieren gegen Spec-Szenarien Phasen vollständig und Rückbezug je Phase
- [x] 4.3 Abschnitt „Übung: Greenfield-Durchstich“ mit Ziel, Teamgröße, Schritten und Zeitanteilen (D4), erwarteten Ergebnissen je Team und Teamvergleich anlegen; Detailanleitung als „in Ausarbeitung → `ki-uebung-durchstich`“ markieren; verifizieren gegen die drei Szenarien der Spec-Anforderung Greenfield-Durchstich
- [x] 4.4 Abschnitt „Transfer aufs eigene Projekt“ anlegen (Diskussion, keine Live-Arbeit mit Kundencode); verifizieren, dass der Abschnitt nach der Übung steht

## 5. Ablauf

- [x] 5.1 Ablauf-Tabelle aus D4 mit Startzeit, Block und Dauer einfügen; verifizieren, dass die Summe 3:45 h ergibt (zwischen 3 und 4 h) und die Reihenfolge Praxis → Phasen → Pause → Hands-on → Transfer ist (Spec: Ablauf für einen halben Tag)

## 6. Abschlussprüfung

- [x] 6.1 Kapitel gegen alle zehn Anforderungen der Spec `training/ki-kapitel` durchgehen und je Anforderung notieren, ob sie durch diesen Change erfüllt ist oder bewusst an einen Folge-Change übergeben wurde (D1); verifiziert, wenn keine Anforderung ohne Zuordnung bleibt
- [x] 6.2 Prüfen, dass der Rest des Dokuments unverändert ist: `git diff --stat` zeigt nur Änderungen im KI-Abschnitt, Referenzen und Base64-Bilder am Dokumentende sind intakt
- [x] 6.3 `openspec validate ki-kapitel-rahmen --strict` ausführen; verifiziert, wenn „valid“ gemeldet wird

## Workflow follow-up

- Folge-Changes anlegen: `ki-junie-spike` (zuerst), `ki-brainstorming-skill`, `ki-demo-repo`, `ki-kapitel-phasen`, `ki-uebung-durchstich`.
- Change nach Review mit `/opsx:archive` archivieren; danach liegt die Spec unter `openspec/specs/training/ki-kapitel/spec.md`.
