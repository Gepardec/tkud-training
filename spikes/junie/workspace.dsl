workspace "Fahrradverleih" "Fiktives System fuer den Junie-Spike des TKuD-Trainings" {

    model {
        kunde = person "Kunde" "Leiht Fahrraeder per App aus"
        service = person "Servicemitarbeiter" "Wartet Fahrraeder und Stationen"

        verleih = softwareSystem "Fahrradverleih" "Verwaltet Fahrraeder, Stationen und Ausleihen"

        zahlung = softwareSystem "Zahlungsanbieter" "Wickelt Kartenzahlungen ab" "Extern"
        karten = softwareSystem "Kartendienst" "Liefert Stationskarten und Routen" "Extern"

        kunde -> verleih "Sucht Stationen, leiht und gibt zurueck"
        service -> verleih "Meldet Wartungen"
        verleih -> zahlung "Belastet Ausleihen" "HTTPS/REST"
        verleih -> karten "Fragt Kartenkacheln ab" "HTTPS/REST"
    }

    views {
        systemContext verleih "Kontext" {
            include *
            autolayout lr
        }
        styles {
            element "Extern" {
                background #999999
            }
        }
    }
}
