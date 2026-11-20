# Lösung: Finde die Fehler (nur für die Moderation)

Referenz: [`../structurizr/workspace.dsl`](../structurizr/workspace.dsl) und der Übungsfall von Tag 1 (`slides/training-plan.md`, „Gemeinsames Systemmodell“ und „Fallannahmen“).

| # | Stelle | Fehlerart | Was falsch ist | Woran man es erkennt |
|---|---|---|---|---|
| 1 | 1.2 Qualitätsziele | **Generik** | „performant“, „sicher“, „benutzerfreundlich“ passen zu jedem System, sind nicht messbar und nicht priorisiert begründet. Die Fallannahmen nennen konkrete Bedürfnisse: keine Überbewässerung, nachvollziehbarer Status, angemessene Reaktion auf Ausfälle. | Ziel lässt sich auf jedes andere System kopieren; kein Szenario, keine Zahl |
| 2 | 1.3 Stakeholder | **Fehlender Projektbezug** | „Management“ und „Entwicklungsteam“ mit Allerwelts-Erwartungen. Für den Fall nicht belegt. | Erwartung sagt nichts darüber, was diese Rolle von *dieser* Doku braucht |
| 3 | 3.1 Feuchtigkeitssensor | **Widerspruch zum Modell** | Laut Modell gehen Messwerte an den Bewässerungsdienst, der entscheidet und dann die Pumpe ansteuert. Ein direkter Weg Sensor → Pumpe umgeht die Regel-Logik. | Abgleich mit `workspace.dsl`: Beziehung `sensor -> bewaesserung.dienst` |
| 4 | 3.1 / 3.2 Wetterdienst-API | **Halluzination** | Ein externes System, das weder im Modell noch im Übungsfall vorkommt. Klingt plausibel, ist aber erfunden. | Taucht in keiner Quelle auf; der Agent hat „sinnvoll ergänzt“ |
| 5 | 3.2 Technischer Kontext | **Annahme als Fakt** | MQTT, HiveMQ Cloud, QoS 2, Keycloak, OAuth 2.0 sind im Übungsfall bewusst offen. Im Modell steht nur „Annahme: MQTT“. Hier sind daraus feste Produktentscheidungen geworden. | Keine Kennzeichnung als Annahme, kein ADR dazu |
| 6 | 3 Kontextabgrenzung | **Lücke** | Der Benachrichtigungsdienst fehlt, obwohl er im Modell steht (Warnungen bei Sensorausfall). | Abgleich mit `workspace.dsl`: `benachrichtigung` |

## Ablauf in der Übung

1. **5 min allein:** Auszug lesen, Fehler markieren. Ohne KI.
2. **5 min mit dem Agenten (Junie oder Claude):** „Prüfe `arc42-auszug.md` gegen `demo/structurizr/workspace.dsl`. Liste Widersprüche, erfundene Elemente und unmarkierte Annahmen.“ Optional `arc42-review`.
3. **Auflösung:** Was hat der Mensch gefunden, was der Agent? Typisch: Der Agent findet Widersprüche zum Modell (3, 4, 6) zuverlässig, Generik (1, 2) nur, wenn man explizit danach fragt.

**Botschaft:** Prüfen geht gut gegen eine Referenz, also gegen Modell, Guideline oder Checkliste. Ohne Referenz bleibt nur das Bauchgefühl. Deshalb brauchen beide Praxisprojekte ein Gate.
