use dbPegawai_MSIB;
ALTER TABLE pegawai DROP divisi_id;
ALTER TABLE pegawai CHANGE divisi_id divisi_id1 int(11);

desc pegawai;
desc jabatan;
desc divisi;
desc gaji;

SELECT * FROM divisi d;
SELECT * FROM pegawai p;
SELECT * FROM jabatan j;
SELECT * FROM gaji g;

DELETE FROM pegawai;  

INSERT INTO pegawai(nip, nama, gender, tmp_lahir, tgl_lahir, alamat, jabatan_id, divisi_id1) VALUES (109, 'jajang', 'Laki', 'Jakarta', '2020-01-06', 'jl. road 1', 2, 1);

-- Buat index untuk kolom nama pegawai dengan nama: nama_pegawai_idx
CREATE INDEX nama_pegawai_idx ON pegawai(nama);

-- Buat fungsi inputPegawai(8 parameter...), setelah itu panggil fungsinya


DELIMITER $$
CREATE PROCEDURE inputPegawai(
	nip char(3), 
	nama varchar(45), 
	gender enum('L','P'), 
	tmp_lahir varchar(45), 
	tgl_lahir date, 
	alamat text,  
	jabatan_id int(11), 
	divisi_id int(11))
BEGIN
	INSERT INTO pegawai(nip, nama, gender, tmp_lahir, tgl_lahir, alamat, jabatan_id, divisi_id1) VALUES (nip, nama, gender, tmp_lahir, tgl_lahir, alamat, jabatan_id, divisi_id);
END$$
DELIMITER ;

CALL inputPegawai(103, 'Ujang', 'L', 'Bogor', '1997-04-01', 'jl. road 3', 3, 1);
CALL inputPegawai(104, 'Bambang', 'L', 'Bekasi', '1992-04-01', 'jl. road 4', 4, 2);
SELECT @inputPegawai$$
-- Buat fungsi showPegawai(), setelah itu panggil fungsinya
DELIMITER $$
CREATE PROCEDURE showPegawai()
BEGIN
	SELECT * FROM pegawai;
END$$
DELIMITER ;

CALL showPegawai();

-- Buat fungsi inputGaji(3 parameter[gapok, tunjab dan pegawai_id]), setelah itu panggil fungsinya
desc gaji;

DELIMITER $$
CREATE PROCEDURE inputGaji(
	gapok double, 
	tunjab double,  
	pegawai_id int(11))
BEGIN
	INSERT INTO gaji(gapok, tunjab, pegawai_id) VALUES (gapok, tunjab, pegawai_id);
END$$
DELIMITER ;

CALL inputGaji(15000000, 5000000, 5);
CALL inputGaji(15000000, 5000000, 6);
CALL inputGaji(15000000, 5000000, 7);

-- Buat fungsi showGaji(), setelah itu panggil fungsinya
DELIMITER $$
CREATE PROCEDURE showGaji()
BEGIN
	SELECT * FROM gaji;
END$$
DELIMITER ;

CALL showGaji();

-- Buat fungsi totalGaji(in gapok, in tunjab, out total), setelah itu panggil fungsinya
desc gaji;
SELECT gapok FROM gaji WHERE pegawai_id = 5;
SELECT tunjab FROM gaji WHERE pegawai_id = 5;

CREATE PROCEDURE totalGaji(in gapok double, in tunjab int, out total double)
BEGIN
	SET total = gapok + tunjab;
	SELECT @total;
END;

DELIMITER $$
CREATE PROCEDURE totalGaji(in idPegawai int(11), out @total double)
BEGIN
	SET gapok = (SELECT gapok FROM gaji WHERE pegawai_id = idPegawai);
	SET tunjab = (SELECT tunjab FROM gaji WHERE pegawai_id = idPegawai);
	SET total = gapok + tunjab;
	SELECT @total
END$$
DELIMITER ;

CALL totalGaji(15000000, 5000000, @totalGaji);
SELECT @totalGaji AS total_gaji;

-- tampilkan slip gaji

DELIMITER $$
CREATE PROCEDURE slipGaji()
BEGIN
	SELECT *, @total FROM gaji ;
END$$
DELIMITER ;

CALL slipGaji();
SELECT @slipGaji;

-- SELECT pegawai.nip, pegawai.nama, jabatan.nama AS posisi, divisi.nama AS departemen,
-- gaji.gapok, gaji.tunjab, SELECT @totalGaji(parameter2...) FROM pegawai
-- INNER JOIN ke tabel gaji, divisi dan jabatan

SELECT 
	p.nip, p.nama, 
	j.nama as posisi, 
	d.nama as departemen,
	g.gapok, g.tunjab,
	(SELECT @totalGaji) as total_gaji
FROM 
	pegawai p 
INNER JOIN 
	jabatan j on p.jabatan_id = j.id
INNER JOIN 
	divisi d on p.divisi_id1 = d.id 
INNER JOIN 
	gaji g on g.pegawai_id = p.id;

-- buatkan query panjang di atas menjadi sebuah view baru: slip_gaji_pegawai_vw
CREATE or REPLACE VIEW slip_gaji_pegawai_vw as 
SELECT 
	p.nip, p.nama, 
	j.nama as posisi, 
	d.nama as departemen,
	g.gapok, g.tunjab,
	(g.gapok + g.tunjab) as total_gaji  
FROM 
	pegawai p 
INNER JOIN 
	jabatan j on p.jabatan_id = j.id
INNER JOIN 
	divisi d on p.divisi_id1 = d.id 
INNER JOIN 
	gaji g on g.pegawai_id = p.id;

SELECT * FROM  slip_gaji_pegawai_vw;






-- test
UPDATE gaji set gapok = 20000000 WHERE pegawai_id = 7;

SELECT * FROM gaji g ;
SELECT * FROM pegawai p ;

SET @pegawai_id = 7;
CALL THP(@pegawai_id, @gatot);
SELECT @gatot AS total_gaji;


SELECT pegawai.nip, pegawai.nama, jabatan.nama AS posisi, divisi.nama AS departemen,
gaji.gapok, gaji.tunjab, @gatot AS total_gaji FROM pegawai
INNER JOIN gaji ON gaji.pegawai_id = pegawai.id
INNER JOIN divisi ON divisi.id = pegawai.divisi_id1
INNER JOIN jabatan ON jabatan.id = pegawai.jabatan_id;

desc pegawai;
desc gaji;
SELECT * FROM pegawai p  ;
SELECT * FROM gaji;
SELECT * FROM jabatan j ;
SELECT * FROM divisi d ;

CALL inputPegawai(107, 'Gugun', 'L', 'Serang', '1997-12-21', 'jl. road 7', 2, 2);
-- trigger new
DELIMITER $$
CREATE or REPLACE TRIGGER autoSetGapok
AFTER INSERT ON pegawai
FOR EACH ROW 
BEGIN 
	IF NEW.jabatan_id = 4 THEN 
		INSERT INTO gaji (gapok,tunjab,pegawai_id) VALUES (15000000,5000000,NEW.id);
	ELSEIF NEW.jabatan_id = 2 THEN 
		INSERT INTO gaji (gapok,tunjab,pegawai_id) VALUES (10000000,3000000,NEW.id);
	ELSEIF NEW.jabatan_id = 1 THEN 
		INSERT INTO gaji (gapok,tunjab,pegawai_id) VALUES (6000000,2500000,NEW.id);
	ELSE 
		INSERT INTO gaji (gapok,tunjab,pegawai_id) VALUES (3000000,500000,NEW.id);
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE or REPLACE TRIGGER autoSetGapok
AFTER INSERT ON pegawai
FOR EACH ROW 
BEGIN 
	IF NEW.jabatan_id = 4 THEN 
		INSERT INTO gaji (gapok,tunjab,pegawai_id) VALUES (15000000,5000000,NEW.id);
	ELSEIF NEW.jabatan_id = 2 THEN 
		INSERT INTO gaji (gapok,tunjab,pegawai_id) VALUES (10000000,3000000,NEW.id);
	ELSEIF NEW.jabatan_id = 1 THEN 
		INSERT INTO gaji (gapok,tunjab,pegawai_id) VALUES (6000000,2500000,NEW.id);
	ELSE 
		INSERT INTO gaji (gapok,tunjab,pegawai_id) VALUES (3000000,500000,NEW.id);
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE or REPLACE TRIGGER autoDeleteGapok
BEFORE DELETE ON pegawai
FOR EACH ROW 
BEGIN 
	DELETE FROM gaji g WHERE pegawai_id = OLD.id;
END$$
DELIMITER ;

DELIMITER $$
CREATE or REPLACE TRIGGER autoEditGapok
AFTER UPDATE ON pegawai
FOR EACH ROW 
BEGIN 
	IF NEW.jabatan_id = 4 THEN 
		UPDATE gaji SET gapok = 15000000, tunjab = 5000000 WHERE pegawai_id = OLD.id;
	ELSEIF NEW.jabatan_id = 2 THEN 
		UPDATE gaji SET gapok = 10000000, tunjab = 3000000 WHERE pegawai_id = OLD.id;
	ELSEIF NEW.jabatan_id = 1 THEN 
		UPDATE gaji SET gapok = 6000000, tunjab = 2500000 WHERE pegawai_id = OLD.id;
	ELSE 
		UPDATE gaji SET gapok = 3000000, tunjab = 500000 WHERE pegawai_id = OLD.id;
	END IF;
END$$
DELIMITER ;

SHOW TRIGGERS




SELECT * FROM jabatan j;


CALL inputPegawai(131, 'rambo', 'L', 'Bogor', '1997-04-01', 'jl. road 3', 5, 1);





