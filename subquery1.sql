#subquery
create database company_db4;

use company_db4;

create table employees (
    emp_id int primary key,
    emp_name varchar(50),
    department varchar(30),
    salary int,
    manager_id int
);

create table departments (
    dept_id int primary key,
    department varchar(30),
    location varchar(30)
);

insert into employees values
(1, 'rahul', 'it', 60000, 5),
(2, 'priya', 'hr', 45000, 6),
(3, 'amit', 'it', 75000, 5),
(4, 'neha', 'sales', 50000, 7),
(5, 'rohit', 'it', 90000, null),
(6, 'pooja', 'hr', 70000, null),
(7, 'karan', 'sales', 65000, null),
(8, 'simran', 'it', 55000, 5),
(9, 'arjun', 'sales', 40000, 7),
(10, 'riya', 'hr', 52000, 6);

insert into departments values
(1, 'it', 'jaipur'),
(2, 'hr', 'delhi'),
(3, 'sales', 'mumbai');


-- Q1. Find employees whose salary is greater than the average salary of all employees.
select emp_name, salary
from employees
where salary > (
    select avg(salary)
    from employees
);
-- Q2. Find the employee who has the highest salary.
select emp_name, salary
from employees
where salary = (
    select max(salary)
    from employees
);
-- Q3. Find employees who earn more than Rahul.
select emp_name, salary
from employees
where salary > (
    select salary
    from employees
    where emp_name = 'rahul'
);
-- Q4. Find employees who earn less than the average salary.
select emp_name, salary
from employees
where salary < (
    select avg(salary)
    from employees
);
-- Q5. Find the second-highest salary.
select max(salary) as second_highest_salary
from employees
where salary < (
    select max(salary)
    from employees
);
-- Q6. Find employees who work in the same departments as Rahul and Amit.
select emp_name, department
from employees
where department in (
    select department
    from employees
    where emp_name in ('rahul', 'amit')
);
-- Q7. Find employees who work in departments located in Jaipur.
select emp_name, department
from employees
where department in (
    select department
    from departments
    where location = 'jaipur'
);
-- Q8. Find departments that have at least one employee.
select department
from departments d
where exists (
    select 1
    from employees e
    where e.department = d.department
);


