# 🎵 PlattenDB – Relationale Musik-Datenbank für Schallplattenverwaltung

**PlattenDB** ist eine relationale SQL-Datenbank, die entwickelt wurde, um eine strukturierte Verwaltung von **Vinyl-Schallplatten** zu ermöglichen.  
Das Projekt wurde für **Musikhändler und Sammler** konzipiert, um Verkäufe, Lagerbestände und Details zu Musikstücken effizient zu verwalten.

## 📌 **Projektbeschreibung**
Mit einer wachsenden Plattensammlung wird es zunehmend schwieriger, den Überblick zu behalten.  
**PlattenDB** bietet eine umfassende Lösung zur Verwaltung von **Schallplatten**, einschließlich **Lagerverwaltung, Trackverwaltung und Verkaufsverwaltung**.

**🛠️ Technologien:**
- **Datenbank:** PostgreSQL
- **Datenmodellierung:** Normalisierte relationale Tabellen (3NF)
- **Abfragen:** SQL mit Joins, Aggregationen und Sicherheitsmechanismen

---

## 📂 **Tabellenstruktur**
| **Tabelle**         | **Beschreibung** |
|--------------------|----------------|
| `platte`          | Enthält Details zu jeder Schallplatte (Titel, Jahr, Zustand, Preis, Label, Standort) |
| `track`           | Speichert Track-Informationen einer Platte (Titel, Dauer, BPM, Seite) |
| `genre`           | Musikgenres für die Kategorisierung |
| `kuenstlerin`     | Enthält Künstler*innen mit Herkunftsland und Geschlecht |
| `hat_genre`       | Verknüpft Platten mit Genres |
| `interpretiert_von` | Verknüpft Platten mit Künstler*innen |
| `label`           | Plattenlabel mit Name und Herkunftsland |
| `ablageort`       | Verwaltung des Lagerorts (Regal, Fachnummer) |

---

## 🚀 **Installation & Nutzung**
### **1️⃣ Voraussetzungen**
- PostgreSQL installiert (`psql` sollte im Terminal verfügbar sein).
- Eine PostgreSQL-Datenbank `db_platten` sollte erstellt werden.

### **2️⃣ Datenbank-Import**
Falls du nur die **Tabellenstruktur** importieren möchtest:

psql -U goncabi -d db_platten -f schema.sql


##**🔍 Beispiel-SQL-Abfragen**

1️⃣ Standort einer bestimmten Platte abfragen

SELECT a.standort, a.regal_nr, a.fach_nr
FROM platte p
JOIN ablageort a ON p.ablageort_id = a.ablageort_id
WHERE p.titel = 'The Amazing Nina Simone';

2️⃣ Anzahl der Platten pro Genre ermitteln

SELECT g.genre_name, COUNT(hg.platte_id) AS anzahl_platten
FROM genre g
LEFT JOIN hat_genre hg ON g.genre_id = hg.genre_id
GROUP BY g.genre_id, g.genre_name
ORDER BY anzahl_platten DESC;

3️⃣ Umsatz mit Platten von Nina Simone berechnen

SELECT SUM(p.verkaufspreis - p.einkaufspreis) AS umsatz
FROM platte p
JOIN interpretiert_von iv ON p.platte_id = iv.platte_id
JOIN kuenstlerin k ON iv.kuenst_id = k.kuenst_id
WHERE k.kuenst_name = 'Nina Simone' AND p.verkaufsdatum IS NOT NULL;

##**🔐 Sicherheitskonzept**

Benutzerrolle für allgemeine Nutzer:

GRANT ALL ON ALL TABLES IN SCHEMA public TO s0592157;
Eingeschränkte Rolle für Shop-Mitarbeiter (nur Leserechte):
sql

GRANT SELECT ON ALL TABLES IN SCHEMA public TO s0592799;

##**📌 Erweiterungsideen**

Umsatz-Views: Verkaufsübersicht mit Gewinn- und Trendanalysen.
Kunden-Views: Anzeige von Verfügbarkeit, Preisen und Zustand der Platten.
Historie: Preis- und Lagerverlauf zur Bestandsoptimierung.
Externe Daten: Preistrends und Marktplatzintegration.

##**📩 Kontakt**
👤 Erstellt von: Gabriela Goncalvez, Maryam Mirza, Noa Sauter
📧 E-Mail: gabriela.goncalvez@posteo.net
🔗 GitHub Repo: GitHub - PlattenDB

##**📝 Lizenz**
📄 Dieses Projekt steht unter der MIT-Lizenz.
Weitere Informationen findest du in der LICENSE-Datei.
