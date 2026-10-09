# Technische Dokumentation und Kommunikation: Reboot

# Begrüßung & Einführung

| Überblick |  |
| :---- | :---- |
|  | ![Kein Typ][image1] Beschreibung |
| Inhalt | Begrüßung der Teilnehmer Erwartungen der TeilnehmerAgenda Warum Dokumentation gut ist \- Die Frage nach dem Warum? |
| Lernziele | Teilnehmer sollen sich des Nutzens von Dokumentation bewusst werden |
| Übung 1 | Diskussion: Was ist gute Dokumentation |
| Übung 2 | Diskussion \+ Auflösung: "Typische Fragen eines neuen Entwicklers und die Antworten darauf" |

Dokumentation wird oft als lästige Pflicht wahrgenommen, die Zeit kostet und selten aktuell ist.  
In Wirklichkeit ist gute Architekturdokumentation jedoch ein zentrales Kommunikationsmittel: Sie macht Architekturentscheidungen, Annahmen und Zusammenhänge sichtbar, nachvollziehbar und diskutierbar.

Dokumentation hilft dabei, Wissen unabhängig von einzelnen Personen festzuhalten. Sie reduziert Missverständnisse, erleichtert Einarbeitung und verhindert, dass Entscheidungen immer wieder neu getroffen werden müssen bzw. im Nachhinein unnötig neu evaluiert werden.  
Gerade in verteilten Teams, bei Fluktuation oder über längere Projektlaufzeiten hinweg wirkt sie somit risikomindernd.

Allerdings ist Dokumentation kein Selbstzweck.  
Sie ist dann wertvoll, wenn sie den richtigen Stakeholdern zur richtigen Zeit die richtigen Informationen liefert — nicht mehr und nicht weniger. Gute Dokumentation spart langfristig Zeit, weil sie Diskussionen fokussiert, Entscheidungen absichert und Änderungen nachvollziehbar macht.

TL/DR: Dokumentation kostet Zeit — fehlende oder schlechte Dokumentation kostet deutlich mehr.

## Sichtenmodell und Notation

Inhalt: • Sichten nach arc42 (evtl. ISO 42010) • Diagrammtypen und Notationen (C4, UML, BPMN) • Konsistenz zwischen Sichten • Level of Detail

Übung: Übung: Erstelle Systemkontext- und Bausteindiagramm in Gruppen  
—

Dieses Kapitel behandelt die visuelle und strukturelle Darstellung von Softwarearchitekturen. Es erläutert, wie komplexe Systeme durch verschiedene Blickwinkel (Sichten) verständlich gemacht werden und welche Notationen dabei helfen, Entwürfe präzise zu kommunizieren.

### Sichten 

Softwarearchitektur ist zu komplex, um sie in einem einzigen Diagramm darzustellen. Daher nutzt man das Konzept der Sichten, um auf bestimmte Aspekte zu fokussieren und Unwichtiges zu abstrahieren.

### ISO/IEC 42010

Dieser Standard definiert den Rahmen für Architekturbeschreibungen. Er fordert, dass Stakeholder und deren Anliegen (Concerns) identifiziert werden und die Architektur durch Sichten (Views)  beschrieben wird, die diesen Anliegen gerecht werden.

### arc42-Sichtenmodell

arc42 bietet eine pragmatische Strukturierung in vier Hauptsichten:

* Kontextabgrenzung (Ebene 0): Die Kontextabgrenzung ist die wichtigste Sicht für die Kommunikation mit Nicht-Technikern.  
* **Fokus:** Das System als "Blackbox".  
* **Inhalt:** Identifikation aller Nachbarsysteme (Fremdsysteme) und Benutzerrollen (Akteure). Es wird strikt zwischen fachlichem Kontext (Domäne) und technischem Kontext (Protokolle, Kanäle) unterschieden.  
* **Ziel:** Festlegung des Scopes. Was gehört zum Projekt, was liegt außerhalb?


  * Bausteinsicht (Statik): Sie beschreibt die interne Struktur des Systems (den "Bauplan").  
* **Fokus:** Hierarchische Zerlegung (Dekomposition) in kleinere Einheiten.  
* **Konzept:** Startet bei Ebene 1 (Whitebox des Gesamtsystems) und zoomt bei Bedarf in komplexe Bausteine hinein (Ebene 2, 3...).  
* **Inhalt:** Name des Bausteins, dessen Verantwortung (Zweck) und die Schnittstellen zu anderen Bausteinen.


  * Laufzeitsicht (Dynamik): Strukturen allein erklären nicht, wie ein System eine Aufgabe löst.  
* **Fokus:** Zeitliche Abfolge und Datenfluss zwischen Bausteinen.  
* **Inhalt:** Typische Szenarien (z.B. "Benutzer loggt sich ein", "Batch-Job startet").  
* **Ziel:** Verständnis von Prozessen, Nebenläufigkeit und Fehlerszenarien.


  * Verteilungssicht (Infrastruktur): Software existiert nicht im luftleeren Raum.  
* **Fokus:** Abbildung der Software-Artefakte auf die technische Hardware.  
* **Inhalt:** Server, Cloud-Instanzen, Netzwerke, Betriebssysteme und physikalische Kanäle (z.B. Glasfaser, HTTP über Internet).

> *\[Placeholder: arc42 Sichten-Matrix\] Beschreibung: Eine Tabelle, die die vier Sichten den jeweiligen Stakeholdern zuordnet (z.B. Kontext \-\> Management; Bausteine \-\> Entwickler; Verteilung \-\> Betrieb).*

![][image2]

> 

Platzhalter: TODO Abschnitten 3 (Kontext), 5 (Bausteine), 6 (Laufzeit) und 7 (Verteilung) einbringen als beispiel diagramme ?\!.

### Diagrammtypen und Notationen

Die Notation ist das Alphabet der Architektur. Eine einheitliche Sprache verhindert, dass Diagramme unterschiedlich interpretiert werden \[Zörner2021\].

#### UML (Unified Modeling Language)

UML bietet eine formale Semantik und gilt als der internationale „Goldstandard“. Sie ist präzise und stellt verschiedene Typen wie Klassendiagramme für die Struktur, Sequenzdiagramme für die Laufzeit und Verteilungsdiagramme für die Infrastruktur bereit.

#### C4-Modell

Das C4-Modell nach Simon Brown stellt einen modernen, pragmatischen Ansatz dar. Es basiert auf vier Abstraktionsebenen namens Context, Container, Component und Code. Dieser hierarchische Aufbau lässt sich hervorragend mit der Arbeitsweise in arc42 kombinieren.

#### BPMN (Business Process Model and Notation)

BPMN wird primär eingesetzt, wenn fachliche Geschäftsprozesse im Vordergrund stehen. Sie schlägt die Brücke zwischen Business-Analysten und der IT, was besonders in der Laufzeitsicht oder bei der Prozessautomatisierung von Vorteil ist.

Platzhalter: Eine Darstellung der vier Ebenen des C4-Modells (Context, Container, Component, Class) als visuelle Analogie zum Hineinzoomen in eine Landkarte auch die anderen als Diagram darstellen

### Konsistenz zwischen Sichten

Ein zentrales Problem der Dokumentation ist das Auseinanderdriften verschiedener Sichten.

* Modellbasierter Ansatz: Idealerweise liegen allen Diagrammen dieselben Modellelemente zugrunde. Ein Baustein, der in der Bausteinsicht definiert wird, muss in der Laufzeitsicht dieselbe Identität und Verantwortlichkeit besitzen.  
* Regelmäßige Abgleiche: Dokumentation muss aktuell gehalten werden, darf aber nicht „zu aktuell“ (übertrieben detailliert) sein, um den Wartungsaufwand zu begrenzen.  
* Modell-Zentralität: Idealerweise werden Diagramme aus einem gemeinsamen Modell generiert (Model-Driven-Architecture) oder durch "Docs-as-Code" (z.B. PlantUML) synchron gehalten.  
* Traceability: Jede technische Lösung in der Bausteinsicht sollte auf eine Anforderung oder Entscheidung (ADR) zurückzuführen sein.

### Level of Detail (Detaillierungsgrad)

Zörner\[Zörner2021\] betont, dass der Detaillierungsgrad "angemessen" sein muss, um den Wartungsaufwand gering zu halten.

* Hierarchische Verfeinerung: arc42 schlägt vor, die Bausteinsicht Top-Down zu dokumentieren (Ebene 1: Gesamtsystem, Ebene 2: Subsysteme usw.).  
* Relevanz-Filter: Nur architektonisch signifikante Teile dokumentieren ("Travel Light").  
* Theorie der Blackbox/Whitebox: Dokumentiere ein Subsystem erst als Blackbox (Was macht es?). Erst wenn das Verständnis der Interna für Stakeholder kritisch ist, öffne es als Whitebox (Wie macht es das?)  \[arc42\]

Platzhalter: Ein Whitebox-Diagramm, das zeigt, wie eine Blackbox der Ebene 1 in Ebene 2 in ihre Bestandteile zerlegt wird.

\[Placeholder: Detail-Zoom Illustration\] Beschreibung: Eine Grafik, die zeigt, wie man von einer Weltkarte (Kontext) über einen Stadtplan (Bausteine Ebene 1\) bis hin zum Grundriss eines Hauses (Ebene 2/Code) zoomt.

## Architekturentscheidungen dokumentieren (ADR)

Inhalt: • Warum Entscheidungen dokumentieren? • Struktur von Architecture Decision Records • Zusammenhang mit Qualitätsanforderungen und Risiken

Übung: Übung: Formuliere 1–2 ADRs zu realen Entscheidungen deines Projekts

—

### Einleitung: Warum Dokumentieren?

„Das Leben eines Softwarearchitekten ist eine Folge suboptimaler Entscheidungen, die teilweise im Dunkeln getroffen werden.“ (Philippe Kruchten) \[Kruchten\]

### Die Schmerzpunkte ohne Dokumentation:

* Wissensverlust: Warum haben wir Framework X gewählt? Niemand erinnert sich, die Experten haben das Projekt verlassen.  
* Endlose Debatten: Neue Teammitglieder stellen alte Grundsatzentscheidungen in Frage, weil der Kontext der Entstehung fehlt.  
* Das Phänomen „Historisch gewachsen“: Dieser Satz ist oft ein Euphemismus für: „Wir wissen nicht mehr, warum wir das so tun, aber wir haben Angst, es zu ändern.“ Dokumentation macht Architektur revidierbar.  
* Das „Waterloo-Klasse“-Risiko:  Eine „Waterloo-Klasse“ bezeichnet eine Kategorie von fundamentalen Architekturentscheidungen, die so weitreichend sind, dass sie im Falle eines Fehlers das gesamte Projekt gefährden oder zum Scheitern des Systems führen.  
* Mangelnde Nachvollziehbarkeit: In Reviews können wir den Weg zur Lösung nicht mehr belegen.

### Architekturentscheidungen: Erarbeitung & Methodik

#### Die Entscheidungsmindmap

Die Mindmap nach Stefan Zörner ist das Moderationswerkzeug für den Architekten. Sie verhindert den „Tunnelblick“, bei dem man sofort zur Lösung springt, ohne das Problem verstanden zu haben. Sie dient im Workshop als visuelle Checkliste.

#### Die 5 Säulen einer Entscheidung

Um eine Entscheidung fundiert vorzubereiten, müssen fünf Bereiche beleuchtet werden:

1. **Fragestellung**: Eine präzise, meist offen formulierte Frage (z. B. „Wie realisieren wir die asynchrone Kommunikation?“).  
2. **Einflussfaktoren**: „Harte Fakten“ (Randbedingungen wie Budget/Zeit) und „weiche Ziele“ (Qualitätsziele wie Wartbarkeit).  
3. **Annahmen**: Explizites Festhalten von Vermutungen bei fehlendem Wissen. „Entscheidungen sind immer dann nötig, wenn Wissen fehlt und trotzdem gehandelt werden muss“ \[Wohland+2012\].  
4. **Betrachtete** Alternativen: Objektiver Vergleich von mindestens zwei Wegen. Wer nur eine Option hat, trifft keine Entscheidung.  
5. **Begründung**: Die logische Herleitung, warum Alternative A die Einflussfaktoren besser bedient als Alternative B.

### Dokumentations-Standards

Dieses Kapitel beschreibt, wie die in Kapitel 2 erarbeiteten Inhalte formal festgehalten werden.

#### Nygard-Format

Michael Nygard etablierte 2011 den Architecture Decision Record (ADR) als agiles Logbuch \[Nygard2011\]. Ein klassisches Nygard-ADR besteht aus diesen fixen Sektionen:

* **Title**: Eine kurze, nummerierte Überschrift (z. B. „ADR 001: Einsatz von PostgreSQL“).  
* **Status**: Der Lebenszyklus der Entscheidung (Proposed, Accepted, Superseded, Deprecated).  
* **Context**: Beschreibt das Problem und die Rahmenbedingungen. Hier fließen die *Fragestellung* und *Einflussfaktoren* aus der Mindmap ein.  
* **Decision**: Die klare Beschreibung der gewählten Lösung.  
* **Consequences**: Der wichtigste Teil. Hier werden die Trade-offs (Vorteile UND Nachteile) gelistet. Jede Entscheidung hat einen Preis.

#### Einbettung in den Standard (arc42)

Gemäß arc42 Abschnitt 9 ("Entwurfsentscheidungen") \[arc42-c9\]  werden ADRs wie folgt verwaltet:

* Zentraler Ort: Wichtige Entscheidungen werden hier gesammelt, um den „Roten Faden“ der Architektur zu zeigen.  
* Selektion: Nur systemrelevante Entscheidungen landen hier (ca. 2-5 für den groben Überblick).  
* Verlinkung: In der modernen Praxis enthält Abschnitt 9 oft die Liste der wichtigsten ADRs mit Links zu den detaillierten Markdown-Files.

#### MADR

MADR (Markdown Architectural Decision Records) verfeinert Nygard für die moderne Entwicklung \[MADR\].

* Unterschied zu Nygard: Während Nygard eher erzählerisch ist, bietet MADR eine strengere Markdown-Struktur.  
* Fokus auf Alternativen: MADR erzwingt eine Sektion Considered Options, in der Vor- und Nachteile der Alternativen tabellarisch oder gelistet gegenübergestellt werden.  
* Tooling: Durch die strengere Struktur können Tools wie adr-log automatisch Inhaltsverzeichnisse generieren.

````textproto
---
parent: Architectural Decisions
nav_order: 9
---
# Use Plain JUnit5 for advanced test assertions

## Context and Problem Statement

How to write readable test assertions?
How to write readable test assertions for advanced tests?

## Considered Options

* Plain JUnit5
* Hamcrest
* AssertJ

## Decision Outcome

Chosen option: "Plain JUnit5", because comes out best (see "Pros and Cons of the Options" below).

### Consequences

* Good, because tests are more readable
* Good, because more easy to write tests
* Good, because more readable assertions
* Bad, because more complicated testing leads to more complicated assertions

### Confirmation

* Check project dependencies, JUnit5 should appear (and be the only test assertion library).
* Collect experience with JUnit5 in sprint reviews and retrospectives: does the gained experience match the pros and cons evaluation below?
* Decide whether and when to review the decision (this is the 'R' in the [ecADR definition of done]
  (https://medium.com/olzzio/a-definition-of-done-for-architectural-decisions-426cf5a952b9) for ADs).

## Pros and Cons of the Options

### Plain JUnit5

Homepage: <https://junit.org/junit5/docs/current/user-guide/>
JabRef testing guidelines: <https://devdocs.jabref.org/getting-into-the-code/code-howtos#test-cases>

Example:

```java
String actual = markdownFormatter.format(source);
assertTrue(actual.contains("Markup<br />"));
assertTrue(actual.contains("<li>list item one</li>"));
assertTrue(actual.contains("<li>list item 2</li>"));
assertTrue(actual.contains("> rest"));
assertFalse(actual.contains("\n"));
```

* Good, because Junit5 is "common Java knowledge"
* Bad, because complex assertions tend to get hard to read
* Bad, because no fluent API

### Hamcrest

Homepage: <https://github.com/hamcrest/JavaHamcrest>

* Good, because offers advanced matchers (such as `contains`)
* Bad, because not full fluent API
* Bad, because entry barrier is increased

### AssertJ

Homepage: <https://joel-costigliola.github.io/assertj/>

Example:

```java
assertThat(markdownFormatter.format(source))
        .contains("Markup<br />")
        .contains("<li>list item one</li>")
        .contains("<li>list item 2</li>")
        .contains("> rest")
        .doesNotContain("\n");
```

* Good, because offers fluent assertions
* Good, because allows partial string testing to focus on important parts
* Good, because assertions are more readable
* Bad, because not commonly used
* Bad, because newcomers have to learn an additional language to express test cases
* Bad, because entry barrier is increased
* Bad, because expressions of test cases vary from unit test to unit test

## More Information

German comparison between Hamcrest and AssertJ: <https://www.sigs-datacom.de/uploads/tx_dmjournals/philipp_JS_06_15_gRfN.pdf>.

````

### Vernetzung: Einflussfaktoren, Qualität & Risiko

#### Zusammenhang mit Qualitätsanforderungen und Risiken

Architektur ist die Auflösung von Zielkonflikten. Jedes ADR sollte dokumentieren, wie es ein Risiko mindert oder ein Qualitätsziel (ISO 25010\) unterstützt \[Zörner2021\].

#### Die Kreuztabelle

Um den Überblick zu behalten, nutzen wir Kreuztabellen als Arbeitsmittel:

* **Spalten**: Qualitätsziele (z. B. Wartbarkeit, Benutzbarkeit).  
* **Zeilen**: Fragestellungen/Entscheidungen.  
* **Zellen**: Ein „X“ oder ein Wert zeigt an, welche Entscheidung welches Ziel adressiert.

Diese Methode macht Abhängigkeiten und ‚blinde Flecken‘ sichtbar: Wir erkennen sofort, ob wir zentrale Ziele wie die ‚Sicherheit‘ mit genügend Entscheidungen untermauern \[Zörner2021\].

Platzhalter: Beispiel Bild, das dies Darstellt 

### Die Architektur-Vision: Kompakte Lösungsstrategie

Dieses Kapitel widmet sich der Frage, wie wir die Essenz unserer Architektur kommunizieren, ohne den Leser mit Hunderten von Seiten zu erschlagen.

#### Bierdeckel-Interpretation

Die „Bierdeckel-Strategie“ ist ein mentales Modell für die Architekturvision. Sie basiert auf der Idee, dass die grundlegende Lösung eines komplexen Problems so einfach sein muss, dass sie auf die Rückseite eines Bierdeckels passt.

In der Praxis bedeutet dies:

* Fokus auf das Wesentliche: Wir lassen Details wie Bibliotheksversionen oder Klassendiagramme weg.  
* Kernaussage: Was ist das fundamentale Prinzip, das das System zusammenhält? (Z. B. "Event-Driven Core mit zustandslosen Read-Models").  
* Kommunizierbarkeit: Die Bierdeckel-Strategie dient dazu, in zwei Minuten jedem Stakeholder – vom Entwickler bis zum Product Owner – klarzumachen, in welche Richtung wir segeln.

#### Struktur

1. Linke Spalte (Qualitätsziele): Hier listen wir die 3 bis 5 wichtigsten Architekturziele auf (z. B. „Hohe Ausfallsicherheit“ oder „Einfache Erweiterbarkeit für Drittanbieter“).  
2. Rechte Spalte (Architekturansätze): Jedem Ziel werden schlagwortartig die technischen Antworten zugeordnet. Hierbei kann es sich um Architekturstile (z. B. Microservices), Muster (z. B. CQRS), Konzepte (z. B. Caching-Strategie) oder konkrete Entscheidungen (ADRs) handeln.

In der Lösungsstrategie manifestiert sich die Angemessenheit Ihres Entwurfs. Sie fungiert als Korrektiv: Jedes Qualitätsziel links benötigt ein technisches 'Gegengewicht' rechts. Fehlende Entsprechungen offenbaren Planungslücken, während technischer Ballast ohne Zielbezug als Overengineering identifiziert wird. Erst wenn beide Seiten im Gleichgewicht stehen, ist die Architekturvision konsistent

Als Ablageort dient im arc42 der Abschnitt 4: „Lösungsstrategie“ \[arc42-c4)

#### 

#### 

### Best Practices & Technischer Workflow

#### Architecture as Code

Architekturrelevante Artefakte werden wie Quellcode behandelt und auch dort abgelegt.

* Textbasierte Formate: Nutzung von Markdown oder AsciiDoc. Diese sind menschenlesbar und maschinenverarbeitbar.  
* Diagrams as Code: Visualisierungen (z. B. mit PlantUML) werden nicht gezeichnet, sondern beschrieben. Dies ermöglicht automatische Layouts und einfache Versionsvergleiche (Diffs).

#### Docs-as-Code \- Workflow 

Die Dokumentation folgt dem gleichen Lebenszyklus wie der Software-Code:

1. Storage: Ablage im selben Git-Repository wie der Quellcode.  
2. Versionierung: Änderungen erfolgen über Branches. Dokumentations-Updates sind Teil des Pull-Requests.  
3. Automation (CI/CD): Bei jedem Push generiert eine Pipeline (z. B. GitHub Actions oder Jenkins) automatisch die aktuelle Dokumentation als HTML oder PDF.  
4. Single Source of Truth: Es gibt keine veralteten Versionen auf Netzlaufwerken; die Wahrheit liegt im main\-Branch.

#### Architecture Decision Records (ADRs) \- Workflow

Während Kapitel 9 von arc42 den *Inhalt* einer Entscheidung beschreibt, regelt der Workflow deren *Entstehung*.

* Der "Proposed"-Status: Ein ADR beginnt als Vorschlag. Das Team kann im Pull-Request über Kommentare die Entscheidung verfeinern (Peer-Review für Architektur).  
* ADR-Log: Ein chronologisches Verzeichnis im Projektordner (z.B.: /docs/adr/), das wie ein Logbuch die Evolution des Systems zeigt.  
* Vorteil: Neue Teammitglieder lesen nicht nur, *wie* das System gebaut ist, sondern können die "Evolutionsstufen" anhand der ADRs nachvollziehen.

#### Selektionskriterien

Die größte Gefahr ist "Over-Documentation". Wir dokumentieren nach dem Prinzip: So viel wie nötig, so wenig wie möglich.

### Die "Zörner-Filter" für Relevanz:

Ein Sachverhalt sollte dokumentiert werden, wenn:

* Hohe Kosten bei Änderung: Die Entscheidung ist schwer revidierbar (z. B. Datenbankwechsel).  
* Risikominimierung: Erfüllt die Entscheidung ein kritisches Qualitätsziel (z. B. DSGVO-Konformität)?  
* Nicht-Offensichtliches: Warum haben wir Option A gewählt, obwohl B der Standard gewesen wäre?  
* Schnittstellen: Alles, was die Arbeit anderer Teams beeinflusst.

> Goldene Regel: Dokumentiere keine Fakten, die man schneller durch kurzes Lesen des Codes herausfindet. Dokumentiere das Warum, nicht das Was.

#### Review-Prozess & Qualitätssicherung

Dokumentation, die nicht geprüft wird, verfällt.

* Definition of Done (DoD): Ein Feature gilt erst als fertig, wenn die betroffenen Dokumentationsstellen (arc42) und eventuelle ADRs aktualisiert wurden.  
* Architektur-Reviews: In regelmäßigen Abständen (z. B. alle 3 Sprints) prüft das Team: "Sind unsere ADRs noch aktuell oder wurden sie durch die Realität überholt?"  
* Automatisierte Checks: Tools wie structurizr oder spezielle Linter können prüfen, ob Diagramme und Code noch synchron sind oder ob alle ADRs einen gültigen Status haben.

## Dokumentation mit KI

| Überblick |  |
| :---- | :---- |
| Inhalt | Praxisbeispiele aus Legacy-Projekten (Media Data, MM) • Phasenmodell: Vorprojekt, Architektur, Entscheiden, Umsetzung • Brownfield vs. Greenfield • Skills und MCP als Bausteine (arc42-Toolkit, Structurizr) • ADRs mit KI • Dokumentation aktuell halten (Ausblick OpenSpec) |
| Lernziele | Die Teilnehmenden können …<br>1. für jede Projektphase erklären, wie KI bei der Dokumentation unterstützt und wo ihre Grenzen liegen;<br>2. Brownfield und Greenfield nach Quelle, Rolle der KI und Hauptrisiko unterscheiden;<br>3. mit KI-Unterstützung Qualitätsziele, Stakeholder und Nicht-Ziele erheben und messbar formulieren;<br>4. Skills und MCP-Server als Bausteine einordnen und wissen, wie sie in ein Repository kommen;<br>5. KI-generierte Dokumentation kritisch prüfen (Generik, Halluzination, fehlender Projektbezug). |
| Übung | Greenfield-Durchstich in Teams à 3–4 Personen: Aus einem fiktiven Kunden-Brief erheben die Teams mit KI Qualitätsziele, Stakeholder und Nicht-Ziele, erstellen arc42-Sektion 1 und 2, erzeugen ein Kontextdiagramm mit Structurizr, schreiben einen ADR und vergleichen anschließend ihre Ergebnisse. |
| Dauer | ca. 3:45 h (halber Tag) |

Die vorherigen Kapitel haben gezeigt, *was* gute Architekturdokumentation ausmacht: passende Sichten und Notationen (Kapitel „Sichtenmodell und Notation“) und nachvollziehbare Entscheidungen (Kapitel „Architekturentscheidungen dokumentieren (ADR)“). Dieses Kapitel führt keine neuen Dokumentationskonzepte ein. Es legt eine KI-Schicht darüber und zeigt, wie sich dieselben Artefakte – arc42-Sektionen, C4-Diagramme, ADRs – mit KI schneller erstellen und vor allem aktuell halten lassen.

Die KI ersetzt dabei weder Fachwissen noch Entscheidungen. Sie stellt Fragen, strukturiert, leitet ab und prüft. Was dabei herauskommt, ist nur so gut wie der Input – und muss genauso kritisch gelesen werden wie Dokumentation, die ein Mensch geschrieben hat.

Im Training startet das Kapitel mit Praxisbeispielen; die Einordnung unten folgt danach.

### Phasenmodell

Das Kapitel ist entlang der Projektphasen aufgebaut. Jede Phase greift auf ein früheres Kapitel zurück:

```
  Vorprojekt        Architektur         Entscheiden        Umsetzung
  +------------+    +--------------+    +------------+    +----------------+
  | QS-Ziele,  |    | arc42-Sek.,  |    | ADRs mit   |    | Doku aktuell   |
  | Anforderun-| -> | C4-Diagramme | -> | KI         | -> | halten         |
  | gen, Nicht-|    | (Structurizr)|    |            |    | (OpenSpec)     |
  | Ziele      |    |              |    |            |    |                |
  +------------+    +--------------+    +------------+    +-------+--------+
        ^                                                         |
        +------------------------ Feedback -----------------------+
```

| Phase | KI-Einsatz | Rückbezug |
| :---- | :---- | :---- |
| Vorprojekt | Qualitätsziele, Anforderungen, Stakeholder und Nicht-Ziele erheben | Kreuztabelle QS ↔ Entscheidungen (Kapitel ADR, „Vernetzung: Einflussfaktoren, Qualität & Risiko“) |
| Architektur | arc42-Sektionen und C4-Diagramme erstellen | Kapitel „Sichtenmodell und Notation“ |
| Entscheiden | ADRs formulieren bzw. rekonstruieren | Kapitel „Architekturentscheidungen dokumentieren (ADR)“ |
| Umsetzung | Dokumentation bei jeder Änderung mitziehen | „Best Practices & Technischer Workflow“ (Docs-as-Code, Review-Prozess) |

### Zwei Einstiege: Brownfield und Greenfield

Dasselbe Phasenmodell wird je nach Ausgangslage von verschiedenen Enden her durchlaufen:

```
  GREENFIELD (Idee -> Doku)
  Vorprojekt --> Architektur --> Entscheiden --> Umsetzung

  BROWNFIELD (Code -> Doku)
  Umsetzung --> Architektur --> Entscheiden --> Vorprojekt
  (Code ist     (aus dem Code   (implizite      (QS-Ziele und
   die Quelle)   abgeleitet)     Entscheidungen  Stakeholder
                                 rekonstruiert)  nachtraeglich)

  Beide muenden in denselben Zyklus: Dokumentation aktuell halten.
```

| | Greenfield | Brownfield / Legacy |
| :---- | :---- | :---- |
| Quelle | Gespräche, Anforderungen, Ideen | Code, Konfiguration, Git-Historie, Tickets |
| Rolle der KI | Sparringspartner und Strukturgeber: stellt Fragen, fordert Priorisierung und Messbarkeit ein | Analyst: liest den Bestand, leitet Struktur und Zusammenhänge ab |
| Hauptrisiko | Generische Dokumentation ohne Projektbezug („alles ist wichtig“) | Halluzinierte oder falsch abgeleitete Zusammenhänge |
| ADRs | Entscheidungen festhalten, während sie fallen | Gründe für bestehende Entscheidungen rekonstruieren („Warum ist das so?“) |
| Im Training | selbst gemacht (Übung) | gezeigt (Praxisbeispiele) |

### Werkzeuge und Vertraulichkeit

Die Konzepte sind werkzeugneutral: **Agent Skills** (wiederverwendbare Anleitungen für den KI-Agenten), **MCP-Server** (Anbindung externer Werkzeuge wie Structurizr) und **Spec-driven Development** funktionieren mit jedem Agenten, der diese Standards unterstützt. Im Training wird mit JetBrains Junie bzw. dem IntelliJ AI Assistant gearbeitet, weil diese bei Gepardec lizenziert sind – sie sind ein Beispiel, keine Voraussetzung.

Hands-on findet ausschließlich in einem vorbereiteten Demo-Repository statt. Kundencode und Kundendokumente werden im Training nicht in KI-Tools eingegeben. Der Transfer auf das eigene Projekt erfolgt als Diskussion.

### Ablauf

| Start | Block | Dauer |
| :---- | :---- | :---- |
| 0:00 | Praxis-Einstieg Brownfield: Media Data (15 min) und MM (10 min) | 25 min |
| 0:25 | Einordnung: Phasenmodell, Brownfield/Greenfield, Skills und MCP | 10 min |
| 0:35 | Vorprojekt: Konzept und Live-Demo Brainstorming-Skill | 20 min |
| 0:55 | Architektur: arc42-Toolkit und Structurizr | 20 min |
| 1:15 | Entscheiden: ADRs mit KI, Kreuztabelle | 15 min |
| 1:30 | Umsetzung: Dokumentation aktuell halten (Ausblick OpenSpec) | 10 min |
| 1:40 | Pause | 15 min |
| 1:55 | Übung: Greenfield-Durchstich | 90 min |
| 3:25 | Transfer aufs eigene Projekt und Abschluss | 20 min |
| 3:45 | Ende (15 min Puffer bis 4 h) | |

Die Live-Demos laufen an einem eigenen Demo-Projekt, nicht am Kunden-Brief der Übung – sonst übernehmen die Teams die Demo-Ergebnisse.

### Praxis-Einstieg: Brownfield

> **In Ausarbeitung** → Change `ki-kapitel-phasen`

Zwei Legacy-Projekte zeigen, wie mit KI Dokumentation aus bestehendem Code entstanden ist.

#### Media Data (arc42)

* Ausgangslage: *in Ausarbeitung*
* KI-Einsatz: *in Ausarbeitung*
* Ergebnis: *in Ausarbeitung*

#### MM (Camel-Route-Guideline)

* Ausgangslage: *in Ausarbeitung*
* KI-Einsatz: *in Ausarbeitung*
* Ergebnis: *in Ausarbeitung*

### Phase 1: Vorprojekt

> **In Ausarbeitung** → Change `ki-kapitel-phasen`

Ziel: Mit KI zu Qualitätszielen, Anforderungen und Nicht-Zielen kommen – also zu dem, was die Architektur später tragen muss und was bewusst nicht gebaut wird. Die KI liefert dabei keine Antworten, sondern stellt die unbequemen Fragen: Was ist wirklich wichtig? Woran wird das gemessen? Was bauen wir ausdrücklich nicht? Werkzeug: Brainstorming-Skill.
Die Ergebnisse fließen in arc42-Sektion 1 und 2 und später in die Kreuztabelle aus dem Kapitel „Architekturentscheidungen dokumentieren (ADR)“.

### Phase 2: Architektur

> **In Ausarbeitung** → Change `ki-kapitel-phasen`

Ziel: arc42-Sektionen und C4-Diagramme mit KI erstellen – im Greenfield aus den Ergebnissen des Vorprojekts, im Brownfield aus dem Code. Werkzeuge: arc42-Toolkit (Skills je Sektion), Structurizr mit MCP-Anbindung und ein Orchestrierungs-Skill, der beides verbindet.
Rückbezug: Kapitel „Sichtenmodell und Notation“ (C4, Konsistenz zwischen Sichten, Level of Detail).

### Phase 3: Entscheiden

> **In Ausarbeitung** → Change `ki-kapitel-phasen`

Ziel: ADRs mit KI formulieren (Greenfield) bzw. die Gründe hinter bestehenden Entscheidungen rekonstruieren (Brownfield) und mit den Qualitätszielen verknüpfen.
Rückbezug: Kapitel „Architekturentscheidungen dokumentieren (ADR)“ (MADR, Kreuztabelle).

### Phase 4: Umsetzung

> **In Ausarbeitung** → Change `ki-kapitel-phasen`

Ziel: Dokumentation bei jeder Änderung mitziehen, statt sie nachträglich zu reparieren. Ausblick auf Spec-driven Development mit OpenSpec, bei dem Spezifikation, Umsetzung und Dokumentation in einem Zyklus entstehen.
Rückbezug: „Best Practices & Technischer Workflow“ (Docs-as-Code, ADR-Workflow, Review-Prozess).

### Übung: Greenfield-Durchstich

> **Detailanleitung in Ausarbeitung** → Change `ki-uebung-durchstich`

Ziel: Einmal alle Phasen im Kleinen durchlaufen – von der Projektidee bis zum ersten ADR. Es entsteht bewusst keine vollständige arc42-Dokumentation, sondern ein Durchstich.

Rahmen: Teams à 3–4 Personen, 90 Minuten, im Demo-Repository. Grundlage ist ein fiktiver Kunden-Brief, der absichtlich Lücken, Widersprüche und versteckte Zielkonflikte enthält.

| Schritt | Inhalt | Dauer |
| :---- | :---- | :---- |
| 1 | Brainstorming mit KI: Qualitätsziele (Top 3), Stakeholder, Nicht-Ziele | 30 min |
| 2 | arc42-Sektion 1 und 2 erstellen | 15 min |
| 3 | Kontextdiagramm mit Structurizr erzeugen | 20 min |
| 4 | Einen ADR zu einer Entscheidung schreiben, mit Bezug zu einem Qualitätsziel | 15 min |
| 5 | Teamvergleich: gleicher Brief, andere Qualitätsziele – warum? | 10 min |

Ergebnis je Team: arc42-Sektion 1 und 2, ein Kontextdiagramm und mindestens ein ADR mit Bezug zu einem Qualitätsziel.

Im Teamvergleich zeigt sich: Qualitätsziele sind Entscheidungen, keine Ableitungen aus dem Brief. Teams, die die KI nur „generieren lassen“, landen bei generischen Ergebnissen.

### Transfer aufs eigene Projekt

Abschließend überträgt jede:r Teilnehmer:in das Gelernte gedanklich auf das eigene Projekt, z. B. auf ein Systemarchitekturkonzept beim Kunden: Ist es Brownfield oder Greenfield? Welche Phase hat den größten Nachholbedarf? Welcher Skill würde am meisten bringen? Der Transfer erfolgt als Diskussion – nicht live mit Kundencode. Die Umsetzung im Projekt ist ein nächster Schritt nach Abstimmung mit dem Projekt bzw. Kunden.

# Referenzen

\[arc42\] Starke, G., & Hruschka, P. (o. D.). “arc42 documentation template”.  
        https\://docs.arc42.org/

\[Kruchten\] Kruchten, P. (1995).  “The 4+1 view model of architecture“. IEEE Software, 12(6), 42–50.  
           https\://doi.org/10.1109/52.469759

\[MADR\] Markdown Architectural Decision Records (MADR). (o. D.).  
       https\://adr.github.io/madr/

\[Nygard2011\] Nygard, M. (2011). “Documenting architecture decisions“.  
             https\://cognitect.com/blog/2011/11/15/documenting-architecture-decisions

\[Wohland2012\] Wohland, G., Wiemeyer, J., & Wiemeyer, M. (2012).  “Denkwerkzeuge der Höchstleistung“.  
              Gabal Verlag.

\[Zörner2021\] Zörner, S. (2021).“Softwarearchitekturen dokumentieren und kommunizieren“ (3. Aufl.).  
             Carl Hanser Verlag.

\[arc42-c9\] arc42 Documentation. (o. D.).  “9. Architecture decisions”.  
           Abgerufen am 23\. Dezember 2025, von  
           [https\://docs.arc42.org/section-9/](https://docs.arc42.org/section-9/)

\[arc42-c4\] arc42 Documentation. (o. D.).  “4. Solution Strategy”.  
           Abgerufen am 23\. Dezember 2025, von  
           [https\://docs.arc42.org/section-4/](https://docs.arc42.org/section-4/)

\[ISO42010\] International Organization for Standardization. (2011). *ISO/IEC/IEEE 42010:2011 Systems and software engineering — Architecture description*.

[image1]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAQAQMAAAAs1s1YAAAABlBMVEUAAABER0byc6G0AAAAAXRSTlMAQObYZgAAAB9JREFUeF5jYEAD9h8YmEA0MwOYZmSWWQjhs4H56BgAT4ECDeGaeV4AAAAASUVORK5CYII=>

[image2]: <data:image/png;base64,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>