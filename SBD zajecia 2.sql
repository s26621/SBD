-- 1
SELECT * FROM Gosc
ORDER BY Nazwisko;
--2
SELECT DISTINCT Procent_rabatu FROM Gosc
ORDER BY Procent_rabatu DESC;
--3
SELECT * FROM Rezerwacja
INNER JOIN Gosc ON Rezerwacja.IdGosc=Gosc.IdGosc
WHERE Imie = 'Ferdynand' AND Nazwisko = 'Kiepski';
--4
SELECT Imie, Nazwisko, NrPokoju FROM Rezerwacja
INNER JOIN Gosc ON Rezerwacja.IdGosc=Gosc.IdGosc
WHERE YEAR(DataOd)=2008 AND (Imie LIKE 'K%' OR Imie LIKE 'L%');
--5
SELECT NrPokoju FROM Rezerwacja
INNER JOIN Gosc ON Rezerwacja.IdGosc=Gosc.IdGosc
WHERE Imie='Andrzej' AND Nazwisko='Nowak';
--6
SELECT Nazwa, COUNT(NrPokoju) FROM Kategoria
INNER JOIN Pokoj ON Kategoria.IdKategoria=Pokoj.IdKategoria
GROUP BY Nazwa;
--7
SELECT Imie, Nazwisko, DataOd, DataDo, NrPokoju, Zaplacona FROM Rezerwacja
RIGHT JOIN Gosc ON Rezerwacja.IdGosc=Gosc.IdGosc;
--8
SELECT * FROM Gosc
INNER JOIN Rezerwacja ON Rezerwacja.IdGosc=Gosc.IdGosc
WHERE NrPokoju=101 AND Zaplacona=1;
--9
SELECT Imie + ' ' + Nazwisko AS 'Imie i Nazwisko', DataOd, DataDo, Rezerwacja.NrPokoju, Nazwa FROM Gosc
INNER JOIN Rezerwacja ON Rezerwacja.IdGosc=Gosc.IdGosc
INNER JOIN Pokoj On Rezerwacja.NrPokoju=Pokoj.NrPokoju
INNER JOIN Kategoria ON Pokoj.IdKategoria=Kategoria.IdKategoria;
--10
SELECT * FROM Gosc
INNER JOIN Rezerwacja ON Rezerwacja.IdGosc=Gosc.IdGosc
WHERE (NrPokoju=101 AND Nazwisko LIKE 'K%') OR (NrPokoju=201 AND Nazwisko LIKE 'P%');
--11
SELECT * FROM Gosc
RIGHT JOIN Rezerwacja ON Rezerwacja.IdGosc=Gosc.IdGosc
WHERE Procent_rabatu IS NULL;
--12
SELECT Imie, Nazwisko, DataOd, DataDo FROM Rezerwacja
INNER JOIN Gosc ON Rezerwacja.IdGosc=Gosc.IdGosc
WHERE NrPokoju>=101 AND NrPokoju<=104;
--13
SELECT Nazwa FROM Kategoria
WHERE Cena >= 10 AND Cena <=100;
--14
SELECT Imie + ' ' + Nazwisko AS 'Dluznik' FROM Gosc
INNER JOIN Rezerwacja ON Rezerwacja.IdGosc=Gosc.IdGosc
WHERE Zaplacona=0
ORDER BY Nazwisko,Imie;
--15
SELECT COUNT(IdRezerwacja) FROM Rezerwacja
WHERE Zaplacona=1;
--16
SELECT Count(IdRezerwacja) FROM Rezerwacja
WHERE YEAR(DataOd)=2009;
--17
INSERT INTO Gosc (Imie, Nazwisko)
VALUES ('Jan', 'Kowalski');
--18
UPDATE Rezerwacja
SET DataDo ='2009-03-21'
WHERE IdRezerwacja=10;
--19
DELETE FROM Rezerwacja WHERE IdRezerwacja = 10;
