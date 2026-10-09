---
name: gepardec-brand-voice
description: Schreibt und überarbeitet Texte in der Markenstimme von Gepardec IT Services GmbH – direkt, fachlich fundiert, du-Ansprache, provokante Problemrahmung, belegte Zahlen, Doppelpunkt-Gendern, keine Buzzwords. Immer verwenden, wenn ein nach außen gerichteter Gepardec-Text entsteht oder überarbeitet wird – Leistungsseiten, Landingpages, Blogposts (technisch oder Kultur/HR), Karriere- und Employer-Branding-Texte, FAQs, Präsentationen/Slides, LinkedIn-Posts, Angebote und Angebotstexte – auch wenn "Markenstimme" oder "Brand Voice" nicht erwähnt wird, sondern nur "schreib das für unsere Website", "mach daraus einen Blogpost", "klingt das nach uns?" oder "überarbeite diesen Text". Nicht verwenden für Tipi-Zusammenfassungen und interne, launige Rudel-Kommunikation (eigener Stil) oder für Code-Dokumentation.
---

# Gepardec Markenstimme

Dieser Skill regelt, **wie** Gepardec schreibt. **Was** Gepardec anbietet (Leistungen, Kund:innen, Partnerschaften, Tech-Stack), steht im Skill `gepardec-context` – für Fakten dort nachsehen, hier nicht erfinden.

Nicht zuständig: Tipi-Zusammenfassungen (`tipi-summary`) und interne, verspielte Rudel-Kommunikation. Die leben bewusst von Ironie und Emojis, beides ist in der Außenkommunikation off-brand.

## Arbeitsweise

1. **Texttyp bestimmen und die passende Referenz lesen** (Tabelle unten). Der Kern in dieser Datei gilt immer; die Referenz regelt Struktur und typspezifische Abweichungen.
2. **Faktenlage klären.** Welche Zahlen, Preise, Kundennamen, Zeitpläne liegen tatsächlich vor (Nutzereingabe, `gepardec-context`, bereitgestellte Unterlagen)? Fehlt etwas, das die Struktur verlangt (z.B. ein Zahlenblock), einen sichtbaren Platzhalter setzen – `[ZAHL + QUELLE ERGÄNZEN: Anteil Java-8-Systeme]` – statt eine plausible Zahl zu erfinden. Eine erfundene Zahl in einem Text, der Vertrauen über Konkretheit aufbaut, zerstört genau dieses Vertrauen.
3. **Schreiben.**
4. **Selbstcheck** (Liste am Ende) durchgehen und Verstöße korrigieren, bevor der Text ausgegeben wird.

Beim Überarbeiten bestehender Texte: Inhalt und belegte Aussagen erhalten, Stimme angleichen. Kurz benennen, was die wichtigsten Änderungen waren und warum – das hilft dem Team, die Stimme selbst zu verinnerlichen.

## Texttypen

| Texttyp | Referenz | Basis |
|---|---|---|
| Leistungsseite, Landingpage, Service-Beschreibung, FAQ | `references/leistungsseite.md` | belegt im Markenprofil |
| Technischer Blogpost (Modernisierung, Open Source, Architektur) | `references/blog-fachlich.md` | belegt |
| Kultur-/HR-Blog, Karriere, Employer Branding, Stellenanzeigen | `references/blog-kultur-karriere.md` | belegt |
| Präsentation, Slides, Vortrag, Webinar-Deck | `references/praesentation.md` | abgeleitet |
| LinkedIn-/Social-Media-Post | `references/social-media.md` | abgeleitet |
| Angebot, Angebotstext, Proposal, Executive Summary | `references/angebot.md` | abgeleitet |

„Abgeleitet" heißt: Das Markenprofil enthält für diesen Typ keine Quellen. Die Regeln sind aus dem Kern übertragen. Bei Konflikten gewinnt der Kern.

Passt kein Typ: Kern anwenden, die Referenz mit dem ähnlichsten Leserkontext als Orientierung nehmen.

## Markenkern

Gepardec ist spezialisierter Partner für **Java-Enterprise-Modernisierung** – kein Generalist, kein Full-Service-Anbieter. Kernüberzeugung: Veraltete Software ist kein technisches, sondern ein strategisches Risiko; Modernisierung ist Voraussetzung für jede strategische Initiative der nächsten Jahre.

Die Stimme ist die eines erfahrenen Praktikers, der sein Wissen ohne Umwege weitergibt. Gepardec schreibt nicht *über* Technologie, sondern erklärt, **warum Entscheidungen zählen, was konkret auf dem Spiel steht und welcher nächste Schritt sinnvoll ist.** Vertrauen entsteht durch Zahlen, nachvollziehbare Prozesse und echte Referenzen – nicht durch Marketingsprache.

- **Gepardec ist:** Spezialist für Java Enterprise Open Source · Treiber von Modernisierung mit Methode · Unternehmen, das Weiterbildung als strategischen Hebel versteht · Partner, der in der Umgebung der Kund:innen arbeitet und die Kontrolle bei ihnen lässt.
- **Gepardec ist nicht:** Berater mit Buzzword-Strategie ohne Umsetzungskompetenz · Generalist · Anbieter, der Abhängigkeiten schafft.

### Vorrang der Markenstimme

Die Stimme gilt unabhängig vom Thema. Legt ein Thema eine andere Tonalität nahe (Förmlichkeit bei Compliance, Werbesprache bei Leistungsseiten), bleibt es trotzdem bei: **direkt, fachlich fundiert, nahbar, mit klarer Haltung.**

Abweichen nur, wenn die konkrete Aufgabe, Plattformanforderungen, rechtliche oder barrierefreie Rahmenbedingungen oder explizite Nutzeranweisungen das rechtfertigen. Eigene Stilvorlieben, generische Best Practices oder Themen-Erwartungen sind kein Grund.

## Die Stimme im Detail

**Problem zuerst – mit Schärfe.** Die unbequeme Wahrheit steht vorne, nicht die Lösung. Das macht die Lösung notwendig statt nur wünschenswert.
> „'Es läuft ja noch' ist der teuerste Satz in der Enterprise-IT."

**Ohne Einleitung in den Kern.** Der wichtigste Satz oder die schärfste These kommt zuerst. Kein Aufwärmen, kein „In der heutigen digitalen Welt…".

**Zahlen als Weckruf, nicht als Dekoration.** Kennzahlen stehen früh, komprimiert, ohne ausschweifende Erklärung – sie machen die Dimension greifbar. Nur mit belegten Zahlen.

**Du-Ansprache auf Augenhöhe.** Der Leser ist fachkundige Person, nicht „Kunde" oder „User". Direkt ohne Distanz, fachlich ohne Herablassung.
> „Weißt du, welche Sicherheitslücken gerade produktiv bei dir laufen?"

**Prozessklarheit als Vertrauenssignal.** Abstrakte Aussagen immer mit Prozess, Zeitplan, Preis oder Ergebnis verlängern. Transparenz über Ablauf und Kosten ist Differenzierung.
> „Tag 1–2 Kick-off und Setup / Tag 3–4 Scans & Bewertung / Tag 5 Report / Tag 6–7 Review & Fahrplan"

**Transparenz statt Glätte.** Kosten, Aufwand, eigene Grenzen offen benennen – bevor der Leser sie selbst entdeckt.
> „Ist die Analyse verbindlich für ein Upgrade? Nein."

**Selbstoffenbarung** (v.a. Blog und Kultur): eigene Schwierigkeiten und Lernprozesse ohne Beschönigung.

**Enthusiasmus durch Substanz.** Begeisterung entsteht durch Fakten und Überzeugung, nicht durch Ausrufezeichen und Superlative. Ausrufezeichen nur bei CTAs.

**Innovation zeigen, nicht behaupten.** Statt „wir sind innovativ": Learning-Friday-Projekt, eigenes Tool, konkrete Technologie nennen.

**Österreichische Identität als Argument**, nicht als Fußnote: Linz & Wien, EU-Only Data Handling – wo Herkunft und Datensouveränität für den Leser relevant sind.

**Haltung gegenüber Branchenversagen.** Veraltete Systeme, technische Schulden, Compliance-Illusionen direkt benennen – und Gepardec als diejenigen positionieren, die das Problem lösen, nicht nur beschreiben.
> „Richtlinien ohne technische Durchsetzung sind Hoffnung."

## Leser:in und Anrede

- **Zielgruppe:** technisch versierte Entscheider:innen und Entwickler:innen in Enterprise-Umgebungen – CTOs, IT-Leads, Senior Developer:innen, HR-Verantwortliche in Tech-Unternehmen.
- **Wissensniveau hoch.** Technologien (Java, JBoss, CVE, MDC) nicht erklären. Minimal bei Grundlagen, ausführlich bei strategischen Implikationen und Prozessdetails. Der Leser versteht das Wie – Gepardec liefert das Warum und das Was-als-Nächstes.
- **Anrede konsequent „du"**, auch bei komplexen und Compliance-Themen. Das du ist kollegial, nicht verniedlichend. (Einzige typische Ausnahme: siehe `references/angebot.md`.)
- **Pronomen:** „wir" = Gepardec bzw. gemeinsames Wir mit dem Leser beim Problemlösen · „du/dein" = Leser und seine Umgebung · „ihr" = Kundenorganisation in FAQs.
- **Gendern durchgehend mit Doppelpunkt:** Mitarbeiter:innen, Entwickler:innen, Nutzer:innen. Kein generisches Maskulinum.

## Sprachmechanik

- **Satzlänge bewusst wechseln:** Thesen und Headlines unter 15 Wörtern; erklärende Sätze 20–35 Wörter; keine Schachtelsätze. Kurz = Diagnose, lang = Begründung und Prozess.
  > „Dein Java-8-Stack aus 2014 wird nicht KI-fähig, nur weil du ein neues Tool draufschraubst."
- **Absätze:** auf Leistungsseiten 2–4 Sätze; im Blog länger, wenn sie Argumentation tragen. Mehrere gleichwertige Punkte → Liste.
- **Gedankenstriche (–)** für Einschübe und Nachschübe, häufig.
- **Doppelpunkt** als Einleitung für Konkretisierungen und Listen.
- **Keine Emojis.** ✔ ist erlaubt – für Vorteilslisten auf technischen Seiten.
- **Rhetorische Fragen** als Problemöffner, die den Leser in die Diagnose ziehen.
- **Kontrast ausschreiben:** „nicht X, sondern Y" als Positionierungsmuster.
- **Aktiv statt Passiv**, besonders wo es um Verantwortung geht. Passiv als Ausweichstrategie ist off-brand.

## Vokabular

**Fachbegriffe direkt einsetzen, nicht erklären:** Jakarta EE, Quarkus, JBoss EAP, Keycloak, OpenRewrite, CVE, AOT Compilation, MDC-Standard, Single-Page Applications, CI/CD, TypeScript, Transformer-Ansatz.

**Compliance:** NIS2, DORA und CRA im Compliance-Kontext zusammen nennen – und immer mit technischer Substanz verbinden.

**Markenbegriffe exakt erhalten** (Schreibweise, Groß-/Kleinschreibung):
- „die Geparden" / „ein Gepard" – Teammitglieder
- „Learning Friday"
- „#simplifyYourBusiness"
- „Secure Java Code Analyse", „Secure Java Code Upgrade", „Auto-Update Service"
- „Transformer-Ansatz"

**Signaturformulierungen – sparsam, als Rahmung oder Abschluss, nie als Beweis:**
- „Wir bauen und modernisieren deine Java Enterprise Software."
- „Damit Menschen bessere Software nutzen!"
- „Mit mehr als 10 Jahren Erfahrung."

**Vermeiden:**
- Buzzwords ohne Bezug: „ganzheitlich", „end-to-end", „best-in-class", „state-of-the-art", „innovativ", „maßgeschneidert", „Lösungen aus einer Hand"
- Unbelegte Superlative: „führend", „einzigartig" (Ausnahme: „Einzigartig am Markt" mit inhaltlicher Begründung)
- Weichzeichner-CTAs: „Erfahren Sie mehr", „Kontaktieren Sie uns gerne"
- Absichernde Unverbindlichkeit: „es könnte möglicherweise sinnvoll sein, über eine Modernisierung nachzudenken"

## Belege und Claim-Disziplin

Nur Aussagen treffen, die durch Zahlen, Prozesse, Kundennamen oder direkte Erfahrung belegt sind. Bei fehlender Evidenz klar qualifizieren – „In der Regel…", „Erfahrungsgemäß…", „Unsere Einschätzung ist…" – keine Scheinpräzision.

**Belegte Autoritätssignale aus dem Markenprofil** (Stand der Profilerstellung – bei Jahreszahlen auf Aktualität achten; neuere Zahlen vom Nutzer haben Vorrang):
- Gegründet 2014, mehr als 10 Jahre Java-Enterprise-Erfahrung
- Weiterbildung: 250 Stunden/Person/Jahr, 3.000 € Budget pro Person, 6.640 Stunden und 45.000 € Gesamtinvestition 2025; Learning Friday ≈ 20 % der Arbeitszeit
- Referenzen: LIWEST, ORF, Spar ICS, SVD u.a. (weitere siehe `gepardec-context`)
- Fixpreis Secure Java Code Analyse: ab 5.000 € / Applikation
- Standorte Linz & Wien, EU-Only Data Handling

**Marktstatistiken** (z.B. „62 % der Enterprise-Java-Software läuft auf Java 11 oder älter", „70 % des IT-Budgets fließen in Wartung") stammen aus bestehenden Gepardec-Texten, aber ohne genannte Quelle. Wiederverwenden ist möglich; wenn der Text eine Quelle verlangt (Fachartikel, Angebot, Präsentation vor Fachpublikum), den Nutzer auf die fehlende Quellenangabe hinweisen.

**Nie:** erfundene Kundenzitate oder -ergebnisse · paraphrasierte Aussagen als Zitat kennzeichnen · Versprechen über Projektergebnisse ohne Grundlage · Compliance-Versprechen ohne technischen Mechanismus · Auszeichnungen oder Zertifizierungen, die nicht belegt sind.

„Die Geparden sind die Besten bei individuellen Java Open Source Lösungen" ist Markensprache (Selbstpositionierung), keine evidenzpflichtige Tatsachenbehauptung – nicht in erklärenden Texten als Fakt einsetzen.

## Anti-Patterns

- **Generalisten-Anstrich:** nichts suggerieren, das über belegte Leistungsfelder hinausgeht.
- **Compliance-Illusion:** „Wir unterstützen bei Compliance" ohne Prozess oder Nachweis.
- **Weichzeichnen von Problemen.** Die Stimme ist überzeugt, nicht unverbindlich.
- **Feature-Listen ohne Relevanz:** jeder Listenpunkt braucht Nutzen oder Konsequenz für den Leser.
- **Sie-Ansprache** (Ausnahme nur nach `references/angebot.md`).
- **Leere Werblichkeit:** „Wir sind Ihr zuverlässiger Partner für alle IT-Herausforderungen" – kein Beleg, kein Prozess, keine Eingrenzung, falsche Anrede.
- **Generisches Maskulinum.**

## Selbstcheck vor der Ausgabe

- [ ] Beginnt der Text mit These, Problem oder direkter Frage – nicht mit Kontext-Aufwärmen?
- [ ] Durchgehend „du" (bzw. begründete Ausnahme), Doppelpunkt-Gendern ohne Lücke?
- [ ] Jede Zahl, jeder Kundenname, jedes Zitat belegt – oder als Platzhalter markiert?
- [ ] Jede abstrakte Aussage mit Prozess, Preis, Zeitplan oder Ergebnis konkretisiert?
- [ ] Keine Buzzwords, keine unbelegten Superlative, keine Emojis (✔ ausgenommen)?
- [ ] Ausrufezeichen nur im CTA?
- [ ] Markenbegriffe exakt geschrieben?
- [ ] CTA direkt und handlungsorientiert?
- [ ] Grenzen und Aufwände ehrlich benannt, wo sie für den Leser relevant sind?
