# Spec Delta

## MODIFIED Requirements

### Requirement: Überblick-Tabelle
Das KI-Kapitel SHALL mit einer Überblick-Tabelle beginnen, die wie bei den übrigen Kapiteln mindestens Inhalt, Lernziele und Übung ausweist. Gibt es keine eigene Übung, SHALL die Zeile „Übung“ das ausdrücklich festhalten und die aktivierenden Anteile des Kapitels nennen.

#### Scenario: Kapitelanfang prüfen
- **WHEN** ein:e Leser:in den Abschnitt „KI“ im Trainingsdokument öffnet
- **THEN** steht vor dem Fließtext eine Tabelle mit den Zeilen Inhalt, Lernziele und Übung
- **AND** jede Zeile ist inhaltlich befüllt, nicht mit Platzhaltern

#### Scenario: Keine eigene Übung
- **WHEN** das Kapitel keine eigene Übung enthält
- **THEN** steht in der Zeile „Übung“, dass es keine eigene Übung gibt
- **AND** die Zeile nennt, wo die Teilnehmenden aktiv werden (IST-/Wunschstand, Transfer aufs eigene Projekt)

### Requirement: Brownfield-Praxisbeispiele
Das KI-Kapitel SHALL den Brownfield-Einstieg anhand zweier anonymisierter Legacy-Praxisbeispiele zeigen: Projekt A (arc42 aus Legacy-Code mit agentischem Workflow) und Projekt B (Camel-Route-Guideline). Kunden- und Projektnamen SHALL weder im Kapiteltext noch auf Folien erscheinen.

#### Scenario: Beide Beispiele vorhanden
- **WHEN** der Brownfield-Einstieg behandelt wird
- **THEN** werden Projekt A und Projekt B jeweils mit Ausgangslage, KI-Einsatz und Ergebnis vorgestellt

#### Scenario: Gemeinsames Muster
- **WHEN** beide Beispiele vorgestellt sind
- **THEN** fasst das Kapitel das gemeinsame Muster zusammen: Mensch setzt den Standard, Agent arbeitet ihn ab, ein Gate entscheidet über „fertig“

#### Scenario: Anonymisierung
- **WHEN** Kapiteltext oder Folien die Praxisbeispiele nennen
- **THEN** erscheinen nur die Bezeichnungen Projekt A und Projekt B, keine Kunden- oder Projektnamen

### Requirement: Ablauf für einen halben Tag
Das KI-Kapitel SHALL auf 3 bis 4 Stunden ausgelegt sein und der Reihenfolge Praxis-Einstieg, Einordnung, je Phase Konzept mit Live-Demo und Transfer aufs eigene Projekt folgen.

#### Scenario: Zeitplan vorhanden
- **WHEN** ein:e Trainer:in das Kapitel vorbereitet
- **THEN** findet er:sie einen Ablauf mit Zeitangaben je Block, deren Summe zwischen 3 und 4 Stunden liegt

#### Scenario: Praxis vor Theorie
- **WHEN** das Kapitel startet
- **THEN** kommt der Praxis-Einstieg vor der ersten Konzepterklärung

#### Scenario: Live-Demo je Phase
- **WHEN** eine der vier Phasen behandelt wird
- **THEN** zeigt eine Live-Demo oder ein vorbereitetes Demo-Beispiel, wie die KI in dieser Phase eingesetzt wird

### Requirement: Werkzeug und Tool-Neutralität
Live-Demos SHALL mit JetBrains Junie oder Claude Code durchgeführt werden; die Konzepte SHALL werkzeugneutral über Agent Skills, MCP und Spec-driven Development erklärt werden.

#### Scenario: Konzept ohne Produktbindung
- **WHEN** das Kapitel einen Skill oder MCP-Server erklärt
- **THEN** ist die Erklärung auch ohne ein bestimmtes Werkzeug verständlich und Junie bzw. Claude Code werden nur als Beispiel genannt

### Requirement: Kein Kundencode in KI-Tools
Live-Demos SHALL ausschließlich in vorbereiteten Demo-Repositories stattfinden; der Transfer auf eigene Kundenprojekte SHALL als Diskussion erfolgen, ohne Kundencode oder -dokumente in KI-Tools einzugeben.

#### Scenario: Transfer aufs eigene Projekt
- **WHEN** Teilnehmende das Gelernte auf ihr Projekt übertragen
- **THEN** geschieht dies im Gespräch bzw. als Hausaufgabe nach Projektfreigabe, nicht live mit Kundencode im Training

#### Scenario: Demo-Material
- **WHEN** eine Live-Demo vorbereitet wird
- **THEN** läuft sie an einem fiktiven oder freigegebenen Demo-System (z. B. Zoo-Verwaltung, Pflanzenbewässerung), nicht an Kundencode

## REMOVED Requirements

### Requirement: Greenfield-Durchstich als Übung
**Reason**: Am 2026-11-25 gestrichen. Der KI-Teil kommt ohne eigene Übung aus; Greenfield wird in Phase 1 (Live-Demo grill-me mit arc42-section-01/-10) und Phase 2 (Beispiel Pflanzenbewässerung) gezeigt. Die Pointe des Teamvergleichs trägt jetzt das Statement „Qualitätsziele sind Entscheidungen, keine Ableitungen“ nach dem Zoo-Ergebnis.
**Migration**: Keine Teamübung und kein Kunden-Brief mehr. Aktiv werden die Teilnehmenden beim IST-/Wunschstand im Einstieg und im Transfer aufs eigene Projekt.
