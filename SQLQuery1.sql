
/* DML,DQL,DCL */
create database my_database
use my_database
create table employee
(
emp_id int identity(1,1) primary key,
emp_name varchar(20) not null,
emp_salary int not null,
start_date datetime
)
 select * from employee

  Alter table employee add emp_address varchar(20) not null 
  Alter table employee alter column emp_name varchar(30) not null

 -- Drop table employee

  insert into employee(emp_name,emp_salary,start_date,emp_address)values('akansha',10000,GETDATE(),'MUMBAI')
  insert into employee(emp_name,emp_salary,start_date,emp_address)values('ayushi',12000,GETDATE(),'DELHI')
  insert into employee(emp_name,emp_salary,start_date,emp_address)values('ankita',15000,GETDATE(),'PUNE')
   insert into employee(emp_name,emp_salary,start_date,emp_address)values('kajal',15000,GETDATE(),'JHARKHAND')

  update employee set emp_name='sweta' where emp_id=4

  Delete from employee where emp_id=3

   /* Constraints PK,FK */
  create table company
(	
	comp_id int primary key,
	comp_name varchar(50),
	emp_id int foreign key references employee(emp_id)
)
select * from company
insert into company(comp_id,comp_name,emp_id)values(1,'Bridgelab',1)
insert into company(comp_id,comp_name,emp_id)values(2,'HCL',1)
insert into company(comp_id,comp_name,emp_id)values(3,'HP',2)

/* Table level constraint */
create table demoTableLevel
(
	id int primary key,
	teacherID int,
	subjects varchar(55),
	constraint StudID_Sub unique(teacherID,subjects)
)
insert into demoTableLevel(id,teacherID,Subjects)values(1,22,'CS')
insert into demoTableLevel(id,teacherID,Subjects)values(2,22,'DV')
insert into demoTableLevel(id,teacherID,Subjects)values(3,23,'EV')
insert into demoTableLevel(id,teacherID,Subjects)values(4,25,'EV')
insert into demoTableLevel(id,teacherID,Subjects)values(5,25,'MC')
select * from demoTableLevel

/* Where,orderby,group by clause*/
select * from employee where emp_id=1
select * from employee where emp_salary=12000
select * from employee where emp_salary>10000
select emp_name from employee where emp_salary=12000
select * from employee where emp_id=2 order by emp_name desc
select * from employee order by emp_name desc
select comp_name from company GROUP BY comp_name
select emp_name from employee GROUP BY emp_name


/* SUB-QUERIES*/
select * from employee
where emp_id=(select emp_id from company where comp_name='Bridgelab' and comp_id=1)

select * from company
select top 2 percent * from employee

select * from employee
where emp_id IN(select emp_id from company where emp_id=1)


/* joints*/
/* Inner joint*/
SELECT * FROM EMPLOYEE
SELECT * FROM COMPANY

SELECT * FROM EMPLOYEE INNER JOIN  COMPANY
ON EMPLOYEE.emp_id = COMPANY.emp_id

SELECT emp_name,emp_salary,comp_name FROM EMPLOYEE INNER JOIN  COMPANY
ON EMPLOYEE.emp_id = COMPANY.emp_id

/* Right outer join*/
SELECT * FROM EMPLOYEE E RIGHT OUTER JOIN  COMPANY C
ON E.emp_id = C.emp_id

SELECT E.*,C.comp_name FROM EMPLOYEE E RIGHT OUTER JOIN  COMPANY C
ON E.emp_id = C.emp_id

/*  outer join*/
SELECT * FROM EMPLOYEE E FULL OUTER JOIN  COMPANY C
ON E.emp_id = C.emp_id

/* Multiple  join*/
create table Department
(
	Department_ID int primary key,
	Department_Name varchar(20)
)
select * from Department
insert into Department(Department_ID,Department_Name)values(1,'CSE')
insert into Department(Department_ID,Department_Name)values(2,'ME')
insert into Department(Department_ID,Department_Name)values(3,'EEE')
insert into Department(Department_ID,Department_Name)values(4,'CIVIL')

create table Genders
(
	Gender_ID int primary key,
	Gender_Name varchar(20)
)
insert into Genders(Gender_ID,Gender_Name)values(1,'M')
insert into Genders(Gender_ID,Gender_Name)values(2,'F')
select * from Genders
create table Employees
(
	Employee_ID int primary key,
	Employee_Name varchar(55),
	Department_ID int foreign key references Department(Department_ID),
	Gender_ID int foreign key references Genders(Gender_ID)
)
select * from Employees
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(1,'Deepika',1,1)
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(2,'Kajal',1,2)
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(3,'Priyanka',2,1)
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(4,'Ayush',3,2)
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(5,'Sweta',4,1)
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(6,'Saket',2,1)

select Employee_Name,Department_Name,Gender_Name
from Employees
inner join Department on Employees.Department_ID = Department.Department_ID
inner join  Genders on Employees.Gender_ID = Genders.Gender_ID


select Employee_Name,Department_Name,Gender_Name
from Employees
inner join Department on Employees.Department_ID = Department.Department_ID
inner join  Genders on Employees.Gender_ID = Genders.Gender_ID
order by Employee_Name asc


select Department_Name,Gender_Name, count(*) as TotalEmployee
from Employees
inner join Department on Employees.Department_ID = Department.Department_ID
inner join  Genders on Employees.Gender_ID = Genders.Gender_ID
group by Department_Name,Gender_Name
            /* Indexing*/
create table table_employee
(
	id int primary key,
	name varchar(20),
	salary int ,
	gender varchar(20)
)
-- drop table table_employee

insert into table_employee(id,name,salary,gender)values(1,'shalini',2500,'F')
insert into table_employee(id,name,salary,gender)values(3,'sweta',5500,'F')
insert into table_employee(id,name,salary,gender)values(2,'Akansha',2550,'F')
insert into table_employee(id,name,salary,gender)values(5,'Ayushi',1500,'F')
insert into table_employee(id,name,salary,gender)values(4,'priyanka',9500,'F')

select * from table_employee where id=5 
			---------------without indexing-----------
create clustered index CLIDX_table_employee_salary on table_employee (salary asc)
drop index If exists table_employee.IX_table_employee_salary

				------------After indexing-----------

create nonclustered index nonCLIDX_Empdetail on table_employee (name asc,gender)

select * from table_employee
/* View */
Create View view_employees
as
select Employee_Name,Department_Name,Gender_Name
from Employees 
inner join Department on Employees.Department_ID = Department.Department_ID
inner join  Genders on Employees.Gender_ID = Genders.Gender_ID
where Department.Department_Name='CSE'

select * from view_employees


							/* Delete Cascade*/
create table customers
(
	cus_ID int primary key,
	cust_Name varchar (55)
)
insert into customers(cus_ID,cust_Name)values(1,'kajal')
insert into customers(cus_ID,cust_Name)values(2,'sweta')
insert into customers(cus_ID,cust_Name)values(3,'ayush')

create table orders
(
	order_ID int identity(1,1) primary key,
	cus_ID int,
	product_items varchar(125),
	foreign key (cus_ID) references customers(cus_ID)
	On delete set null
)
insert into orders(cus_ID,product_items)values(1,'iphone')
insert into orders(cus_ID,product_items)values(2,'samsung')
insert into orders(cus_ID,product_items)values(3,'one plus')
select * from customers
select * from orders
delete from customers where cus_ID=3

  /* Update Cascade*/
drop table orders
create table orders
(
	order_ID int identity(1,1) primary key,
	cus_ID int,
	product_items varchar(55),
	foreign key (cus_ID) references customers(cus_ID)
	On update Cascade
)
update orders set cus_ID=3 where order_ID=1


/* stored procedure*/

create table tb_students(id int,name varchar(20),branch varchar(20))

insert into tb_students values(1,'simani','ME')
insert into tb_students values(2,'manisha','CSE')
insert into tb_students values(3,'sushmita','EE')
insert into tb_students values(4,'sadhna','CSE')
insert into tb_students values(1,'akshita','CSE')
insert into tb_students values(2,'pratiksha','CSE')

select * from tb_students


--create sp
create procedure sp_students
as
Begin
select * from tb_students where id=1
End

-- execute sp
Execute sp_students




