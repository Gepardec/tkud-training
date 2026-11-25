# ki-kapitel Specification

## Purpose

Legt fest, welche Inhalte, welche Struktur und welches Übungsformat das KI-Kapitel des Trainings „Technische Dokumentation und Kommunikation: Reboot“ hat, damit Kapiteltext, Skills und Demo-Material einem gemeinsamen roten Faden folgen.

## Requirements

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

### Requirement: KI-Schicht über das bisherige Training
Das KI-Kapitel SHALL sich als Erweiterung der vorherigen Kapitel verstehen: Es zeigt, wie Sichten/C4, arc42 und ADRs mit KI erstellt und aktuell gehalten werden, und führt keine Dokumentationskonzepte neu ein, die in früheren Kapiteln bereits erklärt sind.

#### Scenario: Konzept bereits erklärt
- **WHEN** das KI-Kapitel ein Konzept nutzt, das ein früheres Kapitel erklärt (z. B. MADR, C4-Kontextdiagramm, Kreuztabelle)
- **THEN** verweist es auf dieses Kapitel statt das Konzept erneut zu erklären

### Requirement: Struktur nach Projektphasen
Das KI-Kapitel SHALL nach den Projektphasen Vorprojekt, Architektur, Entscheiden und Umsetzung gegliedert sein, und jede Phase SHALL auf das passende frühere Kapitel zurückverweisen, sofern eines existiert.

#### Scenario: Phasen vollständig
- **WHEN** das Kapitel gegliedert wird
- **THEN** gibt es je einen Abschnitt für Vorprojekt, Architektur, Entscheiden und Umsetzung in dieser Reihenfolge

#### Scenario: Rückbezug je Phase
- **WHEN** der Abschnitt „Architektur“ oder „Entscheiden“ gelesen wird
- **THEN** enthält er einen Verweis auf das Kapitel „Sichtenmodell und Notation“ bzw. „Architekturentscheidungen dokumentieren (ADR)“

### Requirement: Brownfield- und Greenfield-Einstieg
Das KI-Kapitel SHALL zwei Einstiege in dasselbe Phasenmodell unterscheiden: Brownfield/Legacy (Dokumentation wird aus bestehendem Code abgeleitet) und Greenfield (Dokumentation entsteht vor dem Code), jeweils mit der unterschiedlichen Rolle der KI und dem Hauptrisiko.

#### Scenario: Unterschied erkennbar
- **WHEN** ein:e Teilnehmer:in das Kapitel durcharbeitet
- **THEN** kann er:sie für Brownfield und Greenfield jeweils Quelle, Rolle der KI und Hauptrisiko benennen

#### Scenario: Gemeinsamer Endpunkt
- **WHEN** beide Einstiege beschrieben sind
- **THEN** münden beide in denselben Zyklus „Dokumentation aktuell halten“

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

### Requirement: Greenfield-Erhebung mit KI
Der Greenfield-Einstieg SHALL zeigen, wie Qualitätsziele, Anforderungen und Nicht-Ziele mit KI erhoben werden, wobei die KI Fragen stellt, Priorisierung und Messbarkeit einfordert und nicht selbst Antworten liefert.

#### Scenario: Nicht-Ziele abgedeckt
- **WHEN** die Greenfield-Erhebung beschrieben wird
- **THEN** werden neben Qualitätszielen und Anforderungen explizit Nicht-Ziele erhoben

#### Scenario: Generische Ziele vermeiden
- **WHEN** ein Qualitätsziel ohne messbares Kriterium formuliert ist (z. B. „schnell“)
- **THEN** zeigt das Kapitel, dass die KI nach einer konkreten, messbaren Formulierung fragt

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
