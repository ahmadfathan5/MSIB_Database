use pos;

-- inner join 2 table: customers dan table orders 
select 
	customers.customerName, 
	customers.phone, 
	customers.city,
	orders.orderDate,
	orders.shippedDate, 
	orders.status 
from
	orders 
inner join
	customers
on
	orders.customerNumber = customers.customerNumber;

-- inner join 2 table: customers dan table orders dengan alias
select 
	c.customerName, 
	c.phone, 
	c.city,
	o.orderDate,
	o.shippedDate,
	o.status 
from
	orders as o
inner join
	customers as c
on
	o.customerNumber = c.customerNumber;

-- outer join 2 table: customers dan table orders dengan alias
-- untuk mengetahui apakah customers melakukan pemesanan atau tidak
select 
	c.customerName, 
	c.phone, 
	c.city,
	o.orderDate,
	o.shippedDate,
	o.status 
from
	orders as o
right join
	customers as c
ON
	o.customerNumber = c.customerNumber;

-- outer join 2 table: customers dan table orders dengan alias
-- untuk mengetahui pemesanan di tahun 2004
select 
	c.customerName, 
	c.phone, 
	c.city,
	o.orderDate,
	o.shippedDate,
	o.status 
from
	orders as o
right join
	customers as c
ON
	o.customerNumber = c.customerNumber
WHERE  
	YEAR (o.status) = 2004;
	
-- outer join 2 table: customers dan table orders dengan alias
-- untuk mengetahui jumlah masing2 status per customers menggunakan group by
-- yang lebih dari 5
select 
	c.customerName, 
	o.status,
	count(o.status) as jumlah
from
	orders as o
inner join
	customers as c
ON
	o.customerNumber = c.customerNumber
GROUP BY  
	c.customerName
HAVING  
	jumlah >= 5;


-- inner join 4 table: customers , orders , orderdetails , products 
-- menggunakan alias table
select 
	c.customerName, 
	c.phone,
	c.city,
	o.orderDate,
	o.shippedDate,
	o.status,
	p.productName,
	o2.quantityOrdered,
	o2.priceEach
from
	orderdetails o2 
inner join
	orders o ON o.orderNumber = o2.orderNumber
inner join
	customers c ON c.customerNumber = o.customerNumber
inner join
	products p ON p.productCode = o2.productCode;

-- buat table view(bayangan)
create view orderdetails_vw as 
select 
	c.customerName, 
	c.phone,
	c.city,
	o.orderDate,
	o.shippedDate,
	o.status,
	p.productName,
	o2.quantityOrdered,
	o2.priceEach
from
	orderdetails o2 
inner join
	orders o ON o.orderNumber = o2.orderNumber
inner join
	customers c ON c.customerNumber = o.customerNumber
inner join
	products p ON p.productCode = o2.productCode;

-- memanggil view
select * from orderdetails_vw;



