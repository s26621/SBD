-- Transact SQL
GO
SET IMPLICIT_TRANSACTIONS ON;


-- jeżeli liczba biletów na seans nie przekracza danego progu, to on się nie odpłaca i seans zostaje odwołny. Zwrotem pieniędzy za bilety zajmie się ktoś inny :)

ALTER PROCEDURE odwolaj_seanse @dolnyProg int = 0, @dataOd datetime, @dataDo datetime
AS
	BEGIN
		DECLARE @ilePrzed int = (SELECT Count(1) FROM SEANSE);
		DECLARE @ileBiletow int, @idSeansu int;
		DECLARE kursor CURSOR FOR
		    SELECT Count(id_biletu), Bilety.id_seansu FROM Bilety
		    INNER JOIN Seanse on Bilety.id_seansu = Seanse.id_seansu
	        WHERE Czas_rozpoczecia > @dataOd AND Czas_rozpoczecia < @dataDo
	        GROUP BY Bilety.id_seansu
			HAVING Count(id_biletu) <= @dolnyProg;
		OPEN kursor;
        FETCH NEXT FROM kursor INTO @ileBiletow, @idSeansu;
		WHILE @@FETCH_STATUS = 0
	        BEGIN
	            DELETE FROM Bilety
	            WHERE id_seansu = @idSeansu;
	            DELETE FROM Seanse
	            WHERE id_seansu = @idSeansu;
	            FETCH NEXT FROM kursor INTO @ileBiletow, @idSeansu;
	        END
	    CLOSE kursor;
		DEALLOCATE kursor;
	    DECLARE @ilePo int = (SELECT Count(1) FROM SEANSE);
	    PRINT 'Odwolano ' + CONVERT(varchar(20), @ilePrzed - @ilePo) + ' z ' +CONVERT(varchar(20),@ilePrzed) +' seansow.';
	END
GO


-- -- przed
-- SELECT Count(id_biletu) "Liczba biletow", Bilety.id_seansu FROM Bilety
-- 		    INNER JOIN Seanse on Bilety.id_seansu = Seanse.id_seansu
-- 	        GROUP BY Bilety.id_seansu
--             ORDER BY Count(id_biletu);
-- EXEC odwolaj_seanse 1, '2022-10-01 00:00:00', '2024-01-01 00:00:00';
-- --po
-- SELECT Count(id_biletu) "Liczba biletow", Bilety.id_seansu FROM Bilety
-- 		    INNER JOIN Seanse on Bilety.id_seansu = Seanse.id_seansu
-- 	        GROUP BY Bilety.id_seansu
--             ORDER BY Count(id_biletu);
--
-- GO
-- ROLLBACK;


-- -- wstawianie nowego filmu
-- ALTER PROCEDURE wstaw_film @tytul varchar(20), @gatunek varchar(20), @imieRezysera varchar(20), @nazwiskoRezysera varchar(20), @czy18Plus int = 0
-- AS
-- 	BEGIN
-- 		IF @czy18Plus = 1 OR @czy18Plus = 0
-- 			BEGIN
-- 				DECLARE @idRezysera int, @idGatunku int;
-- 				SELECT @idRezysera = Id_rezysera FROM Rezyserzy
-- 				WHERE Imie = @imieRezysera AND Nazwisko = @nazwiskoRezysera;
-- 				IF @idRezysera IS NULL RAISERROR ('Nie ma takiego rezysera w bazie. Nie wstawiono nowego filmu.',1,1);
-- 				ELSE
-- 					BEGIN
-- 						SELECT @idGatunku = id_gatunku FROM Gatunki
-- 						WHERE Nazwa = @gatunek;
-- 						IF @idGatunku IS NULL RAISERROR ('Nie ma takiego gatunku w bazie. Nie wstawiono nowego filmu.',1,1);
-- 						ELSE
-- 							BEGIN
-- 								DECLARE @idFilmu int = (SELECT Max(id_filmu) FROM Filmy)+1;
-- 								INSERT INTO Filmy
-- 								VALUES(@idFilmu, @tytul, @czy18Plus, @idgatunku);
-- 								INSERT INTO Rezyserzy_filmow
-- 								VALUES(@idRezysera, @idFilmu);
-- 							END
-- 					END
-- 			END
-- 		ELSE
-- 			RAISERROR('Nieprawidlowa wartosc pola "czy 18+". Nie wstawiono nowego filmu',1,1);
--
-- 	END
-- GO
--
-- -- prezentacja
-- EXEC wstaw_film 'test','komedia', 'Roman', 'Polanski', 1;
-- SELECT Tytul, Czy_18_plus, Imie, Nazwisko FROM Filmy
-- INNER JOIN Rezyserzy_filmow Rf on Filmy.id_filmu = Rf.id_filmu
-- INNER JOIN Rezyserzy R2 on R2.id_rezysera = Rf.id_rezysera
-- WHERE Tytul = 'test';
-- ROLLBACK;





--triggery

--trigger, który sprawdza, czy reżyser ma poprawną datę
-- CREATE TRIGGER date_check ON Rezyserzy FOR INSERT, UPDATE
-- AS
-- 	BEGIN
-- 		IF EXISTS (SELECT id_rezysera FROM INSERTED
-- 			   WHERE Data_urodzenia>GetDate() OR (Data_smierci IS NOT NULL AND
-- 				(Data_urodzenia > Data_smierci OR Data_smierci > GetDate())))
-- 			BEGIN
-- 				RAISERROR('Nieprawidlowa data',1,1);
-- 				ROLLBACK;
-- 			END
-- 	END
-- GO;
--
-- --prezentacja
-- INSERT INTO Rezyserzy (id_rezysera, Imie, Nazwisko, Data_urodzenia, Data_smierci)
-- VALUES		((SELECT Max(id_rezysera) FROM Rezyserzy) + 1, 'test', 'test', '1929-12-05', '1887-06-14');



-- --trigger na update i insert, jak chcemy dodać seans na film 18+ przed daną godziną, to nam nie pozwala
--
CREATE TRIGGER poDobranocce ON Seanse FOR INSERT, UPDATE
AS
	BEGIN
	    IF EXISTS(SELECT id_seansu FROM INSERTED
	              INNER JOIN Filmy on FILMY.id_filmu = inserted.id_filmu
	              WHERE Filmy.Czy_18_plus = 1 AND DATEPART(hour, Czas_rozpoczecia) BETWEEN 8 AND 19)
	    RAISERROR('To bedzie za wczesnie na film dla doroslych!',1,1);
	    ROLLBACK;
	END

GO
--prezentacja
INSERT INTO Seanse (id_seansu, id_filmu, Czas_rozpoczecia, Czy_3D, id_typu_tlumaczenia, id_sali)
VALUES		(100, 3, '2023-01-01 14:00:00', 0, 5, 4);
ROLLBACK;
--
-- ROLLBACK;


-- PL SQL

-- CREATE OR REPLACE PROCEDURE odwolaj_seanse (dolnyProg int DEFAULT 0, dataOd timestamp DEFAULT TO_DATE('01-10-2022'), dataDo timestamp)
-- AS
-- 	ileBylo int; ileJest int; kur_ile int; kur_id_seansu int;
-- 	CURSOR kursor IS
-- 		    SELECT Count(id_biletu), Bilety.id_seansu FROM Bilety
-- 		    INNER JOIN Seanse on Bilety.id_seansu = Seanse.id_seansu
-- 	        WHERE Czas_rozpoczecia > dataOd AND Czas_rozpoczecia < dataDo
-- 	        GROUP BY Bilety.id_seansu
-- 			HAVING Count(id_biletu) <= dolnyProg;
-- 	BEGIN
-- 		SELECT Count(1) INTO ileBylo FROM Seanse;
--         OPEN kursor;
-- 		    LOOP
--                 FETCH kursor INTO kur_ile, kur_id_seansu;
--                 DELETE FROM Bilety
--  	            WHERE id_seansu = kur_id_seansu;
--                 DELETE FROM Seanse
--  	            WHERE id_seansu = kur_id_seansu;
--                 EXIT WHEN kursor%NOTFOUND;
--             end loop;
-- 		CLOSE kursor;
-- 		SELECT Count(1) INTO ileJest FROM SEANSE;
-- 		Dbms_output.put_line('Odwolano ' || (ileBylo - ileJest) || ' z ' || ileBylo || 'seansow.');
-- 	END;
--
-- --prezentacja
--
--
-- -- przed
-- SELECT Count(id_biletu) "Liczba biletow", Bilety.id_seansu FROM Bilety
-- 		    INNER JOIN Seanse on Bilety.id_seansu = Seanse.id_seansu
-- 	        GROUP BY Bilety.id_seansu
--             ORDER BY Count(id_biletu);
--
-- CALL odwolaj_seanse (1,  TO_DATE('01-10-2022','DD-MM-YY'), TO_DATE('01-10-2024','DD-MM-YY'));
-- --po
-- SELECT Count(id_biletu) "Liczba biletow", Bilety.id_seansu FROM Bilety
-- 		    INNER JOIN Seanse on Bilety.id_seansu = Seanse.id_seansu
-- 	        GROUP BY Bilety.id_seansu
--             ORDER BY Count(id_biletu);
--
-- ROLLBACK;

--wstawianie nowego filmu



-- CREATE OR REPLACE PROCEDURE wstaw_film (wejscie_tytul varchar, wejscie_gatunek varchar, wejscie_imieRezysera varchar, wejscie_nazwiskoRezysera varchar, wejscie_czy18Plus int DEFAULT 0)
-- AS
-- 	kur_id int; kur_imie varchar(20); kur_nazwisko varchar(20); wstaw_idGatunku int; wstaw_idFilmu int; wstaw_idRezysera int;
-- 	CURSOR rezyserzyKur IS SELECT id_rezysera, imie, nazwisko FROM Rezyserzy;
-- 	zle18Plus EXCEPTION; brakRezysera EXCEPTION; brakGatunku EXCEPTION;
-- 	BEGIN
-- 		IF NOT(wejscie_czy18Plus = 1 OR wejscie_czy18Plus = 0) THEN RAISE zle18Plus;
-- 		ELSE
-- 			OPEN rezyserzyKur;
-- 			LOOP
-- 				FETCH rezyserzyKur INTO kur_id, kur_imie, kur_nazwisko;
-- 				EXIT WHEN rezyserzyKur%NOTFOUND;
-- 				IF kur_imie = wejscie_imieRezysera AND kur_nazwisko = wejscie_nazwiskoRezysera THEN wstaw_idRezysera := kur_id;
-- 				END IF;
-- 			END LOOP;
-- 			CLOSE rezyserzyKur;
-- 			IF wstaw_idRezysera IS NULL THEN RAISE brakRezysera;
-- 			ELSE
-- 				SELECT id_gatunku INTO wstaw_idGatunku FROM Gatunki
-- 				WHERE Nazwa = wejscie_gatunek;
-- 				IF wstaw_idGatunku IS NULL THEN RAISE brakGatunku;
-- 				ELSE
-- 					SELECT Max(id_filmu) INTO wstaw_idFilmu FROM Filmy;
-- 					wstaw_idFilmu := wstaw_idFilmu + 1;
-- 					INSERT INTO Filmy
-- 					VALUES(wstaw_idFilmu, wejscie_tytul, wejscie_czy18Plus, wstaw_idGatunku);
-- 					INSERT INTO Rezyserzy_filmow
-- 					VALUES(wstaw_idRezysera, wstaw_idFilmu);
-- 				END IF;
-- 			END IF;
-- 		END IF;
-- 	EXCEPTION
-- 	WHEN zle18Plus THEN
-- 		dbms_output.put_line('Nieprawidlowa wartosc pola "czy 18+". Nie wstawiono nowego filmu');
-- 	WHEN brakRezysera THEN
-- 		dbms_output.put_line('Nie ma takiego rezysera w bazie. Nie wstawiono nowego filmu.');
-- 	WHEN brakGatunku THEN
-- 		dbms_output.put_line('Nie ma takiego gatunku w bazie. Nie wstawiono nowego filmu.');
-- 	END;
--
--     --prezentacja
--     CALL wstaw_film('test','komedia','Roman','Polanski',1);
--     SELECT Tytul, Czy_18_plus, Imie, Nazwisko FROM Filmy
--     INNER JOIN Rezyserzy_filmow Rf on Filmy.id_filmu = Rf.id_filmu
--     INNER JOIN Rezyserzy R2 on R2.id_rezysera = Rf.id_rezysera
--     WHERE Tytul = 'test';
--
--     ROLLBACK;


--triggery


-- --trigger, który sprawdza, czy reżyser ma poprawną datę
-- CREATE TRIGGER date_check BEFORE INSERT OR UPDATE ON Rezyserzy  FOR EACH ROW
-- 	BEGIN
-- 		IF :NEW.Data_urodzenia>SYSDATE OR (:NEW.Data_smierci IS NOT NULL AND
-- 		   (:NEW.Data_urodzenia > :NEW.Data_smierci OR :NEW.Data_smierci > SYSDATE)) THEN
--                 raise_application_error(-20500, 'Nieprawidlowa data');
-- 		END IF;
-- 	END;
-- --prezentacja
-- INSERT INTO Rezyserzy (id_rezysera, Imie, Nazwisko, Data_urodzenia, Data_smierci)
-- VALUES		((SELECT Max(id_rezysera) FROM Rezyserzy) + 1, 'test', 'test', '1929-12-05', '1887-06-14');


--trigger na update i insert, jak chcemy dodać seans na film 18+ przed daną godziną, to nam nie pozwala

CREATE OR REPLACE TRIGGER poDobranocce BEFORE INSERT OR UPDATE ON Seanse FOR EACH ROW
	DECLARE zmiennaCzy18Plus int;
    BEGIN
        SELECT CZY_18_PLUS INTO zmiennaCzy18Plus FROM filmy
        WHERE ID_FILMU = :NEW.ID_FILMU;
	    IF zmiennaCzy18Plus = 1 AND (Extract(hour FROM :NEW.Czas_rozpoczecia) BETWEEN 8 AND 19) THEN
            raise_application_error(-20500, 'Za wczesnie na film dla doroslych!');
        end if;
	END;

-- prezentacja
INSERT INTO Seanse (id_seansu, id_filmu, Czas_rozpoczecia, Czy_3D, id_typu_tlumaczenia, id_sali)
VALUES		(100, 3, '2023-01-01 14:00:00', 0, 5, 4);
ROLLBACK;