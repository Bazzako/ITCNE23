-- Einfache Subselects
	-- Schreibe eine Abfrage, um alle Mitarbeiter zurückzugeben, die mehr verdienen als der Durchschnittslohn aller Mitarbeiter.
SELECT AVG(Gehalt) FROM Mitarbeiter
SELECT * FROM Mitarbeiter m WHERE m.Gehalt > (SELECT AVG(Gehalt) FROM Mitarbeiter);

	-- Finde alle Produkte, die teurer sind als der Durchschnittspreis aller Produkte.
SELECT AVG(Preis) FROM Produkte
SELECT * FROM Produkte p WHERE p.Preis > (SELECT AVG(Preis) FROM Produkte);

-- Verwendung von Subselects in WHERE-Klauseln
	-- Schreibe eine Abfrage, um alle Kunden zurückzugeben, die mindestens eine Bestellung aufgegeben haben.
SELECT * FROM Kunden k WHERE k.KundenID in (SELECT DISTINCT KundenID FROM Bestellungen b);

	-- Finde alle Mitarbeiter, deren Gehalt höher ist als das Durchschnittsgehalt der Mitarbeiter in ihrer Abteilung.
SELECT AVG(Gehalt) FROM Mitarbeiter
SELECT * FROM Mitarbeiter m WHERE m.gehalt > (SELECT AVG(Gehalt) FROM Mitarbeiter m WHERE m.MitarbeiterID = m.MitarbeiterID);

-- Verwendung von Subselects in FROM-Klauseln
	-- Erstelle eine Abfrage, um die Anzahl der Bestellungen für jeden Kunden zu ermitteln.
SELECT k.*, sub.Anzahl_Bestellungen FROM Kunden k LEFT JOIN (SELECT KundenID, COUNT(*) AS Anzahl_Bestellungen FROM Bestellungen GROUP BY KundenID) AS sub ON k.KundenID = sub.KundenID;

	-- Finde die durchschnittliche Anzahl von Bestellungen pro Kunde.

SELECT AVG(Anzahl_Bestellungen) AS Anzah_Durchscnittliche_Bestellungen
FROM (
SELECT k.*, COUNT(b.BestellungenID) AS Anzahl_Bestellungen
FROM Kunden k
LEFT JOIN Bestellungen b ON k.kundenID = b.kundenID
GROUP BY k.kundenID
) AS subquery

-- Verwendung von Subselects in HAVING-Klauseln
	-- Schreibe eine Abfrage, um alle Abteilungen zurückzugeben, in denen die Anzahl der Mitarbeiter größer ist als der Durchschnitt der Anzahl der Mitarbeiter pro Abteilung.
SELECT AbteilungID
FROM Mitarbeiter
GROUP BY AbteilungID
HAVING COUNT(MitarbeiterID) > (SELECT AVG(Mitarbeiter_Anzahl) FROM (SELECT COUNT(MitarbeiterID) AS Mitarbeiter_Anzahl FROM Mitarbeiter GROUP BY AbteilungID) AS Subquery);

	-- Finde alle Kunden, die mehr als eine Bestellung aufgegeben haben.
SELECT KundenID
FROM Bestellungen
GROUP BY KundenID
HAVING COUNT(BestellungenID) > 1;

-- Verwendung von korrelierten Subselects
	-- Schreibe eine Abfrage, um alle Mitarbeiter zurückzugeben, die ein Gehalt haben, das höher ist als das Gehalt des Mitarbeiters mit der niedrigsten Mitarbeiter-ID.
Select MIN(MitarbeiterID)
FROM Mitarbeiter
SELECT Gehalt FROM Mitarbeiter WHERE MitarbeiterID = (SELECT MIN(MitarbeiterID) FROM Mitarbeiter)
SELECT * FROM Mitarbeiter WHERE Gehalt > (SELECT Gehalt FROM Mitarbeiter WHERE MitarbeiterID = (SELECT MIN(MitarbeiterID) FROM Mitarbeiter))

	-- Finde alle Kunden, die mehr Bestellungen aufgegeben haben als der durchschnittlich der Bestellungen der Kunde.
SELECT KundenID, Count(KundenID) AS Bestellungsanzahl
FROM Bestellungen
GROUP BY KundenID
HAVING COUNT(KundenID) > (SELECT AVG(Bestellungsanzahl) FROM (SELECT KundenID, Count(KundenID) AS Bestellungsanzahl FROM Bestellungen GROUP BY KundenID) AS Anzahlbestellungen)
-- Subselects mit EXISTS und NOT EXISTS
	-- Finde alle Kunden, die mindestens eine Bestellung aufgegeben haben.
SELECT KundenID FROM Bestellungen WHERE EXISTS
SELECT * FROM Bestellungen WHERE KundenID = 1
SELECT * FROM Kunden AS k WHERE EXISTS(SELECT * FROM Bestellungen WHERE KundenID = k.KundenID)
	-- Finde alle Mitarbeiter, die keine Bestellungen bearbeitet haben.
SELECT * FROM Kunden AS k WHERE not EXISTS(SELECT * FROM Bestellungen WHERE KundenID = k.KundenID)
-- Subselects mit IN und NOT IN
	-- Schreibe eine Abfrage, um alle Produkte zurückzugeben, die in einer bestimmten Kategorie liegen.
SELECT DISTINCT Kategorie FROM Produkte
SELECT * FROM Produkte WHERE Kategorie = "Elektronik"
SELECT * FROM Produkte WHERE Kategorie IN (SELECT Distinct Kategorie FROM Produkte WHERE Kategorie LIKE "E%")
SELECT * FROM Produkte WHERE Kategorie 
SELECT Distinct Kategorie FROM Produkte WHERE Kategorie LIKE "E%"
	-- Finde alle Kunden, die Bestellungen für bestimmte Produkte aufgegeben haben.
SELECT * FROM Produkte WHERE Kategorie = "Elektronik"
SELECT * FROM Kunden WHERE KundenID IN (SELECT DISTINCT KundenID FROM Bestellungen WHERE ProduktID = 105)