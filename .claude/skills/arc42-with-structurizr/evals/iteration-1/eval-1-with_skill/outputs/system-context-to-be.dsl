workspace "ATU / PDV — System Context (To-Be)" "System Context Diagramm für den Ziel-Zustand des ATU/PDV-Systems. Die Migrationsstrategie (Strangler Fig) löst den Monolithen Domäne für Domäne in Quarkus-Services auf." {

    model {
        endanwender = person "Endanwender (Mitglied)" "Mitglied einer politischen Organisation. Greift über die Angular-SPA auf das System zu (HTTPS, REST/JSON, Bearer JWT)."
        administrator = person "Administrator" "Mandanten-Administrator. Verwaltet Mitglieder, Kampagnen, Zahlungen und Konfiguration über die Angular-SPA."

        keycloak = softwareSystem "Keycloak" "OIDC/OAuth2 Identity Provider. Ein Realm je Mandant. Stellt JWT mit tenant-id-Claim aus." {
            tags "External"
        }
        mailprovider = softwareSystem "Mailprovider" "Externer E-Mail-Dienst. Empfängt Callbacks über den Message Broker." {
            tags "External"
        }
        smsGateway = softwareSystem "SMS-Gateway" "Externer SMS-Dienst. Empfängt Callbacks über den Message Broker." {
            tags "External"
        }
        portalsysteme = softwareSystem "Portalsysteme" "Externe Portale. Kommunizieren über den Message Broker (asynchron)." {
            tags "External"
        }
        bankImport = softwareSystem "Bankdatei-Import" "Externe Bank-Schnittstelle. REST/JSON-API über den Encashment-Service." {
            tags "External"
        }
        mobileFuture = softwareSystem "Mobile / Dritte (künftig)" "Zukünftige mobile Apps oder Drittsysteme. Integration via REST/JSON (Bearer JWT)." {
            tags "External"
        }

        atuPdv = softwareSystem "ATU / PDV (Target)" "Multi-Tenant-fähige Quarkus-Domänenservices (Member, Campaign, Event, Encashment, Reporting, Document) hinter einem API-Gateway (Nginx). Angular-SPA als Frontend. Strangler-Fig-Migration: Legacy-Tomcat schrumpft Domäne für Domäne. Asynchroner Message Broker für Event-Kommunikation." {
            tags "System"
        }

        endanwender -> atuPdv "Nutzt SPA" "HTTPS, REST/JSON, Bearer JWT"
        administrator -> atuPdv "Verwaltet via SPA" "HTTPS, REST/JSON, Bearer JWT"

        atuPdv -> keycloak "Authentifiziert via" "OIDC / OAuth2, JWT-Introspection"
        atuPdv -> mailprovider "Sendet Mails, empfängt Callbacks" "HTTP, über Message Broker"
        atuPdv -> smsGateway "Sendet SMS, empfängt Callbacks" "HTTP, über Message Broker"
        atuPdv -> portalsysteme "Austausch von Portaldaten" "HTTP, asynchron über Message Broker"
        atuPdv -> bankImport "Importiert Zahlungsdateien" "HTTPS, REST/JSON — Encashment-Service"

        mobileFuture -> atuPdv "Zukünftige Integration" "HTTPS, REST/JSON, Bearer JWT"
    }

    views {
        systemContext atuPdv "SystemContext-ToBe" "System Context Diagramm — ATU/PDV Ziel-Zustand" {
            include *
            autoLayout
        }

        styles {
            element "Person" {
                background "#08427B"
                color "#FFFFFF"
                shape Person
                fontSize 14
            }
            element "System" {
                background "#1168BD"
                color "#FFFFFF"
                fontSize 14
            }
            element "External" {
                background "#B3D9FF"
                color "#000000"
                shape Box
                fontSize 14
            }
        }
    }
}
