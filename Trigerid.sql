--Trigerid
--SQL Triger (trigger)- protsess,
--mille abil tema sisse
--kirjutatud tegevused automaatselt käivitatakse

CREATE DATABASE trigerLOGIT;
USE trigerLOGIT;

CREATE TABLE toode(
toodeID int primary key identity(1,1),
toodeNimetus varchar(25),
toodeHind decimal(5,2))

--tabel logi, mis täidab triger
CREATE TABLE logi(
id int primary key identity(1,1),
tegevus varchar(25),
kuupaev datetime,
andmed TEXT)

--INSERT triger, mis jälgib andmete lisamine toode-tabelisse 
CREATE TRIGGER toodeLisamine
ON toode 
FOR INSERT
AS
INSERT INTO logi(tegevus, kuupaev, andmed)
SELECT 'toode on lisatud',
GETDATE(),
inserted.toodeNimetus
FROM inserted;

DROP TRIGGER toodeLisamine;

--Kontroll
INSERT INTO toode(toodeNimetus, toodeHind)
VALUES ('Sprite1', 2.20);

SELECT * FROM toode;
SELECT * FROM logi;

--DELETE TRIGER, MIS jälgib toode kustutamine tabelis
CREATE TRIGGER toodeKustutamine
ON toode
FOR DELETE
AS
INSERT INTO logi(tegevus, kuupaev, andmed)
SELECT 'toode on kustutatud',
GETDATE(),
CONCAT(deleted.toodeNimetus, ' | tegi kasutaja', SYSTEM_USER)
FROM deleted;

--Kontroll
DELETE FROM toode
WHERE toodeID=5;

SELECT * FROM toode;
SELECT * FROM logi;

--Update Triger, mis jälgib toode uuendamine tabelis
CREATE TRIGGER toodeUuendamine
ON toode 
FOR UPDATE
AS
INSERT INTO logi(tegevus, kuupaev, andmed)
SELECT 'toode on uuendatid',
GETDATE(),
CONCAT('Vanad andmed - ', deleted.toodeNimetus,',', deleted.toodeHind,
'\nUued andmed - ', inserted.toodeNimetus,',', inserted.toodeHind,
' | tegi kasutaja', SYSTEM_USER)
FROM deleted INNER JOIN inserted 
ON deleted.toodeID=inserted.toodeID;

--Kontroll
Update toode SET toodeHind=4.00
WHERE toodeNimetus='Fanta'

SELECT * FROM toode;
SELECT * FROM logi;
