USE commerce;

-- Test: check_anzahl()
SELECT * FROM Lager l
JOIN Artikel a
ON l.Artikel_ID = a.Artikel_ID;

CALL check_anzahl('Kabelbinder Set', @var);

SELECT @var;


-- Test: verkauft()
SELECT * FROM Lager l
JOIN Artikel a
ON l.Artikel_ID = a.Artikel_ID;

CALL verkauft('Kabelbinder Set', 4);

SELECT * FROM Lager l
JOIN Artikel a
ON l.Artikel_ID = a.Artikel_ID;

-- Test: neuer_mitarbeiter()
SELECT * FROM Mitarbeiter m
JOIN (SELECT Name, Verkaufspreis, Mitarbeiter_ID FROM Artikel) AS a
ON m.Mitarbeiter_ID = a.Mitarbeiter_ID;

CALL neuer_mitarbeiter('David', 'Rüping', '2006-02-28', 1234, 'WLAN ROUTER');

SELECT * FROM Mitarbeiter m
JOIN (SELECT Name, Verkaufspreis, Mitarbeiter_ID FROM Artikel) AS a
ON m.Mitarbeiter_ID = a.Mitarbeiter_ID
WHERE a.Name LIKE '%Router';


-- Test: mitarbeiter_ausgeschieden()
CALL mitarbeiter_ausgeschieden('David', 'Rüping', 'gestorben', 'Noah Becker');

SELECT *
FROM Mitarbeiter
WHERE Status = 'gestorben';