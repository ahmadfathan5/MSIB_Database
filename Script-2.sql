use pos;
SELECT * FROM orders o ;
select * FROM  orderdetails o ;
SELECT  * FROM  products p ;

10100
S10_1678

-- buat triger kurangin stok saat terjadi transaksi orderdetails

delimiter $$
CREATE Trigger kurangiStok
after INSERT on orderdetails
for EACH ROW 
BEGIN 
	UPDATE products set quantityInStock = quantityInStock - NEW.quantityOrdered
	WHERE productCode = NEW.productCode;
END $$
delimiter ;

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber) VALUES ('10101', 'S10_1678', 100, 5000, '3');


-- normaliasasi stock
delimiter $$
CREATE trigger normalisasiStock
after DELETE  on orderdetails
for EACH ROW 
BEGIN 
	UPDATE products set quantityInStock = quantityInStock + OLD.quantityOrdered
	WHERE productCode = OLD.productCode;
END$$
delimiter ;