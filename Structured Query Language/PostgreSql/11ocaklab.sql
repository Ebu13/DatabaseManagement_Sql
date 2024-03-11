--Tablo Sorguları

CREATE TABLE Kullanicilar (
    kullaniciId SERIAL PRIMARY KEY,
    ad VARCHAR(50),
    soyad VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Urunler (
    urunId SERIAL PRIMARY KEY,
    urunAd VARCHAR(50),
    fiyat DECIMAL(10, 2),
    stokMiktari BIGINT
);

CREATE TABLE Siparisler (
    siparisId SERIAL PRIMARY KEY,
    kullaniciId INT REFERENCES Kullanicilar(kullaniciId),
    tarih Date,
    toplamTutar DECIMAL(10, 2)
);


CREATE TABLE SiparisDetaylari (
    detayId SERIAL PRIMARY KEY,
    siparisId INT REFERENCES Siparisler(siparisId),
    urunId INT REFERENCES Urunler(urunId),
    adet INT,
    toplamFiyat DECIMAL(10, 2)
);

CREATE TABLE Adresler (
    adresId SERIAL PRIMARY KEY,
    kullaniciId INT REFERENCES Kullanicilar(kullaniciId),
    sehir VARCHAR(50),
    semt VARCHAR(50),
    detay TEXT
);

--drop table Kullanicilar

--Ekleme komutları

-- Kullanicilar tablosuna veri ekleme
INSERT INTO Kullanicilar (ad, soyad, email) VALUES
('Ahmet', 'Yılmaz', 'ahmet.yilmaz@email.com'),
('Ayşe', 'Demir', 'ayse.demir@email.com'),
('Ebubekir Sıddık','Nazlı','ebubekir.13042003@gmail.com'),
('Çetin','Erçelik','cetin.ercelik@gmail.com');

-- Urunler tablosuna veri ekleme
INSERT INTO Urunler (urunAd, fiyat, stokMiktari) VALUES
('Bilgisayar', 2500.00, 100),
('Telefon', 1500.50, 50),
('Tablet',1250.99,30),
('Kulaklık',1000.00,15);


-- Siparisler tablosuna veri ekleme
INSERT INTO Siparisler (kullaniciId, tarih, toplamTutar) VALUES
(1, '2024-01-12', 2500.00),
(2, '2024-01-12', 1500.50),
(3, '2024-01-12', 1250.99),
(4, '2024-01-12', 1000.00);

-- SiparisDetaylari tablosuna veri ekleme
INSERT INTO SiparisDetaylari (siparisId, urunId, adet, toplamFiyat) VALUES
(1 ,1, 2, 5000.00),
(2, 2, 1, 1500.50),
(3, 3, 3, 3772.97),
(4, 4, 2, 2000.00);

-- Adresler tablosuna veri ekleme
INSERT INTO Adresler (kullaniciId, sehir, semt, detay) VALUES
(1, 'İstanbul', 'Ataşehir', 'Barbaros Mah. 3002 cad. No: 123'),
(2, 'Ankara', 'Çankaya', 'Atatürk Bulvarı No: 45'),
(3, 'İzmir', 'Karşıyaka', 'Gazi Mustafa Kemal Caddesi No: 67'),
(4, 'Bursa', 'Osmangazi', 'Uludağ Caddesi No: 89');


--Soru 1
SELECT Kullanicilar.ad, Kullanicilar.soyad, adet 
FROM SiparisDetaylari join Siparisler on Siparisler.siparisId=SiparisDetaylari.siparisId
join Kullanicilar on Kullanicilar.kullaniciId=Siparisler.kullaniciId
ORDER BY adet DESC LIMIT 1;


--Soru 2
SELECT Urunler.urunId AS "ÜrünId", Urunler.urunAd AS "Ürün Adı", SUM(adet) AS "Toplam Satılan Adet" FROM SiparisDetaylari
    JOIN Urunler ON SiparisDetaylari.urunId = Urunler.urunId
GROUP BY
    Urunler.urunId, Urunler.urunAd;

--Soru 3
SELECT
    K.kullaniciId,
    K.ad,
    K.soyad,
    SUM(SD.toplamFiyat) AS toplamHarcama
FROM
    Kullanicilar K
    JOIN Siparisler S ON K.kullaniciId = S.kullaniciId
    JOIN SiparisDetaylari SD ON S.siparisId = SD.siparisId
GROUP BY
    K.kullaniciId, K.ad, K.soyad
ORDER BY
    toplamHarcama DESC
LIMIT 1;

--Soru 4 

SELECT tarih AS "En Çok Satış Yapılan Tarih", COUNT(siparisId) AS "Satış Sayısı"
FROM Siparisler
GROUP BY tarih
ORDER BY "Satış Sayısı" DESC
LIMIT 1;

--Soru 5 

SELECT U.urunId AS "Ürün ID", U.urunAd AS "Ürün Adı"
FROM Urunler U
LEFT JOIN SiparisDetaylari SD ON U.urunId = SD.urunId
WHERE SD.urunId IS NULL;

