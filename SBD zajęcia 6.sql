--1
CREATE TRIGGER otoz_nie_tym_razem
	   ON EMP
	   FOR DELETE
	   AS
	   ROLLBACK;
GO;
DELETE TRIGGER otoz_nie_tym_razem;
GO;
--2
CREATE TRIGGER zad2
	   ON EMP
	   FOR INSERT
	   AS
	   BEGIN
			UPDATE EMP
			SET comm = 0
			WHERE comm IS NULL AND empno IN (SELECT empno FROM Inserted);
	   END
GO;
--3
CREATE TRIGGER zad3
	   ON EMP
	   FOR INSERT, UPDATE
	   AS
	   BEGIN
			IF EXISTS (SELECT Sal, empno FROM Inserted
					   WHERE sal<1000)
			BEGIN
				RAISERROR('Nieprawidlowa wartosc pensji',1,1);
				ROLLBACK;
			END
		END
GO;
--4
CREATE TABLE budzet (wartosc INT NOT NULL);
INSERT INTO budzet (wartosc) SELECT SUM(sal) FROM emp;
GO;
CREATE TRIGGER zad4
	   ON EMP
	   FOR INSERT, UPDATE, DELETE
	   AS
	   BEGIN
			UPDATE budzet
			SET wartosc = wartosc + ISNULL((SELECT SUM(sal) FROM Inserted),0) - ISNULL((SELECT Sum(sal) FROM Deleted),0);
	   END
GO;
--5
CREATE TRIGGER zad5
	   ON DEPT
	   FOR UPDATE
	   AS
	   BEGIN
			IF Update(dname) ROLLBACK;
			RAISERROR('Nieprawidlowa wartosc pensji',1,1);
	   END
GO;
--6 (nie jest sprawdzone, sama robiłam)
CREATE TRIGGER zad5_1 ON EMP FOR DELETE
AS
    BEGIN
        IF EXISTS (SELECT empno FROM DELETED WHERE sal=0)
            ROLLBACK;
    END

CREATE TRIGGER zad5_2 ON EMP FOR UPDATE
AS
    BEGIN
        IF UPDATE(ename)
            ROLLBACK;
    END
CREATE TRIGGER zad5_3 ON EMP FOR INSERT
AS
    BEGIN
        IF EXISTS(SELECT ename FROM INSERTED WHERE ename IN (SELECT ename FROM EMP))
            ROLLBACK;
    END

--7 (nie jest sprawdzone, sama robiłam)
CREATE TRIGGER zad7 ON EMP FOR UPDATE, DELETE
AS
    BEGIN
        IF (ISNULL(EXISTS (SELECT ename FROM INSERTED a WHERE sal < (SELECT sal FROM DELETED b WHERE a.ename = b.ename)),FALSE) OR
            EXISTS (SELECT ename FROM DELETED WHERE ename NOT IN (SELECT ename FROM INSERTED)))
        ROLLBACK
    END