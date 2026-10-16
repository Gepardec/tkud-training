# tkud-training
TKuD Training

## arc42-Toolkit per Symlink einbinden

Die Skills des [arc42-Toolkits](https://github.com/MSiccDev/arc42-toolkit) werden **nicht kopiert**, sondern aus einem lokalen Klon verlinkt. Ein `git pull` im Klon aktualisiert damit alle Tools und Projekte auf einmal.

```bash
git clone https://github.com/MSiccDev/arc42-toolkit.git ~/IdeaProjects/arc42-toolkit
```

### Wo welches Tool Skills sucht

| Tool | Projekt | Global |
| :---- | :---- | :---- |
| Claude Code | `.claude/skills/` | `~/.claude/skills/` |
| OpenCode | `.opencode/skills/`, `.claude/skills/`, `.agents/skills/` | `~/.config/opencode/skills/`, `~/.claude/skills/`, `~/.agents/skills/` |
| GitHub Copilot (VS Code, CLI) | `.github/skills/`, `.claude/skills/`, `.agents/skills/` | `~/.copilot/skills/`, `~/.claude/skills/`, `~/.agents/skills/` |
| GitHub Copilot in IntelliJ | `.github/skills/`, `.claude/skills/`, `.agents/skills/` | nicht dokumentiert |
| Junie (IDE und CLI) | `.junie/skills/` | `~/.junie/skills/` |

Junie liest **weder** `.claude/skills/` **noch** `.agents/skills/`. Für Junie braucht es deshalb immer eigene Links.

### Global verlinken (empfohlen)

Einmal pro Rechner, gilt dann für alle Projekte:

```bash
link_arc42() {  # $1 = Zielordner
  mkdir -p "$1"
  for s in ~/IdeaProjects/arc42-toolkit/skills/*/; do ln -sfn "${s%/}" "$1/"; done
}

link_arc42 ~/.claude/skills   # Claude Code (auch OpenCode und Copilot lesen ihn)
link_arc42 ~/.agents/skills   # OpenCode, Copilot (VS Code, CLI), Codex
link_arc42 ~/.junie/skills    # Junie
```

Für Copilot in IntelliJ reicht das nicht: Dort ist nicht dokumentiert, ob globale Ordner gelesen werden. Also pro Projekt verlinken (siehe unten).

### Pro Projekt verlinken

Die Links zeigen auf einen absoluten lokalen Pfad. Sie gehören **nicht ins Git** und werden lokal über `.git/info/exclude` ausgeschlossen, ohne die `.gitignore` anzufassen. Dafür eine Funktion in `~/.zshrc`:

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

Nach `source ~/.zshrc` irgendwo im Repo aufrufen:

```bash
arc42-link                   # Junie
arc42-link .agents/skills    # OpenCode, Copilot (auch in IntelliJ)
arc42-link .claude/skills    # Claude Code
```

- Den Repo-Root findet die Funktion selbst; `ln -sfn` ersetzt vorhandene Links, ein zweiter Aufruf ist also gefahrlos.
- Ausgeschlossen wird nur das Muster `arc42-*`, nicht der ganze Ordner. In diesem Repo ist `.claude/skills/` versioniert (eigene Projekt-Skills), und neue Projekt-Skills sollen weiterhin in `git status` auftauchen.

### Tool-Hinweise

- **Claude Code:** Alternativ als Plugin installieren (`/plugin marketplace add MSiccDev/arc42-toolkit`, dann `/plugin install arc42-toolkit@arc42-toolkit`); Aufruf dann mit Namespace, z. B. `/arc42-toolkit:arc42-section-01`. Symlinks sind der Weg, wenn man selbst an den Skills arbeitet.
- **OpenCode:** Hat kein Plugin-System für Skills; Links sind der vorgesehene Weg. Ein über das Claude-Code-Plugin installiertes Toolkit sieht OpenCode nicht.
- **GitHub Copilot in IntelliJ:** Agent Skills unter *Settings → GitHub Copilot → Chat → Agent → Agent Skills* einschalten (Public Preview; bei Business/Enterprise muss ein Admin *Editor preview features* freigeben). Skills wirken nur im **Agent-Modus**. Der Copilot Cloud Agent sieht lokale Links nicht.
- **Junie:** Lädt zunächst nur Name und Beschreibung eines Skills. Deshalb deutlich formulieren: *„Nutze den Skill arc42-section-01 für mein Projekt“*. Die Junie CLI bietet an, Skills aus `.claude/skills/` zu importieren – das **kopiert** sie nach `.junie/skills/`, die Kopien veralten nach einem Update. Lieber verlinken.

### Prüfen

Im jeweiligen Tool fragen: *„Welche Skills kennst du?“* – die `arc42-*`-Skills müssen in der Liste stehen.

Ob verlinkte Ordner erkannt werden, ist bei OpenCode, Copilot und Junie nicht dokumentiert. Fehlen die Skills, stattdessen kopieren und nach jedem Update erneut synchronisieren, z. B. für Junie:

```bash
for s in ~/IdeaProjects/arc42-toolkit/skills/arc42-*/; do
  rsync -a --delete "$s" ~/.junie/skills/"$(basename "$s")"/
done
```

Die Schleife synchronisiert nur die `arc42-*`-Ordner und lässt andere Skills im Zielordner unangetastet.

Ausführlicher, inklusive JetBrains AI Assistant und APM: [`documents/how-tos/arc42-toolkit-setup.md`](documents/how-tos/arc42-toolkit-setup.md).
