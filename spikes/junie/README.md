# Junie-Spike

Testprojekt für den OpenSpec-Change `ki-junie-spike`: Prüft, ob die Skills des Trainings (arc42-Toolkit, `arc42-with-structurizr`) und der Structurizr-MCP in JetBrains Junie funktionieren.

> **Nur fiktive Systeme.** Der gehostete Structurizr-MCP (`https://mcp.structurizr.com/mcp`) empfängt die DSL, die man ihm schickt. In diesem Ordner liegen deshalb ausschließlich erfundene Beispiele. Kundensysteme gehören nicht hierher.

## Inhalt

| Datei | Zweck |
| :---- | :---- |
| `workspace.dsl` | Fiktiver „Fahrradverleih“ mit System-Context-View `Kontext`. `validate` liefert `OK`. |
| `broken.dsl` | Absichtlich fehlerhaft (Beziehung auf nicht definiertes Element `zahlung`). `validate` liefert eine Fehlermeldung. |
| `NOTIZEN.md` | Befunde ohne Junie: MCP-Server direkt geprüft, Junie-MCP-Format, APM-Ziele. |
| `PRUEFSCHRITTE.md` | Prompts, erwartete Ergebnisse und Feld für das tatsächliche Ergebnis je Prüfschritt. |
| `.junie/mcp/mcp.json` | Projekt-MCP-Konfiguration für den gehosteten Structurizr-MCP. |
| `.junie/skills/` | Wird im Spike befüllt, falls die Skills nicht über den Marketplace kommen. |

## Benutzung

1. Diesen Ordner (`spikes/junie/`) in IntelliJ als **eigenes Projekt** öffnen.
2. `PRUEFSCHRITTE.md` von oben nach unten durchgehen und die Ergebnisse eintragen.
3. Das funktionierende Setup landet anschließend in `documents/how-tos/junie-setup.md`.
