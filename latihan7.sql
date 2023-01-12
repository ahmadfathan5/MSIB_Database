use pos;

show tables;
desc customers;
desc employees ;

-- INDEXING

-- buatkan index untuk kolom customerName agar lebih cepat ketika dicari
CREATE INDEX pelanggan_idx on customers(customerName);

-- buatkan index untuk kolom nama pegawai agar lebih cepat ketika dicari
CREATE INDEX pegawai_idx on employees(firstName);

-- join multiple table (8 table)
select 
	c.customerName, 
	p3.productName, 
	o2.orderDate, 
	o2.status, 
	o3.quantityOrdered, 
	o3.priceEach,
	p2.textDescription,
	p.paymentDate,
	e.firstName,
	o.city 
from
	orderdetails o3
INNER JOIN
	orders o2 on o2.orderNumber = o3.orderNumber
INNER  JOIN 
	products p3 on p3.productCode = o3.productCode
INNER JOIN 
	productlines p2 on p2.productLine = p3.productLine 
INNER JOIN 
	customers c on c.customerNumber = o2.customerNumber 
INNER JOIN 
	payments p on c.customerNumber = p.customerNumber
INNER JOIN 
	employees e on e.employeeNumber = c.salesRepEmployeeNumber 
INNER JOIN 
	offices o on o.officeCode = e.officeCode;
	
-- membuat vie dari join multiple table (8 table)
create view data_pesanan_pelanggan_vw as
select 
	c.customerName, 
	p3.productName, 
	o2.orderDate, 
	o2.status, 
	o3.quantityOrdered, 
	o3.priceEach,
	p2.textDescription,
	p.paymentDate,
	e.firstName,
	o.city 
from
	orderdetails o3
INNER JOIN
	orders o2 on o2.orderNumber = o3.orderNumber
INNER  JOIN 
	products p3 on p3.productCode = o3.productCode
INNER JOIN 
	productlines p2 on p2.productLine = p3.productLine 
INNER JOIN 
	customers c on c.customerNumber = o2.customerNumber 
INNER JOIN 
	payments p on c.customerNumber = p.customerNumber
INNER JOIN 
	employees e on e.employeeNumber = c.salesRepEmployeeNumber 
INNER JOIN 
	offices o on o.officeCode = e.officeCode;	

-- memanggil view
select * FROM data_pesanan_pelanggan_vw

