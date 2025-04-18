--1
DECLARE @ile Int = (SELECT COUNT(1) FROM EMP);
PRINT 'W tabeli EMP jest ' + CONVERT(Varchar(20), @ile) + ' osob.';
GO;
--2
DECLARE @ile Int = (SELECT COUNT(1) FROM EMP);
IF @ile < 16
	BEGIN
		INSERT INTO EMP
		VALUES (20, 'KOWALSKI','CLERK',NULL, '10.10.2010',2000,NULL,10);
		PRINT 'Wstawiono nowy rekord.';
	END;
ELSE
	PRINT 'Nie wsawiono nowego rekordu.';
GO
--3
CREATE PROCEDURE Kto_duzo_zarabia @prog_wyplaty Money = 2000
AS
	BEGIN
	SELECT * FROM EMP
	WHERE sal > @prog_wyplaty;
	END;

EXEC Kto_duzo_zarabia 3000;
GO
--4
CREATE PROCEDURE Wstaw_dzial @nr_dzialu int, @nazwa Varchar(20), @lokalizacja Varchar(20)
AS
	BEGIN
	IF NOT EXISTS (SELECT * FROM DEPT WHERE dname = @nazwa OR loc = @lokalizacja)
		BEGIN
			INSERT INTO DEPT
			VALUES (@nr_dzialu, @nazwa, @lokalizacja);
			PRINT 'Wstawiono nowy dzial.';
		END
	ELSE 
		PRINT 'Taki dzial juz istnieje. Nie wstawiono nowego dzialu.';
	END

EXEC Wstaw_dzial 50, 'HR', 'BERLIN';
GO
--5
CREATE PROCEDURE Dodaj_pracownika @nazwisko Varchar(20), @nr_dzialu Int, @stanowisko Varchar(20) = 'CLERK'
AS 
	BEGIN
	IF EXISTS (SELECT * FROM DEPT WHERE deptno = @nr_dzialu)
		BEGIN
		DECLARE @wyplata Money = (SELECT MIN(sal) FROM EMP WHERE deptno = @nr_dzialu);
		DECLARE @nr_pracownika int = (SELECT Max(empno) FROM EMP) + 1;
		INSERT INTO EMP
		VALUES (@nr_pracownika, @nazwisko, @stanowisko, NULL, GetDate(), @wyplata, NULL, @nr_dzialu);
		PRINT 'Pomyslnie wstawiono nowego pracownika o nazwisku '+@nazwisko+'.';
		END;
	ELSE
		PRINT 'Nie ma takiego dzialu. Nie wprowadzono pracownika.';
	END;

EXEC Dodaj_pracownika 'NOWAK', 20;
GO
