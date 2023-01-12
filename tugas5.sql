-- masuk ke database pos
show databases;

use pos;

-- manampilkan table pada database pos
show tables;

-- melihat deskripsi table employees 
desc employees ;

-- melihat deskripsi table offices 
desc offices ;

-- inner join table employees dan table offices 
select
	employees.employeeNumber,
	employees.firstName,
	employees.lastName,
	employees.jobTitle,
	offices.officeCode,
	offices.city,
	offices.state
FROM  
	employees
inner join
	offices 
ON
	employees.officeCode = offices.officeCode;

-- inner join table employees dan table offices dengan menggunakan alias
select
	emp.employeeNumber,
	emp.firstName,
	emp.lastName,
	emp.jobTitle,
	off.officeCode,
	off.city,
	off.state
FROM  
	employees as emp
inner join
	offices as off
ON
	emp.officeCode = off.officeCode;

-- outer join (right) table employees dan table offices dengan menggunakan alias
select
	emp.employeeNumber,
	emp.firstName,
	emp.lastName,
	emp.jobTitle,
	off.officeCode,
	off.city,
	off.state
FROM  
	employees as emp
right join
	offices as off
ON
	emp.officeCode = off.officeCode;

-- outer join (left) table employees dan table offices dengan menggunakan alias
select
	emp.employeeNumber,
	emp.firstName,
	emp.lastName,
	emp.jobTitle,
	off.officeCode,
	off.city,
	off.state
FROM  
	employees as emp
left join
	offices as off
ON
	emp.officeCode = off.officeCode;