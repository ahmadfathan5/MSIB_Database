-- masuk ke database pos
use pos;

-- menampilkan table di database pos
show tables;

-- deskripsi table product dan productlines

desc productlines;

desc products;

-- cara 1 inner join table productlines dan product
SELECT
	products.productCode, 
	products.productName, 
	products.quantityInStock,
	productlines.textDescription
FROM
	products
INNER JOIN
	productlines
ON
	products.productLine = productlines.productLine;  


-- cara 2 inner join table productlines dan product dengan alias
SELECT
	pd.productCode, 
	pd.productName, 
	pd.quantityInStock,
	pl.textDescription
FROM
	products pd
INNER JOIN
	productlines pl
ON
	pd.productLine = pl.productLine;
	
-- outer join (right) table productlines dan product dengan alias
SELECT
	pd.productCode, 
	pd.productName, 
	pd.quantityInStock,
	pl.textDescription
FROM
	products pd
LEFT JOIN
	productlines pl
ON
	pd.productLine = pl.productLine;