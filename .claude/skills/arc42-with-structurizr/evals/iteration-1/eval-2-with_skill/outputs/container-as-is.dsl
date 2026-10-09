workspace "ATU / PDV — Container View (As-Is)" "Container-Diagramm für den Ist-Zustand. Zeigt die Container (WARs) innerhalb des Tomcat-Monolithen und ihre wichtigsten Beziehungen." {

    model {
        endanwender = person "Endanwender (Mitglied)" "Mitglied einer politischen Organisation."
        administrator = person "Administrator" "Mandanten-Administrator."

        keycloak = softwareSystem "Keycloak" "OIDC Identity Provider." {
            tags "External"
        }

        atuPdv = softwareSystem "ATU / PDV (Legacy)" "Monolith auf Apache Tomcat." {
            tags "System"

            mandantenWars = container "Mandanten-WARs (atu-cust-*.war)" "Servlets, ObjRel-Domäne, Konfiguration, Custom Code — 17 Stück, eine je Mandant." {
                tags "Container"
            }
            serviceWars = container "Service-WARs (atu-service-*.war)" "SOAP/XML-Service-Endpunkte je Mandant — 13 Stück." {
                tags "Container"
            }
            brokerWars = container "Broker-WARs" "HTTP-Callback-Handler: Mail, SMS, Formular, Umfrage, Datei, Veranstaltung, Intern-Portal, SEA" {
                tags "Container"
            }
            gemeinsameBibs = container "Gemeinsame Bibliotheken" "atu-objrel (ORM), atu-app (964 Domänenobjekte), atu-gui (1193 Servlets), atu-html" {
                tags "Container"
            }
            phoneCampaignWars = container "Phone-Campaign-WARs" "Telefonkampagnen-Oberflächen je Mandant" {
                tags "Container"
            }
            visitorWars = container "Visitor-/WbInfo-WARs" "Nach außen gerichtete Besucherportale" {
                tags "Container"
            }
        }

        mailprovider = softwareSystem "Mailprovider" "Externer Mail-Dienst." {
            tags "External"
        }
        smsGateway = softwareSystem "SMS-Gateway" "Externer SMS-Dienst." {
            tags "External"
        }

        endanwender -> mandantenWars "Nutzt Alt-UI" "HTTP, HTML"
        administrator -> mandantenWars "Verwaltet" "HTTP, HTML"
        mandantenWars -> serviceWars "SOAP-Aufrufe" "JAX-WS"
        mandantenWars -> gemeinsameBibs "Compilezeit-Abhängigkeit"
        brokerWars -> serviceWars "SOAP-Aufrufe" "JAX-WS"
        brokerWars -> mailprovider "Sendet Mails, empfängt Callbacks" "HTTP"
        brokerWars -> smsGateway "Sendet SMS, empfängt Callbacks" "HTTP"
        mandantenWars -> keycloak "Authentifiziert via" "OIDC"
    }

    views {
        container atuPdv "Container-AsIs" "Container-Diagramm — ATU/PDV Ist-Zustand (Tomcat-Monolith)" {
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
            element "Container" {
                background "#438DD5"
                color "#FFFFFF"
                fontSize 12
            }
        }
    }
}
