CREATE TABLE Sucursala ( 
ID_Sucursala NUMBER(10) PRIMARY KEY, 
Nume_Sucursala VARCHAR2(50) NOT NULL, 
Adresa VARCHAR2(100), 
Telefon VARCHAR2(15) 
); 
CREATE TABLE Clienti ( 
ID_Client NUMBER(10) PRIMARY KEY, 
Nume VARCHAR2(50) NOT NULL, 
Prenume VARCHAR2(50) NOT NULL, 
CNP VARCHAR2(13) UNIQUE NOT NULL, 
Adresa VARCHAR2(100), 
Telefon VARCHAR2(15), 
Email VARCHAR2(50), 
Data_Inregistrarii DATE DEFAULT SYSDATE 
); 
CREATE TABLE Tipuri_Conturi ( 
ID_Tip_Cont NUMBER(10) PRIMARY KEY, 
Denumire VARCHAR2(20) NOT NULL, 
Dobanda NUMBER(5, 2), 
Limita_Descoperire NUMBER(12, 2) 
); 
CREATE TABLE Conturi ( 
ID_Cont NUMBER(10) PRIMARY KEY, 
ID_Client NUMBER(10) NOT NULL, 
ID_Tip_Cont NUMBER(10) NOT NULL, 
Sold NUMBER(12, 2) DEFAULT 0, 
Data_Deschiderii DATE DEFAULT SYSDATE, 
Stare VARCHAR2(20), 
ID_Sucursala NUMBER(10) NOT NULL, 
CONSTRAINT FK_Conturi_Clienti FOREIGN KEY (ID_Client) REFERENCES Clienti(ID_Client), 
CONSTRAINT FK_Conturi_Tipuri FOREIGN KEY (ID_Tip_Cont) REFERENCES 
Tipuri_Conturi(ID_Tip_Cont), 
CONSTRAINT FK_Conturi_Sucursala FOREIGN KEY (ID_Sucursala) REFERENCES 
Sucursala(ID_Sucursala) 
);
CREATE TABLE Carduri ( 
ID_Card NUMBER(10) PRIMARY KEY, 
Numar_Card VARCHAR2(16) UNIQUE NOT NULL, 
Tip_Card VARCHAR2(20) NOT NULL, 
Data_Emitere DATE DEFAULT SYSDATE, 
Data_Expirare DATE NOT NULL, 
Limita_Credit NUMBER(12, 2), 
ID_Cont NUMBER(10) NOT NULL, 
CONSTRAINT FK_Carduri_Conturi FOREIGN KEY (ID_Cont) REFERENCES Conturi(ID_Cont) 
); 
CREATE TABLE Tranzactii ( 
ID_Tranzactie NUMBER(12) PRIMARY KEY, 
ID_Cont_Sursa NUMBER(10) , 
ID_Cont_Destinatie NUMBER(10) , 
Suma NUMBER(12, 2) NOT NULL, 
Data_Tranzactiei TIMESTAMP DEFAULT SYSTIMESTAMP, 
Tip_Tranzactie VARCHAR2(20), 
CONSTRAINT FK_Tranzactii_Cont_Sursa FOREIGN KEY (ID_Cont_Sursa) REFERENCES 
Conturi(ID_Cont), 
CONSTRAINT FK_Tranzactii_Cont_Dest FOREIGN KEY (ID_Cont_Destinatie) REFERENCES 
Conturi(ID_Cont) 
); 
CREATE TABLE Angajati ( 
ID_Angajat NUMBER(10) PRIMARY KEY, 
Prenume VARCHAR2(50) NOT NULL, 
Nume VARCHAR2(50) NOT NULL, 
CNP VARCHAR2(13) UNIQUE NOT NULL, 
ID_Sucursala NUMBER(10) NOT NULL, 
Pozitie VARCHAR2(30) NOT NULL, 
Data_Angajarii DATE DEFAULT SYSDATE, 
Salariu NUMBER(10, 2) NOT NULL, 
Telefon VARCHAR2(15), 
Email VARCHAR2(50) UNIQUE, 
CONSTRAINT FK_Angajati_Sucursala FOREIGN KEY (ID_Sucursala) REFERENCES 
Sucursala(ID_Sucursala) 
); 
CREATE TABLE Credite ( 
ID_Credit NUMBER(10) PRIMARY KEY, 
ID_Client NUMBER(10) NOT NULL, 
Suma_Aprobata NUMBER(12, 2), 
Rata_Dobanzii NUMBER(5, 2), 
Data_Acordarii DATE DEFAULT SYSDATE, 
Data_Scadentei DATE, 
Status_Credit VARCHAR2(20), 
CONSTRAINT FK_Credite_Clienti FOREIGN KEY (ID_Client) REFERENCES Clienti(ID_Client) 
); 
CREATE TABLE Depozite ( 
ID_Depozit NUMBER(10) PRIMARY KEY, 
ID_Cont NUMBER(10) NOT NULL, 
Suma_Depozit NUMBER(12, 2), 
Rata_Dobanzii NUMBER(5, 2), 
Data_Depunere DATE DEFAULT SYSDATE, 
Data_Scadenta DATE, 
Status_Depozit VARCHAR2(20), 
CONSTRAINT FK_Depozite_Conturi FOREIGN KEY (ID_Cont) REFERENCES Conturi(ID_Cont) 
); 

INSERT INTO Sucursala (ID_Sucursala, Nume_Sucursala, Adresa, Telefon) 
VALUES (1, 'Bucuresti', 'Strada Principala 1', '0211234567'); 
INSERT INTO Sucursala (ID_Sucursala, Nume_Sucursala, Adresa, Telefon) 
VALUES (2, 'Cluj', 'Strada Nordului 12', '0212233445'); 
INSERT INTO Sucursala (ID_Sucursala, Nume_Sucursala, Adresa, Telefon)  
VALUES (3, 'Timisoara', 'Strada Sudului 45', '0214455667'); 
INSERT INTO Sucursala (ID_Sucursala, Nume_Sucursala, Adresa, Telefon)  
VALUES (4, 'Iasi', 'Strada Estului 3', '0215566778'); 
INSERT INTO Sucursala (ID_Sucursala, Nume_Sucursala, Adresa, Telefon)  
VALUES (5, 'Constanta', 'Strada Vestului 8', '0216677889'); 
INSERT INTO Sucursala (ID_Sucursala, Nume_Sucursala, Adresa, Telefon)  
VALUES (6, 'Brasov', 'Bulevardul Bucuresti 100', '0217788990'); 
INSERT INTO Sucursala (ID_Sucursala, Nume_Sucursala, Adresa, Telefon)  
VALUES (7, 'Sibiu', 'Strada Clujului 22', '0218899001'); 
INSERT INTO Sucursala (ID_Sucursala, Nume_Sucursala, Adresa, Telefon)  
VALUES (8, 'Craiova', 'Strada Iasului 15', '0219001123'); 
INSERT INTO Sucursala (ID_Sucursala, Nume_Sucursala, Adresa, Telefon)  
VALUES (9, 'Arad', 'Strada Timisoarei 30', '0211234568'); 
INSERT INTO Sucursala (ID_Sucursala, Nume_Sucursala, Adresa, Telefon)  
VALUES (10, 'Oradea', 'Strada Marii 50', '0212345678'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email) 
VALUES (0, 'Silviu', 'Serban', '1900101123456',1, 'Director', SYSDATE, 10000.00,'0745123456', 'silviu.serban@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (1, 'Ion', 'Popescu', '5900101123456', 1, 'Manager', SYSDATE, 5000.00, '0740123456', 'ion.popescu@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (2, 'Maria', 'Ionescu', '2910101123456', 1, 'Casier', SYSDATE, 3000.00, '0741123456', 'maria.ionescu@yahoo.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (3, 'Andrei', 'Georgescu', '1920101123456', 1, 'Consultant Financiar', SYSDATE, 3500.00, '0742123456', 
'andrei.georgescu@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (4, 'Ana', 'Dumitrescu', '2930101123456', 2, 'Manager', SYSDATE, 5000.00, '0743123456', 'ana.dumitrescu@yahoo.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (5, 'Mihai', 'Vasilescu', '1940101123456', 2, 'Casier', SYSDATE, 3000.00, '0744123456', 'mihai.vasilescu@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (6, 'Elena', 'Popa', '2950101123456', 2, 'Consultant Financiar', SYSDATE, 3500.00, '0745123456', 'elena.popa@yahoo.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (7, 'Cristian', 'Stan', '1960101123456', 3, 'Manager', SYSDATE, 5000.00, '0746123456', 'cristian.stan@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (8, 'Alina', 'Marinescu', '2970101123456', 3, 'Casier', SYSDATE, 3000.00, '0747123456', 'alina.marinescu@yahoo.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (9, 'George', 'Iliescu', '1980101123456', 3, 'Consultant Financiar', SYSDATE, 3500.00, '0748123456', 'george.iliescu@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (10, 'Raluca', 'Stanciu', '2990101123456', 4, 'Manager', SYSDATE, 5000.00, '0749123456', 'raluca.stanciu@yahoo.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (11, 'Alex', 'Moldoveanu', '2000101123456', 4, 'Casier', SYSDATE, 3000.00, '0750123456', 'alex.moldoveanu@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (12, 'Diana', 'Tudor', '2010101123456', 4, 'Consultant Financiar', SYSDATE, 3500.00, '0751123456', 'diana.tudor@yahoo.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (13, 'Sorin', 'Radulescu', '2020101123456', 5, 'Manager', SYSDATE, 5000.00, '0752123456', 'sorin.radulescu@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (14, 'Simona', 'Calinescu', '2030101123456', 5, 'Casier', SYSDATE, 3000.00, '0753123456', 'simona.calinescu@yahoo.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (15, 'Victor', 'Grigorescu', '2040101123456', 5, 'Consultant Financiar', SYSDATE, 3500.00, '0754123456', 
'victor.grigorescu@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (16, 'Adrian', 'Popa', '2050101123456', 6, 'Manager', SYSDATE, 5000.00, '0755123456', 'adrian.popa@gmail.com');
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (17, 'Gabriel', 'Marin', '2060101123456', 6, 'Casier', SYSDATE, 3000.00, '0756123456', 'gabriel.marin@yahoo.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (18, 'Roxana', 'Enache', '2070101123456', 6, 'Consultant Financiar', SYSDATE, 3500.00, '0757123456', 'roxana.enache@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (19, 'Oana', 'Mihai', '2080101123456', 7, 'Manager', SYSDATE, 5000.00, '0758123456', 'oana.mihai@yahoo.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (20, 'Vlad', 'Tudor', '2090101123456', 7, 'Casier', SYSDATE, 3000.00, '0759123456', 'vlad.tudor@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (21, 'Iulia', 'Dobre', '2100101123456', 7, 'Consultant Financiar', SYSDATE, 3500.00, '0760123456', 'iulia.dobre@yahoo.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (22, 'Marius', 'Popescu', '2110101123456', 8, 'Manager', SYSDATE, 5000.00, '0761123456', 'marius.popescu@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (23, 'Carmen', 'Toma', '2120101123456', 8, 'Casier', SYSDATE, 3000.00, '0762123456', 'carmen.toma@yahoo.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (24, 'Alin', 'Georgescu', '2130101123456', 8, 'Consultant Financiar', SYSDATE, 3500.00, '0763123456', 'alin.georgescu@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (25, 'Dan', 'Iordache', '2140101123456', 9, 'Manager', SYSDATE, 5000.00, '0764123456', 'dan.iordache@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (26, 'Roxana', 'Stoian', '2150101123456', 9, 'Casier', SYSDATE, 3000.00, '0765123456', 'roxana.stoian@yahoo.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (27, 'Cristina', 'Dumitru', '2160101123456', 9, 'Consultant Financiar', SYSDATE, 3500.00, '0766123456', 
'cristina.dumitru@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (28, 'Alexandru', 'Serban', '2170101123456', 10, 'Manager', SYSDATE, 5000.00, '0767123456', 'alexandru.serban@gmail.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (29, 'Bianca', 'Enescu', '2180101123456', 10, 'Casier', SYSDATE, 3000.00, '0768123456', 'bianca.enescu@yahoo.com'); 
INSERT INTO Angajati (ID_Angajat, Prenume, Nume, CNP, ID_Sucursala, Pozitie, Data_Angajarii, Salariu, Telefon, Email)  
VALUES (30, 'Razvan', 'Dinu', '2190101123456', 10, 'Consultant Financiar', SYSDATE, 3500.00, '0769123456', 'razvan.dinu@gmail.com'); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (1, 'Popescu', 'Ion', '1900101123456', 'Strada Principala 1', '0740123456', 'ion.popescu@gmail.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (2, 'Ionescu', 'Maria', '2910101123456', 'Strada Lalelelor 12', '0741123456', 'maria.ionescu@yahoo.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (3, 'Georgescu', 'Andrei', '1920101123456', 'Strada Florilor 8', '0742123456', 'andrei.georgescu@gmail.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (4, 'Dumitrescu', 'Ana', '2930101123456', 'Strada Castanilor 15', '0743123456', 'ana.dumitrescu@yahoo.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (5, 'Vasilescu', 'Mihai', '1940101123456', 'Strada Libertatii 20', '0744123456', 'mihai.vasilescu@gmail.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (6, 'Popa', 'Elena', '2950101123456', 'Strada Independentei 25', '0745123456', 'elena.popa@yahoo.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (7, 'Stan', 'Cristian', '1960101123456', 'Strada Viitorului 30', '0746123456', 'cristian.stan@gmail.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (8, 'Marinescu', 'Alina', '2970101123456', 'Strada Sperantei 35', '0747123456', 'alina.marinescu@yahoo.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (9, 'Iliescu', 'George', '1980101123456', 'Strada Fericirii 40', '0748123456', 'george.iliescu@gmail.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (10, 'Stanciu', 'Raluca', '2990101123456', 'Strada Visului 45', '0749123456', 'raluca.stanciu@yahoo.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (11, 'Moldoveanu', 'Alex', '2000101123456', 'Strada Bucuriei 50', '0750123456', 'alex.moldoveanu@gmail.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (12, 'Tudor', 'Diana', '2010101123456', 'Strada Copilului 55', '0751123456', 'diana.tudor@yahoo.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (13, 'Radulescu', 'Sorin', '2020101123456', 'Strada Curcubeului 60', '0752123456', 'sorin.radulescu@gmail.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (14, 'Calinescu', 'Simona', '2030101123456', 'Strada Prieteniei 65', '0753123456', 'simona.calinescu@yahoo.com', SYSDATE); 
INSERT INTO Clienti (ID_Client, Nume, Prenume, CNP, Adresa, Telefon, Email, Data_Inregistrarii)  
VALUES (15, 'Grigorescu', 'Victor', '2040101123456', 'Strada Pacii 70', '0754123456', 'victor.grigorescu@gmail.com', SYSDATE); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (1, 1, 5000.00, 5.00, SYSDATE, ADD_MONTHS(SYSDATE, 12), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (2, 2, 10000.00, 4.50, SYSDATE, ADD_MONTHS(SYSDATE, 24), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (3, 3, 7500.00, 6.00, SYSDATE, ADD_MONTHS(SYSDATE, 18), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (4, 4, 15000.00, 3.50, SYSDATE, ADD_MONTHS(SYSDATE, 36), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (5, 5, 2000.00, 5.50, SYSDATE, ADD_MONTHS(SYSDATE, 12), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (6, 6, 8000.00, 4.00, SYSDATE, ADD_MONTHS(SYSDATE, 24), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (7, 7, 12000.00, 3.75, SYSDATE, ADD_MONTHS(SYSDATE, 36), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (8, 8, 9000.00, 5.25, SYSDATE, ADD_MONTHS(SYSDATE, 12), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (9, 9, 10000.00, 4.00, SYSDATE, ADD_MONTHS(SYSDATE, 24), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (10, 10, 5000.00, 5.00, SYSDATE, ADD_MONTHS(SYSDATE, 12), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (11, 11, 7000.00, 4.50, SYSDATE, ADD_MONTHS(SYSDATE, 18), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (12, 12, 11000.00, 3.75, SYSDATE, ADD_MONTHS(SYSDATE, 36), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (13, 13, 15000.00, 3.50, SYSDATE, ADD_MONTHS(SYSDATE, 24), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (14, 14, 20000.00, 4.75, SYSDATE, ADD_MONTHS(SYSDATE, 48), 'Activ'); 
INSERT INTO Credite (ID_Credit, ID_Client, Suma_Aprobata, Rata_Dobanzii, Data_Acordarii, Data_Scadentei, Status_Credit)  
VALUES (15, 15, 25000.00, 4.25, SYSDATE, ADD_MONTHS(SYSDATE, 60), 'Activ'); 
INSERT INTO Tipuri_Conturi (ID_Tip_Cont, Denumire, Dobanda, Limita_Descoperire) VALUES (1, 'Curent', 0.00, 1000.00); 
INSERT INTO Tipuri_Conturi (ID_Tip_Cont, Denumire, Dobanda, Limita_Descoperire) VALUES (2, 'Economii', 2.50, 0.00); 
INSERT INTO Tipuri_Conturi (ID_Tip_Cont, Denumire, Dobanda, Limita_Descoperire) VALUES (3, 'Credit', 5.00, 5000.00); 
INSERT INTO Tipuri_Conturi (ID_Tip_Cont, Denumire, Dobanda, Limita_Descoperire) VALUES (4, 'Business', 3.00, 10000.00); 
INSERT INTO Tipuri_Conturi (ID_Tip_Cont, Denumire, Dobanda, Limita_Descoperire) VALUES (5, 'Investitii', 1.50, 0.00); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (1, 1, 1, 5000.00, SYSDATE, 'Activ', 1); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (2, 2, 2, 10000.00, SYSDATE, 'Activ', 2); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (3, 3, 3, 2000.00, SYSDATE, 'Activ', 3); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (4, 4, 4, 15000.00, SYSDATE, 'Activ', 4); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (5, 5, 5, 25000.00, SYSDATE, 'Activ', 5); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (6, 6, 1, 3000.00, SYSDATE, 'Activ', 6); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (7, 7, 2, 1000.00, SYSDATE, 'Activ', 7); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (8, 8, 3, 50000.00, SYSDATE, 'Activ', 8); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (9, 9, 4, 75000.00, SYSDATE, 'Activ', 9); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (10, 10, 5, 2000.00, SYSDATE, 'Activ', 1); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (11, 11, 1, 12000.00, SYSDATE, 'Activ', 2); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (12, 12, 2, 8000.00, SYSDATE, 'Activ', 3); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (13, 13, 3, 5000.00, SYSDATE, 'Activ', 4); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (14, 14, 4, 15000.00, SYSDATE, 'Activ', 5); 
INSERT INTO Conturi (ID_Cont, ID_Client, ID_Tip_Cont, Sold, Data_Deschiderii, Stare, ID_Sucursala)  
VALUES (15, 15, 5, 100000.00, SYSDATE, 'Activ', 6); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (1, 1, 5000.00, 2.50, SYSDATE, ADD_MONTHS(SYSDATE, 12), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (2, 2, 10000.00, 3.00, SYSDATE, ADD_MONTHS(SYSDATE, 24), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (3, 3, 15000.00, 2.75, SYSDATE, ADD_MONTHS(SYSDATE, 18), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (4, 4, 20000.00, 3.25, SYSDATE, ADD_MONTHS(SYSDATE, 36), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (5, 5, 2500.00, 2.50, SYSDATE, ADD_MONTHS(SYSDATE, 12), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (6, 6, 8000.00, 3.00, SYSDATE, ADD_MONTHS(SYSDATE, 24), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (7, 7, 10000.00, 2.50, SYSDATE, ADD_MONTHS(SYSDATE, 36), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (8, 8, 15000.00, 3.25, SYSDATE, ADD_MONTHS(SYSDATE, 12), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (9, 9, 20000.00, 2.75, SYSDATE, ADD_MONTHS(SYSDATE, 24), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (10, 10, 12000.00, 3.50, SYSDATE, ADD_MONTHS(SYSDATE, 36), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (11, 11, 5000.00, 2.50, SYSDATE, ADD_MONTHS(SYSDATE, 12), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (12, 12, 15000.00, 3.00, SYSDATE, ADD_MONTHS(SYSDATE, 24), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (13, 13, 8000.00, 2.75, SYSDATE, ADD_MONTHS(SYSDATE, 18), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (14, 14, 20000.00, 3.25, SYSDATE, ADD_MONTHS(SYSDATE, 36), 'Activ'); 
INSERT INTO Depozite (ID_Depozit, ID_Cont, Suma_Depozit, Rata_Dobanzii, Data_Depunere, Data_Scadenta, Status_Depozit)  
VALUES (15, 15, 30000.00, 3.50, SYSDATE, ADD_MONTHS(SYSDATE, 60), 'Activ'); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont)  
VALUES (1, '1234567890123456', 'Debit', SYSDATE, ADD_MONTHS(SYSDATE, 60), NULL, 1); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont)  
VALUES (2, '2234567890123456', 'Credit', SYSDATE, ADD_MONTHS(SYSDATE, 60), 5000.00, 2); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont)  
VALUES (3, '3234567890123456', 'Debit', SYSDATE, ADD_MONTHS(SYSDATE, 60), NULL, 3); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont) 
VALUES (4, '4234567890123456', 'Credit', SYSDATE, ADD_MONTHS(SYSDATE, 60), 10000.00, 4); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont) 
VALUES (5, '5234567890123456', 'Debit', SYSDATE, ADD_MONTHS(SYSDATE, 60), NULL, 5); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont) 
VALUES (6, '6234567890123456', 'Credit', SYSDATE, ADD_MONTHS(SYSDATE, 60), 15000.00, 6); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont) 
VALUES (7, '7234567890123456', 'Debit', SYSDATE, ADD_MONTHS(SYSDATE, 60), NULL, 7); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont) 
VALUES (8, '8234567890123456', 'Credit', SYSDATE, ADD_MONTHS(SYSDATE, 60), 20000.00, 8); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont) 
VALUES (9, '9234567890123456', 'Debit', SYSDATE, ADD_MONTHS(SYSDATE, 60), NULL, 9); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont) 
VALUES (10, '1234567890987654', 'Credit', SYSDATE, ADD_MONTHS(SYSDATE, 60), 50000.00, 10); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont) 
VALUES (11, '2234567890987654', 'Debit', SYSDATE, ADD_MONTHS(SYSDATE, 60), NULL, 11); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont) 
VALUES (12, '3234567890987654', 'Credit', SYSDATE, ADD_MONTHS(SYSDATE, 60), 3000.00, 12); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont) 
VALUES (13, '4234567890987654', 'Debit', SYSDATE, ADD_MONTHS(SYSDATE, 60), NULL, 13); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont) 
VALUES (14, '5234567890987654', 'Credit', SYSDATE, ADD_MONTHS(SYSDATE, 60), 100000.00, 14); 
INSERT INTO Carduri (ID_Card, Numar_Card, Tip_Card, Data_Emitere, Data_Expirare, Limita_Credit, ID_Cont) 
VALUES (15, '6234567890987654', 'Debit', SYSDATE, ADD_MONTHS(SYSDATE, 60), NULL, 15);
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie)  
VALUES (1, 1, 2, 500.00, SYSDATE, 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie)  
VALUES (2, 2, 3, 1000.00, SYSDATE, 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie)  
VALUES (3, 3, 4, 1500.00, SYSDATE, 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie)  
VALUES (4, 4, 5, 200.00, SYSDATE, 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie)  
VALUES (5, 5, 6, 300.00, SYSDATE, 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie)  
VALUES (6, NULL, 7, 1000.00, SYSDATE, 'Depunere'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie)  
VALUES (7, 8, NULL, 500.00, SYSDATE, 'Retragere'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie)  
VALUES (8, 9, 10, 800.00, SYSDATE, 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie)  
VALUES (9, 10, 1, 1200.00, SYSDATE, 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie)  
VALUES (10, 1, 3, 1500.00, SYSDATE, 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (101, 1, 2, 500.00, SYSDATE - 10, 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (102, 3, 4, 2000.00, SYSDATE - 8, 'Depunere'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (103, 2, 5, 150.00, SYSDATE - 6, 'Retragere'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (104, 4, 1, 800.00, SYSDATE - 15, 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (105, 6, 3, 300.00, SYSDATE - 12, 'Retragere'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (106, 1, 6, 1200.00, SYSDATE - 7, 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (107, 5, 2, 400.00, SYSDATE - 14, 'Depunere'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (108, 2, 4, 250.00, SYSDATE - 5, 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (109, 3, 6, 600.00, SYSDATE - 9, 'Retragere'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (110, 6, 5, 100.00, SYSDATE - 4, 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (201, 1, 2, 500.00, TO_DATE('2025-01-07 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (202, 3, 4, 1200.00, TO_DATE('2025-01-07 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Depunere'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (203, 2, 5, 800.00, TO_DATE('2025-01-07 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Retragere'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (204, 4, 1, 1500.00, TO_DATE('2025-01-07 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (205, 5, 3, 600.00, TO_DATE('2025-01-07 20:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Depunere'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (206, 3, 1, 700.00, TO_DATE('2025-01-07 23:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Transfer'); 
INSERT INTO Tranzactii (ID_Tranzactie, ID_Cont_Sursa, ID_Cont_Destinatie, Suma, Data_Tranzactiei, Tip_Tranzactie) 
VALUES (207, 4, 2, 400.00, TO_DATE('2025-01-07 04:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Retragere'); 
