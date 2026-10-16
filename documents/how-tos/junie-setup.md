# Junie für arc42 und Structurizr einrichten

Anleitung für das Training *Technische Dokumentation und Kommunikation: Reboot*: Wie du JetBrains Junie in IntelliJ so einrichtest, dass die arc42-Skills und der Structurizr-MCP funktionieren – und wie du vor dem Training prüfst, ob alles läuft.

> **Kurzfassung für Teilnehmende:** Repo mit `git clone --recurse-submodules` klonen, in IntelliJ öffnen, [Checkliste](#4-checkliste-läuft-alles) durchgehen. Mehr ist nicht nötig.

---

## 1. Voraussetzungen

- **IntelliJ IDEA** mit dem Plugin **Junie** und einer gültigen Lizenz (bei Gepardec vorhanden).
- **Git**. Unter Windows zusätzlich Symlink-Unterstützung, siehe [Bekannte Grenzen](#windows-symlinks).
- **Optional:** Structurizr-CLI für den Fallback ohne MCP: `brew install structurizr` (installiert Java mit).

---

## 2. Skills

Junie liest Skills nur aus diesen Ordnern ([Doku](https://junie.jetbrains.com/docs/agent-skills.html)):

| Ebene | Ordner |
| :---- | :---- |
| Projekt | `.junie/skills/<name>/SKILL.md` |
| Global (alle Projekte) | `~/.junie/skills/<name>/SKILL.md` |

`.claude/skills/` liest Junie **nicht**. Die Junie CLI bietet zwar an, Skills aus `.claude/skills/` zu importieren, **kopiert** sie dabei aber nach `.junie/skills/` – die Kopien veralten beim nächsten Update.

### Im Trainings-Repo: schon eingerichtet

Das Repo bringt alles mit:

```
vendor/arc42-toolkit/                  arc42-Toolkit als Git-Submodule (fester Stand)
.junie/skills/arc42-*                  -> ../../vendor/arc42-toolkit/skills/arc42-*
.junie/skills/arc42-with-structurizr   -> ../../.claude/skills/arc42-with-structurizr
.junie/mcp/mcp.json                    Structurizr-MCP (siehe Abschnitt 3)
```

Die Links sind relativ und committet. Nach dem Klonen funktionieren sie, **sofern das Submodule mitgeklont wurde**:

```bash
git clone --recurse-submodules <repo-url>
# schon ohne Submodule geklont? Dann im Repo:
git submodule update --init
```

**Toolkit aktualisieren** (für Maintainer:innen des Repos, alle anderen bekommen den Stand per `git pull` + `git submodule update`):

```bash
git submodule update --remote vendor/arc42-toolkit
git add vendor/arc42-toolkit && git commit -m "Update arc42-toolkit"
```

### In eigenen Projekten: aus einem lokalen Klon verlinken

```bash
git clone https://github.com/MSiccDev/arc42-toolkit.git ~/IdeaProjects/arc42-toolkit

# global, für alle Projekte (empfohlen)
mkdir -p ~/.junie/skills
for s in ~/IdeaProjects/arc42-toolkit/skills/*/; do ln -sfn "${s%/}" ~/.junie/skills/; done
```

Pro Projekt geht es mit der Funktion `arc42-link` aus [`arc42-toolkit-setup.md`](arc42-toolkit-setup.md#hilfsfunktion-pro-repo-verlinken). Sie schließt nur `.junie/skills/arc42-*` lokal aus, eigene Skills im selben Ordner bleiben in `git status` sichtbar. Diese Links zeigen auf einen absoluten Pfad und gehören **nicht** ins Git.

Updates: `git pull` im Klon – Links brauchen keinen Sync.

### Aufruf

Junie lädt zunächst nur Name und Beschreibung eines Skills. Deshalb deutlich formulieren: *„Nutze den Skill arc42-section-01 für mein Projekt“*. Die Skills heißen ohne Namespace (`arc42-section-01`, nicht `arc42-toolkit:arc42-section-01`).

---

## 3. Structurizr-MCP

Junie liest MCP-Server aus `.junie/mcp/mcp.json` (Projekt) oder `~/.junie/mcp/mcp.json` (global, auch über *Settings → Tools → Junie → MCP Settings*). Remote-Server werden nur mit `url` eingetragen, ohne `type` ([Doku](https://junie.jetbrains.com/docs/junie-cli-mcp-configuration.html)):

```json
{
  "mcpServers": {
    "structurizr": {
      "url": "https://mcp.structurizr.com/mcp"
    }
  }
}
```

Im Trainings-Repo liegt diese Datei bereits unter `.junie/mcp/mcp.json`. Ob der Server verbunden ist, zeigt *Settings → Tools → Junie → MCP Settings*.

> **Datenschutz:** Der gehostete Server `https://mcp.structurizr.com/mcp` empfängt die DSL, die du ihm schickst. Nur für **fiktive Systeme** verwenden, nie für Kundensysteme, interne Hostnamen oder Sicherheitsdetails. Dafür einen selbst gehosteten Server ([`structurizr-setup.md`](structurizr-setup.md), 1b/1c) oder die lokale CLI ([Fallback C](#fallback-c-mcp-nicht-erreichbar-structurizr-cli)) nutzen.

---

## 4. Checkliste: Läuft alles?

Vor dem Training einmal durchgehen, im **Trainings-Repo** in IntelliJ. Jeder Prompt in einer **neuen Junie-Session**.

### Test-DSL

Beide Beispiele sind fiktiv. Für die MCP-Prüfungen kopierst du sie direkt in den Prompt – eine Datei ist nicht nötig.

<details>
<summary><strong>DSL A – gültig</strong></summary>

```
workspace "Fahrradverleih" "Fiktives Beispiel fuer den Junie-Check" {
    model {
        kunde = person "Kunde" "Leiht Fahrraeder per App aus"
        verleih = softwareSystem "Fahrradverleih" "Verwaltet Fahrraeder, Stationen und Ausleihen"
        zahlung = softwareSystem "Zahlungsanbieter" "Wickelt Kartenzahlungen ab"
        kunde -> verleih "Leiht aus und gibt zurueck"
        verleih -> zahlung "Belastet Ausleihen" "HTTPS/REST"
    }
    views {
        systemContext verleih "Kontext" {
            include *
            autolayout lr
        }
    }
}
```
</details>

<details>
<summary><strong>DSL B – absichtlich fehlerhaft</strong> (<code>zahlung</code> ist nicht definiert)</summary>

```
workspace "Fahrradverleih (fehlerhaft)" {
    model {
        kunde = person "Kunde"
        verleih = softwareSystem "Fahrradverleih"
        kunde -> verleih "Leiht aus"
        verleih -> zahlung "Belastet Ausleihen"
    }
    views {
        systemContext verleih "Kontext" {
            include *
            autolayout lr
        }
    }
}
```
</details>

### Prüfschritte

- [ ] **C0 – Submodule da.** Im Terminal: `test -f .junie/skills/arc42-section-01/SKILL.md && echo ok`
  → `ok`. Sonst: `git submodule update --init`.
- [ ] **C1 – Skills werden erkannt.** Prompt: *„Welche Skills kennst du? Liste alle mit Namen auf.“*
  → Liste enthält `arc42-section-01` … `arc42-section-12`, `arc42-lint`, `arc42-review`, `arc42-with-structurizr`. Sonst: [Fallback A](#fallback-a-skills-werden-nicht-erkannt).
- [ ] **C2 – Skill fragt zuerst.** Prompt: *„Nutze den Skill arc42-section-01 für mein Projekt: einen Fahrradverleih mit App-Ausleihe.“*
  → Junie stellt die Fragen des Skills (Zweck, Qualitätsziele, Stakeholder, Detailtiefe) und erzeugt **noch keine** Sektion. Antworte auf die Frage nach Qualitätszielen mit „soll schnell sein“ → Junie fragt nach einer messbaren Formulierung. Sonst: [Fallback B](#fallback-b-skill-wird-erkannt-aber-nicht-befolgt).
- [ ] **C3 – MCP: gültige DSL.** Prompt: *„Validiere diese DSL mit dem Structurizr-MCP und exportiere danach die View „Kontext“ als Mermaid:“* + DSL A.
  → Ein MCP-Tool-Aufruf ist sichtbar, Ergebnis `OK`, danach ein Mermaid-Block mit Kunde, Fahrradverleih, Zahlungsanbieter. Sonst: [Fallback C](#fallback-c-mcp-nicht-erreichbar-structurizr-cli).
- [ ] **C4 – MCP: fehlerhafte DSL.** Prompt: *„Validiere diese DSL mit dem Structurizr-MCP und zeig mir die Antwort des Servers wörtlich:“* + DSL B.
  → Sinngemäß *The destination element "zahlung" does not exist at line 6*. Kein Diagramm, keine stillschweigend „reparierte“ DSL.
- [ ] **C5 – Orchestrierungs-Skill.** Prompt: *„Nutze den Skill arc42-with-structurizr: Erstelle aus dieser DSL das Kontextdiagramm für arc42-Sektion 3:“* + DSL A.
  → Junie folgt dem Skill (prüft den MCP, validiert, exportiert) und liefert ein Diagramm.
- [ ] **C6 – Hinweis ohne MCP.** Den Server `structurizr` in *MCP Settings* deaktivieren, neue Session, Prompt wie C5.
  → Der Skill meldet, dass der Structurizr-MCP nicht verbunden ist, und verweist auf die Einrichtungsanleitungen – ohne eine werkzeugfremde Datei wie `opencode.json` zu verlangen. Danach den Server wieder aktivieren.
- [ ] **C7 – Fallback ohne MCP (optional, nur mit installierter CLI).** Siehe [Fallback C](#fallback-c-mcp-nicht-erreichbar-structurizr-cli): DSL A validiert mit Exit-Code 0, DSL B mit Exit-Code 1, der Export erzeugt `structurizr-Kontext.mmd`.

Alle Punkte ✅ → bereit fürs Training. Ergebnis und Versionen gern in [Abschnitt 7](#7-getestet) ergänzen.

---

## 5. Fallbacks

### Fallback A: Skills werden nicht erkannt

1. C0 prüfen – meist fehlt das Submodule.
2. **Windows:** siehe [Windows-Symlinks](#windows-symlinks).
3. Erkennt Junie verlinkte Ordner trotzdem nicht, die Links durch Kopien ersetzen. **Erst den Link löschen**, sonst kopiert `cp` in das Linkziel hinein:
   ```bash
   for l in .junie/skills/arc42-*; do
     [ -L "$l" ] || continue
     t=$(readlink "$l"); rm "$l"; cp -R ".junie/skills/$t" "$l"
   done
   ```
   Kopien veralten: nach jedem Toolkit-Update den Schritt wiederholen (vorher `git checkout -- .junie/skills` stellt die Links wieder her). Die Kopien nicht committen.

### Fallback B: Skill wird erkannt, aber nicht befolgt

Den Skill explizit lesen lassen:

> *„Lies die Datei `.junie/skills/arc42-section-01/SKILL.md` und befolge ihre Anweisungen für mein Projekt.“*

Erwartet: Junie verhält sich wie in C2. Hilft auch, wenn Junie einen Skill bei vagen Prompts nicht von selbst lädt.

### Fallback C: MCP nicht erreichbar (Structurizr-CLI)

Wenn der gehostete Server ausfällt, im Netz blockiert ist oder die DSL vertraulich ist. Nach `brew install structurizr`:

```bash
mkdir -p /tmp/junie-check && cd /tmp/junie-check
# DSL A als ok.dsl, DSL B als kaputt.dsl speichern (z. B. per Editor oder Heredoc)

structurizr validate -workspace ok.dsl       # Exit-Code 0 = OK
structurizr validate -workspace kaputt.dsl   # Exit-Code 1, Fehlermeldung im Log
structurizr export -workspace ok.dsl -format mermaid -output export
```

In Junie: *„Der Structurizr-MCP ist nicht verfügbar. Validiere `<datei>` mit der lokalen Structurizr-CLI im Terminal und exportiere die View „Kontext“ als Mermaid.“*

Lässt Junie den Remote-Eintrag in `mcp.json` gar nicht zu, geht als Zwischenlösung auch eine stdio-Brücke (benötigt Node.js):

```json
{
  "mcpServers": {
    "structurizr": {
      "command": "npx",
      "args": ["-y", "mcp-remote", "https://mcp.structurizr.com/mcp"]
    }
  }
}
```

---

## 6. Bekannte Grenzen und Hintergrund

### Windows-Symlinks

Git legt Symlinks unter Windows nur an, wenn der **Entwicklermodus** aktiv ist und `core.symlinks` gesetzt ist – sonst entstehen kleine Textdateien mit dem Linkziel:

```bash
git config --global core.symlinks true
# danach neu klonen
```

Geht das nicht, in Git Bash die Textdateien durch Kopien ersetzen:

```bash
for l in .junie/skills/arc42-*; do
  [ -f "$l" ] && [ ! -d "$l" ] || continue
  t=$(cat "$l"); rm "$l"; cp -R ".junie/skills/$t" "$l"
done
```

### `theme default` funktioniert nicht mehr

Die Structurizr-Cloud hat am 30.09.2026 ihr End of Life erreicht. `theme default` lädt ein Theme von `static.structurizr.com`, das nicht mehr erreichbar ist: Die CLI bricht dann ab, der gehostete MCP meldet trotzdem `OK`. In Trainings-DSLs deshalb **kein `theme default`**.

### APM verteilt nicht an Junie

APM 0.30 kennt kein Junie-Ziel. `--runtime intellij` meint das GitHub-Copilot-Plugin und schreibt nach `.agents/skills/` und `.github/` – beide Ordner liest Junie nicht.

### Junie-Marketplace

Junie kann Claude-Code-Plugins aus Marketplaces installieren. Für das arc42-Toolkit hat das im Spike nicht ohne Weiteres funktioniert; der Weg über `.junie/skills/` ist der getestete.

### Orchestrierungs-Skill und PlantUML

`arc42-with-structurizr` exportiert standardmäßig PlantUML und rendert SVG mit einer lokalen `plantuml`-Installation. Ohne `plantuml` fragt der Skill, ob er installieren oder Mermaid verwenden soll.

---

## 7. Getestet

| Feld | Wert |
| :---- | :---- |
| Datum | 2026-10-16 |
| IntelliJ IDEA | 2026.2 |
| Junie | *Version nachtragen (Settings → Plugins → Junie)* |
| Modell | `gemini-3.7-flash` |
| Projekt | Trainings-Repo (Root), Skills als **absolute** Links auf einen lokalen Toolkit-Klon, MCP über `.junie/mcp/mcp.json` |

| Prüfung | Ergebnis |
| :---- | :---- |
| Skills erkannt (C1), ohne Namespace | ✅ per Symlink und per Kopie; Marketplace ⚠️ (siehe Hintergrund) |
| Toolkit-Update über Link ohne Sync | ✅ Änderung im Klon sofort sichtbar |
| Skill fragt zuerst (C2), fordert messbare Qualitätsziele | ✅ |
| MCP gültige DSL + Mermaid-Export (C3) | ✅ |
| MCP fehlerhafte DSL (C4) | ✅ wörtliche Servermeldung |
| Orchestrierungs-Skill mit MCP (C5) | ✅ Kontextdiagramm für Sektion 3 |
| Orchestrierungs-Skill ohne MCP (C6) | ✅ werkzeugneutraler Hinweis |
| CLI-Fallback (C7) | ✅ Exit 0 / Exit 1, Export erzeugt |
| Fallback „Skill-Datei explizit lesen“ (B) | ✅ |
| **Frischer Klon mit Submodule, nur nach dieser Anleitung** | ⏳ **offen** – die committete Variante (relative Links ins Submodule) ist noch nicht in Junie geprüft |

**Entscheidung: Go.** Skills (per Link) und MCP (direkt über HTTP) funktionieren in Junie. Vor dem ersten Training muss die offene Prüfung auf einem frischen Klon erledigt sein, idealerweise durch eine zweite Person.

---

## Zuordnung zur Spec `training/demo-tooling`

| Requirement | Szenario | Nachweis |
| :---- | :---- | :---- |
| Skills in Junie auffindbar | Skills auflisten | C0, C1 |
| Skills in Junie auffindbar | Aktualisierung des Toolkits | Abschnitt 2 (Submodule-Update bzw. `git pull`), Getestet |
| Skills in Junie ausführbar | Section-Skill fragt zuerst | C2 |
| Structurizr-MCP in Junie nutzbar | Gültige DSL | C3 |
| Structurizr-MCP in Junie nutzbar | Ungültige DSL | C4 |
| Werkzeugneutrale Skill-Hinweise | MCP fehlt | C6 |
| Einrichtungsanleitung für Junie | Einrichtung von null | Kurzfassung, Abschnitt 1–3, offene Prüfung in Abschnitt 7 |
| Einrichtungsanleitung für Junie | Bekannte Grenzen | Abschnitt 5 und 6 |
| Fallback je Baustein | MCP nicht erreichbar | Fallback C, C7 |
| Fallback je Baustein | Skills nicht erkannt | Fallback A, B |
| Nur fiktive Systeme über gehostete Dienste | Hinweis in der Anleitung | Abschnitt 3 (Datenschutz) |
