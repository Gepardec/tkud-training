# Notizen zum Junie-Spike

Befunde, die der Agent ohne Junie ermitteln konnte. Sie fließen in `documents/how-tos/junie-setup.md` ein.

## Structurizr-MCP (gehostet), direkt geprüft

Stand 2026-10-09, per JSON-RPC an `https://mcp.structurizr.com/mcp`:

- `initialize` → `serverInfo: mcp-server 1.0.0`, Protokoll `2025-03-26`.
- `validate` mit `workspace.dsl` → `OK`.
- `validate` mit `broken.dsl` → `The destination element "zahlung" does not exist at line 9: verleih -> zahlung "Belastet Ausleihen"`.

Der Server funktioniert also. Fehlschläge in P4/P5 liegen dann an der Junie-Seite.

## MCP-Konfiguration in Junie

Quelle: [Junie CLI – Add and configure MCP servers](https://junie.jetbrains.com/docs/junie-cli-mcp-configuration.html); laut Doku nutzt das IDE-Plugin dasselbe Format.

| Ebene | Datei |
| :---- | :---- |
| Projekt | `.junie/mcp/mcp.json` |
| Global | `~/.junie/mcp/mcp.json` (auch über *Settings → Tools → Junie → MCP Settings*) |

Remote-Server werden mit `url` (optional `headers`) **ohne** `type` eingetragen. Für diesen Spike angelegt: `.junie/mcp/mcp.json` mit dem Server `structurizr`.

Fallback, falls Junie den Remote-Eintrag nicht annimmt (stdio-Brücke, vgl. `documents/how-tos/structurizr-setup.md`, 1d):

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

## APM und Junie

`apm install --runtime intellij` (APM 0.30.0) in einem Wegwerf-Verzeichnis:

- Ausgabe: `Targets: copilot (source: --target flag)` – `intellij` meint das **GitHub-Copilot-Plugin** für JetBrains, nicht Junie.
- Skills landen in `.agents/skills/`, zusätzlich entsteht `.github/`.
- APM 0.30 kennt kein Ziel für Junie. Junie liest `.agents/skills/` laut Doku nicht.

Folge: APM taugt derzeit nicht zum Verteilen der Skills an Junie. Alternativen: Junie-Marketplace (P1, Weg 1), Symlinks oder Kopie nach `.junie/skills/`.

## Fallback ohne MCP: Structurizr-CLI (Task 4.4)

Installiert mit `brew install structurizr` (Homebrew-Formel 2026.09.19, Java 25; bringt `structurizr` und `structurizr-mcp` mit; aktualisiert ggf. Abhängigkeiten wie `brotli`).

```bash
# Validieren – Exit-Code 0 = OK, 1 = Fehler (Meldung im Log)
structurizr validate -workspace workspace.dsl

# View als Mermaid exportieren (eine .mmd-Datei je View)
structurizr export -workspace workspace.dsl -format mermaid -output export
```

Geprüft am 2026-10-09: `workspace.dsl` → Exit 0, `broken.dsl` → Exit 1 mit `The destination element "zahlung" does not exist at line 9 …`; Export schreibt `export/structurizr-Kontext.mmd`.

### Achtung: `theme default` funktioniert nicht mehr

Die Structurizr-Cloud hat am 30.09.2026 ihr End of Life erreicht. `theme default` lädt `https://static.structurizr.com/themes/default/theme.json`, das nicht mehr erreichbar ist – die CLI bricht die Validierung dann mit `could not be loaded` ab. Der gehostete MCP meldete für dieselbe DSL trotzdem `OK`. Deshalb in allen Trainings-DSLs **kein `theme default`** verwenden. Betroffen ist auch das Minimalbeispiel in `documents/how-tos/structurizr-setup.md`.
