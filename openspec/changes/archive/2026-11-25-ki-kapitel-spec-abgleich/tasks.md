# Tasks

## 1. Kapiteltext gegen die geänderten Anforderungen prüfen

- [x] 1.1 Überblick-Tabelle im Hauptdokument: Zeile „Übung“ hält „keine eigene Übung“ fest und nennt IST-/Wunschstand und Transfer; Inhalt nennt Projekt A/B
- [x] 1.2 Praxis-Einstieg: Projekt A und B mit Ausgangslage, KI-Einsatz, Ergebnis und gemeinsamem Muster; keine Kunden- oder Projektnamen in Hauptdokument und `slides-ai/slides.md` (Suche nach Klarnamen, Moderationsnotizen ausgenommen, die als intern markiert sind)
- [x] 1.3 Ablauf: Reihenfolge Praxis-Einstieg, Einordnung, Phasen mit Live-Demo, Transfer; Summe der Blöcke zwischen 3 und 4 Stunden; keine Hands-on- oder Übungsblöcke mehr
- [x] 1.4 Werkzeuge: Junie oder Claude Code als Beispiel, kein IntelliJ AI Assistant mehr in Kapiteltext und Deck
- [x] 1.5 Kundencode-Regel: Live-Demos nur an Demo-Repositories (Zoo-Verwaltung, Pflanzenbewässerung), Transfer als Diskussion

## 2. Abweichungen beheben

- [x] 2.1 Gefundene Abweichungen aus Gruppe 1 in Hauptdokument bzw. Deck korrigieren (falls keine: als erledigt vermerken) – keine Abweichungen gefunden

## 3. Abschluss

- [x] 3.1 `openspec validate ki-kapitel-spec-abgleich --strict` ohne Fehler
- [x] 3.2 Handoff `documents/ai/presentation-ai-handoff.md`: Hinweis „Spec noch nicht angepasst“ im Vermerk zur gestrichenen Übung aktualisieren, Änderungslog ergänzen

## Workflow follow-up

- Nach der Umsetzung `openspec-archive-change` ausführen, damit die Delta-Spec in `openspec/specs/training/ki-kapitel/spec.md` übernommen wird
