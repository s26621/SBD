deklarujemy kursor dla selecta, deklarujemy tyle zmiennych ile jest kolumn w select'cie, otwieramy, przechodzimy na pierwszy wiersz aby wejść do pętli i zainicjalizować, w pętli pod koniec pobieramy kolejny wiersz dla następnego obrotu

fetch_status = udano się pobrać poprzedni rekord, jak się zmieni to znaczy że kończymy

jeżeli jest możliwe zrobienie zadania zarówno z kursorem jak i bez, to wyżej punktowane będzie to bez kursora

w 4 i 5 wziąć pod uwagę że może być więcej niż 1 maks i tylko jeden zmienić

--1
DECLARE Test1 CURSOR FOR SELECT ename, empno, sal
						 FROM emp
						 WHERE sal BETWEEN 1000 AND 1500;
DECLARE @ename Varchar(15), @empno Int, @sal Money;
OPEN Test1
FETCH NEXT FROM Test1 INTO @ename, @empno, @sal;
WHILE @@Fetch_status = 0
BEGIN
	IF @sal > 1500
	BEGIN
		SET @sal = 0.9*@sal;
		UPDATE emp SET sal = @sal WHERE empno = @empno; -- można też WHERE CURRENT OF nazwaKursora
		PRINT @ename+ ' zarabia po obniżce ' + Cast(@sal As Varchar);
	END;
	ELSE IF @sal < 1000
	BEGIN
		SET @sal = 1.1*@sal;
		UPDATE emp SET sal = @sal WHERE empno = @empno;
		PRINT @ename + ' zarabia po podwyżce ' + Cast(@sal As Varchar);
	END;
	FETCH NEXT FROM Test1 INTO @ename, @empno, @sal;
END;
CLOSE Test1;
DEALLOCATE Test1;
GO;
--2
CREATE PROCEDURE zad2 @minSal Money = 1000, @maxSal Money = 1500
AS
	BEGIN
		DECLARE Test CURSOR FOR SELECT ename, empno, sal
								FROM emp;
		DECLARE @ename Varchar(15), @empno Int, @sal Money;
		OPEN Test
		FETCH NEXT FROM Test INTO @ename, @empno, @sal;
		WHILE @@Fetch_status = 0
		BEGIN
			IF @sal > @maxSal
			BEGIN
				SET @sal = 0.9*@sal;
				UPDATE emp SET sal = @sal WHERE empno = @empno;
				PRINT @ename+ ' zarabia po obniżce ' + Cast(@sal As Varchar);
			END;
			ELSE IF @sal < @minSal
			BEGIN
				SET @sal = 1.1*@sal;
				UPDATE emp SET sal = @sal WHERE empno = @empno;
				PRINT @ename + ' zarabia po podwyżce ' + Cast(@sal As Varchar);
			END;
			FETCH NEXT FROM Test INTO @ename, @empno, @sal;
		END;
		CLOSE Test;
		DEALLOCATE Test;
	END;
EXEC zad2;
GO;
--3
CREATE PROCEDURE zad3 @numer int
AS
	BEGIN
		UPDATE EMP SET COMM = 0.05*sal 
		WHERE deptno = @numer AND sal > (SELECT AVG(sal) FROM EMP 
										 WHERE deptno = @numer);
	END
EXEC zad3;
GO;
--4
CREATE TABLE MAGAZYN (IdPozycji int PRIMARY KEY, Nazwa VARCHAR(20), Ilosc int);
INSERT INTO MAGAZYN
VALUES (1, 'Papryka', 20),
	   (2, 'Pomidor', 15),
	   (3, 'Ogorek', 32),
	   (4, 'Rzodkiew', 162),
	   (5, 'Marchew', 67),
	   (6, 'Pietruszka',41),
	   (7, 'Por', 32),
	   (8, 'Brokul',12),
	   (9, 'Kalafior', 36),
	   (10, 'Salata',6),
	   (11, 'Dynia', 10),
	   (12, 'Ziemniak', 345);

DECLARE @indeksMaks int, @iloscMaks int = -1;
SELECT @iloscMaks = Ilosc, @indeksMaks = IdPozycji FROM MAGAZYN
WHERE Ilosc = (SELECT Max(ilosc) FROM MAGAZYN);
IF (@iloscMaks <= 5) 
	PRINT 'Liczba towaru ktorego jest nawiecej musi byc wieksza niz 5!';
ELSE
	UPDATE MAGAZYN SET Ilosc = Ilosc-5 WHERE IdPozycji = @indeksMaks;
GO;
--5
CREATE PROCEDURE zad5 @ileZmniejszamy int = 5
AS
	BEGIN
	/*
	CREATE TABLE MAGAZYN (IdPozycji int PRIMARY KEY, Nazwa VARCHAR(20), Ilosc int);
	INSERT INTO MAGAZYN
	VALUES (1, 'Papryka', 20),
	   (2, 'Pomidor', 15),
	   (3, 'Ogorek', 32),
	   (4, 'Rzodkiew', 162),
	   (5, 'Marchew', 67),
	   (6, 'Pietruszka',41),
	   (7, 'Por', 32),
	   (8, 'Brokul',12),
	   (9, 'Kalafior', 36),
	   (10, 'Salata',5),
	   (11, 'Dynia', 10),
	   (12, 'Ziemniak', 345);
	   */
	   DECLARE @indeksMaks int, @iloscMaks int = -1;
       SELECT @iloscMaks = Ilosc, @indeksMaks = IdPozycji FROM MAGAZYN
       WHERE Ilosc = (SELECT Max(ilosc) FROM MAGAZYN);
       IF (@iloscMaks <= @ileZmniejszamy) 
			PRINT 'Liczba towaru ktorego jest nawiecej musi byc wieksza niz '+ CONVERT(Varchar(20), @ileZmniejszamy);
	   ELSE
			UPDATE MAGAZYN SET Ilosc = Ilosc - @ileZmniejszamy WHERE IdPozycji = @indeksMaks;
	   END
EXEC zad5 4;
GO;