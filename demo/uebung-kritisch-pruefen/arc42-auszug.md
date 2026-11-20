# Bewässerungssystem – arc42-Auszug (KI-generiert)

> Dieser Auszug wurde von einem KI-Agenten aus einem kurzen Prompt erzeugt. Prüfe ihn gegen das Modell in [`../structurizr/workspace.dsl`](../structurizr/workspace.dsl) und gegen den Übungsfall von Tag 1.

## 1.2 Qualitätsziele

| Priorität | Qualitätsziel | Beschreibung |
|---|---|---|
| 1 | Performance | Das System soll performant sein. |
| 2 | Sicherheit | Das System soll sicher sein. |
| 3 | Benutzerfreundlichkeit | Das System soll benutzerfreundlich und intuitiv bedienbar sein. |

## 1.3 Stakeholder

| Rolle | Erwartung |
|---|---|
| Pflanzenverantwortliche Person | Grenzwerte konfigurieren, Status und Warnungen sehen |
| Management | Überblick über alle Projekte |
| Entwicklungsteam | Gute Dokumentation |

## 3 Kontextabgrenzung

### 3.1 Fachlicher Kontext

| Nachbar | Beschreibung |
|---|---|
| Pflanzenverantwortliche Person | Konfiguriert Grenzwerte, sieht Status und Warnungen |
| Feuchtigkeitssensor | Misst die Bodenfeuchte und sendet Messwerte direkt an die Pumpensteuerung |
| Pumpensteuerung | Führt Bewässerungsbefehle aus und meldet den Status zurück |
| Wetterdienst-API | Liefert Regenprognosen, damit bei erwartetem Regen nicht gegossen wird |

### 3.2 Technischer Kontext

| Nachbar | Kanal |
|---|---|
| Feuchtigkeitssensor | MQTT über HiveMQ Cloud, QoS 2 |
| Pumpensteuerung | MQTT über HiveMQ Cloud, QoS 2 |
| Wetterdienst-API | REST/JSON, stündlicher Abruf |
| Web-App | HTTPS, OAuth 2.0 über Keycloak |
