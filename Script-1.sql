-- masuk ke db pos
use pos;

-- tampilkan table yang ada pada db pos
show tables;

-- lihat deskripsi table offices, employees, customers, payments
desc offices;
desc employees;
desc customers;
desc payments;

-- 1. Buat INNER JOIN 4 TABLE:
-- 
--    offices: addressLine1, phone, city as kota
-- 
--    employees: firstName, email, jobTitle
-- 
--    customers: customerName, phone as telp, city
-- 
--    payments: paymentDate, amount

SELECT 
	o.addressLine1,
	o.phone,
	o.city as kota,
	e.firstName,
	e.email,
	e.jobTitle,
	c.customerName,
	c.phone as telp,
	c.city,
	p.paymentDate,
	p.amount
FROM
	customers c 
inner join 
	payments p on c.customerNumber = p.customerNumber
INNER JOIN 
	employees e on c.salesRepEmployeeNumber = e.employeeNumber
INNER JOIN 
	offices o on e.officeCode = o.officeCode;

-- 2. Setelah itu buat tabel viewnya: customer_vw
CREATE VIEW customers_vw as
SELECT 
	o.addressLine1,
	o.phone,
	o.city as kota,
	e.firstName,
	e.email,
	e.jobTitle,
	c.customerName,
	c.phone as telp,
	c.city,
	p.paymentDate,
	p.amount
FROM
	customers c 
inner join 
	payments p on c.customerNumber = p.customerNumber
INNER JOIN 
	employees e on c.salesRepEmployeeNumber = e.employeeNumber
INNER JOIN 
	offices o on e.officeCode = o.officeCode;

-- 3. Tampilkan view customer_vw
SELECT * FROM customers_vw;




