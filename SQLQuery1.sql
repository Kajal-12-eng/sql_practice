
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