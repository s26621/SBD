--1
DECLARE ile int;
BEGIN
SELECT Count(1) INTO ile FROM EMP;
dbms_output.PUT_LINE('W tabeli emp jest ' || ile || ' osob');
END;
--2
DECLARE ile int;
BEGIN
    SELECT Count(1) INTO ile FROM EMP;
    IF ile<16 THEN
        INSERT INTO EMP
        VALUES(20, 'KOWALSKI','CLERK',NULL, '10.10.2010',2000,NULL,10);
        dbms_output.PUT_LINE('Wstawiono nowego pracownika');
    ELSE
        dbms_output.PUT_LINE('Za malo pracownikow, nie wstawiono nowego');
    end if;
END;
--3
CREATE PROCEDURE Wstaw_dzial (nr_dzialu int, nazwa Varchar(20), lokalizacja Varchar(20))
AS
    ile int;
	BEGIN
        SELECT Count(*) INTO ile FROM DEPT WHERE dname = nazwa OR loc = lokalizacja;
        IF ile = 0 THEN
            INSERT INTO DEPT
            VALUES (nr_dzialu, nazwa, lokalizacja);
            dbms_output.PUT_LINE('Wstawiono nowy dzial.');
        ELSE
            dbms_output.PUT_LINE('Taki dzial juz istnieje. Nie wstawiono nowego dzialu.');
	    END IF;
	END;
--4
CREATE PROCEDURE Dodaj_pracownika (nazwisko Varchar(20), nr_dzialu Int)
AS
    ile int;
    wyplata int;
    nr_pracownika int;
    stanowisko Varchar(20) := 'CLERK';
	BEGIN
	    SELECT count(*) INTO ile FROM DEPT WHERE deptno = nr_dzialu;
        IF ile >0 THEN
            SELECT MIN(sal) INTO wyplata FROM EMP WHERE deptno = @nr_dzialu;
            SELECT Max(empno)+1 INTO nr_pracownika FROM EMP;
            INSERT INTO EMP
            VALUES (nr_pracownika, nazwisko, stanowisko, NULL, CURRENT_DATE, wyplata, NULL, nr_dzialu);
            dbms_output.PUT_LINE('Pomyslnie wstawiono nowego pracownika o nazwisku '|| nazwisko || '.');
        ELSE
            dbms_output.PUT_LINE('Nie ma takiego dzialu. Nie wprowadzono pracownika.');
        END IF;
	END;
--5
CREATE TABLE MAGAZYN (IdPozycji int PRIMARY KEY, Nazwa VARCHAR(20), Ilosc int);
    INSERT INTO MAGAZYN VALUES (1, 'Papryka', 20);
    INSERT INTO MAGAZYN VALUES (2, 'Pomidor', 15);
    INSERT INTO MAGAZYN VALUES (3, 'Ogorek', 32);
    INSERT INTO MAGAZYN VALUES (4, 'Rzodkiew', 162);
    INSERT INTO MAGAZYN VALUES (5, 'Marchew', 67);
    INSERT INTO MAGAZYN VALUES (6, 'Pietruszka',41);
    INSERT INTO MAGAZYN VALUES (7, 'Por', 32);
    INSERT INTO MAGAZYN VALUES (8, 'Brokul',12);
    INSERT INTO MAGAZYN VALUES (9, 'Kalafior', 36);
    INSERT INTO MAGAZYN VALUES (10, 'Salata',6);
    INSERT INTO MAGAZYN VALUES (11, 'Dynia', 10);
    INSERT INTO MAGAZYN VALUES (12, 'Ziemniak', 345);

DECLARE indeksMaks int; iloscMaks int;
BEGIN
    SELECT Max(Ilosc) INTO iloscMaks FROM MAGAZYN;
    SELECT IdPozycji INTO indeksMaks FROM MAGAZYN
    WHERE Ilosc = iloscMaks;
    IF (iloscMaks <= 5) THEN
        dbms_output.PUT_LINE('Liczba towaru, ktorego jest nawiecej, musi byc wieksza niz 5!');
    ELSE
        UPDATE MAGAZYN SET Ilosc = Ilosc-5 WHERE IdPozycji = indeksMaks;
    END IF;
END;