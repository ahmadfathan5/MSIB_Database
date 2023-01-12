-- masuk ke ruang DB dbpegawai melalui CMD
use dbpegawai;

-- tampilkan tabel yang ada di dbpegawai
show tables;

-- tampilkan deskripsi tabel yang ada di dbpegawai
desc divisi;

desc pegawai;

-- gunakan alter tabel untuk menambahkan kolom baru berat_badan, lalu input berat badan semua pegawai secara acak
ALTER TABLE pegawai ADD COLUMN berat_badan char(3);

ALTER TABLE pegawai MODIFY berat_badan int(3);

UPDATE pegawai SET berat_badan = 50 WHERE id = 23;
UPDATE pegawai SET berat_badan = 60 WHERE id = 24;
UPDATE pegawai SET berat_badan = 40 WHERE id = 25;
UPDATE pegawai SET berat_badan = 55 WHERE id = 26;
UPDATE pegawai SET berat_badan = 70 WHERE id = 27;

UPDATE pegawai SET berat_badan = 150 WHERE id = 28;
UPDATE pegawai SET berat_badan = 100 WHERE id = 29;
UPDATE pegawai SET berat_badan = 44 WHERE id = 30;
UPDATE pegawai SET berat_badan = 65 WHERE id = 31;
UPDATE pegawai SET berat_badan = 30 WHERE id = 32;

UPDATE pegawai SET berat_badan = 80 WHERE id = 33;
UPDATE pegawai SET berat_badan = 100 WHERE id = 34;
UPDATE pegawai SET berat_badan = 54 WHERE id = 35;
UPDATE pegawai SET berat_badan = 75 WHERE id = 36;
UPDATE pegawai SET berat_badan = 90 WHERE id = 37;

UPDATE pegawai SET berat_badan = 88 WHERE id = 38;
UPDATE pegawai SET berat_badan = 120 WHERE id = 39;
UPDATE pegawai SET berat_badan = 74 WHERE id = 40;
UPDATE pegawai SET berat_badan = 45 WHERE id = 41;
UPDATE pegawai SET berat_badan = 90 WHERE id = 42;

UPDATE pegawai SET nama = 'Bambang' WHERE id = 23;
UPDATE pegawai SET nama = 'Sambo' WHERE id = 24;
UPDATE pegawai SET nama = 'Jajang' WHERE id = 25;
UPDATE pegawai SET nama = 'Dewi' WHERE id = 26;
UPDATE pegawai SET nama = 'Tifatul' WHERE id = 27;

UPDATE pegawai SET nama = 'Fahri' WHERE id = 28;
UPDATE pegawai SET nama = 'Ridwan' WHERE id = 29;
UPDATE pegawai SET nama = 'Joko' WHERE id = 30;
UPDATE pegawai SET nama = 'Mega' WHERE id = 31;
UPDATE pegawai SET nama = 'Harto' WHERE id = 32;

UPDATE pegawai SET nama = 'Rasyid' WHERE id = 33;
UPDATE pegawai SET nama = 'Jaenal' WHERE id = 34;
UPDATE pegawai SET nama = 'Jubaedah' WHERE id = 35;
UPDATE pegawai SET nama = 'Benyamin' WHERE id = 36;
UPDATE pegawai SET nama = 'Jaelani' WHERE id = 37;

UPDATE pegawai SET nama = 'rara' WHERE id = 38;
UPDATE pegawai SET nama = 'riri' WHERE id = 39;
UPDATE pegawai SET nama = 'ruru' WHERE id = 40;
UPDATE pegawai SET nama = 'rere' WHERE id = 41;
UPDATE pegawai SET nama = 'roro' WHERE id = 42;

UPDATE pegawai SET tmp_lahir = 'Jakarta' WHERE id = 23;
UPDATE pegawai SET tmp_lahir = 'Bandung' WHERE id = 24;
UPDATE pegawai SET tmp_lahir = 'Jakarta' WHERE id = 25;
UPDATE pegawai SET tmp_lahir = 'Semarang' WHERE id = 26;
UPDATE pegawai SET tmp_lahir = 'Depok' WHERE id = 27;

UPDATE pegawai SET tmp_lahir = 'Londo' WHERE id = 28;
UPDATE pegawai SET tmp_lahir = 'Jakarta' WHERE id = 29;
UPDATE pegawai SET tmp_lahir = 'Yogyakarta' WHERE id = 30;
UPDATE pegawai SET tmp_lahir = 'Depok' WHERE id = 31;
UPDATE pegawai SET tmp_lahir = 'Singapura' WHERE id = 32;

UPDATE pegawai SET tmp_lahir = 'Jakarta' WHERE id = 33;
UPDATE pegawai SET tmp_lahir = 'Berlin' WHERE id = 34;
UPDATE pegawai SET tmp_lahir = 'Tokyo' WHERE id = 35;
UPDATE pegawai SET tmp_lahir = 'Jakarta' WHERE id = 36;
UPDATE pegawai SET tmp_lahir = 'Lombok' WHERE id = 37;

UPDATE pegawai SET tmp_lahir = 'Jakarta' WHERE id = 38;
UPDATE pegawai SET tmp_lahir = 'Banjarmasin' WHERE id = 39;
UPDATE pegawai SET tmp_lahir = 'Jakarta' WHERE id = 40;
UPDATE pegawai SET tmp_lahir = 'Lombok' WHERE id = 41;
UPDATE pegawai SET tmp_lahir = 'Bali' WHERE id = 42;

UPDATE pegawai SET tgl_lahir = '1991-10-21' WHERE id = 23;
UPDATE pegawai SET tgl_lahir = '1992-10-05' WHERE id = 24;
UPDATE pegawai SET tgl_lahir = '1993-12-12' WHERE id = 25;
UPDATE pegawai SET tgl_lahir = '1994-11-15' WHERE id = 26;
UPDATE pegawai SET tgl_lahir = '1995-11-25' WHERE id = 27;

UPDATE pegawai SET tgl_lahir = '1995-11-15' WHERE id = 28;
UPDATE pegawai SET tgl_lahir = '1995-02-21' WHERE id = 29;
UPDATE pegawai SET tgl_lahir = '1993-03-26' WHERE id = 30;
UPDATE pegawai SET tgl_lahir = '1992-05-30' WHERE id = 31;
UPDATE pegawai SET tgl_lahir = '1991-06-01' WHERE id = 32;

UPDATE pegawai SET tgl_lahir = '1990-12-20' WHERE id = 33;
UPDATE pegawai SET tgl_lahir = '1999-11-15' WHERE id = 34;
UPDATE pegawai SET tgl_lahir = '1998-10-05' WHERE id = 35;
UPDATE pegawai SET tgl_lahir = '1998-06-11' WHERE id = 36;
UPDATE pegawai SET tgl_lahir = '1997-01-12' WHERE id = 37;

UPDATE pegawai SET tgl_lahir = '1985-06-14' WHERE id = 38;
UPDATE pegawai SET tgl_lahir = '1997-01-14' WHERE id = 39;
UPDATE pegawai SET tgl_lahir = '2000-04-21' WHERE id = 40;
UPDATE pegawai SET tgl_lahir = '2001-03-22' WHERE id = 41;
UPDATE pegawai SET tgl_lahir = '2000-02-28' WHERE id = 42;

UPDATE pegawai SET gender = 'P' WHERE id = 42;

-- tampilkan seluruh data staff
SELECT * FROM pegawai;

-- tampilkan kolom2 tertentu di tabel staff (bebas, contoh: nip,nama,gender,umur)
SELECT nip, nama, gender, tmp_lahir from pegawai;

-- - tampilkan baris2 tertentu di tabel staff (bebas, contoh: menampilkan yang gendernya laki2 saja)
SELECT  * FROM pegawai WHERE gender = 'L';

-- - tampilkan kolom2 dan baris2 tertentu di tabel staff (bebas)
SELECT nip, nama, gender FROM pegawai WHERE  gender = 'P'; 

-- - tampilkan data pegawai yang umurnya di atas 30 tahun dan lahirnya di kota jakarta
SELECT 
	id, nip, nama, tgl_lahir, tmp_lahir ,TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) AS umur 
FROM 
	pegawai;
SELECT 
	id, nip, nama, tgl_lahir, tmp_lahir ,TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) AS umur 
FROM 
	pegawai 
WHERE 
	TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) >= 30 
AND 
	tmp_lahir = 'Jakarta'; 

-- - tampilkan data pegawai dengan klausa key (nip)
SELECT * FROM pegawai WHERE nip = 1101;

-- - tampilkan data pegawai dengan klausa non key (gender)
SELECT * FROM pegawai WHERE gender <> 'L';
 
-- - tampilkan data pegawai dengan klausa in (menyebutkan beberapa nip)
SELECT * FROM pegawai WHERE nip IN (1102, 1112)

-- - tampilkan data pegawai dengan klausa not in (menyebutkan beberapa tempat lahir)
SELECT * FROM pegawai WHERE tmp_lahir NOT IN ('Jakarta', 'Depok', 'Bandung');

-- - tampilkan data pegawai berdasarkan nama secara ascending
SELECT * FROM pegawai ORDER BY nama ASC;

-- - tampilkan data pegawai dari yang berat badan paling gemuk ke paling kurus
SELECT nama, berat_badan FROM pegawai ORDER BY berat_badan DESC;

-- - tampilkan data 5 pegawai teratas gunakan klausa limit
SELECT * FROM pegawai LIMIT 5;

-- - tampilkan data 5 pegawai terbawah gunakan klausa limit offset
SELECT * FROM pegawai LIMIT 5 OFFSET 15;

-- - tampilkan jumlah pegawai gunakan fungsi aggregrat count
SELECT COUNT(nip) AS jumlah FROM pegawai;

-- - tampilkan nip,nama pegawai, umur yg paling tua gunakan fungsi aggregrat max (kombinasi dengan sub query)
SELECT 
	nip, nama, TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) AS umur 
FROM 
	pegawai 
WHERE 
	TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) = (
		SELECT 
			MAX(TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE())) 
		FROM 
			pegawai
		);

-- - tampilkan nip,nama pegawai, berat_badan yg paling kurus gunakan fungsi aggregrat min (kombinasi dengan sub query)
SELECT nip, nama, berat_badan FROM pegawai WHERE berat_badan = (SELECT MIN(berat_badan) FROM pegawai); 

-- - tampilkan data rata2 umur pegawai gunakan fungsi aggregrat avg
SELECT AVG(TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE())) as rata2_umur_pegawai FROM pegawai;

-- - tampilkan jumlah data pegawai yang laki2 gunakan fungsi aggregrat count
SELECT COUNT(gender) as jumlah_pegawai_laki2 FROM pegawai WHERE gender = 'L';

-- - tampilkan jumlah data pegawai yang perempuan gunakan fungsi aggregrat count
SELECT COUNT(gender) as jumlah_pegawai_perempuan FROM pegawai WHERE gender = 'P';

-- - tampilkan total berat badan seluruh pegawai gunakan fungsi aggregrat sum
SELECT berat_badan from pegawai;
SELECT SUM(berat_badan) as total_berat_badan_pegawai FROM pegawai;

-- - tampilkan data jumlah pegawai berdasarkan gender, yg jumlah minimal 10 orang (gunakan group by dan having)
SELECT gender, COUNT(gender) AS jumlah_gender FROM pegawai GROUP BY gender HAVING COUNT(gender) >= 10 ;


select * from pegawai where DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), tgl_lahir)), '%Y') + 0 > 30 && tmp_lahir = 'Jakarta';
