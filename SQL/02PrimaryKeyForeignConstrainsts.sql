--CONSTRAINTS (UNIQUE)
--Tablo olusturmadan yapilmalidir aksi halde ALTER ile eklenebilir fakat sorun cikarabilir.

CREATE TABLE OGRETMENLER_2(
kimlik_no char(9),
isim varchar(30) unique,
brans varchar(30),
cinsiyet char(5)
);

INSERT INTO OGRETMENLER_2 VALUES ('234431223','Ayse Guler','Matematik','Kadin');
INSERT INTO OGRETMENLER_2 VALUES ('234431225','Mehmet Guler','Kimya','Erkek');

SELECT * FROM OGRETMENLER_2;

--not null

CREATE TABLE OGRETMENLER_3(
kimlik_no char(9) not null,
isim varchar(30) unique,
brans varchar(30),
cinsiyet char(5)
--UNIQUE (kimlik_no) ayni seye not null be unique eklemek icin
-- constraint uniq_ky UNIQUE (kimlik_no) --> bu da bir yöntem isim vermek icin constraint kuralina
);

INSERT INTO OGRETMENLER_3 VALUES ('234431223','Ayse Guler','Matematik','Kadin');
INSERT INTO OGRETMENLER_3 VALUES ('234431225','Mehmet Guler','Kimya','Erkek');

--PRIMARY KEY hem unique hem not null ozelligi alir

CREATE TABLE OGRETMENLER_5(
kimlik_no char(9) PRIMARY KEY,
isim varchar(30) unique,
brans varchar(30),
cinsiyet char(5)
);	

SELECT * FROM OGRETMENLER_2;

--FOREIGN KEY AND PRIMARY KEY CONNECTION

CREATE TABLE TEDARIKCILER_2(
tedarikci_id char(4) PRIMARY KEY,
tedarikci_ismi varchar(50),
iletisim_isim varchar(100)
);

CREATE TABLE URUNLER_2(
tedarikci_id varchar(10),
urun_id varchar(10),
FOREIGN KEY (tedarikci_id) references TEDARIKCILER_2 (tedarikci_id)
);
