OKNO PIERWSZE



--1
CREATE TABLE test (Id INT IDENTITY, Zawartosc INT, Zawartosc2 INT)
GO

DECLARE @a INT
SET @a = 1
WHILE @a  100000 BEGIN
	INSERT INTO test (Zawartosc, Zawartosc2) 
VALUES (CONVERT(INT,RAND()  100000), CONVERT(INT,RAND()  100000))
	SET @a = @a + 1
END
GO
--2
SELECT  FROM test WHERE Zawartosc = 12345; -- koszt to 0,314762
GO
--3
CREATE NONCLUSTERED INDEX ind_zad3 ON test (Zawartosc);
GO
--4
DROP INDEX ind_zad3 ON test;
SELECT Zawartosc, Zawartosc2 FROM test WHERE Zawartosc = 12345; -- koszt to 0,314762
GO
CREATE INDEX ind_zad4 ON test (Zawartosc,zawartosc2);
SELECT Zawartosc, Zawartosc2 FROM test WHERE Zawartosc = 12345; -- koszt to 0,0032838
GO
--5
DROP INDEX ind_zad4 ON test;
SELECT  FROM test WHERE Zawartosc BETWEEN 10000 and 20000; -- koszt to 0,314762
GO
CREATE NONCLUSTERED INDEX ind_zad5 ON test (Zawartosc);
SELECT  FROM test WHERE Zawartosc BETWEEN 10000 and 20000; -- koszt to 0,314762, taki sam
GO
DROP INDEX ind_zad5 ON test;
CREATE CLUSTERED INDEX ind_zad5 ON test (Zawartosc);
SELECT  FROM test WHERE Zawartosc BETWEEN 10000 and 20000; -- koszt to 0,0356899
GO
--6
DROP INDEX ind_zad5 ON test;
SELECT  FROM test ORDER BY Zawartosc; -- koszt to 7,96764
GO
CREATE NONCLUSTERED INDEX ind_zad6 ON test (Zawartosc);
SELECT  FROM test ORDER BY Zawartosc; -- koszt to 7,96764, taki sam
GO
DROP INDEX ind_zad6 ON test;
CREATE CLUSTERED INDEX ind_zad6 ON test (Zawartosc);
SELECT  FROM test ORDER BY Zawartosc; -- koszt to 0,33254
GO
--7
SET IMPLICIT_TRANSACTIONS ON -- wyłączenie automatycznego zatwierdzania
CREATE TABLE Osoba (Id INT, Nazwisko VARCHAR(50))
COMMIT
INSERT INTO Osoba VALUES (1, 'Lenkiewicz')
INSERT INTO Osoba VALUES (2, 'Kowalski')
SELECT  FROM Osoba   -- powinniśmy zobaczyć dwie osoby 
ROLLBACK
SELECT  FROM Osoba   -- powinniśmy zobaczyć pustą tabelę
INSERT INTO Osoba VALUES (3, 'Iksiński')
COMMIT
SELECT  FROM Osoba   -- powinniśmy zobaczyć jedną osobę
GO
--8
SET IMPLICIT_TRANSACTIONS OFF;
DROP TABLE Osoba;
CREATE TABLE Osoba (Id INT, Nazwisko VARCHAR(50))
COMMIT
INSERT INTO Osoba VALUES (1, 'Lenkiewicz')
INSERT INTO Osoba VALUES (2, 'Kowalski')
SELECT  FROM Osoba   -- powinniśmy zobaczyć dwie osoby 
ROLLBACK
SELECT  FROM Osoba   -- powinniśmy zobaczyć pustą tabelę
INSERT INTO Osoba VALUES (3, 'Iksiński')
COMMIT
SELECT  FROM Osoba   -- powinniśmy zobaczyć jedną osobę
GO
SET IMPLICIT_TRANSACTIONS ON
GO
--9 okno 1
SET IMPLICIT_TRANSACTIONS ON
UPDATE Osoba SET Nazwisko = 'Igrekowski' WHERE Id = 3
GO
-- odpalamy w oknie 2
COMMIT;
--10 okno 1
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
GO
--tu odpalamy zad 9
COMMIT
GO
--11 okno 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
SET IMPLICIT_TRANSACTIONS ON
COMMIT
GO
SELECT  FROM Test -- również w drugim oknie
INSERT INTO Test (Zawartosc, Zawartosc2) VALUES (12345, 56789);
GO
-- czekamy na commit w drugim oknie


OKNO DRUGIE



--9 okno 2
SET IMPLICIT_TRANSACTIONS ON
SELECT * FROM Osoba
GO;
-- tutaj akcja w oknie 1
SELECT * FROM Osoba;
-- czekamy na commit
--11
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
SET IMPLICIT_TRANSACTIONS ON
COMMIT
GO
SELECT * FROM Test -- również w pierwszym oknie
GO
-- pierwsze okno czeka na commit
COMMIT
GO