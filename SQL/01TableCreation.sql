--DDL (Data Definition Language Create/Alter/Drop) Create

Create table STUDENTS(
Std_No varchar(10),
Std_Name varchar(10),
Tel varchar(15),
email varchar(25),
Register_date date
);


--Create a table from existing table

CREATE TABLE STUDENT_INFO
AS SELECT Std_Name, Tel FROM STUDENTS;

--DML (Data Manipulation Language Insert/Update/Delete)
/* Add data into fiels/table */

INSERT INTO STUDENTS VALUES ('1234','ADAM SMITH','0707777777','adam.smith@google.com','06-03-2023');

--Add values into SOME fields.

INSERT INTO STUDENTS (Std_Name, Tel, email) VALUES ('Rene Winti','0710000000','rene.winter@google.com')

CREATE TABLE TEDARIKCILER(
tedarikci_id char(4),
tedarikci_ismi varchar(50),
tedarikci_adres varchar(100),
ulasim_tarihi date
);

CREATE TABLE TEDARIKCI_ZIYARET
AS 
SELECT tedarikci_ismi, ulasim_tarihi FROM TEDARIKCILER;

--PRACTICE--

CREATE TABLE OGRETMENLER(
kimlik_no char(9),
isim varchar(30),
brans varchar(30),
cinsiyet char(5)
);

INSERT INTO OGRETMENLER VALUES ('234431223','Ayse Guler','Matematik','Kadin');
INSERT INTO OGRETMENLER (kimlik_no, isim) VALUES ('567597624','Ali Veli');

--BRING DATA FROM TABLE 
--DQL Data Querly Language --> SELECT

SELECT * FROM STUDENTS;
SELECT Std_Name, Tel FROM STUDENTS;


