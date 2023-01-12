-- transaction

show databases;

use dbPegawai_MSIB;

show tables;

SELECT * FROM divisi;

START TRANSACTION; -- untuk memulai transaction
INSERT into divisi (nama) 
values
	('HRD'),
	('Keuangan'),
	('Marketing');
COMMIT; -- untuk membuat hal-hal yang kita lakukan menjadi permanen

DELETE FROM divisi; 
ROLLBACK; -- untuk mengembalikan data yang di ubah sebelumnya, tetapi hanya bisa dilakukan ketika start transaction


-- procedure / function

-- membuat fungsi input jabatan


DELIMITER $$ 
CREATE PROCEDURE inputJabatan(nama varchar(45))
BEGIN
	INSERT INTO jabatan (nama) values (nama);
END$$

CALL inputJabatan('Supervisor');
CALL inputJabatan('Manager');
CALL inputJabatan('Assisten Manager');
CALL inputJabatan('Staff');

DELIMITER $$ 
CREATE PROCEDURE showJabatan()
BEGIN
	SELECT * FROM jabatan;
END$$

CALL shoJabatan;
