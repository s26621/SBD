--w wyzwalaczach w T-SQL są tylko wyzwalacze AFTER
-- jak chcemy zapobiec - zgłaszamy błąd w wyzwalaczach typu BEFORE
-- można ustawić na update, zmiana których kolumn uruchamia wyzwalacz
-- FOR EACH ROW -> zamiast inserted i deleted, uruchomi się dla każdego wiersza osobno, nie ma takich tabel
-- w delete jest tylko :OLD, w insert tylko :NEW, a w update oba
-- IF UPDATING THEN - jeżeli ten wyzwalacz został uruchomiony przez UPDATE, to cośtam

--1
CREATE OR REPLACE TRIGGER zad1 BEFORE DELETE ON emp
    BEGIN
        raise_application_error(-20500, 'nie mozna usunac wiersza');
    END;

DELETE FROM EMP
WHERE EMPNO = 7369;
DROP TRIGGER zad1;
--2
CREATE OR REPLACE TRIGGER zad2 BEFORE INSERT OR UPDATE OF SAL ON emp FOR EACH ROW
    BEGIN
        IF :NEW.sal <= 1000 THEN
            raise_application_error(-20500, 'Nieprawidlowa wartosc pensji');
        END IF;
    END;

UPDATE EMP
SET sal = 1
WHERE EMPNO = 7369;
DROP TRIGGER zad2;
--3
CREATE TABLE budzet (wartosc INT NOT NULL);
INSERT INTO budzet (wartosc)
SELECT SUM(sal) FROM emp;


CREATE OR REPLACE TRIGGER zad3 AFTER INSERT OR UPDATE OF SAL OR DELETE ON emp FOR EACH ROW
    BEGIN
        UPDATE budzet
        SET wartosc = wartosc + NVL(:NEW.sal,0) - NVL(:OLD.sal,0);
    END;

SELECT * FROM budzet;
UPDATE EMP
SET SAL = 4000
WHERE EMPNO = 7369;
SELECT * FROM budzet;
ROLLBACK;


--4
CREATE OR REPLACE TRIGGER zad4 BEFORE INSERT OR UPDATE OF ENAME OR DELETE ON emp FOR EACH ROW
    DECLARE ile int;
    BEGIN
        IF DELETING AND :OLD.sal > 0 THEN
                raise_application_error(-20500, 'Nie mozna usunac parcownika, ktory ma pensje wieksza od 0');
        ELSIF UPDATING THEN
            raise_application_error(-20500, 'Nie mozna zmienic nazwiska pracownika');
        ELSIF INSERTING THEN
                SELECT Count(1) INTO ile FROM emp WHERE ENAME = :NEW.ename;
                IF ile > 0 THEN
                    raise_application_error(-20500, 'Taki pracownik juz istnieje');
                END IF;
        END IF;
    END;
DELETE FROM EMP
WHERE EMPNO = 7369;

DROP TRIGGER zad4;
--5
CREATE TRIGGER zad5 BEFORE UPDATE OF sal OR DELETE ON EMP FOR EACH ROW
    BEGIN
        IF UPDATING THEN
            IF :OLD.SAL > :NEW.SAL THEN
                raise_application_error(-20500, 'Nie mozna zmniejszyc pensji');
            END IF;
        ELSIF DELETING THEN
            raise_application_error(-20500, 'Nie mozna usuwac pracownikow');
        END IF;
    END;

DELETE FROM EMP
WHERE EMPNO = 7369;
DROP TRIGGER zad5;