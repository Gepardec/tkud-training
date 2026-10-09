# Design

## Context

Motivation und Umfang: siehe `proposal.md`. Anforderungen: siehe `specs/training/ki-kapitel/spec.md`.

Ausgangslage im Dokument `documents/Technische Dokumentation und Kommunikation_ Reboot - Ausarbeitung.md`:

- Der Abschnitt `# KI` (ab ca. Zeile 369) besteht nur aus Stichpunkten und einem dreizeiligen „Ablauf“.
- Die Kapitel sind uneinheitlich formatiert: „Begrüßung & Einführung“ hat eine Markdown-Überblick-Tabelle, „Sichtenmodell und Notation“ und „ADR“ nutzen eine Zeile `Inhalt: • … Übung: …`. Die Ebenen schwanken (`#` vs. `##`).
- Das Dokument ist ein Google-Docs-Export (escapte Zeichen wie `\-`, eingebettete Base64-Bilder am Ende) und noch **nicht in Git eingecheckt**.
- Inhalte, auf die das Kapitel zurückverweist, existieren bereits: Sichten/C4 (ab Z. 24), ADR inkl. MADR (ab Z. 114), Kreuztabelle QS↔Risiko (Z. 281), Docs-as-Code/Architecture-as-Code (Z. 320 ff.).

Dieser Change liefert den **Rahmen** des Kapitels. Die inhaltliche Ausarbeitung der Phasen, der Skill, das Demo-Repo und die Übungsanleitung folgen in eigenen Changes (siehe `proposal.md` – Impact).

## Goals / Non-Goals

**Goals:**
- Kapitelgerüst im Dokument, das alle Anforderungen der Spec strukturell abbildet: Überblick-Tabelle, Einleitung mit Phasenmodell und Green-/Brownfield-Einordnung, Abschnitte je Phase, Ablauf mit Zeiten, Übungsbeschreibung auf Rahmenebene.
- Ein Gerüst, in das die Folge-Changes ihre Inhalte einsetzen können, ohne die Struktur erneut zu verhandeln.

**Non-Goals:**
- Ausformulierter Fachtext je Phase (→ `ki-kapitel-phasen`).
- Ausgearbeitete Praxisbeispiele MD/MM (→ `ki-kapitel-phasen`).
- Brainstorming-Skill, Demo-Repo, Kunden-Brief (→ `ki-brainstorming-skill`, `ki-demo-repo`).
- Schritt-für-Schritt-Übungsanleitung und Trainer-Notizen (→ `ki-uebung-durchstich`).
- Vereinheitlichung der Formatierung der anderen Kapitel.

## Decisions

### D1: Rahmen-Change erfüllt Struktur-Anforderungen, Folge-Changes die Inhalts-Anforderungen
Die Spec beschreibt das fertige Kapitel. Dieser Change erfüllt vollständig: Überblick-Tabelle, Phasenstruktur, Green-/Brownfield-Einordnung, Ablauf, Übungsformat, Werkzeug- und Vertraulichkeitsregel. Szenarien, die ausgearbeiteten Inhalt verlangen (MD/MM mit Ausgangslage/KI-Einsatz/Ergebnis, Ergebnisse je Team), werden im Gerüst als markierte Abschnitte angelegt und von den Folge-Changes befüllt.
*Alternative:* Spec auf reine Rahmen-Anforderungen beschränken – verworfen, weil die Capability das Kapitel als Ganzes beschreiben soll und sonst jeder Folge-Change die Spec ändern müsste.

### D2: Kapitel als `## Dokumentation mit KI` mit Markdown-Überblick-Tabelle
Überschrift auf `##`-Ebene wie „Sichtenmodell“ und „ADR“; Überblick als Markdown-Tabelle wie bei „Begrüßung & Einführung“ (Zeilen Inhalt, Lernziele, Übung). Die Tabelle ist besser lesbar als die `Inhalt: •`-Zeile und erfüllt die Spec wörtlich.
*Alternative:* `Inhalt: •`-Zeile wie die direkten Nachbarkapitel – verworfen, weil Lernziele dort fehlen.

### D3: Lernziele
Die Teilnehmenden können …
1. für jede Projektphase erklären, wie KI bei der Dokumentation unterstützt und wo ihre Grenzen liegen;
2. Brownfield und Greenfield nach Quelle, Rolle der KI und Hauptrisiko unterscheiden;
3. mit KI-Unterstützung Qualitätsziele, Stakeholder und Nicht-Ziele erheben und messbar formulieren;
4. Skills und MCP-Server als Bausteine einordnen und wissen, wie sie in ein Repository kommen;
5. KI-generierte Dokumentation kritisch prüfen (Generik, Halluzination, fehlender Projektbezug).

### D4: Ablauf (3:45 h)

```
  0:00  Praxis-Einstieg Brownfield: Media Data (15) + MM (10)          25
  0:25  Einordnung: Phasenmodell, Green-/Brownfield, Skills & MCP      10
  0:35  Vorprojekt:   Konzept + Live-Demo Brainstorming-Skill           20
  0:55  Architektur:  arc42-Toolkit + Structurizr (Orchestra-Skill)     20
  1:15  Entscheiden:  ADRs mit KI, Kreuztabelle                         15
  1:30  Umsetzung:    Doku aktuell halten (OpenSpec-Ausblick)           10
  1:40  Pause                                                           15
  1:55  Hands-on Greenfield-Durchstich (Teams a 3-4)                    90
          Brainstorming 30 | Sek. 1+2 15 | Kontextdiagramm 20 |
          ADR 15 | Teamvergleich 10
  3:25  Transfer aufs eigene Projekt + Abschluss                        20
  3:45  Ende
```

Puffer bis 4 h: 15 min, bewusst nicht verplant (Setup-Probleme im Hands-on sind wahrscheinlich).
*Alternative:* Hands-on vor den Phasen-Demos – verworfen, weil Teams die Skills sonst ohne Vorbild bedienen müssen.

### D5: Live-Demos nutzen ein anderes fiktives Projekt als der Team-Brief
Die Trainer:innen-Demos je Phase laufen an einem eigenen Demo-Projekt, nicht am Kunden-Brief der Übung. Sonst übernehmen Teams die Demo-Ergebnisse, und der Teamvergleich verliert seine Aussage.
*Alternative:* gleicher Brief für Demo und Übung – spart Vorbereitung, entwertet aber die Übung.

### D6: Die alten Stichpunkte werden ersetzt, nicht ergänzt
Die bisherigen Notizen des `# KI`-Abschnitts sind vollständig in `proposal.md` und der Spec aufgegangen und werden im Dokument durch das Gerüst ersetzt.

## Risks / Trade-offs

- [Dokument nicht versioniert – Überschreiben ohne Rückweg] → Dokument vor der ersten Änderung im aktuellen Stand committen.
- [Google-Docs-Export: Rückimport oder parallele Bearbeitung in Google Docs überschreibt Markdown-Änderungen] → klären, welche Quelle führend ist; bis dahin Markdown als führend behandeln. **Geklärt 2026-10-09: Markdown im Repo ist führend.** Google Docs ist nur noch historische Quelle.
- [Dokument wurde nicht vor der Änderung committet – Ausgangsstand fehlt in der Git-Historie] → Der erste Commit enthält bereits den neuen KI-Abschnitt; der alte Abschnitt (nur Stichpunkte) ist vollständig in `proposal.md` erfasst. Akzeptiert am 2026-10-09.
- [Zeitplan zu dicht: 90 min Hands-on mit Tool-Setup] → Junie-Spike vor dem Training, vorbereitetes Demo-Repo, 15 min Puffer.
- [Junie unterstützt Skills/MCP nicht wie recherchiert] → `ki-junie-spike` früh; Fallback: Skills als Prompt-Dateien bzw. `.aiassistant/rules/`, Diagramm per Structurizr-DSL ohne MCP.
- [Gerüst mit leeren Phasenabschnitten wirkt unfertig, falls das Dokument vorher geteilt wird] → Abschnitte sichtbar als „in Ausarbeitung“ markieren.

## Spec-Abdeckung

Stand nach Umsetzung dieses Changes (siehe D1):

| Anforderung | Status | Offen für |
| :---- | :---- | :---- |
| Überblick-Tabelle | erfüllt | – |
| KI-Schicht über das bisherige Training | erfüllt für Einleitung und Gerüst; Phasentexte müssen weiter verweisen statt erklären | `ki-kapitel-phasen` |
| Struktur nach Projektphasen | erfüllt (vier Phasen, Rückbezug je Phase) | – |
| Brownfield- und Greenfield-Einstieg | erfüllt (Gegenüberstellung, gemeinsamer Endpunkt) | – |
| Brownfield-Praxisbeispiele | Gerüst angelegt | `ki-kapitel-phasen` |
| Greenfield-Erhebung mit KI | Grundsatz und Nicht-Ziele beschrieben; Nachweis „KI fragt nach messbarer Formulierung“ fehlt | `ki-brainstorming-skill`, `ki-kapitel-phasen` |
| Ablauf für einen halben Tag | erfüllt (3:45 h, Praxis zuerst) | – |
| Greenfield-Durchstich als Übung | Rahmen, Schritte, Ergebnisse und Teamvergleich erfüllt; Kunden-Brief und Detailanleitung fehlen | `ki-demo-repo`, `ki-uebung-durchstich` |
| Werkzeug und Tool-Neutralität | erfüllt | – |
| Kein Kundencode in KI-Tools | erfüllt | – |

## Open Questions

- Freigabe bzw. Anonymisierung von Media Data und MM (betrifft nur den Inhalt in `ki-kapitel-phasen`).
- Domäne des Kunden-Briefs und des separaten Demo-Projekts (betrifft `ki-demo-repo`).
- Ort des Demo-Repos (betrifft `ki-demo-repo`).
- Tiefe des OpenSpec-Teils in der Phase Umsetzung; der Zeitplan sieht 10 min Ausblick vor und lässt sich ohne Strukturänderung verschieben.
