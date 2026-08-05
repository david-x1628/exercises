USE commerce

DELIMITER //

CREATE PROCEDURE check_anzahl (
	IN p_Artikelname VARCHAR(40),
    OUT p_Bestand	INT	-- kann bei Aufruf in Session-Variable gespeichert werden: check_anzahl(name, @bestand) und dann mit SELECT @bestand abgerufen werden
)
BEGIN 
	SELECT Anzahl
    INTO p_Bestand
    FROM Lager
    WHERE Artikel_ID = (
		SELECT Artikel_ID 
        FROM Artikel
        WHERE Name = p_Artikelname);
END //


CREATE PROCEDURE verkauft (
	IN Artikelname VARCHAR(40),
    IN Anzahl_gekauft INT
)
BEGIN
	UPDATE Lager
    SET Anzahl = Anzahl - Anzahl_gekauft 
    WHERE Artikel_ID = (SELECT Artikel_ID FROM Artikel WHERE Name = Artikelname);
END //


CREATE PROCEDURE neuer_mitarbeiter (
	IN p_Vorname VARCHAR(40),
    IN p_Nachname VARCHAR(40),
    IN p_Geburtsdatum DATE,
    IN p_Telefonnummer VARCHAR(40),
    IN p_Artikelname VARCHAR(40)
)
BEGIN
	INSERT INTO Mitarbeiter (Nachname, Vorname, Geburtsdatum, Telefonnummer)
    VALUES(p_Nachname, p_Vorname, p_Geburtsdatum, p_Telefonnummer);
    
    UPDATE Artikel
    SET Mitarbeiter_ID = (
		SELECT Mitarbeiter_ID
        FROM Mitarbeiter
        WHERE Vorname = p_Vorname 
		AND Nachname = p_Nachname
        )
	WHERE Artikel_ID = (
		SELECT Artikel_ID
		FROM Artikel 
		WHERE Name = p_Artikelname
        );
END //


CREATE PROCEDURE mitarbeiter_ausgeschieden (
	IN p_Vorname VARCHAR(40),
    IN p_Nachname VARCHAR(40),
    IN p_Grund VARCHAR(40),
    IN p_übernehmender_Mitarbeiter VARCHAR(40)
)
BEGIN
    UPDATE Mitarbeiter 
    SET Status = p_Grund
    WHERE Vorname = p_Vorname 
    AND Nachname = p_Nachname;
    
    UPDATE Artikel
    SET Mitarbeiter_ID = (
		SELECT Mitarbeiter_ID
        FROM Mitarbeiter
        WHERE Vorname LIKE p_übernehmender_Mitarbeiter
        AND Nachname LIKE p_übernehmender_Mitarbeiter
        )
	WHERE Mitarbeiter_ID = (
		SELECT Mitarbeiter_ID
        FROM Mitarbeiter
        WHERE Vorname = p_Vorname 
        AND Nachname = p_Nachname
        );
END //

DELIMITER ;
    
    