
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
