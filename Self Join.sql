create database selfjoindb;
use selfjoindb;

create table employees(eid int, name varchar(20),manager_id int);

insert into employees values(1,'tushar',null),(2,'abhinav',1),(3,'sakshi',1),(4,'akshay',2);
select * from employees;

select emp.eid,emp.name,emp.manager_id,mngr.eid,mngr.name from employees as emp
join employees as emp left join employees  as mngr
on emp.manager_id=mngr.eid;




-- Q1
select e.emp_id , e.emp_name , d.dept_name , d.location 
from employees e
inner join departments d 
on e.dept_id = d.dept_id;

-- Q2. 
select p.proj_id , p.proj_name , d.dept_name , p.budget
from projects p 
inner join departments d 
on p.dept_id = d.dept_id;

-- Q3. 
select e.emp_name, d.dept_name, p.proj_name
from employees e
inner join departments d
on e.dept_id = d.dept_id
inner join projects p
on d.dept_id = p.dept_id;

-- Q4. 
select e.emp_id , e.emp_name  , d.dept_id , d.dept_name 
from employees e 
left join departments d 
on e.dept_id = d.dept_id; 

-- Q5. 
select d.dept_id , d.dept_name , p.proj_name , p.budget 
from departments d 
left join projects p 
on d.dept_id = p.dept_id;

-- Q6.
select e.emp_id , e.emp_name , e.dept_id 
from employees e 
left join departments d 
on e.dept_id = d.dept_id
where d.dept_id is null;

-- Q7.
select e.emp_name , d.dept_id , d.dept_name 
from employees e 
right join departments d 
on e.dept_id = d.dept_id;

-- Q8. 
select d.dept_name , p.proj_id , p.proj_name , p.dept_id 
from departments d 
right join projects p 
on d.dept_id = p.dept_id;

-- Q9. .
select d.dept_id , d.dept_name , d.location 
from departments d 
left join employees e 
on e.dept_id = d.dept_id
where e.emp_id is null;

-- Q10.
select e.emp_name,e.salary,d.dept_name
from employees e
cross join departments d
where e.salary > 70000 and d.dept_name in ('Finance', 'Legal');
  
-- Q11. 
select p.proj_name , p.budget , d.dept_name , d.location
from  projects p 
cross join departments d 
where budget >= 400000 and d.location in ('mumbai','pune');

-- Q12. 
select count(*) as total_combination 
from employees 
cross join departments ;

-- Q13. 
select * from employees 
where salary > 60000;

-- Q14.
select * from employees 
where city In ('Delhi','Mumbai');

-- Q15. 
select * from employees 
where dept_id is null ; 

-- Q16. 
select * from departments 
where location In ('Bangalore','Delhi');

-- Q17. 
select * from departments 
where dept_id >= 30;

-- Q18. 
select * from departments 
where dept_name LIKE 'F%' or dept_name LIKE 'L%';

-- Q19. 
select * from projects 
where budget between 200000 and 400000;

-- Q20. 
select * from projects 
where dept_id = 20;


--
select p.proj_name,p.dept_id,p.budget,d.dept_id,d.dept_name from projects as p
join departments as d
on p.dept_id = d.dept_id
group by dept_name;

select d.dept_name,count(*)
from employees as e
join departments as d on e.dept_id = d.dept_id
group by d.dept_name 








