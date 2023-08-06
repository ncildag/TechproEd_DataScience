--SUBQUERY(Alt Sorgu)
CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

--
--************************SUBQUERY****************************--
SELECT ISYERI,ISIM,MAAS FROM CALISANLAR2 
WHERE ISYERI IN (SELECT MARKA_ISIM FROM MARKALAR WHERE CALISAN_SAYISI > 15000);

----------------------------------------------------------------
-- AGGREGATE METHODS (SUM,COUNT,MIN, MAX, AVG) bunlar subquery icinde kulanilabilir.
SELECT MAX(MAAS) AS MAX_EMPLOYEE_SALARY FROM CALISANLAR2; 
SELECT MIN(MAAS) FROM CALISANLAR2;

SELECT COUNT(ISIM) FROM CALISANLAR2;
SELECT COUNT(*) FROM CALISANLAR2; --Bu tablodaki satirlari sayar.

SELECT ROUND(AVG(MAAS)) FROM CALISANLAR2;
SELECT ROUND(AVG(MAAS),2) AS AVARAGE_SALARY FROM CALISANLAR2;

--
--HER MARKANIN ID'SINI , ISMINI VE TOPLAM KAC SEHIRDE BULUNDUGUNU LISTELEYIN
SELECT MARKA_ID, MARKA_ISIM,
(SELECT COUNT(SEHIR) FROM CALISANLAR2 WHERE MARKA_ISIM=ISYERI) AS SEHIR_SAYISI
FROM MARKALAR;



---------------------EXIST USAGE-----------------------------------------------
CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');


CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

SELECT URUN_ID, MUSTERI_ISIM FROM MART
WHERE EXISTS (SELECT URUN_ID FROM NISAN WHERE MART.URUN_ID = NISAN.URUN_ID);

SELECT urun_id, musteri_isim FROM mart WHERE urun_id IN(SELECT urun_id FROM nisan);


--DML (UPDATE)
--UPDATE TABLOADI
--SET SUTUNADI

UPDATE PERSONEL
SET isim='Erol Evren'
where id='1001';
