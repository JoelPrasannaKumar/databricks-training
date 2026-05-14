-- 56
select sum(salary) as total_salary
from Employee
where YEAR(hire_date)=2020;

-- 57
select department_id,avg(salary) as average_salary
from Employee
where department_id is not null
group by department_id
order by avg(salary) desc;

-- 58
select department_id,count(*) as emp_count,avg(salary) as average_salary
from Employee
where department_id is not null 
group by department_id
having count(*)>=1 and avg(salary)>55000;

-- 59
select name,hire_date
from Employee
where hire_date>=DATE_SUB('2022-05-18',INTERVAL 2 YEAR)
order by hire_date ;

-- 60
select department_id,count(*) as emp_count,avg(salary) as average_salary
from Employee
where department_id is not null 
group by department_id
having count(*)>2;

-- 61
select e1.name,e1.department_id,e1.salary
from Employee e1
where e1.salary>(
  select avg(e2.salary)
  from Employee e2
  where e2.department_id=e1.department_id
  );

-- 62
select name,hire_date
from Employee 
where hire_date=(
  select hire_date
  from Employee 
  where age=(select MAX(age) from Employee)
  );

-- 63
select d.name,count(p.project_id) as project_cnt
from Department d
left join Project p
on d.department_id=p.department_id
group by d.department_id,d.name
order by project_cnt desc;

-- 64
select d.department_id,e.name,e.salary
from Employee e
join Department d
on e.department_id=d.department_id
join(select department_id,max(salary) as max_salary
     from Employee
     group by department_id
     ) m
     on e.department_id=m.department_id and e.salary=m.max_salary;

-- 65
select e1.name,e1.salary
from Employee e1
where e1.age>(select avg(e2.age)
           from Employee e2
           where e2.department_id=e1.department_id);























