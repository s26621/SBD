
--1
DECLARE
    CURSOR zad1 IS SELECT ename, sal, empno FROM emp WHERE sal<1000 OR sal > 1500;
    wiersz zad1%ROWTYPE;
BEGIN
    OPEN zad1;
    LOOP
        FETCH zad1 INTO wiersz;
        EXIT WHEN zad1%NOTFOUND;
        IF wiersz.sal < 1000 THEN
            UPDATE emp SET sal = sal*1.1 WHERE empno = wiersz.empno;
            DBMS_OUTPUT.PUT_LINE(wiersz.ename || ' dostal podwyzke');
        ELSIF wiersz.sal > 1500 THEN
            UPDATE emp SET SAL = SAL*0.9 WHERE empno = wiersz.empno;
            DBMS_OUTPUT.PUT_LINE(wiersz.ename || ' dostal obnizke');
        END IF;
    END LOOP;
    CLOSE zad1;
END;
--2
CREATE OR REPLACE PROCEDURE zad2 (minsal int, maxsal int) AS
    CURSOR kurs IS SELECT * FROM emp WHERE sal<minsal OR sal > maxsal FOR UPDATE;
    wiersz emp%ROWTYPE;
BEGIN
    OPEN kurs;
    LOOP
        FETCH kurs INTO wiersz;
        EXIT WHEN kurs%NOTFOUND;
        IF wiersz.sal < minsal THEN
            UPDATE emp SET sal = sal*1.1 WHERE CURRENT OF kurs;
            DBMS_OUTPUT.PUT_LINE(wiersz.ename || ' dostal podwyzke');
        ELSIF wiersz.sal > maxsal THEN
            UPDATE emp SET sal = sal*0.9 WHERE CURRENT OF kurs;
            DBMS_OUTPUT.PUT_LINE(wiersz.ename || ' dostal obnizke');
        END IF;
    END LOOP;
END;

DROP PROCEDURE zad2;
--3
CREATE OR REPLACE PROCEDURE zad3 (numer int)
AS
	BEGIN
		UPDATE EMP SET COMM = 0.05*sal
		WHERE deptno = @numer AND sal > (SELECT AVG(sal) FROM EMP
										 WHERE deptno = @numer);
	END;

DROP PROCEDURE zad3;
--4
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
    SELECT Min(IdPozycji) INTO indeksMaks FROM MAGAZYN --musi być min bo w PL/SQL może dać tylko jedną zmienną
    WHERE Ilosc = iloscMaks;
    IF (iloscMaks <= 5) THEN
        dbms_output.PUT_LINE('Liczba towaru, ktorego jest nawiecej, musi byc wieksza niz 5!');
    ELSE
        UPDATE MAGAZYN SET Ilosc = Ilosc-5 WHERE IdPozycji = indeksMaks;
    END IF;
END;

--5
CREATE OR REPLACE PROCEDURE zad5 (ile int)
AS
    indeksMaks int; iloscMaks int;
BEGIN
    SELECT Max(Ilosc) INTO iloscMaks FROM MAGAZYN;
    SELECT Min(IdPozycji) INTO indeksMaks FROM MAGAZYN
    WHERE Ilosc = iloscMaks;
    IF (iloscMaks <= ile) THEN
        dbms_output.PUT_LINE('Liczba towaru, ktorego jest nawiecej, musi byc wieksza niz 5!');
    ELSE
        UPDATE MAGAZYN SET Ilosc = Ilosc-5 WHERE IdPozycji = indeksMaks;
    END IF;
END;

DROP PROCEDURE zad5;
DROP TABLE MAGAZYN;