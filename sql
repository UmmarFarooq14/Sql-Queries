show databases;
create database ummar;
use ummar;
create table Employee
(
 emp_id int unsigned auto_increment primary key,
 name varchar(20),
 department varchar(20),
 salary decimal,
 date_of_joining date
);
select * from Employee;
insert into Employee values (1,'Ravi','HR',45000.0,'2021-05-10'),(2,'sachin','IT',Null,'2020-09-15'),(3,'siva','sales',55000.0,'2019-12-01'),(4,'Null','IT',60000.0,Null);
-- Write a query to find all employees who joined after January 1, 2020.

select * from Employee
where date_of_joining > '2020-01-01';

-- Write a query to display employees with a salary greater than 50000.

select * from Employee
where salary > 50000;

-- Find employees with missing name or salary.

select * from Employee
where name='Null' or salary='Null';

-- Replace NULL salaries with the average salary of their respective department.

select avg(salary) from employee;
update Employee
set salary = 53333.33
where salary is Null;
set sql_safe_updates =0;

-- Calculate the average salary for each department.
select department,avg(salary) from Employee
group by department;

-- Count the number of employees in each department.

select count(*),department from Employee
group by department ;

-- Find the employee with the highest salary in each department using a subquery

select * from Employee as e1
where salary =(select max(salary) from Employee e2 
where e1.department=e2.department);

-- Write a query to display employees in descending order of their salaries.

select * from Employee
order by salary desc;

-- Retrieve the top 2 highest-paid employees in the IT department.

select department,salary from Employee
where department = 'IT'
order by salary desc
limit 2;

-- Calculate the number of years each employee has worked in the company.

select emp_id,name,department,datediff(curdate(),date_of_joining)/365 as years_worked from  Employee;

-- Find employees whose joining date is on a weekend.

select * from Employee 
where dayofweek(date_of_joining) in (1,7);
