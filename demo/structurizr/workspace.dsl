/*
 * Demo-Workspace für den KI-Teil (Tag 2): automatische Pflanzenbewässerung.
 * Fiktives Trainingssystem aus Tag 1 – keine Beschreibung einer realen Architektur.
 * Technologien sind Annahmen und als solche markiert.
 */
workspace "Pflanzenbewässerung" "Fiktives Trainingssystem – automatische Pflanzenbewässerung" {

    !identifiers hierarchical

    model {
        verantwortliche = person "Pflanzenverantwortliche Person" "Konfiguriert Grenzwerte, sieht Status und Warnungen."

        bewaesserung = softwareSystem "Bewässerungssystem" "Bewertet Messwerte und entscheidet, ob gegossen wird." {
            app = container "Web-App" "Grenzwerte konfigurieren, Status und Warnungen anzeigen." "Annahme: SPA" "Web Browser"
            dienst = container "Bewässerungsdienst" "Bewertet Messwerte anhand konfigurierbarer Regeln und sendet Bewässerungsbefehle." "Annahme: Java/Quarkus"
            db = container "Messwert- und Regelspeicher" "Speichert Messwerte, Grenzwerte und Bewässerungsverlauf." "Annahme: PostgreSQL" "Database"
        }

        sensor = softwareSystem "Feuchtigkeitssensor" "Misst die Bodenfeuchte einer Pflanze." "Extern"
        pumpe = softwareSystem "Pumpensteuerung" "Führt Bewässerungsbefehle aus und meldet den Status zurück." "Extern"
        benachrichtigung = softwareSystem "Benachrichtigungsdienst" "Versendet Warnungen, z. B. bei Sensorausfall." "Extern"

        verantwortliche -> bewaesserung.app "konfiguriert Grenzwerte, sieht Status"
        bewaesserung.app -> bewaesserung.dienst "liest Status, speichert Grenzwerte" "Annahme: HTTPS/JSON"
        sensor -> bewaesserung.dienst "liefert Messwerte" "Annahme: MQTT"
        bewaesserung.dienst -> bewaesserung.db "liest und schreibt"
        bewaesserung.dienst -> pumpe "sendet Bewässerungsbefehl" "Annahme: MQTT"
        pumpe -> bewaesserung.dienst "meldet Status zurück" "Annahme: MQTT"
        bewaesserung.dienst -> benachrichtigung "löst Warnung aus"
        benachrichtigung -> verantwortliche "benachrichtigt"
    }

    views {
        systemContext bewaesserung "Kontext" "Systemkontext der Pflanzenbewässerung" {
            include *
            autolayout lr
        }

        container bewaesserung "Container" "Container des Bewässerungssystems" {
            include *
            autolayout lr
        }

        styles {
            element "Person" {
                shape Person
            }
            element "Extern" {
                background #999999
            }
            element "Database" {
                shape Cylinder
            }
            element "Web Browser" {
                shape WebBrowser
            }
        }
    }
}
