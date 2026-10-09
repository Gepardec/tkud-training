workspace "Fahrradverleih (fehlerhaft)" {

    model {
        kunde = person "Kunde"
        verleih = softwareSystem "Fahrradverleih"

        // Absichtlicher Fehler: "zahlung" ist nicht definiert
        kunde -> verleih "Leiht aus"
        verleih -> zahlung "Belastet Ausleihen"
    }

    views {
        systemContext verleih {
            include *
            autolayout lr
        }
    }
}
