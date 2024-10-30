-- Aufgabe 7.1: Durchschnittsnote mit Dezimalstellen berechnen
SELECT AVG(CAST(Note AS DECIMAL(5, 2))) AS Durchschnittsnote
FROM Schulungen
WHERE Schulung_ID = 3; -- Angenommen, Aufgabe 3.7 bezog sich auf eine spezifische Schulung


-- Aufgabe 7.2: Trainer, Schulungen und Durchschnittsnote, beste und schlechteste Note je Schulung
SELECT 
    t.Trainer_Name,
    s.Schulung_Name,
    AVG(CAST(b.Note AS DECIMAL(5, 2))) AS Durchschnittsnote,
    MIN(b.Note) AS Beste_Note,
    MAX(b.Note) AS Schlechteste_Note
FROM 
    Trainer t
JOIN 
    Schulungen s ON t.Trainer_ID = s.Trainer_ID
JOIN 
    Bewertungen b ON s.Schulung_ID = b.Schulung_ID
GROUP BY 
    t.Trainer_Name, s.Schulung_Name;


-- Aufgabe 7.3: Alle drei Noten nebeneinander darstellen
SELECT 
    t.Trainer_Name,
    s.Schulung_Name,
    CONCAT(
        AVG(CAST(b.Note AS DECIMAL(5, 2))), ' ', 
        MIN(b.Note), ' ', 
        MAX(b.Note)
    ) AS Noten_Uebersicht
FROM 
    Trainer t
JOIN 
    Schulungen s ON t.Trainer_ID = s.Trainer_ID
JOIN 
    Bewertungen b ON s.Schulung_ID = b.Schulung_ID
GROUP BY 
    t.Trainer_Name, s.Schulung_Name;


-- Aufgabe 7.4: Aktuelles Datum in verschiedenen Formaten
SELECT 
    GETDATE() AS Standard,
    CONVERT(VARCHAR, GETDATE(), 101) AS US_ohne_Jahrhundert,
    CONVERT(VARCHAR, GETDATE(), 111) AS US_mit_Jahrhundert,
    CONVERT(VARCHAR, GETDATE(), 104) AS Deutschland_ohne_Jahrhundert,
    CONVERT(VARCHAR, GETDATE(), 112) AS Deutschland_mit_Jahrhundert;


-- Aufgabe 7.5: Verschiedene Casts
SELECT 
    CAST(GETDATE() AS DATE) AS Zeitstempel_zu_Date,
    CAST('Vorname Nachname' AS VARCHAR(5)) AS Name_zu_Varchar,
    CAST('2000-01-01' AS DATETIME) AS Geburtsdatum_zu_Datetime,
    CAST(1.75 AS INT) AS Koerpergroesse_zu_Int;
