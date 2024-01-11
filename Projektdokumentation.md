# Titel des Dokuments

Autoren: Delia,Thomas;Philipp  
Datum: 12.01.3034   
Version: 1.0   

## Inhaltsverzeichnis

1. [Grundidee](#Grundidee)
2. [Infrastruktur](#Infrastruktur)
3. [Konfiguration](#Konfiguration)
4. [Testplan](#Testplan)
5. [Testergebnisse](#Testplan)
6. [Installationsanleitung](#Installationsanleitung)
7. [Hilfestellungen](#hilfestellungen)


## Grundidee

Als demonstations Objekt haben wir das LB Projekt für das modul 223 verwendet da dieses schon aus mehreren Kompoentten besteht und daher nur angepasst werden muss um automatisiert deployed zu werden. 
Der erste schritt war die Dokerisierung des Projektes das bisher nur auf local host geloffen ist also solches musste die 

## Infrastruktur

## Konfigurationen

## Testplan
Backend access test

DB Access Test

Frontend Acess Test

Signup Test

Logout Test


## Testergebnisse

## Installationsanleitung

# Installationsanleitung für LB-Projekt-M210_Delia-Thomas-Philipp

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



