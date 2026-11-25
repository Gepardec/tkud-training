# Structurizr-Demo: Pflanzenbewässerung

Demo-Workspace für den KI-Teil (Tag 2). Das System ist das **fiktive** Trainingssystem aus Tag 1. Technologien sind als „Annahme:“ markiert.

- `workspace.dsl`: Modell mit Kontextsicht (`Kontext`) und Containersicht (`Container`)

## Mit dem Agenten (Structurizr-MCP)

Der MCP ist für Claude in `.mcp.json` und für Junie in `.junie/mcp/mcp.json` eingetragen. Beispiel-Prompts:

- „Validiere `demo/structurizr/workspace.dsl`.“
- „Exportiere die Sicht `Kontext` als Mermaid.“
- „Ergänze einen Container für die Regelverwaltung und prüfe, ob die Kontextsicht noch passt.“

## In IntelliJ

Plugin [Structurizr DSL](https://plugins.jetbrains.com/plugin/29351-structurizr-dsl) (Jakub Jirák) installieren, `workspace.dsl` öffnen. Der Split Editor zeigt die Sichten `Kontext` und `Container` live neben dem Code.

## Lokal ohne MCP

```bash
docker run -it --rm -p 8080:8080 -v "$PWD/demo/structurizr:/usr/local/structurizr" structurizr/lite
```

Danach <http://localhost:8080> öffnen. Mehr Varianten: [`documents/how-tos/structurizr-setup.md`](../../documents/how-tos/structurizr-setup.md).
