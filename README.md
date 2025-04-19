# SBD
Projekty z przedmiotu "Systemy Baz Danych" / Projects from the subject "Database Systems" 

## Zajęcia 2 - lesson 2 (literal transaltion, original below)
1. List all hotel customers in alphabetical order (sorted by last name and first name).
2. List all discount values ​​in the table, sorted descending, without repetition.
3. List all reservations made by Ferdynand Kiepski.
4. List reservations made by customers from 2008 whose last name starts with the letter "K" or "L". Provide first name, last name, and room number.
5. List the numbers of rooms rented by Andrzej Nowak.
6. Provide the number of rooms in each category.
7. Provide customer data and their reservations so that the customer is listed even if they have never booked a room.
8. List customers who slept in room 101 and paid.
9. List the data in the form: Last name and first name (in one column), DateFrom, DateTo, RoomNumber, category name.
10. List in one query the guests who booked room 101, whose last name starts with the letter "K" and those who booked room 201, but whose last name starts with the letter "P".
11. List the data of customers who do not have a discount (NULL) and have rented any room.
12. List the data of all room reservations: 101, 102, 103, 104. Provide the first name, last name and date.
13. Provide categories from the price range <10,100>.
14. List the first and last names (in one column) of customers who are in arrears with payments (field "paid" = 0). Label the column with customer data "debtor". Sort first by last name, second by first name.
15. Provide the total number of paid reservations.
16. List the number of reservations made in 2009.
17. Insert a new guest into the database (make up any data) and a reservation for him.
18. Change the end date of the selected reservation at will.
19. Delete the selected reservation.

### Original
1.	Wypisz wszystkich klientów hotelu w kolejności alfabetycznej (sortując po nazwisku i imieniu).
2.	Podaj bez powtórzeń wszystkie występujące w tabeli wartości rabatu posortowane malejąco.
3.	Wypisz wszystkie rezerwacje Ferdynanda Kiepskiego.
4.	Wypisz rezerwacje z 2008 roku klientów, których nazwisko zaczyna się na literę „K” lub „L”. Podaj imię, nazwisko oraz numer pokoju.
5.	Wypisz numery pokoi wynajmowanych przez Andrzeja Nowaka.
6.	Podaj liczbę pokoi w każdej kategorii.
7.	Podaj dane klientów oraz ich rezerwacji tak, aby klient został wypisany nawet, jeśli nigdy nie rezerwował pokoju.
8.	Wypisz klientów, którzy spali w pokoju 101 i zapłacili.
9.	Wypisz dane w postaci: Nazwisko i imię (w jednej kolumnie), DataOd, DataDo, NrPokoju, nazwa kategorii.
10.	Wypisz w jednym zapytaniu gości, którzy zarezerwowali pokój 101, mających nazwisko na literę „K” oraz tych, którzy zarezerwowali pokój 201, ale mających nazwisko na literę „P”.
11.	Wypisz dane klientów, którzy nie mają rabatu (NULL) i wynajęli jakikolwiek pokój.
12.	Wypisz dane wszystkich rezerwacji pokoi: 101, 102, 103, 104. Podaj imię, nazwisko i datę.
13.	Podaj kategorie z przedziału cenowego <10,100>.
14.	Wypisz imiona i nazwiska (w jednej kolumnie) klientów, którzy zalegają z płatnościami (pole „zaplacona” = 0). Kolumnie z danymi klienta nadaj etykietę „dłużnik”. Posortuj w pierwszej kolejności po nazwiskach, a w drugiej po imionach.
15.	Podaj, ile jest łącznie rezerwacji zapłaconych.
16.	Wypisz, ile rezerwacji zostało złożonych w 2009 roku.
17.	Wstaw do bazy danych nowego gościa (wymyśl dowolne dane) oraz rezerwację dla niego.
18.	Zmień dowolnie datę zakończenia wybranej rezerwacji.
19.	Usuń wybraną rezerwację.

## Zajęcia 3 - lesson 3 (literal transaltion, original below) 
1. List the guests along with the number of reservations they made. Do not list information about guests who made only one reservation.
2. List the rooms with the largest number of beds.
3. For each room, list when it was last rented.
4. List the number of reservations for each room. Do not list rooms that were booked only once or rooms from the "luxury" category.
5. Provide the details (name, surname, room number) of the most recent reservation.
6. List the details of the room that has never been rented.
7. Using the NOT EXISTS operator, list the guests who have never rented a luxury room.
8. In one query, list the guests who rented room 101 (name, surname, reservation date) and the guests who have never rented any room (name, surname, 'none').
9. Find the category with the largest number of rooms.
10. For each category, provide the room with the largest number of beds.

### Original
1.	Wypisz gości wraz z liczbą dokonanych przez nich rezerwacji. Nie wypisuj informacji o gościach, którzy złożyli tylko jedną rezerwację.
2.	Wypisz pokoje o największej liczbie miejsc.
3.	Dla każdego pokoju wypisz, kiedy był ostatnio wynajmowany.
4.	Wypisz liczbę rezerwacji dla każdego pokoju. Nie wypisuj pokoi, które były rezerwowane tylko raz oraz pokoi z kategorii „luksusowy”.
5.	Podaj dane (imię, nazwisko, numer pokoju) najnowszej rezerwacji.
6.	Wypisz dane pokoju, który nie był nigdy wynajmowany.
7.	Używając operatora NOT EXISTS wypisz gości, którzy nigdy nie wynajmowali pokoju luksusowego.
8.	W jednym zapytaniu wypisz gości, którzy wynajmowali pokój 101 (imię, nazwisko, data rezerwacji) oraz gości, którzy nigdy nie wynajmowali żadnego pokoju (imię, nazwisko, ‘brak’).
9.	Znajdź kategorię, w której liczba pokoi jest największa.
10.	Dla każdej kategorii podaj pokój o największej liczbie miejsc.


## Zajęcia 4 - lesson 4 (literal transaltion, original below) 
1. Write a simple Transact-SQL program. Declare a variable, assign the number of records in the Emp table (or any other) to this variable and print the result using the PRINT statement, in the form of a string, e.g. "There are 10 people in the table".
2. Using Transact-SQL, count the number of employees from the EMP table. If the number is less than 16, insert the employee Kowalski and print a message. Otherwise, print a message informing that no data was inserted.
3. Write a procedure that returns employees who earn more than the value specified by the procedure parameter.
4. Write a procedure for inserting departments into the Dept table. The procedure will take as parameters: department_number, name and location. It should be checked whether a department with such a name or location already exists. If it does, then we do not insert a new record.
5. Write a procedure that allows the user to enter new employees into the EMP table. As parameters, we will provide the name and department number of the employee being hired. The procedure should check when entering a new record whether the entered department exists (if not, an error should be reported) and calculate its salary equal to the minimum wage in this department. The new employee's EMPNO should be calculated as the highest existing value in the table + 1.

### Original
1.	Napisz prosty program w Transact-SQL. Zadeklaruj zmienną, przypisz na tą zmienną liczbę rekordów w tabeli Emp (lub jakiejkolwiek innej) i wypisz uzyskany wynik używając instrukcji PRINT, w postaci napisu np. "W tabeli jest 10 osób".
2.	Używając Transact-SQL, policz liczbę pracowników z tabeli EMP. Jeśli liczba jest mniejsza niż 16, wstaw pracownika Kowalskiego i wypisz komunikat. W przeciwnym przypadku wypisz komunikat informujący o tym, że nie wstawiono danych.
3.	Napisz procedurę zwracającą pracowników, którzy zarabiają więcej niż wartość zadana parametrem procedury.
4.	Napisz procedurę służącą do wstawiania działów do tabeli Dept. Procedura będzie pobierać jako parametry: nr_działu, nazwę i lokalizację. Należy sprawdzić, czy dział o takiej nazwie lub lokalizacji już istnieje. Jeżeli istnieje, to nie wstawiamy nowego rekordu. 
5.	Napisz procedurę umożliwiającą użytkownikowi wprowadzanie nowych pracowników do tabeli EMP. Jako parametry będziemy podawać nazwisko i nr działu zatrudnianego pracownika. Procedura powinna wprowadzając nowy rekord sprawdzić, czy wprowadzany dział istnieje (jeżeli nie, to należy zgłosić błąd) oraz obliczyć mu pensję równą minimalnemu zarobkowi w tym dziale. EMPNO nowego pracownika powinno zostać wyliczone jako najwyższa istniejąca wartość w tabeli + 1.


## Zajęcia 5 - lesson 5 (literal transaltion, original below)
1. Use the cursor to review all employees and modify salaries so that those earning less than 1000 have their salaries increased by 10%, while those earning more than 1500 have their salaries reduced by 10%. Print each change to the screen.
2. Modify the code from task 1 into a procedure so that the earnings values ​​(1000 and 1500) are not constant, but are procedure parameters.
3. In the procedure, check the average earnings value from the EMP table from the department specified by the procedure parameter. Then, give a commission (comm) to those employees in this department who earn below the average. The commission should be 5% of their monthly salary.
4. (without cursor) Create a Warehouse (ItemId, Name, Quantity) table containing the quantities of individual items in the warehouse and insert a few sample records into it.
In the Transact-SQL block, check which item is the most in stock and reduce the quantity of that item by 5 (if the stock is greater than or equal to 5, otherwise report an error).
5. Convert the code from task 4 into a procedure to which we can provide a value by which we reduce the stock (instead of the "hard-coded" 5).

### Original
1.	Przy pomocy kursora przejrzyj wszystkich pracowników i zmodyfikuj wynagrodzenia tak, aby osoby zarabiające mniej niż 1000 miały zwiększone wynagrodzenie o 10%, natomiast osoby zarabiające powyżej 1500 miały zmniejszone wynagrodzenie o 10%. Wypisz na ekran każdą wprowadzoną zmianę.
2.	Przerób kod z zadania 1 na procedurę tak, aby wartości zarobków (1000 i 1500) nie były stałe, tylko były parametrami procedury.
3.	W procedurze sprawdź średnią wartość zarobków z tabeli EMP z działu określonego parametrem procedury. Następnie należy dać prowizję (comm) tym pracownikom tego działu, którzy zarabiają poniżej średniej. Prowizja powinna wynosić 5% ich miesięcznego wynagrodzenia.
4.	(bez kursora) Utwórz tabelę Magazyn (IdPozycji, Nazwa, Ilosc) zawierającą ilości poszczególnych towarów w magazynie i wstaw do niej kilka przykładowych rekordów.
W bloku Transact-SQL sprawdź, którego artykułu jest najwięcej w magazynie i zmniejsz ilość tego artykułu o 5 (jeśli stan jest większy lub równy 5, w przeciwnym wypadku zgłoś błąd).
5.	Przerób kod z zadania 4 na procedurę, której będziemy mogli podać wartość, o którą zmniejszamy stan (zamiast wpisanego „na sztywno” 5).

## Zajęcia 6 - lesson 6 (literal transaltion, original below)
1. Create a trigger that will not allow you to delete a record from the Emp table.
2. Create a trigger that, when inserting an employee into the Emp table, will insert a commission equal to 0 if the commission was empty. Note: The task can be done without using triggers using DEFAULT. However, let's use the trigger for training purposes.
3. Create a trigger that, when inserting or modifying data in the Emp table, will check whether the new earnings (inserted or modified) are greater than 1000. Otherwise, the trigger should report an error and prevent the record from being inserted. Note: The same effect can be achieved more easily using CHECK type integrity constraints. Let's use the trigger for training purposes.
4. Create the budget table:
> CREATE TABLE budget (INT NOT NULL value)

This table will store the total value of all employees' salaries. The table will always contain one row. First, calculate the initial value of earnings:
> INSERT INTO budzet (value)
> SELECT SUM(sal) FROM emp

Create a trigger that will make sure that the value in the budzet table is always up to date, so that for all operations updating the emp table (INSERT, UPDATE, DELETE), the trigger will update the entry in the budget table

5. Write a trigger that will not allow you to modify department names in the dept table. However, it should be possible to insert new departments.
7. Write one trigger that:
  • Will not allow to delete an employee whose salary is greater than 0.
  • Will not allow to change the employee's name.
  • Will not allow to insert an employee who already exists (checking by name).
8. Write a trigger that:
  • Will not allow to decrease salaries.
  • Will not allow to delete employees.

### Original
1.	Utwórz wyzwalacz, który nie pozwoli usunąć rekordu z tabeli Emp.
2.	Utwórz wyzwalacz, który przy wstawianiu pracownika do tabeli Emp, wstawi prowizję równą 0, jeśli prowizja była pusta. Uwaga: Zadanie da się wykonać bez użycia wyzwalaczy przy pomocy DEFAULT. Użyjmy jednak wyzwalacza w celach treningowych.
3.	Utwórz wyzwalacz, który przy wstawianiu lub modyfikowaniu danych w tabeli Emp sprawdzi czy nowe zarobki (wstawiane lub modyfikowane) są większe niż 1000. W przeciwnym przypadku wyzwalacz powinien zgłosić błąd i nie dopuścić do wstawienia rekordu. Uwaga:  Ten sam efekt można uzyskać łatwiej przy pomocy więzów spójności typu CHECK. Użyjmy wyzwalacza w celach treningowych.
4.	Utwórz tabelę budzet:
> CREATE TABLE budzet (wartosc INT NOT NULL)

W tabeli tej będzie przechowywana łączna wartość wynagrodzenia wszystkich pracowników. Tabela będzie zawsze zawierała jeden wiersz. Należy najpierw obliczyć początkową wartość zarobków:
> INSERT INTO budzet (wartosc)
> SELECT SUM(sal) FROM emp

Utwórz wyzwalacz, który będzie pilnował, aby wartość w tabeli budzet była zawsze aktualna, a więc przy wszystkich operacjach aktualizujących tabelę emp (INSERT, UPDATE, DELETE), wyzwalacz będzie aktualizował wpis w tabeli budżet

5.	Napisz wyzwalacz, który nie pozwoli modyfikować nazw działów w tabeli dept. Powinno być jednak możliwe wstawianie nowych działów.
6.	Napisz jeden wyzwalacz, który:
  •	Nie pozwoli usunąć pracownika, którego pensja jest większa od 0.
  •	Nie pozwoli zmienić nazwiska pracownika.
  •	Nie pozwoli wstawić pracownika, który już istnieje (sprawdzając po nazwisku).
7.	Napisz wyzwalacz, który:
  •	Nie pozwoli zmniejszać pensji.
  •	Nie pozwoli usuwać pracowników.

## Zajęcia 7 - lesson 7 (literal transaltion, original below)
#### Indexes
1. To prepare a table with a large amount of data, run the script:
> CREATE TABLE test (Id INT IDENTITY, Content INT, Content2 INT)
> GO
> 
> DECLARE @a INT
> SET @a = 1
> WHILE @a < 100000 BEGIN
>  INSERT INTO test (Content, Content2)
>  VALUES (CONVERT(INT,RAND() * 100000), CONVERT(INT,RAND() * 100000))
>  SET @a = @a + 1
> END
> GO
2. Turn on the query execution plan preview and run a query like:
> SELECT * FROM test WHERE Content = 12345

Look at the plan. You will probably see the Table scan operation. Record the total cost by observing the Estimated subtree cost of the last (leftmost) operation in the plan.

3. Create an ungrouped index on the Content column. Run the query again. Compare the query execution plan and cost. The server should use the index created (Index seek), and the cost should be much lower.

4. "Index only" strategy. Remove the index created in point 4. Execute the query and view its execution plan:
> SELECT Content, Content2 FROM test WHERE Content = 12345

Create a composite index on the Content and Content2 columns (necessarily in that order). Observe the difference in the query execution plan and the total cost (Estimated subtree cost of the last operation). You will probably notice that the plan consists of only two operations. The first is Index seek, the second is Select. This means that the server did not have to read the data pages.

5. Range search. Remove all indexes from the test table and execute the query with the plan preview:
> SELECT * FROM test WHERE Content BETWEEN 10000 and 20000

You will probably notice the Table scan operation. Record the total cost of the query (Estimated subtree cost of the leftmost operation). Create an ungrouped index on the Content column. Execute the query again. The server probably will not use the index (ungrouped indexes do not support range searches well). Remove the ungrouped index and create a grouped index. Execute the query again. View the plan and preview the costs.

6. Sorting using indexes. Remove all indexes from the test table and execute the query with the plan preview:
> SELECT * FROM test ORDER BY Content

You will probably notice two expensive operations: Table scan and sorting. Create an ungrouped index on the Content column and execute the query again. Compare the plan and costs. Did the server use the index? Remove the ungrouped index and create a grouped one. Did the server use the index this time?

#### Transactions
7. Execute the following instructions:
> SET IMPLICIT_TRANSACTIONS ON -- disable automatic commit
> CREATE TABLE Person (ID INT, Surname VARCHAR(50))
> COMMIT
> INSERT INTO Person VALUES (1, ‘Lenkiewicz’)
> INSERT INTO Person VALUES (2, ‘Kowalski’)
> SELECT * FROM Person -- we should see two persons
> ROLLBACK
> SELECT * FROM Person -- we should see an empty table
> INSERT INTO Person VALUES (3, ‘Iksiński’)
> COMMIT
> SELECT * FROM Person -- we should see one person
8. Try to perform task 7 again, but with the option disabled:
> SET IMPLICIT_TRANSACTIONS OFF

Before performing the next task, set this option back to ON.
During the execution of COMMIT and ROLLBACK statements, errors will appear stating that the transaction cannot be committed or rolled back. This is normal, because when the IMPLICIT_TRANSACTIONS option is disabled, each transaction is automatically committed. Perform subsequent tasks with this option enabled.

9. Open the second tab in Management Studio. Execute:
> SET IMPLICIT_TRANSACTIONS ON
> SELECT * FROM Person

In window 1, update the record:
> SET IMPLICIT_TRANSACTIONS ON
> UPDATE Person SET LastName = 'Igrekowski' WHERE Id = 3

In window 2, try again:
> SELECT * FROM Person

The query will wait for the lock to be released. In window 1, do:
> COMMIT

Check if the query from window 2 has been executed.
NOTE: In this and subsequent exercises performed with IMPLICIT_TRANSACTIONS set to ON, previous, unfinished transactions may interfere. Therefore, it is worth performing a COMMIT in each window before each exercise.

10. In the second MS window, set the isolation level to the lowest:
> SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
> Perform task 9 (or similar) again. In the first window, make changes, and in the second, see if you are able to read uncommitted data.

NOTE: Setting the isolation level only works for the next transaction and does not apply to a transaction that has already started. Therefore, after the SET TRANSACTION ISOLATION LEVEL … statement, it is worth performing a COMMIT or ROLLBACK to be sure.

11. Check if the Test table exists and if it contains any records. If not, create it using the script from point 1. Don't forget to COMMIT when you're done. Then set the isolation level to SERIALIZABLE in both tabs. To be on the safe side, we also turn off automatic commit and do COMMIT (it may return an error if there was no previous transaction).
> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
> SET IMPLICIT_TRANSACTIONS ON
> COMMIT

Then execute in both windows:
> SELECT * FROM Test

And then in the first window any INSERT:
> INSERT INTO Test (Content, Content2) VALUES (12345, 56789)

Notice that this time, the execution of the SELECT statement has already caused a lock to be placed on the entire "Person" table and we are not able to execute the INSERT until we execute a COMMIT in window 2. In the case of READ COMMITTED, the INSERT statement would execute immediately (phantom).

### Original
#### Indeksy
1.	Aby przygotować tabelę z dużą ilością danych, uruchom skrypt:
> CREATE TABLE test (Id INT IDENTITY, Zawartosc INT, Zawartosc2 INT)
> GO
> 
> DECLARE @a INT
> SET @a = 1
> WHILE @a < 100000 BEGIN
> 	INSERT INTO test (Zawartosc, Zawartosc2) 
> VALUES (CONVERT(INT,RAND() * 100000), CONVERT(INT,RAND() * 100000))
>	 SET @a = @a + 1
> END
> GO
2.	Włącz podgląd planu wykonania zapytania i uruchom zapytanie typu:
> SELECT * FROM test WHERE Zawartosc = 12345

Obejrzyj plan. Zaobserwujesz zapewne operację Table scan. Zapisz łączny koszt obserwując wartość Estimated subtree cost ostatniej (najbardziej lewej) operacji w planie.

3.	Załóż indeks niepogrupowany na kolumnę Zawartosc. Uruchom zapytanie jeszcze raz. Porównaj plan wykonania zapytania oraz koszt. Serwer powinien użyć założonego indeksu (Index seek), a koszt powinien być znacznie niższy.
4.	Strategia „tylko indeks”. Usuń indeks założony w punkcie 4. Wykonaj zapytanie i obejrzyj plan jego wykonania:

> SELECT Zawartosc, Zawartosc2 FROM test WHERE Zawartosc = 12345
Załóż indeks złożony na kolumny Zawartosc oraz Zawartosc2 (koniecznie w takiej kolejności). Zaobserwuj różnicę w planie wykonania zapytania oraz łącznym koszcie (Estimated subtree cost ostatniej operacji). Zauważysz zapewne, że plan składa się jedynie z dwóch operacji. Pierwsza to Index seek, druga to Select. Wynika z tego, że serwer nie musiał odczytać stron z danymi.

5.	Wyszukiwanie zakresowe. Usuń wszystkie indeksy z tabeli test i wykonaj z podglądem planu zapytanie:
> SELECT * FROM test WHERE Zawartosc BETWEEN 10000 and 20000

Zaobserwujesz zapewne operację Table scan. Zapisz łączny koszt zapytania (Estimated subtree cost najbardziej lewej operacji). Załóż indeks niepogrupowany na kolumnie Zawartosc. Wykonaj zapytanie jeszcze raz. Zapewne serwer nie skorzysta z indeksu (indeksy niepogrupowane słabo wspierają wyszukiwanie zakresowe). Usuń indeks niepogrupowany i załóż pogrupowany. Wykonaj zapytanie jeszcze raz. Obejrzyj plan i podejrzyj koszty.

6.	Sortowanie przy pomocy indeksów. Usuń wszystkie indeksy z tabeli test i wykonaj z podglądem planu zapytanie:
> SELECT * FROM test ORDER BY Zawartosc

Zauważysz zapewne dwie kosztowne operacje: Table scan i sortowanie. Załóż indeks niepogrupowany na kolumnę Zawartosc i wykonaj zapytanie jeszcze raz. Porównaj plan i koszty. Czy serwer skorzystał z indeksu? Usuń indeks niepogrupowany i załóż pogrupowany. Czy tym razem serwer skorzystał z indeksu?

#### Transakcje
7.	Wykonuj kolejno instrukcje:
> SET IMPLICIT_TRANSACTIONS ON -- wyłączenie automatycznego zatwierdzania
> CREATE TABLE Osoba (Id INT, Nazwisko VARCHAR(50))
> COMMIT
> INSERT INTO Osoba VALUES (1, ‘Lenkiewicz’)
> INSERT INTO Osoba VALUES (2, ‘Kowalski’)
> SELECT * FROM Osoba   -- powinniśmy zobaczyć dwie osoby 
> ROLLBACK
> SELECT * FROM Osoba   -- powinniśmy zobaczyć pustą tabelę
> INSERT INTO Osoba VALUES (3, ‘Iksiński’)
> COMMIT
> SELECT * FROM Osoba   -- powinniśmy zobaczyć jedną osobę
8.	Spróbuj wykonać zadanie 7 ponownie, ale z wyłączoną opcją:
> SET IMPLICIT_TRANSACTIONS OFF

Przed wykonaniem kolejnego zadania ustaw tą opcję z powrotem na ON.
W trakcie wykonywania instrukcji COMMIT i ROLLBACK pojawią się błędy mówiące o tym, że nie można zatwierdzić lub wycofać transakcji. Jest to normalne, ponieważ przy wyłączonej opcji IMPLICIT_TRANSACTIONS, każda transakcja jest zatwierdzana automatycznie. Kolejne zadania wykonuj z włączoną tą opcją.

9.	Otwórz drugą zakładkę w Management Studio. Wykonaj:
> SET IMPLICIT_TRANSACTIONS ON
> SELECT * FROM Osoba

W oknie 1 zaktualizuj rekord:
> SET IMPLICIT_TRANSACTIONS ON
> UPDATE Osoba SET Nazwisko = 'Igrekowski' WHERE Id = 3

W oknie 2 spróbuj wykonać jeszcze raz:
> SELECT * FROM Osoba

Zapytanie będzie czekać na zwolnienie blokady. W oknie 1 wykonaj:
> COMMIT

Zobacz, czy wykonało się zapytanie z okna 2.
UWAGA: Przy tym i kolejnych ćwiczeniach wykonywanych przy IMPLICIT_TRANSACTIONS ustawionym na ON mogą przeszkadzać nam poprzednie, niezakończone transakcje. Dlatego warto przed każdym ćwiczeniem wykonać COMMIT w każdym oknie.

10.	W drugim oknie MS ustaw poziom izolacji na najniższy:
> SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
> Wykonaj ponownie zadanie 9 (lub podobne). W pierwszym oknie wprowadzaj zmiany, a w drugim zobacz, czy jesteś w stanie odczytać niezatwierdzone dane.

UWAGA: Ustawienie poziomu izolacji działa dopiero dla kolejnej transakcji i nie dotyczy transakcji, która już się rozpoczęła. Dlatego po instrukcji SET TRANSACTION ISOLATION LEVEL … warto dla pewności wykonać COMMIT lub ROLLBACK.

11.	Sprawdź czy istnieje tabela Test i czy zawiera jakieś rekordy. Jeżeli nie, utwórz ją przy pomocy skryptu z punktu 1. Nie zapomnij wykonać COMMIT po zakończeniu. Następnie ustaw poziom izolacji SERIALIZABLE w obu zakładkach. Dla pewności wyłączamy też automatyczne zatwierdzanie oraz robimy COMMIT (może zwrócić błąd, jeśli nie było poprzedniej transakcji).
> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
> SET IMPLICIT_TRANSACTIONS ON
> COMMIT

Następnie wykonaj w obu oknach:
> SELECT * FROM Test

A następnie w pierwszym oknie dowolny INSERT:
> INSERT INTO Test (Zawartosc, Zawartosc2) VALUES (12345, 56789)

Zauważ, że tym razem, już wykonanie instrukcji SELECT spowodowało założenie blokady na całą tabelę „Osoba” i nie jesteśmy w stanie wykonać INSERT do momentu, gdy w oknie 2 wykonamy COMMIT. W przypadku READ COMMITTED instrukcja INSERT wykonałaby się od razu (fantom).

## Zajęcia 9 - lesson 9 (literal transaltion, original below)
1. Write a simple PL/SQL program. Declare a variable, assign the number of records in the EMP table to this variable and print the result in the form of e.g. "There are 10 people in the table".
2. Check the number of employees from the EMP table in the PL/SQL block. If the number is less than 16, insert the Kowalski employee and print an appropriate message. Otherwise, print a message informing that no data was inserted.
3. Write a procedure for inserting departments into the Dept table. The procedure will take the following parameters: department_no., name and location. You should check whether a department with such a name or location already exists. If it does, do not insert a new record.
4. Write a procedure for inserting employees. You will provide the following parameters: department no. and last name. The procedure should check whether the given department exists (otherwise, report an error) and calculate the employee's salary equal to the minimum wage in his department. The procedure should also assign the new employee an EMPNO calculated as the maximum EMPNO in the table + 1.
5. Create a Warehouse (ItemId, Name, Quantity) table containing the quantities of individual items in the warehouse and insert a few sample records into it.
In the PL/SQL block, check which item is the most in the warehouse and reduce the quantity of that item by 5 (if the stock is greater than or equal to 5, otherwise report an error).

### Original
1.	Napisz prosty program w PL/SQL. Zadeklaruj zmienną, przypisz na tą zmienną liczbę rekordów w tabeli EMP i wypisz uzyskany wynik w postaci  np. "W tabeli jest 10 osób".
2.	Sprawdź w bloku PL/SQL liczbę pracowników z tabeli EMP. Jeśli liczba jest mniejsza niż 16, wstaw pracownika Kowalskiego i wypisz odpowiedni komunikat. W przeciwnym przypadku wypisz komunikat informujący o tym, że nie wstawiono danych.
3.	Napisz procedurę służącą do wstawiania działów do tabeli Dept. Procedura będzie pobierać jako parametry: nr_działu, nazwę i lokalizację. Należy sprawdzić, czy dział o takiej nazwie lub lokalizacji już istnieje. Jeżeli istnieje, to nie wstawiamy nowego rekordu. 
4.	Napisz procedurę służącą do wstawiania pracowników. Jako parametry podamy: nr działu i nazwisko. Procedura powinna sprawdzić, czy podany dział istnieje (w przeciwnym przypadku zgłaszamy błąd) i wyliczyć pracownikowi pensję równą minimalnemu wynagrodzeniu w jego dziale. Procedura powinna również nadać EMPNO nowemu pracownikowi obliczone jako maksymalne EMPNO w tabeli + 1.
5.	Utwórz tabelę Magazyn (IdPozycji, Nazwa, Ilosc) zawierającą ilości poszczególnych towarów w magazynie i wstaw do niej kilka przykładowych rekordów.
W bloku PL/SQL sprawdź, którego artykułu jest najwięcej w magazynie i zmniejsz ilość tego artykułu o 5 (jeśli stan jest większy lub równy 5, w przeciwnym wypadku zgłoś błąd).


## Zajęcia 10 - lesson 10 (literal transaltion, original below)
1. Use the cursor to review all employees and modify salaries so that those earning less than 1000 have their salaries increased by 10%, while those earning more than 1500 have their salaries reduced by 10%. Print each change to the screen.
2. Modify the code from task 1 into a procedure so that the earnings values ​​(1000 and 1500) are not constant, but are procedure parameters.
3. In the procedure, check the average earnings value from the EMP table from the department specified by the procedure parameter. Then, give a commission (comm) to those employees in this department who earn below the average. The commission should be 5% of their monthly salary.
4. (without cursor) Create a Warehouse (ItemId, Name, Quantity) table containing the quantities of individual items in the warehouse and insert a few sample records into it.
In the PL/SQL block, check which item is the most in stock and reduce the quantity of that item by 5 (if the stock is greater than or equal to 5, otherwise report an error). Remember that the procedure should always reduce the stock of only one item, even if there are two with the maximum number.
5. Convert the code from task 4 into a procedure to which we can provide a value by which we reduce the stock (instead of the "hard-coded" 5).
6. Convert the code from task 1 or 2 into a version in which the cursor will be handled in a FOR loop.

### Original
1.	Przy pomocy kursora przejrzyj wszystkich pracowników i zmodyfikuj wynagrodzenia tak, aby osoby zarabiające mniej niż 1000 miały zwiększone wynagrodzenie o 10%, natomiast osoby zarabiające powyżej 1500 miały zmniejszone wynagrodzenie o 10%. Wypisz na ekran każdą wprowadzoną zmianę.
2.	Przerób kod z zadania 1 na procedurę tak, aby wartości zarobków (1000 i 1500) nie były stałe, tylko były parametrami procedury.
3.	W procedurze sprawdź średnią wartość zarobków z tabeli EMP z działu określonego parametrem procedury. Następnie należy dać prowizję (comm) tym pracownikom tego działu, którzy zarabiają poniżej średniej. Prowizja powinna wynosić 5% ich miesięcznego wynagrodzenia.
4.	(bez kursora) Utwórz tabelę Magazyn (IdPozycji, Nazwa, Ilosc) zawierającą ilości poszczególnych towarów w magazynie i wstaw do niej kilka przykładowych rekordów.
W bloku PL/SQL sprawdź, którego artykułu jest najwięcej w magazynie i zmniejsz ilość tego artykułu o 5 (jeśli stan jest większy lub równy 5, w przeciwnym wypadku zgłoś błąd). Pamiętaj, aby procedura zawsze zmniejszała stan tylko jednego artykułu nawet, gdy są dwa o liczbie takiej jak maksymalna.
5.	Przerób kod z zadania 4 na procedurę, której będziemy mogli podać wartość, o którą zmniejszamy stan (zamiast wpisanego „na sztywno” 5).
6.	Przerób kod z zadania 1 lub 2 na wersję, w której kursor będzie obsługiwany w pętli FOR.

## Zajęcia 11 - lesson 11 (literal transaltion, original below)
1. Create a trigger that will not allow the record to be deleted from the Emp table.
2. Create a trigger that, when inserting or modifying data in the Emp table, checks whether the new earnings (inserted or modified) are greater than 1000. Otherwise, the trigger should report an error and prevent the record from being inserted. Note: The same effect can be achieved more easily using CHECK type integrity constraints. Let's use the trigger for training purposes.
3. Create the budget table:
> CREATE TABLE budget (INT NOT NULL value)

This table will store the total value of all employees' salaries. The table will always contain one row. First, calculate the initial value of earnings:
> INSERT INTO budzet (value)
> SELECT SUM(sal) FROM emp

Create a trigger that will ensure that the value in the budzet table is always up to date, so that for all operations updating the emp table (INSERT, UPDATE, DELETE), the trigger will update the entry in the budget table

4. Write one trigger that:
• Will not allow deleting an employee whose salary is greater than 0.
• Will not allow changing the employee's name.
• Will not allow inserting an employee that already exists (checking by name).
5. Write a trigger that:
• Will not allow decreasing the salary.
• Will not allow deleting employees.

### Original
1.	Utwórz wyzwalacz, który nie pozwoli usunąć rekordu z tabeli Emp.
2.	Utwórz wyzwalacz, który przy wstawianiu lub modyfikowaniu danych w tabeli Emp sprawdzi czy nowe zarobki (wstawiane lub modyfikowane) są większe niż 1000. W przeciwnym przypadku wyzwalacz powinien zgłosić błąd i nie dopuścić do wstawienia rekordu. Uwaga:  Ten sam efekt można uzyskać łatwiej przy pomocy więzów spójności typu CHECK. Użyjmy wyzwalacza w celach treningowych.
3.	Utwórz tabelę budzet:
> CREATE TABLE budzet (wartosc INT NOT NULL)

W tabeli tej będzie przechowywana łączna wartość wynagrodzenia wszystkich pracowników. Tabela będzie zawsze zawierała jeden wiersz. Należy najpierw obliczyć początkową wartość zarobków:
> INSERT INTO budzet (wartosc)
> SELECT SUM(sal) FROM emp

Utwórz wyzwalacz, który będzie pilnował, aby wartość w tabeli budzet była zawsze aktualna, a więc przy wszystkich operacjach aktualizujących tabelę emp (INSERT, UPDATE, DELETE), wyzwalacz będzie aktualizował wpis w tabeli budżet

4.	Napisz jeden wyzwalacz, który:
•	Nie pozwoli usunąć pracownika, którego pensja jest większa od 0.
•	Nie pozwoli zmienić nazwiska pracownika.
•	Nie pozwoli wstawić pracownika, który już istnieje (sprawdzając po nazwisku).
5.	Napisz wyzwalacz, który:
•	Nie pozwoli zmniejszać pensji.
•	Nie pozwoli usuwać pracowników.
