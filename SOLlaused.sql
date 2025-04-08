--kommentaar
--SQL SERVER Managment Stuudio
--Conect TO:
--Server Name: (localdb)\mssqllocaldb
-- Authentification 2 tüüpi:
--1. Windows Auth - localdb admini õigused
--2. SQL Server Auth - kontrollida varem tehtud kasutajad


CREATE DATABASE lebedevLOGITpv23;
USE lebedevLOGITpv23;

--tabeli loomine
--identity(1,1) - ise täidab tabeli 1,2,3...
CREATE TABLE inimene(
inimeneID int Primary Key identity(1,1),
nimi varchar(50) unique,
synniaeg date,
telefon char(12),
pikkus decimal(5,2),
opilaskodu bit
);
SELECT * FROM inimene;

--tabeli kustutamine
DROP table inimene;

--andmete lisamine
--DDL - data definition language
--DML - data manipulation language

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu)
VALUES
('Peter Uus', '2021-12-30', '2568952', 90.5, 0),
('Kaarel Oja', '2021-12-30', '2568952', 90.5, 0),
('Kask Mati', '2012-2-12', '2568952', 160.2, 0),
('Peeter oja', '2013-12-30', '6844242', 172.5, 0)
;

SELECT * FROM inimene;
--kustuta id=2
DELETE FROM inimene
WHERE inimeneID=2;


--tabel elukoht
CREATE TABLE elukoht(
elukohtID int PRIMARY KEY identity(1,1),
elukoht varchar(50) UNIQUE,
maakond varchar(50)
);
SELECT * FROM elukoht;
--andmete lisamine tabeli elukoht
INSERT INTO elukoht(elukoht, maakond)
VALUES ('Tartu', 'Tartumaa'),
('Pärnu', 'Pärnumaa');

--tabeli muutmine uue veergu lisamine
ALTER TABLE inimene ADD elukohtID int;
SELECT * FROM inimene;
--foreign key lisamine
ALTER TABLE inimene 
ADD CONSTRAINT fk_elukord
FOREIGN KEY (elukohtID) 
references elukoht(elukohtID);

SELECT * FROM inimene;
SELECT * FROM elukoht;

-----------------------------------------------------------------------------------------
INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID)
VALUES
('Peter Suus', '2021-12-30', '2568952', 90.5, 0, 3);

SELECT inimene.nimi, inimene.synniaeg, elukoht.elukoht
FROM inimene join elukoht
ON inimene.elukohtID=elukoht.elukohtID;

SELECT i.nimi, i.synniaeg, e.elukoht
FROM inimene i join elukoht e
ON i.elukohtID=e.elukohtID;


--tabel auto loomine
CREATE TABLE auto(
autoID int Primary Key identity(1,1),
autoNR varchar(50) unique,
mudell char(50),
mark varchar(20),
v_aasta char(15)
);

SELECT * FROM auto;

INSERT INTO auto(autoNR, mudell, mark, v_aasta)
VALUES 
('1', '123', 'Nissan', '2013'),
('2', '555', 'BMW', '2020'), 
('3', '89', 'AUDI', '2009')
;

--autoID lisamine
ALTER TABLE inimene ADD autoID int;
SELECT * FROM inimene;
--Foreign key
ALTER TABLE inimene 
ADD CONSTRAINT fk_auto
FOREIGN KEY (autoID) 
references auto(autoID);

SELECT * FROM inimene;
SELECT * FROM auto;

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, autoID)
VALUES
('Peter Su', '2020-03-14', '2568952', 90.5, 0, 1);
