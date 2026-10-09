# Prüfschritte Junie-Spike

Diese Schritte in Junie (IntelliJ) ausführen, mit `spikes/junie/` als geöffnetem Projekt. Jeder Prompt startet in einer **neuen Junie-Session**, damit kein Kontext aus vorherigen Schritten mitläuft. Das tatsächliche Ergebnis unter **Ergebnis** eintragen (kurzer Text oder Screenshot-Verweis). Status: ✅ wie erwartet · ⚠️ teilweise · ❌ nicht.

## Umgebung

| Feld | Wert |
| :---- | :---- |
| Datum | |
| IntelliJ-Version | |
| Junie-Version | |
| Modell in Junie | |
| Weg Skill-Verteilung (Marketplace / Symlink / Kopie) | |
| Weg MCP (HTTP direkt / mcp-remote / ohne MCP) | |

---

## P1 – Skill-Erkennung

**Prompt:**
> Welche Skills kennst du? Liste alle mit Namen auf.

**Erwartet:** Die Liste enthält mindestens `arc42-section-01`, `arc42-section-02`, `arc42-section-03`, `arc42-section-09` und `arc42-with-structurizr` (ggf. mit Namespace, z. B. `arc42-toolkit:arc42-section-01`).

**Zusätzlich notieren:** Wie heißen die Skills genau (mit oder ohne Namespace)?

| Weg | Status | Ergebnis |
| :---- | :---- | :---- |
| Marketplace | | |
| Symlink | | |
| Kopie | | |

## P1-F – Fallback, falls Junie keine Skills erkennt

Nur ausführen, wenn P1 auf allen Wegen ❌ ist.

**Prompt:**
> Lies die Datei `.junie/skills/arc42-section-01/SKILL.md` und befolge ihre Anweisungen für mein Projekt.

**Erwartet:** Junie liest die Datei und verhält sich wie in P3 (stellt zuerst Fragen).

**Status / Ergebnis:**

## P2 – Aktualisierung des Toolkits

**Vorgehen:** Im Toolkit-Klon (`~/IdeaProjects/arc42-toolkit`) in `skills/arc42-section-01/SKILL.md` testweise die Zeile `version: 1.0.1` auf `version: 1.0.1-spike` ändern (danach wieder zurücksetzen, `git checkout -- skills/arc42-section-01/SKILL.md`).

**Prompt:**
> Welche Version steht im Frontmatter des Skills arc42-section-01?

**Erwartet:**
- Symlink-Weg: `1.0.1-spike` (Änderung kommt ohne Kopieren an).
- Marketplace-Weg: `1.0.1` (Marketplace nutzt eigenen Stand); notieren, wie man aktualisiert.
- Kopie-Weg: `1.0.1`, erst nach erneutem Sync `1.0.1-spike`.

**Status / Ergebnis:**

## P3 – Section-Skill fragt zuerst

**Prompt:**
> Nutze den Skill arc42-section-01 für mein Projekt. Das Projekt ist der Fahrradverleih aus workspace.dsl.

**Erwartet:** Junie stellt die Fragen des Skills (u. a. Systemzweck, Qualitätsziele, Stakeholder, Detailtiefe) und erzeugt **noch keine** Sektion 1. Bei vagen Qualitätszielen (z. B. „soll schnell sein“) fragt es nach einer messbaren Formulierung.

**Status / Ergebnis:**

## P4 – Structurizr-MCP: gültige DSL und Export

**Prompt:**
> Validiere workspace.dsl mit dem Structurizr-MCP. Exportiere danach die View „Kontext“ als Mermaid.

**Erwartet:** Validierung meldet `OK`. Junie liefert einen Mermaid-Block mit den Elementen Kunde, Servicemitarbeiter, Fahrradverleih, Zahlungsanbieter, Kartendienst. Junie nutzt erkennbar das MCP-Tool (Tool-Aufruf sichtbar), nicht eigenes Wissen.

**Status / Ergebnis:**

## P5 – Structurizr-MCP: ungültige DSL

**Prompt:**
> Validiere broken.dsl mit dem Structurizr-MCP und zeig mir die Antwort des Servers wörtlich.

**Erwartet:** Junie gibt die Fehlermeldung des Servers wieder, sinngemäß: *The destination element "zahlung" does not exist at line 9*. Kein Diagramm, keine „reparierte“ Version ohne Rückfrage.

**Status / Ergebnis:**

## P6 – Fallback ohne MCP (Structurizr-CLI)

**Vorgehen:** MCP in Junie deaktivieren bzw. trennen.

**Prompt:**
> Der Structurizr-MCP ist nicht verfügbar. Validiere workspace.dsl stattdessen mit der lokalen Structurizr-CLI im Terminal und exportiere die View „Kontext“ als Mermaid.

**Erwartet:** Junie führt die in `documents/how-tos/junie-setup.md` dokumentierten CLI-Befehle aus; Validierung `OK`, Export-Datei wird erzeugt.

**Status / Ergebnis:**

## P7 – Orchestrierungs-Skill `arc42-with-structurizr`

### P7a – mit verbundenem MCP

**Prompt:**
> Nutze den Skill arc42-with-structurizr: Erstelle für den Fahrradverleih aus workspace.dsl das Kontextdiagramm für arc42-Sektion 3.

**Erwartet:** Junie folgt dem Skill-Ablauf (prüft MCP, ggf. PlantUML, nutzt arc42-section-03), validiert die DSL über den MCP und erzeugt ein Diagramm (PlantUML/SVG oder Mermaid).

**Status / Ergebnis:**

### P7b – ohne MCP

**Vorgehen:** MCP trennen, neue Session.

**Prompt:** wie P7a.

**Erwartet:** Der Skill meldet, dass der Structurizr-MCP nicht verbunden ist, und verweist auf die Einrichtungsanleitung – **ohne** `opencode.json` oder eine andere werkzeugfremde Datei vorauszusetzen.

**Status / Ergebnis:**

## P8 – Einrichtung nach Anleitung

Erst nach Fertigstellung von `documents/how-tos/junie-setup.md`, idealerweise durch eine zweite Person.

**Vorgehen:** Neues leeres Projekt anlegen und nur nach `junie-setup.md` einrichten. Danach P1, P3 und P4 im neuen Projekt wiederholen.

**Erwartet:**
- Einrichtung gelingt ohne Rückfragen; P1, P3, P4 ✅.
- Jede dabei aufgetretene Einschränkung steht in der Anleitung unter „Bekannte Grenzen“ mit Fallback.
- Die Anleitung enthält den Datenschutzhinweis zum gehosteten MCP mit Verweis auf die Self-hosted-Variante.

**Status / Ergebnis:**

---

## Zuordnung zur Spec `training/demo-tooling`

| Requirement | Szenario | Prüfschritt |
| :---- | :---- | :---- |
| Skills in Junie auffindbar | Skills auflisten | P1 |
| Skills in Junie auffindbar | Aktualisierung des Toolkits | P2 |
| Skills in Junie ausführbar | Section-Skill fragt zuerst | P3 |
| Structurizr-MCP in Junie nutzbar | Gültige DSL | P4 |
| Structurizr-MCP in Junie nutzbar | Ungültige DSL | P5 |
| Werkzeugneutrale Skill-Hinweise | MCP fehlt | P7b |
| Einrichtungsanleitung für Junie | Einrichtung von null | P8 |
| Einrichtungsanleitung für Junie | Bekannte Grenzen | P8 |
| Fallback je Baustein | MCP nicht erreichbar | P6 |
| Fallback je Baustein | Skills nicht erkannt | P1-F |
| Nur fiktive Systeme über gehostete Dienste | Hinweis in der Anleitung | P8 |
