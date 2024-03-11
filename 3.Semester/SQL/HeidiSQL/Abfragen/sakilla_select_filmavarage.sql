SELECT AVG(LENGTH) FROM film;

#Zeigt alle Filme an, welche kürzer oder länger als der Durchschnitt dauern
SELECT * FROM film f WHERE f.length > (SELECT AVG(LENGTH) FROM film);

#Zeigt die Maximale Replacementkosten an
SELECT MAX(replacement_cost) FROM film;

#Zeigt alle Filme an, welche die höchsten Replacementkosten haben
SELECT * FROM film f WHERE f.replacement_cost = (SELECT MAX(replacement_cost) FROM film);

#Zeigt das jahr mit den meisten Releases an
SELECT MAX(release_year) FROM film;

#Zeig alle Filme an, welche im Jahr released worden sind, in welchem am Meisten filme released wurden
SELECT * FROM film f WHERE f.release_year = (SELECT MAX(release_year) FROM film);

