create table employees (
    empid int primary key,
    name varchar(50),
    dept varchar(20),
    city varchar(30),
    gender char(1),
    salary int,
    joindate date,
    role varchar(30)
);

insert into employees values
(1,'alice','hr','new york','f',55000,'2019-03-15','manager'),
(2,'bob','it','chicago','m',72000,'2020-07-22','developer'),
(3,'carol','finance','new york','f',68000,'2018-11-01','analyst'),
(4,'david','hr','chicago','m',52000,'2021-01-10','executive'),
(5,'eve','it','houston','f',85000,'2017-06-30','senior dev'),
(6,'frank','finance','new york','m',74000,'2019-09-14','manager'),
(7,'grace','marketing','chicago','f',60000,'2022-02-28','executive'),
(8,'hank','it','houston','m',90000,'2016-04-05','lead'),
(9,'ivy','hr','new york','f',58000,'2020-12-19','executive'),
(10,'jack','finance','chicago','m',65000,'2021-03-07','analyst'),
(11,'karen','marketing','houston','f',62000,'2018-08-23','manager'),
(12,'leo','it','new york','m',78000,'2019-11-11','developer'),
(13,'mia','hr','chicago','f',53000,'2022-05-16','executive'),
(14,'nate','finance','houston','m',71000,'2017-12-02','manager'),
(15,'olivia','marketing','new york','f',66000,'2020-06-18','analyst'),
(16,'paul','it','chicago','m',82000,'2018-03-27','senior dev'),
(17,'quinn','hr','houston','f',57000,'2021-09-09','executive'),
(18,'rita','finance','new york','f',76000,'2019-01-25','lead'),
(19,'sam','marketing','chicago','m',63000,'2022-07-14','executive'),
(20,'tina','it','houston','f',88000,'2016-10-31','lead'),
(21,'uma','hr','new york','f',60000,'2020-04-03','manager'),
(22,'victor','finance','chicago','m',69000,'2018-07-19','analyst'),
(23,'wendy','marketing','houston','f',64000,'2021-11-27','manager'),
(24,'xander','it','new york','m',95000,'2015-02-14','architect'),
(25,'yara','hr','chicago','f',54000,'2022-09-08','executive'),
(26,'zoe','finance','houston','f',73000,'2019-05-21','manager'),
(27,'aaron','marketing','new york','m',67000,'2020-10-15','analyst'),
(28,'bella','it','chicago','f',80000,'2017-08-06','senior dev'),
(29,'carlos','hr','houston','m',56000,'2021-06-24','executive'),
(30,'diana','finance','new york','f',77000,'2018-02-09','lead');

select * from employees;
-- q1. find the total number of employees in each department.
select dept, count(*) as totalemployees
from employees
group by dept;

-- q2. find the total salary paid per department.
select dept, sum(salary) as totalsalary
from employees
group by dept;

-- q3. find the average salary in each city.
select city, avg(salary) as avgsalary
from employees
group by city;

-- q4. find the maximum salary in each department.
select dept, max(salary) as maxsalary
from employees
group by dept;


-- q5. find the minimum salary in each department.
select dept, min(salary) as minsalary
from employees
group by dept;

-- q6. list departments with their employee count, sorted by count descending.
select dept, count(*) as empcount
from employees
group by dept
order by empcount desc;

-- q7. list cities with total salary, sorted by totalsalary ascending.
select city, sum(salary) as totalsalary
from employees
group by city
order by totalsalary asc;

-- q8. list all employees ordered by department (a-z) and then by salary (highest first).
select name, dept, salary
from employees
order by dept asc, salary desc;

-- q9. list all employees ordered by city (a-z) and then by join date (oldest first).
select name, city, joindate
from employees
order by city asc, joindate asc;

-- q10. list all employees ordered by role (a-z) and then by salary (lowest first).
select name, role, salary
from employees
order by role asc, salary asc;

-- q11. show only departments that have more than 7 employees.
select dept, count(*) as empcount
from employees
group by dept
having count(*) > 7;

-- q12. show departments where the average salary exceeds 65000.
select dept, avg(salary) as avgsalary
from employees
group by dept
having avg(salary) > 65000;

-- q13. show cities where the total salary bill is greater than 650000.
select city, sum(salary) as totalsalary
from employees
group by city
having sum(salary) > 650000;

-- q14. show departments where the maximum salary is at least 80000.
select dept, max(salary) as maxsalary
from employees
group by dept
having max(salary) >= 80000;

-- q15. show roles that appear more than 5 times in the table.
select role, count(*) as rolecount
from employees
group by role
having count(*) > 5;

-- q16. find the overall average salary of all employees.
select avg(salary) as companyavgsalary
from employees;

-- q17. count how many female employees exist in each department.
select dept, count(*) as femalecount
from employees
where gender = 'f'
group by dept;

-- q18. find the highest and lowest salary across the entire company.
select max(salary) as highest,min(salary) as lowest
from employees;

-- q19. find the total salary paid to employees who joined after '2019-01-01'.
select sum(salary) as totalsalary from employees
where joindate > '2019-01-01';

-- q20. find the average salary grouped by gender.
select gender, avg(salary) as avgsalary from employees
group by gender;

-- q21. find total employees grouped by department and city.
select dept, city, count(*) as empcount
from employees
group by dept, city;

-- q22. find average salary grouped by department and gender.
select dept, gender, avg(salary) as avgsalary
from employees
group by dept, gender;

-- q23. find total salary grouped by city and role, ordered by city and total salary descending.
select city, role, sum(salary) as totalsalary
from employees
group by city, role
order by city asc, totalsalary desc;

-- q24. count employees grouped by department and role, show only groups with more than 1 employee.
select dept, role, count(*) as empcount
from employees
group by dept, role
having count(*) > 1;

-- q25. find max salary grouped by city and gender.
select city, gender, max(salary) as maxsalary
from employees
group by city, gender;

-- q26. show departments with avg salary > 60000, ordered by avg salary descending.
select dept, avg(salary) as avgsalary
from employees
group by dept
having avg(salary) > 60000
order by avgsalary desc;

-- q27. show city and department combinations with more than 1 employee, ordered by count descending and city.
select city, dept, count(*) as empcount
from employees
group by city, dept
having count(*) > 1
order by empcount desc, city asc;

-- q28. show roles where total salary exceeds 300000, ordered by total salary ascending.
select role, sum(salary) as totalsalary
from employees
group by role
having sum(salary) > 300000
order by totalsalary asc;

-- q29. list each employee's name in upper case along with the year they joined.
select upper(name) as empname, year(joindate) as joinyear
from employees;

-- q30. find the number of employees who joined each year, sorted by year.
select year(joindate) as joinyear,count(*) as joiners
from employees
group by year(joindate)
order by joinyear asc;