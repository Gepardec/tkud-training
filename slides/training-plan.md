# Trainingsplan: Technische Kommunikation und Dokumentation

**Schwerpunkt:** Softwarearchitektur dokumentieren mit arc42  
**Zielgruppe:** Softwareentwickler:innen und Softwarearchitekt:innen  
**Dauer:** ein Trainingstag, angenommen 09:00–17:00 Uhr  
**Arbeitsstil:** praxisnah, kurze Impulse, Gruppenübungen und gemeinsame Auswertung

> **Arbeitsannahmen für diesen Entwurf:** Die Teilnehmenden bringen gemischte Vorkenntnisse zu Architektur und arc42 mit. Sie arbeiten in Kleingruppen mit Papier/Whiteboard oder einem Diagrammwerkzeug. Der Zeitplan enthält 90 Minuten Pausen inklusive Mittagspause und damit 6,5 Stunden Lernzeit. Zeiten und Übungsumfang sind leicht anpassbar.

## Lernziele

Am Ende des Tages können die Teilnehmenden:

- den Zweck von Architekturdokumentation aus Stakeholder-Fragen ableiten;
- die arc42-Abschnitte passend zu Informationsbedürfnissen nutzen und bewusst zuschneiden;
- Qualitätsziele konkretisieren und mit Architekturentscheidungen verbinden;
- Kontext-, Baustein-, Laufzeit- und Deployment-Sichten auswählen und verständlich skizzieren;
- eine Architekturentscheidung als ADR festhalten;
- ein querschnittliches Konzept so dokumentieren, dass es im Team anwendbar ist;
- Review, Pflege und Zuständigkeiten für Architekturdokumentation pragmatisch festlegen.

## Durchgehender Übungsfall

Die Übungen verwenden den leicht verständlichen Anwendungsfall **automatische Pflanzenbewässerung** (Hogarama als Inspiration). Das Trainingssystem ist ausdrücklich **fiktiv** und keine Beschreibung der tatsächlichen Hogarama-Architektur.

### Gemeinsames Systemmodell

Eine Pflanze wird von einem Feuchtigkeitssensor überwacht. Messwerte gelangen an einen Bewässerungsdienst. Dieser entscheidet anhand konfigurierbarer Regeln, ob gegossen werden soll, und sendet einen Befehl an eine Pumpensteuerung. Eine Nutzerin kann Grenzwerte konfigurieren und Status sowie Warnungen sehen.

Für Übungen dürfen Gruppen fehlende Details ergänzen. Sie schreiben Annahmen sichtbar dazu, statt sie als feststehende Fakten auszugeben. Technologien bleiben zunächst offen; bei ADR-Übungen werden Alternativen und Konsequenzen erarbeitet.

### Fallannahmen für die Moderation

- **Akteure:** Pflanzenverantwortliche Person, Sensor, Pumpensteuerung.
- **Kernablauf:** Messung → Bewertung → Bewässerungsbefehl → Rückmeldung/Status.
- **Mögliche externe Systeme:** Benachrichtigungsdienst; Identitätsdienst nur, falls eine Übung Authentifizierung berührt.
- **Mögliche Qualitätsbedürfnisse:** keine Überbewässerung, nachvollziehbarer Status, angemessene Reaktion auf Ausfälle, einfache Erweiterbarkeit.
- **Bewusst offen:** konkrete Protokolle, Datenbank, Hosting, Redundanz und Grenzwerte.

## Tagesablauf im Überblick

| Zeit | Thema | Methode / Ergebnis |
|---|---|---|
| 09:00–09:30 | Begrüßung, Erwartungen, Einstieg über neue Teammitglieder | Fragen sammeln; Lernziele und Arbeitsfall klären |
| 09:30–10:15 | Warum Architekturdokumentation? | Kurzimpuls, Reflexion, Dokumentationsziele für den Fall |
| 10:15–10:30 | Pause | |
| 10:30–11:30 | Stakeholder, Informationsbedürfnisse, Qualitätsziele | Stakeholder-Mapping und Qualitätsszenario |
| 11:30–12:30 | arc42-Struktur und angemessener Umfang | arc42-Zuordnung; individuelles Dokumentationsgerüst |
| 12:30–13:15 | Mittagspause | |
| 13:15–14:15 | Sichten, Notationen und Konsistenz | Kontext- und Laufzeitsicht skizzieren und reviewen |
| 14:15–14:30 | Pause | |
| 14:30–15:15 | Architekturentscheidungen und ADRs | ADR zu einer offenen Fallfrage |
| 15:15–15:55 | Querschnittliche Konzepte | Konzeptseite mit Ablauf, Regeln und Beispiel |
| 15:55–16:10 | Pause | |
| 16:10–16:40 | Werkzeuge, Qualität, Reviews und Pflege | Review-Check und Pflegevereinbarung |
| 16:40–17:00 | Zusammenfassung und Transfer | Erkenntnisse und nächster Schritt |

## Ablauf im Detail

### 09:00–09:30 — Begrüßung und Einstieg

**Ziele**

- Gruppe und Erwartungen sichtbar machen.
- Dokumentation als Antwort auf konkrete Fragen einführen.
- Die fiktive Pflanzenbewässerung als gemeinsamen Fall erklären.

**Ablauf**

1. Begrüßung und Tagesziele (5 Min.).
2. Erwartungsabfrage: „Welche Architekturfrage kostet euch im Projektalltag regelmäßig Zeit?“ (8 Min.).
3. Impuls mit Stefan Zörners vier typischen Antworten neuer Teammitglieder: „Steht alles im Wiki“, „Wir gehen agil vor“, „Das war schon so, als ich neu war“ und „Das ist historisch gewachsen“ (5 Min.).
4. Tandemgespräch: Welche Frage steckt hinter der unbefriedigenden Antwort? (7 Min.).
5. Hogarama-inspirierter Übungsfall und Arbeitsmodus vorstellen (5 Min.).

**Moderationshinweise**

- Die vier Antworten als Gesprächsanstoß einsetzen, nicht als Vorwurf an Teams.
- Auf echte Fragen der Teilnehmenden achten und diese im Tagesverlauf wieder aufgreifen.
- Klar sagen: Der Fall ist eine Lernfiktion; es wird keine reale Hogarama-Systemarchitektur behauptet.

**Ergebnis**

Eine sichtbare Liste mit Architekturfragen und Erwartungen.

### 09:30–10:15 — Motivation und Nutzen

**Kerninhalte**

- Dokumentation kann Architekturarbeit unterstützen, Entscheidungen nachvollziehbar machen und Umsetzung/Weiterentwicklung leiten.
- Dokumentation ist ein Kommunikationsmittel; Umfang und Detailgrad richten sich nach Fragen und Risiken.
- Agilität und Dokumentation schließen einander nicht aus. Veraltete oder unnötig umfangreiche Dokumentation verfehlt ihren Zweck.

**Übung: Gute Antwort statt Folklore (15 Min.)**

Kleingruppen wählen eine Einstiegsfrage, zum Beispiel „Wie finde ich heraus, wann gegossen wird?“ oder „Warum wird eine Messung verworfen?“. Sie formulieren:

1. Wer stellt die Frage?
2. Welche Entscheidung oder Arbeit soll die Antwort ermöglichen?
3. Welche Information wäre die kleinste hilfreiche Dokumentation?

**Auswertung (10 Min.)**

Gruppen vergleichen: Welche Antwort muss im Gespräch gegeben werden, welche lässt sich sinnvoll festhalten? Wo reicht Code nicht als alleinige Erklärung?

**Moderationshinweis**

Die Diskussion nicht auf „Dokumentation versus Code“ verengen. Herausarbeiten, dass Architekturinformationen unterschiedliche Formen haben können und gepflegt werden müssen.

### 10:30–11:30 — Stakeholder und Qualitätsziele

**Kerninhalte**

- Stakeholder haben unterschiedliche Anliegen: Betrieb, Entwicklung, Produktverantwortung, Sicherheit, Nutzer:innen.
- arc42 beginnt mit Zielen und Anforderungen; Qualitätsziele sollen priorisiert und möglichst überprüfbar formuliert sein.
- Q42 kann als Orientierung für Qualitätsmerkmale und Beispiele dienen. ISO/IEC 25010 ist ein Qualitätsmodell-Standard; Q42 ist keine ISO-Norm.

**Übung 1: Stakeholder und Fragen (15 Min.)**

Gruppen erstellen eine kleine Matrix für das Bewässerungssystem:

| Stakeholder | Frage / Anliegen | Welche Information hilft? |
|---|---|---|
| Pflanzenverantwortliche Person | Wird rechtzeitig und nicht zu viel gegossen? | Ablauf, Grenzwerte, Warnungen |
| Entwicklungsteam | Wo ergänze ich eine neue Sensorart? | Bausteine, Schnittstellen, Konzepte |
| Betrieb | Was passiert bei Netz- oder Geräteausfall? | Deployment, Laufzeit, Betriebsregeln |

Diese Matrix ist ein Startpunkt; Gruppen dürfen Stakeholder ergänzen.

**Übung 2: Qualitätsszenario (20 Min.)**

Jede Gruppe wählt ein Anliegen und präzisiert Auslöser, Kontext, erwartete Reaktion und Messkriterium. Beispiel als Arbeitsentwurf: „Wenn der Sensor drei aufeinanderfolgende Messintervalle keine Daten liefert, wird keine automatische Bewässerung ausgelöst und eine Warnung innerhalb von fünf Minuten angezeigt.“ Die Gruppe prüft, welche Architekturentscheidungen dadurch beeinflusst werden.

**Auswertung (10 Min.)**

Vergleichen, welche Anforderungen bereits überprüfbar sind und welche Begriffe wie „schnell“, „sicher“ oder „zuverlässig“ noch konkretisiert werden müssen.

**Ergebnis**

Stakeholder-Matrix und mindestens ein überprüfbares Qualitätsszenario pro Gruppe.

### 11:30–12:30 — arc42: Struktur und angemessener Umfang

**Kerninhalte**

arc42 stellt zwölf anpassbare Abschnitte bereit:

1. Einführung und Ziele
2. Randbedingungen
3. Kontextabgrenzung
4. Lösungsstrategie
5. Bausteinsicht
6. Laufzeitsicht
7. Verteilungssicht
8. Querschnittliche Konzepte
9. Architekturentscheidungen
10. Qualitätsanforderungen
11. Risiken und technische Schulden
12. Glossar

**Übung: Was gehört wohin? (20 Min.)**

Moderation verteilt Karten mit Informationsstücken: Akteur und externe Systeme, Qualitätsziel, Technologiezwang, Modulverantwortung, Bewässerungsablauf, Hosting-Topologie, Wiederholungsregel, Entscheidung für/gegen einen Nachrichtentransport, bekanntes Ausfallrisiko und Fachbegriffe. Gruppen ordnen zu und markieren Mehrfachbezüge.

**Übung: Schlankes Inhaltsverzeichnis (15 Min.)**

Gruppen entscheiden, welche Abschnitte für die konkrete Fallfrage zuerst ausgearbeitet werden sollten und welche zunächst nur einen Verweis oder „nicht relevant“ enthalten. Begründung mit Stakeholder-Bedarf und Risiko.

**Moderationshinweise**

- Nicht alle zwölf Abschnitte müssen gleich ausführlich sein.
- Eine Information hat einen führenden Ablageort; andere Abschnitte können darauf verweisen.
- Die Bezeichnungen sind Orientierung, keine Pflicht zur Textproduktion ohne konkreten Nutzen.

**Ergebnis**

Ein zugeschnittenes arc42-Inhaltsverzeichnis mit einer priorisierten Ausarbeitungsreihenfolge.

### 13:15–14:15 — Sichten und Notationen

**Kerninhalte**

- Sichten beantworten unterschiedliche Fragen und adressieren Stakeholder-Anliegen.
- ISO/IEC/IEEE 42010 bietet Begriffe und Anforderungen für Architekturbeschreibungen, Viewpoints und Model-Kinds; sie schreibt keine bestimmte Diagrammnotation oder Vorgehensweise vor.
- C4, UML und BPMN sind mögliche Notationen für unterschiedliche Zwecke. Verständlichkeit und konsistente Bedeutung sind wichtiger als möglichst viele Symbole.
- Level of Detail richtet sich nach Kommunikationsziel und Änderungsrisiko.

**Übung 1: Kontext (15 Min.)**

Gruppen skizzieren Systemgrenze, Nutzer:in, Sensor, Pumpensteuerung und mögliche externe Dienste. Sie benennen Beziehungen mit Protokollen nur dann, wenn sie diese als Annahme markieren.

**Übung 2: Laufzeit (15 Min.)**

Eine Gruppe modelliert den Ablauf „Messwert führt zu Bewässerung“, eine zweite „Sensor liefert keine Daten“. Beide nutzen dieselben Begriffe und prüfen, ob die Laufzeitsicht zur Kontextsicht passt.

**Peer-Review (10 Min.)**

Eine andere Gruppe beantwortet anhand der Skizzen:

- Was ist innerhalb und außerhalb des Systems?
- Welche Komponente entscheidet über das Gießen?
- Was passiert bei fehlenden Messdaten?
- Welche Annahme ist unklar?

**Moderationshinweise**

- Auf Pfeilrichtung, Systemgrenze und Benennung achten.
- Diagramme nicht nach Schönheit bewerten, sondern danach, ob sie eine konkrete Frage beantworten.
- Für UML/C4/BPMN nur so viel Notation erklären, wie die Übung benötigt.

**Ergebnis**

Kontextbild, Laufzeitablauf und mindestens eine Verbesserung aus dem Peer-Review.

### 14:30–15:15 — Architekturentscheidungen dokumentieren

**Kerninhalte**

- ADRs halten wichtige Entscheidungen samt Kontext, Alternativen und Folgen fest.
- Eine Entscheidung sollte auf relevante Qualitätsziele und Risiken verweisen.
- Ein ADR dokumentiert den damaligen Entscheidungsstand; es ist bei neuen Erkenntnissen erneut zu prüfen.

**Übung: ADR in 20 Minuten**

Jede Gruppe wählt eine offene Frage, zum Beispiel:

- Soll die Bewässerungsentscheidung bei Netzausfall lokal oder zentral getroffen werden?
- Wie werden Befehle gegen doppelte Ausführung geschützt?
- Wie wird eine neue Sensorart integriert?

Die Gruppe schreibt einen kurzen ADR-Entwurf mit Titel, Status, Kontext, Entscheidung, betrachteten Alternativen, Konsequenzen sowie Links zu Qualitätszielen und Risiken.

**Review (10 Min.)**

Eine andere Gruppe prüft, ob sie die Entscheidung ohne Rückfragen nachvollziehen kann und welche Konsequenzen noch fehlen.

**Moderationshinweis**

Technische Debatten nicht lösen müssen. Lernziel ist die nachvollziehbare Begründung und die Verbindung zu Anforderungen, nicht die eine „richtige“ Architektur.

**Ergebnis**

Ein kurzer, überprüfbarer ADR-Entwurf.

### 15:15–15:55 — Querschnittliche Konzepte

**Kerninhalte**

- Querschnittliche Konzepte gelten über mehrere Bausteine hinweg, zum Beispiel Logging, Fehlerbehandlung, Sicherheit, Teststrategie oder Technologieauswahl.
- Gute Konzepte zeigen Regeln und deren Anwendung: Struktur, Ablauf, Beispiele und Grenzen.
- Ein Konzept soll Wiederverwendung unterstützen und trotzdem konkrete Architekturbezüge nennen.

**Übung: Ein Konzept verständlich machen (20 Min.)**

Gruppen wählen ein Thema, zum Beispiel „Umgang mit veralteten Sensordaten“ oder „Logging und Korrelation eines Bewässerungsvorgangs“. Sie erstellen eine Konzeptseite mit:

1. Zweck und betroffenen Bausteinen;
2. Regeln oder Ablauf;
3. einem konkreten Beispiel;
4. Fehlerfall oder Ausnahme;
5. Bezug zu einem Qualitätsziel oder ADR.

**Kurzgalerie und Feedback (10 Min.)**

Teilnehmende gehen die Ergebnisse durch und hinterlassen je einen Hinweis: „Damit kann ich arbeiten, weil …“ oder „Mir fehlt noch …“.

### 16:10–16:40 — Toolchain, Qualität, Reviews und Pflege

**Kerninhalte**

- Markdown und versionierte Diagrammquellen unterstützen gemeinsame Änderungen und Review im Code-Workflow.
- Confluence kann Zusammenarbeit erleichtern; klare Zuständigkeit, Verlinkung und Änderungsprozess bleiben trotzdem nötig.
- PlantUML und Draw.io sind mögliche Diagrammwerkzeuge; OpenAPI kann Schnittstellenbeschreibungen aus strukturierten Quellen liefern.
- CI/CD kann Links, Format, Diagrammquellen oder generierte Artefakte prüfen. Automatisierung ersetzt keine fachliche Review.
- Es gibt eine Quelle pro Information und eine benannte Pflegeverantwortung. Code ist für viele Architekturgründe nicht automatisch die einzige Quelle der Wahrheit.

**Übung: Doku-Review und Pflegevereinbarung (15 Min.)**

Gruppen tauschen ihre Fallartefakte und nutzen die Kriterien: Angemessenheit, Aktualität, Verständlichkeit, Konsistenz, Auffindbarkeit. Danach vereinbaren sie:

- Wer ändert die Doku, wenn Architektur oder Anforderungen sich ändern?
- Bei welchem Ereignis ist ein Review fällig?
- Was kann die Pipeline automatisch prüfen?
- Wo liegt die maßgebliche Version?

**Moderationshinweise**

- Tooldiskussionen nicht als Produktauswahl-Wettbewerb führen.
- Für den fiktiven Fall reicht eine einfache Toolchain-Skizze.
- Pflege als Teil der Änderung besprechen: Architekturänderung und Dokumentationsänderung gehören in denselben Arbeitsfluss.

**Ergebnis**

Review-Checkliste und knappe Teamvereinbarung zur Pflege.

### 16:40–17:00 — Zusammenfassung und Transfer

**Ablauf**

1. Jede Gruppe nennt ein Artefakt, das besonders hilfreich war (5 Min.).
2. Einzelreflexion: „Welche konkrete Frage werde ich in meinem Projekt als Nächstes besser dokumentieren?“ (5 Min.).
3. Runde mit persönlichem nächsten Schritt und offenem Punkt (8 Min.).
4. Abschluss und Feedback (2 Min.).

**Ergebnis**

Jede Person geht mit einem umsetzbaren nächsten Schritt und einer kleinen Auswahl geeigneter arc42-Abschnitte zurück.

## Benötigte Materialien

- Präsentation `slides.md` und Anzeige/Beamer.
- Whiteboard oder Flipchart, Haftnotizen und Stifte; alternativ ein gemeinsames digitales Board.
- Ausgedruckte oder digitale Arbeitsblätter: Stakeholder-Matrix, Qualitätsszenario, arc42-Karten, ADR-Vorlage, Konzeptseite, Review-Check.
- Optional: Laptops und ein Diagrammwerkzeug. Keine spezielle Laufzeitumgebung oder echte Hogarama-Installation ist erforderlich.

## Vorbereitungscheck für Trainer:innen

- Zeitplan und Pausen mit Veranstalter abstimmen.
- Gruppengröße prüfen und Teams von drei bis fünf Personen planen.
- Whiteboard-Flächen/Arbeitsblätter vorbereiten.
- Fiktive Fallannahmen sichtbar bereithalten; ergänzte Annahmen markieren lassen.
- Ein eigenes Beispiel für ein knappes Qualitätsszenario und ADR als Moderationshilfe vorbereiten.
- Falls Live-Tooling geplant ist, Diagrammwerkzeug und Projektion vorher prüfen; Tooling ist für die Lernziele nicht zwingend.

## Quellen und fachliche Einordnung

- Stefan Zörner: *Software-Architekturen dokumentieren und kommunizieren*, Kapitel 1.1.2, Leseprobe: <https://api.pageplace.de/preview/DT0400.9783446472464_A42831971/preview-9783446472464_A42831971.pdf>
- arc42-Übersicht mit den zwölf Abschnitten: <https://arc42.org/overview/>
- arc42 Dokumentation: <https://docs.arc42.org/>
- Q42 Qualitätsmodell: <https://quality.arc42.org/articles/arc42-quality-model>
- ISO/IEC/IEEE 42010:2022: <https://www.iso.org/standard/74393.html>
- Gepardec-Beitrag zu Hogarama als Inspiration für den Pflanzenbewässerungsfall: <https://www.gepardec.com/blog/hogarama/>

**Einordnung:** Hogarama liefert hier den verständlichen Anwendungskontext. Das im Training dokumentierte System ist eine didaktische Fiktion; Architekturdetails und Technologiewahl werden für Übungen neu festgelegt.
