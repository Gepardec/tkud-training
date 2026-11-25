# Spec Delta

## Purpose

Legt fest, was die Werkzeugumgebung für Live-Demo und Hands-on des KI-Kapitels leisten muss: welche Skills und MCP-Server in JetBrains Junie verfügbar sind, wie Teilnehmende sie einrichten und welcher Fallback gilt, wenn ein Baustein nicht funktioniert.

## ADDED Requirements

### Requirement: Skills in Junie auffindbar
In einem für das Training eingerichteten Projekt SHALL Junie die Skills des arc42-Toolkits und den Skill `arc42-with-structurizr` als verfügbare Skills erkennen.

#### Scenario: Skills auflisten
- **WHEN** ein:e Teilnehmer:in Junie im eingerichteten Projekt fragt „Welche Skills kennst du?“
- **THEN** nennt Junie mindestens `arc42-section-01`, `arc42-section-02`, `arc42-section-03`, `arc42-section-09` und `arc42-with-structurizr`

#### Scenario: Aktualisierung des Toolkits
- **WHEN** der lokale Klon des arc42-Toolkits aktualisiert wird
- **THEN** nutzt Junie die neue Version ohne erneutes Kopieren, oder die Einrichtungsanleitung beschreibt den nötigen Synchronisationsschritt

### Requirement: Skills in Junie ausführbar
Ein in Junie aufgerufener arc42-Section-Skill SHALL sein dokumentiertes Verhalten zeigen, insbesondere zuerst Fragen stellen, bevor er Dokumentation erzeugt.

#### Scenario: Section-Skill fragt zuerst
- **WHEN** ein:e Teilnehmer:in in Junie schreibt „Nutze den Skill arc42-section-01 für mein Projekt“
- **THEN** stellt Junie die Fragen des Skills (u. a. zu Qualitätszielen und Stakeholdern) und erzeugt noch keine Sektion

### Requirement: Structurizr-MCP in Junie nutzbar
Junie SHALL in einem eingerichteten Projekt Structurizr-DSL über einen Structurizr-MCP-Server validieren und mindestens eine View als PlantUML oder Mermaid exportieren können.

#### Scenario: Gültige DSL
- **WHEN** Junie eine gültige `workspace.dsl` mit einer System-Context-View über den MCP validieren und exportieren soll
- **THEN** meldet die Validierung `OK` und Junie liefert den Export der View

#### Scenario: Ungültige DSL
- **WHEN** die DSL einen Syntaxfehler enthält
- **THEN** meldet Junie die Fehlermeldung des MCP-Servers statt eines erfundenen Diagramms

### Requirement: Werkzeugneutrale Skill-Hinweise
Skills, die im Training verwendet werden, SHALL in ihren Anweisungen und Hinweisen an Nutzende keine Konfigurationsdatei eines bestimmten Agenten (z. B. `opencode.json`, `.mcp.json`) als einzigen Einrichtungsweg nennen.

#### Scenario: MCP fehlt
- **WHEN** `arc42-with-structurizr` in Junie läuft und kein Structurizr-MCP verbunden ist
- **THEN** weist der Skill auf die fehlende MCP-Verbindung und die Einrichtungsanleitung hin, ohne eine werkzeugfremde Konfigurationsdatei vorauszusetzen

### Requirement: Einrichtungsanleitung für Junie
Es SHALL eine Anleitung `documents/how-tos/junie-setup.md` geben, mit der Teilnehmende Skills und Structurizr-MCP in Junie ohne Vorwissen einrichten und die Einrichtung selbst prüfen können.

#### Scenario: Einrichtung von null
- **WHEN** ein:e Teilnehmer:in mit lizenziertem Junie auf einem frischen Rechner der Anleitung folgt
- **THEN** sind danach die Skills auffindbar und der Structurizr-MCP nutzbar, geprüft mit den in der Anleitung genannten Prüfschritten

#### Scenario: Bekannte Grenzen
- **WHEN** ein Baustein in Junie nicht oder nur eingeschränkt funktioniert
- **THEN** nennt die Anleitung die Einschränkung und den zugehörigen Fallback

### Requirement: Fallback je Baustein
Für Skill-Erkennung, Skill-Ausführung und Structurizr-MCP SHALL je ein dokumentierter Fallback existieren, mit dem Demo und Übung auch ohne den betroffenen Baustein durchführbar bleiben.

#### Scenario: MCP nicht erreichbar
- **WHEN** der Structurizr-MCP im Training nicht erreichbar ist (z. B. Netzwerk blockiert)
- **THEN** kann das Kontextdiagramm der Übung über den dokumentierten Fallback validiert und dargestellt werden

#### Scenario: Skills nicht erkannt
- **WHEN** Junie die Skills nicht als Skills erkennt
- **THEN** beschreibt der Fallback, wie der Skill-Inhalt dennoch genutzt wird (z. B. als Regel- oder Prompt-Datei)

### Requirement: Nur fiktive Systeme über gehostete Dienste
Demo und Übung SHALL über gehostete Dienste wie den öffentlichen Structurizr-MCP ausschließlich DSL fiktiver Systeme senden; die Einrichtungsanleitung SHALL darauf hinweisen.

#### Scenario: Hinweis in der Anleitung
- **WHEN** die Anleitung die Einbindung des gehosteten Structurizr-MCP beschreibt
- **THEN** enthält sie einen Hinweis, dass dieser die DSL empfängt und nicht für Kundensysteme genutzt werden darf, mit Verweis auf die Self-hosted-Variante
