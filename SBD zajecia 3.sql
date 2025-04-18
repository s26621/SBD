--1
SELECT Imie +' ' + Nazwisko AS "Imie i Nazwisko", Count(Rezerwacja.IdRezerwacja) AS "Liczba Rezerwacji" FROM Gosc
INNER JOIN Rezerwacja ON Gosc.IdGosc=Rezerwacja.IdGosc
GROUP BY Imie, Nazwisko
HAVING Count(Rezerwacja.IdRezerwacja)>1;
--2
SELECT * FROM Pokoj
WHERE Liczba_miejsc >= ALL (SELECT Liczba_miejsc FROM Pokoj);
--3
SELECT Pokoj.NrPokoju, Max(DataDo) AS "Ostatnia Rezerwacja" FROM Pokoj
INNER JOIN Rezerwacja ON Pokoj.NrPokoju = Rezerwacja.NrPokoju
GROUP BY Pokoj.NrPokoju;
--4
SELECT Pokoj.NrPokoju, Count(IdRezerwacja) AS "Liczba Rezerwacji" FROM Pokoj
INNER JOIN Rezerwacja ON Pokoj.NrPokoju = Rezerwacja.NrPokoju
INNER JOIN Kategoria ON Pokoj.IdKategoria=Kategoria.IdKategoria
WHERE NOT (Nazwa = 'Luksusowy')
GROUP BY Pokoj.NrPokoju;
--5
SELECT Imie, Nazwisko, NrPokoju FROM Rezerwacja
INNER JOIN Gosc ON Gosc.IdGosc=Rezerwacja.IdGosc
WHERE DataDo >= ALL (SELECT DataDo FROM Rezerwacja);
--6
SELECT * FROM Pokoj
WHERE Pokoj.NrPokoju NOT IN (SELECT NrPokoju FROM Rezerwacja);
--7
SELECT * FROM Gosc "g"
WHERE IdGosc NOT IN (
SELECT IdGosc FROM Rezerwacja "r"
INNER JOIN Pokoj ON Pokoj.NrPokoju = r.NrPokoju
INNER JOIN Kategoria ON Pokoj.IdKategoria=Kategoria.IdKategoria
WHERE g.IdGosc=r.IdGosc AND Nazwa = 'Luksusowy');