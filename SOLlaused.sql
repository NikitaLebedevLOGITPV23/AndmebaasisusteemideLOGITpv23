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
