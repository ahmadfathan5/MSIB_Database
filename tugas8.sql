-- Restorelah di db kosong tersebut, dari file backup: dbrentalbus.sql
-- sudo /opt/lampp/bin/mysql -u root -p dbRentalBus < /home/ahmadfathan/Unduhan/dbrentalbus.sql
use dbRentalBus;
show tables;
desc kendaraan;
desc sopir;
-- Buatlah trigger: updateStatus dengan ketentuan, jika pelanggan menyewa sebuah bus di tabel transaksi akan mentrigger:
--      Status kendaraan berubah yang sebelum Bebas menjadi Jalan
--      Status sopir yang berubah sebelum Bebas menjadi Jalan

DELIMITER $$
CREATE or REPLACE  TRIGGER updateStatus 
AFTER INSERT ON transaksi 
FOR EACH ROW 
BEGIN 
	UPDATE kendaraan SET status = 'Jalan' WHERE id = NEW.idKendaraan;
	UPDATE sopir SET status = 'Jalan' WHERE id = NEW.idSopir;
END$$
DELIMITER ;
INSERT INTO `transaksi`(`id`, `idpelanggan`, `idsopir`, `idkendaraan`, `tglmulai`, `tglselesai`, `lamasewa`, `tglovertime`, `jmlovertime`, `total`, `status`) VALUES (DEFAULT,'1','1','3','2022-02-01','2022-02-02','5','2022-02-03',NULL,'1000000','Mulai')

select * FROM kendaraan k ;
SELECT * FROM sopir s ;
SELECT * FROM transaksi t ;


-- trigerr update status selesai
DELIMITER $$
CREATE or REPLACE  TRIGGER updateStatusSelesai
AFTER UPDATE  ON transaksi 
FOR EACH ROW 
BEGIN 
	UPDATE kendaraan SET status = 'Bebas' WHERE id = NEW.idKendaraan;
	UPDATE sopir SET status = 'Bebas' WHERE id = NEW.idSopir;
END$$
DELIMITER ;

UPDATE transaksi SET status = 'Selesai' WHERE id = 8;
SELECT * FROM kendaraan k ;
SELECT * FROM sopir s;

-- Backuplah database dbrental_bus Anda menjadi dbbackup_rentalbus.sql
sudo /opt/lampp/bin/mysqldump -u root -p dbRentalBus > /home/ahmadfathan/proyek/MSIB/database/dbrentalbus_new.sql






