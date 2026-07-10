DROP DATABASE IF EXISTS commerce;

CREATE DATABASE commerce;

USE commerce;

CREATE TABLE Lager (
	Lagerplatz_ID INT PRIMARY KEY AUTO_INCREMENT,
    Anzahl INT,
    Artikel_ID INT
);

CREATE TABLE Artikel (
	Artikel_ID INT PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(40) DEFAULT 'fehlt',
	Verkaufspreis FLOAT,
    Mitarbeiter_ID INT
);

CREATE TABLE Lieferant (
	Lieferant_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Straße VARCHAR(50),
    Hnr VARCHAR(5),
    Orts_ID INT
);

-- Matching-Tabelle
CREATE TABLE Artikel_Lieferant (
	Artikel_ID INT,
    Lieferant_ID INT,
    Einkaufspreis FLOAT,
    PRIMARY KEY (Artikel_ID, Lieferant_ID),
    FOREIGN KEY (Artikel_ID) REFERENCES Artikel(Artikel_ID),
    FOREIGN KEY (Lieferant_ID) REFERENCES Lieferant(Lieferant_ID)
);

CREATE TABLE Mitarbeiter (
	Mitarbeiter_ID INT PRIMARY KEY AUTO_INCREMENT,
    Nachname VARCHAR(40),
    Vorname VARCHAR(40),
    Geburtsdatum DATE,
    Telefonnummer VARCHAR(40)
);

CREATE TABLE Ort (
	Orts_ID INT PRIMARY KEY AUTO_INCREMENT,
    PLZ INT,
    Name VARCHAR(40)
);

ALTER TABLE Lager
ADD FOREIGN KEY (Artikel_ID) REFERENCES Artikel(Artikel_ID);

ALTER TABLE Artikel
ADD FOREIGN KEY (Mitarbeiter_ID) REFERENCES Mitarbeiter(Mitarbeiter_ID);

ALTER TABLE Lieferant
ADD FOREIGN KEY (Orts_ID) REFERENCES Ort(Orts_ID);

ALTER TABLE Mitarbeiter
ADD Status VARCHAR(40) DEFAULT 'aktiv';

INSERT INTO Ort (Orts_ID, PLZ, Name) VALUES
(1, '70173', 'Stuttgart'),
(2, '72070', 'Tuebingen'),
(3, '76133', 'Karlsruhe'),
(4, '80331', 'Muenchen'),
(5, '01067', 'Dresden'),
(6, '20095', 'Hamburg'),
(7, '28195', 'Bremen'),
(8, '04109', 'Leipzig'),
(9, '70180', 'Stuttgart-Sued'),
(10, '71332', 'Waiblingen');

INSERT INTO Mitarbeiter (Mitarbeiter_ID, Nachname, Vorname, Geburtsdatum, Telefonnummer) VALUES
(1007, 'Burstedt', 'Lars', '1984-02-14', '0711-5551007'),
(1008, 'Heisterkamp', 'Mara', '1990-06-23', '0711-5551008'),
(1009, 'Stromberg', 'Erik', '1978-11-05', '0711-5551009'),
(1010, 'Klein', 'Anna', '1992-01-18', '0711-5551010'),
(1011, 'Wagner', 'Tom', '1988-09-30', '0711-5551011'),
(1012, 'Scholz', 'Nina', '1995-04-12', '0711-5551012'),
(1013, 'Fischer', 'Paul', '1981-12-02', '0711-5551013'),
(1014, 'Bauer', 'Lea', '1993-07-19', '0711-5551014'),
(1015, 'Becker', 'Noah', '1986-03-27', '0711-5551015'),
(1016, 'Hoffmann', 'Emma', '1991-10-08', '0711-5551016');

INSERT INTO Lieferant (Lieferant_ID, Name, Straße, Hnr, Orts_ID) VALUES
(201, 'Nordhandel GmbH', 'Industriestrasse', '12', 1),
(202, 'SuedLogistik AG', 'Bahnhofstrasse', '8', 2),
(203, 'WestImport GmbH', 'Marktweg', '4', 3),
(204, 'Ostwaren KG', 'Hauptstrasse', '19', 4),
(205, 'Alpha Supply', 'Gartenweg', '7', 5),
(206, 'Beta Trade', 'Ringstrasse', '21', 6),
(207, 'Gamma Handel', 'Muehlenweg', '3', 7),
(208, 'Delta Distribution', 'Kirchweg', '14', 8),
(209, 'Eco Waren', 'Feldstrasse', '6', 9),
(210, 'Prime Sources', 'Wiesenweg', '11', 10);

INSERT INTO Artikel (Artikel_ID, Name, Verkaufspreis, Mitarbeiter_ID) VALUES
(4242, 'Kabelbinder Set', 4.99, 1007),
(5001, 'USB-C Adapter', 12.90, 1007),
(5002, 'Notebook 13 Zoll', 799.00, 1008),
(5003, 'Schraubendreher', 8.49, 1008),
(5004, 'WLAN Router', 59.90, 1009),
(5005, 'Monitor 24 Zoll', 149.00, 1009),
(5006, 'Buerostuhl', 129.99, 1010),
(5007, 'Tastatur', 24.90, 1010),
(5008, 'Mauspad', 6.50, 1011),
(5009, 'Akku-Pack', 19.95, 1011),
(5010, 'Steckdosenleiste', 14.90, 1012),
(5011, 'LED-Lampe', 9.99, 1012),
(5012, 'Regalbrett', 17.80, 1013),
(5013, 'Ordner', 2.49, 1013),
(5014, 'Heftklammern', 1.99, 1014),
(5015, 'Marker Set', 5.75, 1014),
(5016, 'Papier A4', 4.20, 1015),
(5017, 'Tablet 10 Zoll', 249.00, 1015),
(5018, 'Etikettenrolle', 3.95, 1016),
(5019, 'Netzwerkkabel', 7.49, 1016);

INSERT INTO Artikel_Lieferant (Artikel_ID, Lieferant_ID, Einkaufspreis) VALUES
(4242, 201, 2.10),
(4242, 205, 2.05),
(5001, 201, 6.80),
(5001, 206, 6.70),
(5002, 202, 610.00),
(5003, 203, 4.20),
(5004, 204, 33.50),
(5005, 204, 92.00),
(5006, 205, 78.00),
(5007, 206, 11.40),
(5008, 207, 2.90),
(5009, 208, 9.80),
(5010, 209, 8.10),
(5011, 210, 5.60),
(5012, 203, 11.90),
(5013, 207, 1.20),
(5014, 208, 0.90),
(5015, 209, 2.30),
(5016, 210, 2.10),
(5017, 202, 185.00),
(5018, 205, 1.70),
(5019, 206, 3.40);

INSERT INTO Lager (Lagerplatz_ID, Anzahl, Artikel_ID) VALUES
(1, 8, 4242),
(2, 12, 5001),
(3, 60, 5002),
(4, 4, 5003),
(5, 18, 5004),
(6, 9, 5005),
(7, 75, 5006),
(8, 22, 5007),
(9, 5, 5008),
(10, 14, 5009),
(11, 33, 5010),
(12, 7, 5011),
(13, 48, 5012),
(14, 3, 5013),
(15, 27, 5014),
(16, 11, 5015),
(17, 52, 5016),
(18, 2, 5017),
(19, 19, 5018),
(20, 41, 5019);

