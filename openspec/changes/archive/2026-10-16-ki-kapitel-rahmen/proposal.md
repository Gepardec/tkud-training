# Proposal

## Why

Das Kapitel „KI“ im Training *Technische Dokumentation und Kommunikation: Reboot* besteht derzeit nur aus einer Stichpunktliste ohne Lernziele, Ablauf oder Übung. Bevor die Inhalte geschrieben und das Material (Skill, Demo-Repo) gebaut werden, braucht das Kapitel einen verbindlichen Rahmen: Rolle im Training, Struktur, Zeitbudget und Übungsformat. Sonst entstehen die Teilpakete ohne gemeinsamen roten Faden.

## What Changes

- Kapitel „KI“ erhält eine Überblick-Tabelle (Inhalt, Lernziele, Übung) analog zu den bisherigen Kapiteln.
- Festlegung der **Rolle**: Das Kapitel ist eine KI-Schicht über das bisherige Training. Es führt kaum neue Konzepte ein, sondern zeigt, wie Sichten/C4, arc42 und ADRs mit KI erstellt und aktuell gehalten werden; jede Phase verweist auf das passende frühere Kapitel.
- Festlegung der **Struktur nach Projektphasen**: Vorprojekt → Architektur → Entscheiden → Umsetzung (Doku aktuell halten).
- Einführung der **zwei Einstiege** in dasselbe Phasenmodell:
  - **Brownfield/Legacy (Code → Doku)**: wird anhand der Praxisbeispiele *Media Data* (arc42) und *MM* (Camel-Route-Guideline) gezeigt.
  - **Greenfield (Idee → Doku)**: wird selbst gemacht; Schwerpunkt ist, wie man mit KI zu Qualitätszielen, Anforderungen und Nicht-Zielen kommt.
- Festlegung des **Ablaufs** für einen halben Tag (3–4 h): Praxis-Einstieg → je Phase Konzept + Live-Demo + Rückbezug → Hands-on → Transfer aufs eigene Projekt.
- Festlegung der **Übung** als Greenfield-Durchstich in Teams im Demo-Repo: fiktiver, bewusst lückenhafter Kunden-Brief → Brainstorming-Skill (QS-Ziele, Stakeholder, Nicht-Ziele) → arc42-Sektionen 1 und 2 → Kontextdiagramm via Structurizr → ein ADR inkl. Kreuztabelle QS↔ADR → Vergleich der Teamergebnisse.
- Festlegung des **Tools**: Live-Demo und Hands-on mit JetBrains Junie / IntelliJ AI Assistant (lizenziert); Inhalte bleiben konzeptionell tool-agnostisch (Agent Skills, MCP, Spec-driven Development).
- Festlegung der **Zielgruppe**: Gepardec-Mitarbeitende allgemein. Hands-on findet nur im Demo-Repo statt; der Transfer aufs eigene Projekt ist Diskussion, damit kein Kundencode in KI-Tools gelangt.

## Capabilities

### New Capabilities
- `training/ki-kapitel`: Inhaltliche und didaktische Anforderungen an das KI-Kapitel des Trainings – Rolle, Phasenstruktur, Green-/Brownfield-Einstiege, Ablauf, Lernziele und Übungsformat.

### Modified Capabilities
<!-- keine -->

## Impact

- **Dokument**: `documents/Technische Dokumentation und Kommunikation_ Reboot - Ausarbeitung.md`, Abschnitt „KI“ (bisher Stichpunkte) wird durch Überblick-Tabelle, Einleitung und Ablauf ersetzt.
- **Folge-Changes**, die auf diesem Rahmen aufbauen:
  - `ki-junie-spike` – verifizieren, dass Agent Skills und Structurizr-MCP in Junie laufen (früh, Risiko).
  - `ki-brainstorming-skill` – neuer Skill zur Erhebung von QS-Zielen, Stakeholdern und Nicht-Zielen; Output im Format arc42 Sektion 1/2/10 (das arc42-Toolkit dokumentiert nur, es erhebt nicht, und kennt keine Nicht-Ziele).
  - `ki-demo-repo` – Demo-Repo mit Kunden-Brief und APM-Setup für Junie.
  - `ki-kapitel-phasen` – Theorie-/Demo-Text je Phase inkl. Praxisbeispiele MD und MM.
  - `ki-uebung-durchstich` – Übungsanleitung und Trainer-Notizen.
- **Abhängigkeiten**: arc42-Toolkit (MSiccDev/arc42-toolkit), Skill `arc42-with-structurizr`, Structurizr-MCP, APM (`apm.yml`, Ziel für Junie ergänzen).

## Offene Fragen

- Dürfen Media Data und MM intern unverändert gezeigt werden, oder ist Anonymisierung nötig?
- Welche fiktive Domäne für den Kunden-Brief bietet genug eingebaute Zielkonflikte?
- Liegt das Demo-Repo in diesem Repository oder separat (klonbar für Teilnehmende)?
- OpenSpec: nur Ausblick am Ende oder eigene Phase „Doku aktuell halten“?
