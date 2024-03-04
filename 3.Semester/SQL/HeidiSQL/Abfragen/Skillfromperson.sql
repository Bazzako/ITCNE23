SELECT p.*, s.*
FROM personen AS p
JOIN skillzt AS szt ON p.personenid = szt.person
JOIN skill AS s ON s.skillid = szt.personskill