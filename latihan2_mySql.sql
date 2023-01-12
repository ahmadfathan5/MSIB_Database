use dbToko;

show tables;

desc jenis;

desc produk;

-- latihan 2 07-10-22

ALTER TABLE produk ADD COLUMN keterangan text;

ALTER table produk change keterangan deskripsi varchar(200);

ALTER TABLE produk MODIFY deskripsi text;

ALTER TABLE produk DROP deskripsi;

ALTER TABLE produk RENAME TO barang;

ALTER TABLE barang RENAME TO produk;

SHOW TABLES;

INSERT into jenis values (1,'Eleltronik'),(2,'Furniture');

SELECT * FROM jenis;

desc produk;

INSERT INTO 
	produk (kode,nama,harga,stok,tgl_produksi,status,idjenis) 
VALUES
	('TV01','TV 32inch',5000000,5,'2022-10-01','Baru',1),
	('KP01','Kipas Angin',500000,15,'2022-08-01','Baru',1),
	('LM01','Lemari Perabot',750000,1,'2020-01-01','Second',2),
	('LM02','Lemari Buku',3000000,4,'2022-07-01','Baru',2),
	('KR01','Kursi Belajar',1000000,6,'2022-06-01','Baru',2);

UPDATE produk set harga = harga - (0.1 * harga) WHERE status <> 'Second';

UPDATE produk set harga = harga + (0.2 * harga) WHERE status = 'Second';

DELETE FROM produk WHERE id = 5;

INSERT INTO 
	produk (kode,nama,harga,stok,tgl_produksi,status,idjenis) 
VALUES
	('KP02','Kipas Angin',150000,2,'2022-03-01','Second',1);


-- latihan 3 10-10-22

SELECT * FROM jenis;

SELECT * FROM produk;

SELECT  kode, nama, harga, stok from produk;

-- where
SELECT  * FROM produk WHERE stok >= 5;
SELECT kode,nama,harga,stok, status  FROM produk WHERE status = 'Second';


-- sub query

SELECT nama,stok, harga as harga_terendah from produk WHERE harga = (SELECT min(harga) from produk);

SELECT nama,stok, harga as harga_tertinggi from produk WHERE harga = (SELECT MAX(harga) from produk);

-- distinct
SELECT DISTINCT harga  from produk;

-- gerbang logic
SELECT kode,nama,harga,stok FROM produk WHERE harga >= 1000000 AND stok >= 5;
SELECT kode,nama,harga,stok FROM produk WHERE harga >= 1000000 OR stok >= 5;

-- in
SELECT kode,nama,harga,stok FROM produk WHERE kode IN('LM01','LM02');
SELECT kode,nama,harga,stok FROM produk WHERE kode NOT IN('LM01','LM02');

-- limit, ofset
SELECT nama,harga,stok,status FROM produk LIMIT 3;
SELECT nama,harga,stok,status FROM produk LIMIT 3 OFFSET 3;

-- sum, max, min, avg, count
SELECT SUM(harga) AS total_harga FROM produk;
SELECT MAX(harga) AS harga_tertinggi FROM produk;
SELECT MIN(harga) AS harga_terendah FROM produk;
SELECT AVG(harga) AS harga_rata2 FROM produk;
SELECT COUNT(nama) AS jml_produk FROM produk;

-- order by
SELECT status,nama,stok,harga FROM produk ORDER BY harga;
SELECT status,nama,stok,harga FROM produk ORDER BY harga ASC;
SELECT nama,harga,stok,status FROM produk ORDER BY harga DESC;

-- case

SELECT nama, harga, stok, status,
CASE 
	when stok > 10 then 'lebih'
	when stok >= 5 and stok <= 10 THEN 'cukup'
	ELSE 'kurang'
	END AS status_stok
FROM produk;

-- like 
SELECT nama,harga,stok,status FROM produk WHERE nama LIKE 'lemari%';
SELECT nama,harga,stok,status FROM produk WHERE nama LIKE '%n';
SELECT nama,harga,stok,status FROM produk WHERE nama LIKE '%lemari%';
SELECT nama,harga,stok,status FROM produk WHERE nama LIKE '___3%';
SELECT nama,harga,stok,status FROM produk WHERE nama NOT LIKE '%lemari%';

UPDATE produk SET stok = 2 WHERE id = 3;

-- group by
SELECT status, SUM(stok) AS total_stok FROM produk GROUP BY status;
SELECT status, COUNT(status) AS jumlah_produk FROM produk GROUP BY status;
