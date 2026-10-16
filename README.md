# J&S Regensburg Food Tour

## Website online stellen
1. ZIP entpacken und die Dateien im Hauptverzeichnis eines GitHub-Repositories hochladen.
2. GitHub → Settings → Pages → Deploy from a branch → `main` / root → Save.
3. GitHub-Pages-Adresse am Handy öffnen. Android: Browser-Menü → Zum Startbildschirm hinzufügen / App installieren. iPhone: Safari → Teilen → Zum Home-Bildschirm.
4. Ohne Datenbank speichert die Seite Einträge **nur lokal pro Gerät**. Es findet KEINE Synchronisierung statt.

## Gemeinsame Daten (Supabase)
1. Supabase-Projekt anlegen, SQL Editor öffnen, `supabase.sql` ausführen.
2. Project Settings / API: Projekt-URL und **öffentlichen Publishable/anon-Key** kopieren, niemals den `service_role`-Key.
3. Auf beiden Geräten in der Website auf „Verbindung“ klicken und dieselben Werte eintragen.
4. Danach synchronisieren sich Einträge und Aktivitätsfeed (Realtime). Fotos werden im öffentlichen Storage-Bucket gespeichert.

**SICHERHEIT:** Das mitgelieferte SQL ist eine einfache, offen beschreibbare PROTOTYP-Konfiguration. Wer URL und Key kennt, kann Inhalte lesen/ändern; Links und Fotos können öffentlich zugänglich sein. Für private Nutzung mit echten persönlichen Erinnerungen unbedingt Supabase Auth mit zwei Konten, gruppenbezogene Row-Level-Security und privaten Storage-Bucket samt signierten URLs ergänzen. Die Eingabe J/S ist keine Anmeldung. Keine sensiblen Fotos/Daten in den Prototyp hochladen.

## Karten
OpenStreetMap/Leaflet; Adresssuche über Nominatim. Google-Maps-Kurzlinks werden als Links gespeichert, aber nicht automatisch in Koordinaten umgewandelt. Für den Karten-Pin auf „Ort auf Karte suchen“ klicken. Nominatim ist ein öffentliches Angebot mit Nutzungslimits.

## App und Push
PWA ist vorbereitet (Manifest + Service Worker; HTTPS über GitHub Pages). iOS und Android können sie zum Home-Bildschirm hinzufügen. **Push-Benachrichtigungen sind noch nicht implementiert.** Dafür benötigt man Web-Push-Abonnements, Berechtigungsabfrage, VAPID-Schlüssel und eine sichere Server-/Edge-Function, die bei neuen Einträgen Nachrichten verschickt. iPhone Web Push funktioniert für installierte Web-Apps ab iOS 16.4. Die Aktivitätsliste auf der Startseite funktioniert bereits.

## Einschränkungen
- Demo speichert Fotos als Data-URL im Browser und kann an Browser-Speicherlimits stoßen.
- Bewertungen werden pro Ort als ein gemeinsamer Satz von drei Kriterien gespeichert, nicht getrennt pro Person.
- Kein automatischer Import von Google-Maps-Ortsnamen aus Kurzlinks.
- Datumsanzeige verwendet die Zeitzone des jeweiligen Geräts.
- Keine Anmeldung, Löschfunktion oder automatische Benachrichtigung in dieser Version.
