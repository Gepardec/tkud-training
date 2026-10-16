  
# arc42-toolkit in eigenen Projekten nutzen

Persönliche Notizen: wie man das Toolkit einbindet, **ohne die Skills in jedes Projekt zu kopieren**.

Lokaler Klon: `~/IdeaProjects/arc42-toolkit`. Updates holt man immer mit `git pull` im Klon.

---

## Claude Code

Das Repo ist ein fertiges Claude-Code-Plugin (`.claude-plugin/plugin.json` + `marketplace.json`).

### Installation (direkt von GitHub)

```
/plugin marketplace add MSiccDev/arc42-toolkit
/plugin install arc42-toolkit@arc42-toolkit
```

- Aufruf mit Namespace, z.B. `/arc42-toolkit:arc42-section-01`
- Update: `/plugin marketplace update arc42-toolkit`
- Das README nennt `claude plugin install MSiccDev/arc42-toolkit` als Einzeiler. Klappt das nicht, den Ablauf oben verwenden (erst den Marketplace hinzufügen, dann installieren).

### Variante: lokaler Klon als Marketplace

Sinnvoll, wenn man selbst an den Skills arbeitet oder einen bestimmten Stand verwenden will:

```
/plugin marketplace add ~/IdeaProjects/arc42-toolkit
/plugin install arc42-toolkit@arc42-toolkit
```

### Variante: im Team per Projekt festlegen

Im **Zielprojekt** eine `.claude/settings.json` committen:

```json
{
  "extraKnownMarketplaces": {
    "arc42-toolkit": {
      "source": { "source": "github", "repo": "MSiccDev/arc42-toolkit" }
    }
  },
  "enabledPlugins": {
    "arc42-toolkit@arc42-toolkit": true
  }
}
```

Wer das Projekt öffnet, wird gefragt, ob das Plugin installiert werden soll. Alle arbeiten mit derselben Version, und es gibt keine Kopien.

---

## OpenCode

OpenCode hat **kein Plugin- oder Marketplace-System** für Skills. Es liest `SKILL.md`-Ordner aus diesen Verzeichnissen ([Doku](https://opencode.ai/docs/skills/)):

| Ebene   | Pfade |
|---------|-------|
| Projekt | `.opencode/skills/`, `.claude/skills/`, `.agents/skills/` |
| Global  | `~/.config/opencode/skills/`, `~/.claude/skills/`, `~/.agents/skills/` |

### Global per Symlink (empfohlen)

```bash
mkdir -p ~/.config/opencode/skills
for s in ~/IdeaProjects/arc42-toolkit/skills/*/; do
  ln -sfn "${s%/}" ~/.config/opencode/skills/
done
```

Tipp: Mit `~/.agents/skills` statt `~/.config/opencode/skills` finden auch Codex und andere Tools, die `.agents/` lesen, dieselben Skills.

### Nur für ein Projekt

```bash
mkdir -p .agents/skills
for s in ~/IdeaProjects/arc42-toolkit/skills/*/; do ln -sfn "${s%/}" .agents/skills/; done
```

Diese Symlinks zeigen auf einen absoluten lokalen Pfad und gehören **nicht** ins Git. Fürs Team besser ein `git submodule` mit relativen Symlinks verwenden.

### Aufruf

Der Agent lädt Skills selbst über sein `skill`-Tool. Einfach schreiben:
*„Nutze den Skill arc42-section-01 für mein Projekt"*.

### Offene Punkte

- **Symlinks:** Die Doku sagt nicht, ob verlinkte Ordner erkannt werden. Zum Prüfen OpenCode starten und fragen: *„Welche Skills hast du?"*. Fehlen die arc42-Skills, stattdessen kopieren und nach jedem Update synchronisieren:
  ```bash
  for s in ~/IdeaProjects/arc42-toolkit/skills/arc42-*/; do
    rsync -a --delete "$s" ~/.config/opencode/skills/"$(basename "$s")"/
  done
  ```
  Die Schleife synchronisiert jeden `arc42-*`-Ordner einzeln. `--delete` wirkt so nur innerhalb dieser Ordner, andere Skills im Zielordner bleiben unangetastet. Für andere Tools nur den Zielordner tauschen (z. B. `~/.junie/skills/`).
- **Claude-Code-Plugin:** Ein über das Plugin installiertes Toolkit liegt im Plugin-Cache von Claude Code. Nach der Doku liest OpenCode nur Skills-Ordner wie `~/.claude/skills`, den Plugin-Cache wohl nicht. Für OpenCode deshalb die Symlinks oben verwenden.

---

## GitHub Copilot

Copilot sucht Skills in diesen Ordnern ([Doku](https://code.visualstudio.com/docs/copilot/customization/agent-skills)):

| Ebene      | Ordner |
|------------|--------|
| Projekt    | `.github/skills/`, `.claude/skills/`, `.agents/skills/` |
| Persönlich | `~/.copilot/skills/`, `~/.claude/skills/`, `~/.agents/skills/` |

Das gilt laut Doku für Copilot in VS Code, die Copilot CLI, die Copilot-App und den Copilot Cloud Agent.

### Für die eigene Arbeit: einmal global verlinken (empfohlen)

```bash
mkdir -p ~/.agents/skills
for s in ~/IdeaProjects/arc42-toolkit/skills/*/; do ln -sfn "${s%/}" ~/.agents/skills/; done
```

`~/.agents/skills/` lesen **Copilot, OpenCode und Codex**. In den Code-Repos muss man dann nichts anlegen. Claude Code liest diesen Ordner **nicht**: dort das Plugin nehmen oder zusätzlich nach `~/.claude/skills/` verlinken.

### Falls doch pro Projekt verlinkt

- Die Symlinks **nicht committen**. Sie zeigen auf einen lokalen Pfad und sind auf anderen Rechnern und in CI kaputt. Lokal ausschließen, ohne die `.gitignore` des Projekts anzufassen:
  ```bash
  echo ".agents/skills/" >> .git/info/exclude
  ```
- Der **Copilot Cloud Agent** arbeitet direkt auf dem Repo bei GitHub und sieht lokale Symlinks nicht. Soll er die Skills nutzen, müssen sie wirklich im Repo liegen (per APM oder `git submodule`).

### Copilot CLI als Plugin (laut README)

```bash
copilot plugin marketplace add MSiccDev/arc42-toolkit
copilot plugin install arc42-toolkit
```

### Offene Punkte

- **Symlinks:** Die Doku sagt nicht, ob verlinkte Ordner erkannt werden. Zum Prüfen im Copilot-Chat fragen: *„Welche Skills kennst du?"*

### IntelliJ (GitHub-Copilot-Plugin)

Agent Skills werden in JetBrains-IDEs unterstützt, sind aber noch **Public Preview** ([Changelog](https://github.blog/changelog/2026-02-13-new-features-and-improvements-in-github-copilot-in-jetbrains-ides-2/)).

1. Einschalten unter **Settings → GitHub Copilot → Chat → Agent → Agent Skills**.
2. Bei Copilot Business/Enterprise muss ein Admin zuerst die Richtlinie **Editor preview features** freigeben.
3. Skills gelten **nur im Agent-Modus** des Copilot-Chats, nicht im Ask- oder Edit-Modus.
4. Gesucht wird im Projekt in `.github/skills/`, `.claude/skills/` und `.agents/skills/`.

Für JetBrains habe ich nirgends dokumentiert gefunden, ob **globale Ordner** (`~/.agents/skills/`, `~/.copilot/skills/`) gelesen werden. Am sichersten ist deshalb, pro Projekt zu verlinken und lokal auszuschließen:

```bash
mkdir -p .agents/skills
for s in ~/IdeaProjects/arc42-toolkit/skills/*/; do ln -sfn "${s%/}" .agents/skills/; done
echo ".agents/skills/" >> .git/info/exclude
```

Zum Testen im Agent-Modus fragen: *„Welche Skills kennst du?"* oder direkt *„Nutze den Skill arc42-section-01"*.

Bekannte Probleme mit dem Plugin:
- [#1395](https://github.com/microsoft/copilot-intellij-feedback/issues/1395): Plugin 1.5.65 konnte `SKILL.md` nicht lesen (Fehler `Path must not contain a scheme`). Copilot arbeitet dann ohne den Skill weiter. Abhilfe: Plugin aktualisieren.
- [#1682](https://github.com/microsoft/copilot-intellij-feedback/issues/1682): Skills und `AGENTS.md` werden nicht geladen, wenn das Projekt auf einem WSL2-Pfad liegt. Unter macOS nicht relevant.

---

## Junie

Im Trainings-Repo ist Junie schon eingerichtet (Toolkit als Submodule, Links und MCP-Konfiguration committet). Einrichtung, Structurizr-MCP und Prüf-Checkliste: [`junie-setup.md`](junie-setup.md) im Trainings-Repo `tkud-training`.

Junie (im IDE und als CLI) liest Skills aus diesen Ordnern ([Doku](https://junie.jetbrains.com/docs/agent-skills.html)):

| Ebene   | Ordner |
|---------|--------|
| Projekt | `.junie/skills/` |
| Global  | `~/.junie/skills/` |

`.claude/skills/` und `.agents/skills/` liest Junie **nicht**. Die Junie CLI erkennt zwar `.claude/skills/`, `.cursor/skills/` und `.codex/skills/` und schlägt einen Import vor, dabei werden die Skills aber nach `.junie/skills/` **kopiert** und veralten nach einem Update im Klon.

### Global per Symlink (empfohlen)

```bash
mkdir -p ~/.junie/skills
for s in ~/IdeaProjects/arc42-toolkit/skills/*/; do ln -sfn "${s%/}" ~/.junie/skills/; done
```

Gilt dann für Junie im IDE und in der CLI, in allen Projekten.

### Nur für ein Projekt

```bash
mkdir -p .junie/skills
for s in ~/IdeaProjects/arc42-toolkit/skills/*/; do ln -sfn "${s%/}" .junie/skills/; done
echo ".junie/skills/" >> .git/info/exclude
```

Die Befehle im **Repo-Root** ausführen, nicht in `.junie/skills/`, denn der Zielpfad `.junie/skills/` ist relativ. Getestet in `tkud-training`: Die Links werden angelegt.

Kürzer geht es mit der Funktion `arc42-link` (siehe [Hilfsfunktion](#hilfsfunktion-pro-repo-verlinken)).

### Aufruf

Junie lädt zuerst nur Name und Beschreibung jedes Skills und liest den vollen Inhalt erst, wenn der Skill zur Aufgabe passt. Also deutlich formulieren: *„Nutze den Skill arc42-section-01 für mein Projekt"*.

### Offene Punkte

- **Symlinks:** Im Junie-Spike (2026-10-16, IntelliJ 2026.2) getestet: Verlinkte Ordner in `.junie/skills/` werden erkannt, eine Änderung im Klon ist ohne Sync sichtbar. Fehlen die arc42-Skills trotzdem, stattdessen kopieren (siehe `rsync`-Hinweis bei OpenCode, Zielordner `~/.junie/skills/`).

---

## JetBrains AI Assistant

AI Assistant unterstützt Agent Skills ab **2026.1** und hat dafür einen **Skills Manager** ([Doku](https://www.jetbrains.com/help/ai-assistant/agent-skills.html), [Blog](https://blog.jetbrains.com/ai/2026/04/skill-manager-and-skill-repository/)).

| Ebene   | Ordner |
|---------|--------|
| Projekt | `.agents/skills/` |
| IDE (alle Projekte) | im Cache-Verzeichnis der IDE unter `aia/agents/.agents/skills`, wird über den Skills Manager verwaltet |

Der IDE-weite Ordner liegt im Cache und ist pro IDE-Version verschieden. Dort von Hand zu verlinken lohnt sich nicht.

### Pro Projekt verlinken (empfohlen)

```bash
mkdir -p .agents/skills
for s in ~/IdeaProjects/arc42-toolkit/skills/*/; do ln -sfn "${s%/}" .agents/skills/; done
echo ".agents/skills/" >> .git/info/exclude
```

Der gleiche Ordner wird auch von OpenCode und Copilot gelesen. Wer schon für Copilot in IntelliJ verlinkt hat, muss nichts mehr tun.

### Offene Punkte

- **Symlinks:** Ob verlinkte Ordner erkannt werden, ist nicht dokumentiert. Im Skills Manager prüfen, ob die arc42-Skills unter *Project* auftauchen.
- **Agent:** AI Assistant kann verschiedene Agents verwenden (z.B. Claude Agent, Codex). Nicht geprüft, ob jeder Agent die Projekt-Skills aus `.agents/skills/` bekommt. Beim Skill-Installieren über den Skills Manager gibt es für Codex eine eigene Option.

---

## APM (Agent Package Manager)

[APM](https://github.com/microsoft/apm) von Microsoft funktioniert wie npm bzw. `package.json`, nur für Agent-Skills:

- Abhängigkeiten stehen in einer `apm.yml` im Projekt.
- Die Lockfile `apm.lock.yaml` hält die genaue Version fest.
- Ein Befehl installiert für mehrere Tools gleichzeitig (Claude Code, OpenCode, Copilot, Cursor, Codex, …).

Die Skills landen als Kopien im Projekt, werden aber nicht von Hand gepflegt, sondern sind versioniert und jederzeit wiederherstellbar. Damit funktioniert es im Team und im Copilot Cloud Agent ohne lokalen Klon.

### Setup

```bash
brew install apm        # oder: pip install apm-cli
```

`apm.yml` im Zielprojekt:

```yaml
name: mein-projekt
version: 1.0.0
targets: [claude, opencode]
dependencies:
  apm:
    - MSiccDev/arc42-toolkit/skills/arc42-section-01#v1.1.1
    - MSiccDev/arc42-toolkit/skills/arc42-section-02#v1.1.1
    # … weitere Sections, arc42-review, arc42-lint
```

```bash
apm install
```

Wohin die Skills installiert werden:

| Ziel        | Projekt           | Global (`--global`) |
|-------------|-------------------|---------------------|
| Claude Code | `.claude/skills/` | `~/.claude/skills/` |
| OpenCode    | `.agents/skills/` | `~/.config/opencode/skills/` |
| Copilot     | `.agents/skills/` | `~/.agents/skills/` |

Ohne `targets:` erkennt APM die Tools selbst am Projekt (z.B. `.claude/`, `.opencode/`, `.github/`). Mit `--target <name>` legt man das Ziel beim Aufruf fest.

### Offene Punkte

- **Ganzes Repo auf einmal?** Das Toolkit hat keine eigene `apm.yml`. Zuerst `apm install MSiccDev/arc42-toolkit` probieren. Findet APM damit nichts, jeden Skill einzeln eintragen (wie oben).
- **Tag `v1.1.1`:** Nicht geprüft, ob es diesen Git-Tag im Repo gibt. Falls nicht, einen Commit-Hash nehmen oder `#…` weglassen (dann gilt der neueste Stand).

---

## Andere Tools (Cursor, …)

Gleiches Prinzip wie bei OpenCode, Copilot und Junie: die Skills aus dem Klon nach `~/.agents/skills/` bzw. `.agents/skills/` (oder in den Skills-Ordner des Tools) verlinken, statt sie zu kopieren. Bei Bedarf zusätzlich `AGENTS.md` ins Projekt übernehmen.

| Tool | Installation laut README |
|------|--------------------------|
| OpenAI Codex | `codex plugin marketplace add MSiccDev/arc42-toolkit --ref main` → in der App unter **Plugins** installieren |

---

## Hilfsfunktion: pro Repo verlinken

Wer die Skills in jedes ausgecheckte Repo verlinkt, legt sich dafür am besten eine Funktion in `~/.zshrc` an:

```bash
arc42-link() {
  local dir="${1:-.junie/skills}"
  local root
  root=$(git rev-parse --show-toplevel) || return 1
  mkdir -p "$root/$dir"
  for s in ~/IdeaProjects/arc42-toolkit/skills/*/; do
    ln -sfn "${s%/}" "$root/$dir/"
  done
  grep -qxF "$dir/arc42-*" "$root/.git/info/exclude" 2>/dev/null \
    || echo "$dir/arc42-*" >> "$root/.git/info/exclude"
  ls -l "$root/$dir"
}
```

Danach einmal `source ~/.zshrc` ausführen. Aufruf irgendwo im Repo:

```bash
arc42-link                   # Junie: .junie/skills/
arc42-link .agents/skills    # Copilot, OpenCode, JetBrains AI Assistant
arc42-link .claude/skills    # Claude Code (ohne Plugin)
```

- Den Repo-Root findet die Funktion selbst, egal in welchem Unterordner man steht.
- `ln -sfn` macht einen erneuten Aufruf gefahrlos: Vorhandene Links werden ersetzt, es gibt keine Fehler.
- In `.git/info/exclude` wird nur das Muster `<ordner>/arc42-*` eingetragen, und zwar nur einmal. Die Symlinks landen also nicht im Git, eigene Skills im selben Ordner (z. B. versionierte Projekt-Skills in `.claude/skills/`) tauchen aber weiter in `git status` auf.

---

## Kurzfassung

| Situation | Weg |
|-----------|-----|
| Claude Code (allein) | Plugin installieren |
| Claude Code (Team) | `.claude/settings.json` ins Projekt committen |
| Copilot, OpenCode, Codex (eigene Arbeit) | einmal global nach `~/.agents/skills/` verlinken |
| Copilot in IntelliJ | pro Projekt nach `.agents/skills/` verlinken, Agent Skills einschalten, Agent-Modus |
| Junie (IDE + CLI) | einmal global nach `~/.junie/skills/` verlinken |
| JetBrains AI Assistant | pro Projekt nach `.agents/skills/` verlinken, im Skills Manager prüfen |
| Eigene Änderungen an den Skills | Symlinks auf den lokalen Klon |
| Mehrere Tools, Team, Cloud Agent, feste Version | APM |
