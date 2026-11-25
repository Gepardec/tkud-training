# Proposal

## Why

Die Spec `training/ki-kapitel` beschreibt noch den Stand von Oktober 2026. Seitdem sind mehrere Entscheidungen gefallen, die in Deck, Hauptdokument und Handoff schon umgesetzt sind (2026-11-20 bis 2026-11-25). Die wichtigste: Die Übung „Greenfield-Durchstich“ ist gestrichen. Die Spec fordert sie aber weiter, ebenso Hands-on-Zeit, die Klarnamen der Praxisbeispiele und den IntelliJ AI Assistant. Kapiteltext und Spec widersprechen sich damit.

## What Changes

- **REMOVED** Requirement „Greenfield-Durchstich als Übung“. Es gibt keine eigene Übung mehr; Greenfield wird gezeigt (Live-Demo grill-me in Phase 1, Beispiel Pflanzenbewässerung in Phase 2).
- **MODIFIED** „Überblick-Tabelle“: Die Zeile „Übung“ bleibt Pflicht, darf aber ausdrücklich festhalten, dass es keine eigene Übung gibt, und nennt dann die aktivierenden Anteile (IST-/Wunschstand, Transfer).
- **MODIFIED** „Ablauf für einen halben Tag“: Reihenfolge ohne Hands-on – Praxis-Einstieg, Einordnung, je Phase Konzept mit Live-Demo, Transfer. Der Zeitrahmen von 3 bis 4 Stunden bleibt (aktuell ca. 3:20 h).
- **MODIFIED** „Brownfield-Praxisbeispiele“: Projekt A und Projekt B, anonymisiert, statt der Klarnamen Media Data und MM; dazu das gemeinsame Muster (Standard → Agent → Gate).
- **MODIFIED** „Werkzeug und Tool-Neutralität“: Live-Demos mit Junie oder Claude Code statt Junie bzw. IntelliJ AI Assistant.
- **MODIFIED** „Kein Kundencode in KI-Tools“: gilt für Live-Demos statt Hands-on-Übungen; Demo-Repositories sind Zoo-Verwaltung und Pflanzenbewässerung.

Nicht Teil dieses Changes: das ADR-Format (schlankes Format) und die Live-Demo-Details von Phase 2. Beide sind im Kapiteltext beschrieben, aber keine Anforderung der Spec; die Spec verweist für Konzepte ohnehin auf die früheren Kapitel.

## Capabilities

### New Capabilities

_keine_

### Modified Capabilities

- `training/ki-kapitel`: Übungs-Requirement entfällt; Überblick-Tabelle, Ablauf, Praxisbeispiele, Werkzeug und Kundencode-Regel werden an den aktuellen Stand angepasst.

## Impact

- `openspec/specs/training/ki-kapitel/spec.md` (nach dem Archivieren)
- Kapitel „Dokumentation mit KI“ im Hauptdokument und das Deck `slides-ai/` erfüllen die neuen Anforderungen bereits; zu prüfen, nicht umzuschreiben.
- Handoff `documents/ai/presentation-ai-handoff.md`: Hinweis „Spec noch nicht angepasst“ entfernen, Änderungslog.
- Lernziel 3 (Qualitätsziele erheben) wird nur noch gezeigt, nicht mehr geübt – bewusst so entschieden, kein Spec-Konflikt, weil Lernziele im Kapiteltext und nicht in der Spec stehen.
