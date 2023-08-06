--UNION

CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50),  
maas int,  
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--S.1.Maasi 4000 den cok olan isci isimleri
SELECT ISIM as isim_sehir, MAAS FROM PERSONEL WHERE MAAS>4000
UNION
SELECT SEHIR, MAAS FROM PERSONEL WHERE MAAS>5000 ORDER BY isim_Sehir;

--S.2.Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini bir tabloda gosteren sorgu yaziniz
SELECT ISIM, SEHIR,MAAS FROM PERSONEL WHERE ISIM='Mehmet Ozturk'
UNION
SELECT ISIM,SEHIR,MAAS FROM PERSONEL WHERE SEHIR='Istanbul';

-------------------------------
DROP TABLE PERSONEL;


-------------------------------
CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id));
    
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);


-----id’si 123456789 olan personelin Personel tablosundan sehir ve maasini, personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin
SELECT SEHIR AS Sehir_Tel, MAAS AS Maas_CocukSayisi FROM PERSONEL WHERE ID='123456789'
UNION
SELECT TEL, COCUK_SAYISI FROM PERSONEL_BILGI WHERE ID='123456789'; 

SELECT * FROM PERSONEL;


SELECT ID, FROM PERSONEL WHERE SEHIR IN('Istanbul','Ankara') -- (WHERE SEHIR='ISTANBUL' OR SEHIR='ANKARA')
INTERSECT
SELECT ID FROM PERSONEL_BILGI WHERE COCUK_SAYISI IN (2,3);


--Honda, Ford ve TOFAS ta calisan ortak isimdeki personelleri bulunuz.

SELECT ISIM FROM PERSONEL WHERE SIRKET ='Honda'
INTERSECT
SELECT ISIM FROM PERSONEL WHERE SIRKET ='Ford'
INTERSECT
SELECT ISIM FROM PERSONEL WHERE SIRKET ='Tofas';

-------------------------------EXCEPT DIKKAT DIGER SQL PROGRAMLARINDA BU MINUS------------------------------------
--Hondada calismayip 5000den az maas alanlar

SELECT ISIM, MAAS, SIRKET FROM PERSONEL WHERE MAAS<5000 -- and sirket <> 'Honda' böyle yaparsak da alttaki satirlara gerek kalmadan yapmis oluruz.
EXCEPT
SELECT ISIM, MAAS, SIRKET FROM PERSONEL WHERE SIRKET='Honda';



-------------------------------------------join join join --------------------------------------------------------
CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota');  
INSERT INTO sirketler VALUES(101, 'Honda');  
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler  (
siparis_id int,  
    sirket_id int,  
    siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17');  
INSERT INTO siparisler VALUES(22, 102, '2020-04-18'); 
INSERT INTO siparisler VALUES(33, 103, '2020-04-19');  
INSERT INTO siparisler VALUES(44, 104, '2020-04-20');  
INSERT INTO siparisler VALUES(55, 105, '2020-04-21');

--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve siparis_tarihleri ile yeni bir tablo olusturun
SELECT SIRKETLER.SIRKET_ISIM, SIPARISLER.SIPARIS_ID, SIPARISLER.SIPARIS_TARIHI
FROM SIRKETLER INNER JOIN SIPARISLER
ON SIRKETLER.SIRKET_ID = SIPARISLER.SIRKET_ID;

--left join soldaki tablonun tamami ve kesisim alanini dahil eder ama sagdaki kümenin farkini almaz.

--SELF JOIN hayali iki tablo bir tablodan olusuyor

