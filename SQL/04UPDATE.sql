--DML (UPDATE)
--UPDATE TABLOADI
--SET SUTUNADI

UPDATE PERSONEL
SET isim='Erol Evren'
where id='1001';

-----------------------------------------

CREATE TABLE hastaneler
(
id char(5) primary key, 
isim char(30),
sehir char(15),
ozel char(1)
); 
insert into hastaneler values('H101', 'Aci Madem Hastanesi', 'Istanbul', 'Y');
insert into hastaneler values('H102', 'HasZeki Hastanesi', 'Istanbul', 'N');
insert into hastaneler values('H103', 'Medikol Hastanesi', 'Izmir', 'Y');
insert into hastaneler values('H104', 'Memoryil Hastanesi', 'Ankara', 'Y');
CREATE TABLE hastalar(
  kimlik_no CHAR(11) PRIMARY Key,
  isim CHAR(50) ,
  teshis  CHAR(20)
  );
  insert INTO hastalar values('12345678901','Ali Can','Gizli Seker');
  insert INTO hastalar values('45678901121','Ayse Yilmaz','Hipertansiyon');
  insert INTO hastalar values('78901123451','Steve Jobs','Pankreatit');
  insert INTO hastalar values('12344321251','Tom Hanks','COVID 19');
   
create table bolumler(
bolum_id char(5),
bolum_adi char(20)
);
insert into bolumler values('DHL','Dahiliye');
insert into bolumler values('KBB','Kulak Burun Bogaz');
insert into bolumler values('NRJ','Noroloji');
insert into bolumler values('GAST','Gastoroloji');
insert into bolumler values('KARD','Kardioloji');
insert into bolumler values('PSK','Psikiyatri');
insert into bolumler values('GOZ','Goz Hastaliklari');
create table hasta_kayitlar(
kimlik_no char(11) Primary key,
hasta_ismi char(20),
hastane_adi char(50),
bolum_adi char(20),
teshis char(20)
);
insert into hasta_kayitlar values('1111','NO NAME','','','');
insert into hasta_kayitlar values('2222','NO NAME','','','');
insert into hasta_kayitlar values('3333','NO NAME','','','');
insert into hasta_kayitlar values('4444','NO NAME','','','');
insert into hasta_kayitlar values('5555','NO NAME','','','');

/*
hasta_kayıtlar tablosundaki ‘3333’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : ‘Salvadore Dali’ ismi ile
hastane_adi: ‘John Hopins’
bolum_adi: ‘Noroloji’
teshis: ‘Parkinson’
kimlik_no: ‘99991111222’
*/

UPDATE HASTA_KAYITLAR
SET HASTA_ISMI = 'Salvadore Dali', HASTANE_ADI = 'John Hopins', BOLUM_ADI = 'Noroloji', TESHIS = 'PARKINSON', KIMLIK_NO = 99991111222 
WHERE KIMLIK_NO='3333';

SELECT * FROM HASTA_KAYITLAR;

/*
hasta_kayıtlar tablosundaki ‘1111’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : hastalar tablosundaki kimlik nosu ‘12345678901’ olan kişinin ismi ile
hastane_adi: hastaneler tablosundaki 'H104' bolum_id kodlu hastanenin ismi ile
bolum_adi: bolumler tablosundaki 'DHL' bolum_id kodlu bolum_adi ile
teshis: hastalar tablosundaki 'Ali Can' isimli hastanın teshis bilgisi ile
kimlik_no: hastalar tablosundaki 'Ali Can' isimli hastanın kimlik_no kodu ile
*/

UPDATE HASTA_KAYITLAR

SET HASTA_ISMI = (SELECT ISIM FROM HASTALAR WHERE KIMLIK_NO = '12345678901'),
HASTANE_ADI = (SELECT ISIM FROM HASTANELER WHERE ID = 'H104'),
BOLUM_ADI = (SELECT BOLUM_ADI FROM BOLUMLER WHERE BOLUM_ID = 'DHL'),
TESHIS = (SELECT TESHIS FROM HASTALAR WHERE ISIM = 'Ali Can'),
KIMLIK_NO = (SELECT KIMLIK_NO FROM HASTALAR WHERE ISIM = 'Ali Can')

WHERE KIMLIK_NO = '1111'

SELECT * FROM HASTA_KAYITLAR;

---ALIASES

SELECT HASTA_ISMI AS ISIM FROM HASTA_KAYITLAR;

--------IS NULL / IS NOT NULL CONDITION---------------------------

CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir'); 
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');  
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

--name degeri null olanlari listeleyiniz

SELECT * FROM INSANLAR WHERE name IS NULL;
SELECT * FROM INSANLAR WHERE name IS NOT NULL;

--NAME NULL ISE ISIM GIRILMEMIS YAZDIRALIM
UPDATE INSANLAR
SET NAME = 'ISIM GIRILMEMIS'
WHERE NAME IS NULL;

--ORDER BY -----------------------------------------------------
DROP TABLE INSANLAR 

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

--INSANLAR TABLOSUNDA ADRES SÜTUNUNU ALFABETIK OLARAK SIRALAYINIZ
SELECT * FROM INSANLAR ORDER BY ISIM ASC, SOYISIM DESC;

SELECT ISIM, SOYISIM FROM INSANLAR ORDER BY LENGTH(SOYISIM);


----------------------CONCAT------------------------
SELECT CONCAT (ISIM,' ',SOYISIM) AS ISIM_SOYISIM FROM INSANLAR ORDER BY LENGTH(ISIM);

---------------------------GROUP BY--------------------------

create table sirket(
isim varchar(20),    
sehir varchar(20),
maas int    
);
insert into sirket values ('erol','burdur',1000);
insert into sirket values ('erol','antalya',2000);
insert into sirket values ('erol','izmir',1500);
insert into sirket values ('ahmet','bursa',900);
insert into sirket values ('ahmet','izmir',2500);
insert into sirket values ('ahmet','istanbul',1800);
insert into sirket values ('mert','trabzon',1200);
insert into sirket values ('mert','istanbul',1000);
insert into sirket values ('mert','antep',2000);
insert into sirket values ('mert','tokat',3000);
insert into sirket values ('eda','antep',1200);
insert into sirket values ('eda','urfa',1500);
insert into sirket values ('erol','usak',2000);
insert into sirket values ('erol','burdur',900);

--Sirkette calisanlarin isimlerini listeleyiniz

SELECT ISIM,SUM(MAAS) FROM SIRKET GROUP BY ISIM;

SELECT ISIM,SEHIR FROM SIRKET GROUP BY ISIM,SEHIR ORDER BY ISIM;

--EN YÜKSEK VE ENDÜSÜK MAASLARI;
SELECT ISIM, MAX(MAAS), MIN(MAAS) FROM SIRKET GROUP BY ISIM;

SELECT ISIM, COUNT(SEHIR) FROM SIRKET GROUP BY ISIM;

-------------------------HAVING CLAUS----------------------------------
--Sadece group by komutu ile kullanilir. Gruplamadan sonra bir sart var ise where kommutu kullanamayiz onun yerine ayni anlama gelne having komutu kullanilir.

--TOPLAM MAASI 7000IN ALTINDA OLAN KISILERI LISTELE
SELECT ISIM, SUM(MAAS) FROM SIRKET GROUP BY ISIM HAVING SUM(MAAS)<7000;

--sehirlere gore ort maas listele
SELECT SEHIR, AVG(ROUND(MAAS)) AS AVARAGE_SALARY FROM SIRKET GROUP BY SEHIR HAVING AVG(ROUND(MAAS))<2000 ORDER BY SEHIR;

