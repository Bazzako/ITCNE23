#In welchen Jahren kommt dein Vorname vor?
SELECT firstname, yearofbirth
FROM Personen
WHERE firstname = 'Dennis';

#In wie vielen Jahren kommt dein Vorname vor?
SELECT COUNT(*) AS Anzahl
FROM Personen
WHERE firstname = 'Dennis';

#In wie viel Prozent aller aufgezeichneten Jahre kommt dein Vorname vor?
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT YEAR(yearofbirth)) FROM Personen)) AS Prozent
FROM Personen
WHERE firstname = 'Dennis';

#In welchen Jahren kommt dein Vorname nicht vor?
SELECT yearofbirth AS year
FROM Personen
WHERE yearofbirth NOT IN (
    SELECT yearofbirth
    FROM Personen
    WHERE firstname = 'Dennis'
);
#In wie vielen Jahren kommt dein Vorname nicht vor?

#In welchem Jahr sind am meisten Namen vorhanden?
