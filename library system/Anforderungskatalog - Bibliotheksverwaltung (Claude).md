# Anforderungskatalog & Produktbeschreibung
## Projekt: "PyLib" – Konsolenbasierte Bibliotheksverwaltung in Python

---

## 1. Produktbeschreibung

**PyLib** ist eine reine Kommandozeilen-Anwendung (kein GUI, kein Web-Frontend) zur Verwaltung des Buchbestands und der Ausleihvorgänge einer kleinen Bibliothek. Die Software läuft in der Konsole, wird über ein textbasiertes Menü gesteuert und speichert ihre Daten lokal in einer Datei (z. B. JSON oder CSV).

Das Projekt ist bewusst als Übungssoftware konzipiert: Der funktionale Umfang ist überschaubar, deckt aber die zentralen Kompetenzbereiche ab, die für das **PCAP – Certified Associate in Python Programmer**-Zertifikat (Python Institute, Exam PCAP-31-03) relevant sind. Laut offiziellem Exam-Syllabus umfasst dieses Niveau u. a. objektorientierte Programmierung (Klassen, Vererbung, Kapselung, Polymorphie), Module und Pakete, die Exception-Hierarchie samt eigener Exception-Klassen, fortgeschrittene String-Verarbeitung, sowie List Comprehensions, Generatoren, Closures und Datei-I/O.

Die Anwendung soll ausschließlich mit der Python-Standardbibliothek umsetzbar sein. Externe APIs, Machine-Learning-Verfahren oder XML-Verarbeitung sind **nicht erforderlich**, aber als optionale Erweiterung nicht ausgeschlossen (siehe Abschnitt 5).

---

## 2. Zielsetzung

- Praxisnahes Üben von Python-Grundlagen bis Kompetenzniveau PCAP
- Anwendung von OOP-Prinzipien auf ein realistisches, kleines Domänenmodell
- Umgang mit persistenter Datenspeicherung ohne Datenbank
- Strukturierung von Code in mehrere Module/Dateien (kein Monolith-Skript)
- Sauberer Umgang mit Fehlerfällen über eigene Exception-Klassen

---

## 3. Funktionale Anforderungen

Die Anforderungen sind nach den fünf Themenbereichen des PCAP-Syllabus gegliedert, damit erkennbar ist, welche Kompetenz jeweils geübt wird.

### 3.1 Objektorientierte Programmierung (Kernbereich, ca. 1/3 des PCAP-Stoffs)

| ID | Anforderung |
|----|-------------|
| FR-01 | Es muss eine Klasse `Book` existieren mit Attributen wie Titel, Autor, ISBN, Verfügbarkeitsstatus. |
| FR-02 | Es muss eine Klasse `Member` (Bibliotheksmitglied) mit ID, Name und Liste ausgeliehener Bücher existieren. |
| FR-03 | Es muss eine Basisklasse `LibraryItem` geben, von der `Book` (und optional `Magazine`/`DVD`) erben, um Vererbung zu demonstrieren. |
| FR-04 | Attribute sollen über Properties (`@property`) mit Validierung gekapselt werden (z. B. ISBN-Format prüfen). |
| FR-05 | Mindestens eine Methode soll in einer Kindklasse überschrieben werden (Polymorphie), z. B. eine abweichende `__str__`- oder `describe()`-Methode. |
| FR-06 | Die Klasse `Library` verwaltet Bestand und Mitglieder und kapselt die zentrale Geschäftslogik (Ausleihe, Rückgabe, Suche). |

### 3.2 Module und Pakete

| ID | Anforderung |
|----|-------------|
| FR-07 | Der Code muss in mindestens 3–4 Module aufgeteilt werden, z. B. `models.py`, `library.py`, `storage.py`, `exceptions.py`, `main.py`. |
| FR-08 | Es soll mindestens ein selbst geschriebenes Paket (Ordner mit `__init__.py`) verwendet werden. |
| FR-09 | Import-Techniken sollen variieren (`import`, `from … import …`, ggf. `as`-Aliasing), um verschiedene Importmechanismen zu üben. |

### 3.3 Exceptions

| ID | Anforderung |
|----|-------------|
| FR-10 | Es müssen mindestens zwei eigene Exception-Klassen definiert werden, z. B. `BookNotAvailableError`, `MemberNotFoundError`, abgeleitet von `Exception`. |
| FR-11 | Ausleih-/Rückgabelogik muss diese Exceptions kontrolliert auslösen (`raise`) und im Hauptprogramm mit `try/except/else/finally` abgefangen werden. |
| FR-12 | Fehlerhafte Benutzereingaben (z. B. Buchstaben statt Zahl im Menü) müssen abgefangen werden, ohne dass das Programm abstürzt. |

### 3.4 Strings

| ID | Anforderung |
|----|-------------|
| FR-13 | Die Suchfunktion muss Teilstring-Suche unterstützen (Titel/Autor), inklusive Groß-/Kleinschreibungs-Toleranz. |
| FR-14 | Eingaben sollen bereinigt werden (`strip()`, `lower()`/`casefold()`, ggf. `split()`), bevor sie verarbeitet werden. |
| FR-15 | Ausgaben (z. B. Tabellenübersicht des Bestands) sollen über String-Formatierung (f-Strings, `str.format()` oder `%`) sauber formatiert werden. |

### 3.5 Miscellaneous: List Comprehensions, Lambdas, Generatoren, Closures, I/O

| ID | Anforderung |
|----|-------------|
| FR-16 | Statistikfunktionen (z. B. "alle verfügbaren Bücher", "meistausgeliehenes Buch") sollen mit List Comprehensions umgesetzt werden. |
| FR-17 | Sortierfunktionen sollen `sorted()` mit `key=lambda …` nutzen. |
| FR-18 | Mindestens ein Generator (z. B. `def iter_overdue_books(): yield …`) soll zur speichereffizienten Iteration über überfällige Ausleihen verwendet werden. |
| FR-19 | Mindestens eine Closure (z. B. ein Zähler oder Filter-Fabrikfunktion) soll demonstriert werden. |
| FR-20 | Der Datenbestand muss dauerhaft in einer Datei gespeichert und beim Programmstart wieder geladen werden (JSON via `json`-Modul oder CSV via `csv`-Modul). |
| FR-21 | Datei-I/O muss mit Context-Manager (`with open(...) as f:`) erfolgen. |

### 3.6 Benutzerführung (CLI)

| ID | Anforderung |
|----|-------------|
| FR-22 | Textbasiertes Hauptmenü mit nummerierten Optionen (Buch hinzufügen, ausleihen, zurückgeben, suchen, Statistik anzeigen, Beenden). |
| FR-23 | Das Menü läuft in einer Schleife, bis der Benutzer explizit "Beenden" wählt. |
| FR-24 | Alle Benutzereingaben werden validiert; ungültige Eingaben führen zu einer verständlichen Fehlermeldung, nicht zu einem Absturz. |

---

## 4. Nicht-funktionale Anforderungen

| ID | Anforderung |
|----|-------------|
| NFR-01 | Kein GUI – ausschließlich Terminal-/Konsolenausgabe. |
| NFR-02 | Ausschließliche Nutzung der Python-Standardbibliothek (keine externen Pakete wie `requests`, `pandas`, `flask` etc. erforderlich). |
| NFR-03 | Kompatibilität mit Python 3.10+ (aktuelle stabile 3.x-Version). |
| NFR-04 | Code folgt PEP 8 (Formatierung, Namenskonventionen). |
| NFR-05 | Jede Klasse und jede öffentliche Funktion besitzt einen Docstring. |
| NFR-06 | Das Projekt ist in einem eigenen Verzeichnis mit klarer Ordnerstruktur organisiert (z. B. `src/`, `data/`, ggf. `tests/`). |
| NFR-07 | Optional: einfache Unit-Tests mit `unittest` oder `pytest` für die Kernlogik (Ausleihe, Rückgabe, Suche). |

---

## 5. Abgrenzung / optionale Erweiterungen

Nicht Kernbestandteil der Anforderung, aber als spätere Erweiterungsstufe denkbar, falls mehr Übungstiefe gewünscht ist:

- **API-Calls**: z. B. Anreicherung von Buchdaten über eine öffentliche Buch-API (Cover, Beschreibung).
- **Machine Learning**: z. B. einfache Klassifikation von Büchern nach Genre auf Basis von Titel/Beschreibung, oder Clustering ähnlicher Nutzer nach Ausleihverhalten.
- **XML-Verarbeitung**: alternative Import-/Export-Schnittstelle im XML-Format zusätzlich zu JSON/CSV.

Diese Punkte gehen über den PCAP-Stoffumfang hinaus und sind **nicht Bestandteil der Kernanforderung**, können aber als Zusatzaufgabe dienen, sobald die Basisversion steht.

---

## 6. Akzeptanzkriterien (Beispiele)

- Das Programm startet ohne Fehler und zeigt das Hauptmenü an.
- Ein Buch kann hinzugefügt, gesucht, ausgeliehen und zurückgegeben werden, jeweils mit korrekter Statusänderung.
- Der Versuch, ein bereits ausgeliehenes Buch erneut auszuleihen, löst eine kontrollierte, abgefangene Exception mit verständlicher Meldung aus (kein Programmabsturz).
- Nach Neustart des Programms sind zuvor gespeicherte Daten weiterhin vorhanden (Persistenz funktioniert).
- Der Quellcode ist auf mindestens drei Dateien/Module verteilt und lässt sich fehlerfrei importieren.

---

## Quellen

- Python Institute: *PCAP™ – Certified Associate Python Programmer* (Zertifikatsbeschreibung), abgerufen von https://pythoninstitute.org/pcap
- Python Institute: *PCAP-31-0x Exam Syllabus*, abgerufen von https://pythoninstitute.org/pcap-exam-syllabus (letzte Aktualisierung der Quelle: 7. März 2022)
