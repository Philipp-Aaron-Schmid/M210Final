# LB210

Autoren: Delia,Thomas;Philipp  
Datum: 12.01.3034   
Version: 1.0   

## Inhaltsverzeichnis

1. [Grundidee](#Grundidee)
2. [Infrastruktur](#Infrastruktur)
3. [Konfiguration](#Konfiguration)
4. [Testplan](#Testplan)
5. [Installationsanleitung](#Installationsanleitung)
6. [Hilfestellungen](#hilfestellungen)


## Grundidee

Als Demonstrationsobjekt wählten wir für das Modul 223 das LB-Projekt, da es bereits aus mehreren Komponenten besteht. Diese Struktur ermöglichte eine einfache Anpassung für eine automatisierte Bereitstellung. Das Projekt setzt sich hauptsächlich aus einem Frontend, Backend und einer Datenbank zusammen. Zusätzlich integrierten wir einen Loadbalancer, um die Anwendung für mehrere Nutzer zugänglich zu machen.

Der erste Schritt bestand in der Dockerisierung des Projekts, das zuvor nur auf einem lokalen Server (localhost) lief. Für die Integration in das Docker-Netzwerk waren leichte Anpassungen der Verbindungen notwendig.

Die zweite Aufgabe war umfangreicher: Es galt, einen Release-Kandidaten gemäss den Vorgaben zu erstellen. Dieser Prozess erfolgte vollautomatisch durch einen GitHub-Workflow. Dieser Workflow verpackt nicht nur alle Komponenten in ein ZIP-Archiv und konvertiert dieses Dokument in ein PDF, sondern speichert auch die Docker-Images lokal im Projekt. Dadurch wird der Build-Prozess für 'docker up' erheblich vereinfacht.


## Infrastruktur

Die Infrastruktur des Projekts, besteht aus verschiedenen Docker-Containern wird durch `docker-compose.yml` konfiguriert. Das Projekt umfasst eine Java-Anwendung, eine Node.js-basierte Webanwendung und eine MySQL-Datenbank.

### Docker Compose Konfiguration (`docker-compose.yml`)
- **Version:** 3
- **Services:**
  - **db (MySQL-Datenbank):**
    - Verwendet `mysql:latest`.
    - Umgebungsvariablen für Datenbankkonfiguration.
    - Port `3307` auf dem Host zu `3306` im Container.
    - Initialisierungsskript und benannter Volume.
  - **backend (Java-Anwendung):**
    - Baut aus dem Verzeichnis `./M223_Sudoku-main`.
    - Port `8080` auf dem Host zu `8080` im Container.
    - Umgebungsvariablen für Datenbankverbindung.
    - Abhängigkeit von `db`.
  - **frontend (Node.js-Webanwendung):**
    - Baut aus dem Verzeichnis `./M223_Sudoku_Frontend2-main`.
    - Port `5174` auf dem Host zu `5174` im Container.
  - **loadbalancer (Nginx):**
    - Verwendet `nginx:latest`.
    - Port `8081` auf dem Host zu `80` im Container.
    - Abhängigkeiten von `backend` und `frontend`.

### Java-Anwendung
#### Build-Stadium:
- Verwendet Maven mit OpenJDK 21.
- Kopiert Projektdateien und führt Maven-Build aus.

#### Container-Erstellung:
- Verwendet OpenJDK 21-Image.
- Kopiert die erstellte JAR-Datei.

### Node.js-basierte Webanwendung
#### Build-Stadium:
- Verwendet Node.js-Image.
- Installiert Abhängigkeiten und baut die Anwendung.

#### Bereitstellungsstadium:
- Verwendet Nginx-Image.
- Serviert die gebauten Dateien.

### Zusammenfassung
Die Infrastruktur besteht aus einer Java- und einer Node.js-Webanwendung sowie einer MySQL-Datenbank, alle in Docker-Containern. Ein Nginx-basierter Loadbalancer wird ebenfalls verwendet. Die Containerisierung ermöglicht eine modulare und skalierbare Architektur.

## Konfigurationen

## Testplan

| Testfall-ID | Beschreibung                     | Reproduktionsschritte                               | Erwartestes Ergebniss               | Resultat | Status   |
|--------------|---------------------------------|---------------------------------------------------|--------------------------------|---------------|----------|
| TC-001       | Docker Run Test     | 1. Unzip LB-Projekt-M210_Delia-Thomas-Philipp.zip<br>2. öffne das Terminal<br>3. execute: `docker load -i docker_images.tar` <br>3.execute: `docker-compose up`| Die Docker umgebung ist aufgestarted und alle 4 container sind im betrieb | Die Docker umgebung ist aufgestarted und alle 4 container sind im betrieb| Bestanden   |
| TC-002       | DB access Test          | 1. TC-001 war erfolgreich<br>2. öffne das Terminal und execute: `mysql -h 127.0.0.1 -P 3307 -u sudoku -psudoku`<br>3. execute: `use sudoku;`<br>4. execute: `show tables;` | Die mysql DB hatt sich geöffnet und die tabelle user ist in der DB SUdoku vorhanden| Die mysql DB hatt sich geöffnet und die tabelle user ist in der DB SUdoku vorhanden | Bestanden  |
| TC-003       | Frontend Acess Test   | 1. ImBrowser Firefox ruffe `localhost:5174/index`auf | Die Index Seite wird mit den daten aus dem backend angezeigt | Die seite ist nicht verfügbar | Nicht Bestanden  |
| TC-004       | Signup Test       | 1. ImBrowser Firefox ruffe `localhost:5174/signup`auf<br>2. Gebe die Daten ein Benutzername: `Test` Email: `Test@Test.com` Passswort: `test123`<br>3. Klicke auf Anmelden | Der User wird auf die signin seite umgeleitet| Die seite ist nicht verfügbar | Passed   |
| TC-005       | Signin Test         | 1. Signin mitt Benutzername `Test`und Passwort: `test`` <br>2. Klicke auf anmelden | Der User wird auf die Challenges seite umgeleitet | Die seite ist nicht verfügbar | Nicht Bestanden |

## Installationsanleitung

### Voraussetzungen
Bevor Sie beginnen, stellen Sie sicher, dass Docker und Docker Compose auf Ihrem System installiert sind. Die Installationsschritte für Docker und Docker Compose variieren je nach Betriebssystem.

### Schritt 1: Projekt herunterladen
Laden Sie die Datei `LB-Projekt-M210_Delia-Thomas-Philipp.zip` herunter.

### Schritt 2: Zip-Datei entpacken
Entpacken Sie die heruntergeladene Zip-Datei in einem gewünschten Verzeichnis.

### Schritt 3: Terminal öffnen
Öffnen Sie ein Terminal im Verzeichnis, das die Datei `docker-compose.yml` enthält.

### Schritt 4: Docker-Images laden
Führen Sie den folgenden Befehl im Terminal aus, um die Docker-Images lokal zu laden:

```bash
docker load -i docker_images.tar
```

### Schritt 6: Anwendung starten
Geben Sie abschliessend den folgenden Befehl ein, um die Anwendung zu starten:

```bash
docker-compose up
```



## Hilfestellungen

Jakub Docker compose Hilfen



