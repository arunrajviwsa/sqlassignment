-- Write a query to display all the first_name  in upper case
select upper(first_name) as First_name from Worker;
-- Write a querty to display unique department from workers table
select distinct department from Worker;
-- Write an SQL query to print the first three characters of FIRST_NAME from Worker table

select SUBSTRING( first_name, 1, 3 ) as First_name from Worker;

-- Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
SELECT POSITION('a' in 'first_name') AS MatchPosition from Worker where first_name ='Amitabh';
---- Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length;
select distinct Length(department) as  Length_department from worker ;
-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending
select worker_id,first_name,last_name,salary,joining_date,department from  worker order by first_name asc ,department desc;
-- Write a query to get workers whose name are Vipul and Satish
select worker_id,first_name,last_name,salary,joining_date,department from worker where first_name in('Vipul','Satish');
-- Write an SQL query to print details of the Workers whose FIRST_NAME contains 'a'
select * from worker where first_name like '%a%';
-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets
select worker_id,first_name,last_name,salary,joining_date,department from worker where first_name like '_____h%';
-- Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000
select worker_id,first_name,last_name,salary,joining_date,department from worker where salary between 100000 and 500000;
-- Write an SQL query to print details of the Workers who have joined in Feb’2014
select  worker_id,first_name,last_name,salary,joining_date,department from worker  where MONTH(joining_date)=2 and YEAR(joining_date)=2014;
-- Write an SQL query to fetch the count of employees working in the department ‘Admin’
select count(worker_id) as No_of_workers from worker where department='Admin';
-- Write an SQL query to fetch the no. of workers for each department in the descending order
select count(worker_id) as No_of_workers,department  from worker group by department order by department desc ;
-- Write a query to display workerrs who are managers
select  w.worker_id,w.first_name,w.last_name,w.salary,w.joining_date,w.department,t.worker_title from worker w inner join title t on t.WORKER_REF_ID=w.worker_id  where t.worker_title='Manager';
-- select * from worker w inner join Bonus b on b.WORKER_REF_ID=w.worker_id inner join title t on t.WORKER_REF_ID=b.WORKER_REF_ID  where t.worker_title='Manager'
-- Write query to find duplicate rows title table
select worker_title,affected_from,count(*) as Number_of_duplicates from title group by worker_title,affected_from having count(*) > 1;
-- Write an SQL query to show all workers who got the bonus along with bonus amount
select distinct w.worker_id,w.first_name,w.last_name,w.salary,w.joining_date,w.department,b.BONUS_AMOUNT  from worker w inner join Bonus b on b.WORKER_REF_ID=w.worker_id ;
-- Write a query to find employees in worker table that do not exist in bonus table (ie did not get bonus)
select w.worker_id,w.first_name,w.last_name,w.salary,w.joining_date,w.department  from worker w where w.worker_id not in (select WORKER_REF_ID from bonus );
-- Write a query to find the highest 2 salaries
select * from worker w order by w.salary desc limit 2;
-- Find 2nd highest without using TOP or LIMIT
SELECT worker_id,first_name, salary
FROM worker
WHERE salary = (
    SELECT MAX(salary)
    FROM worker
    WHERE salary < (SELECT MAX(salary) FROM worker)
);
-- Find people who have the same salary
SELECT worker_id,first_name,salary FROM worker where salary in(select salary from worker group by salary having count(worker_id) >1;
-- Write a query to fetch 1st 50% records without using Top

select worker_id,first_name,last_name,salary,joining_date,department 
from (select w.worker_id,w.first_name,w.last_name,w.salary,w.joining_date,w.department , ntile(2) over(order by worker_id) nt from worker w) t
where nt = 1
-- Write a query to select a department with more than 3 people in worker table
select department ,count(worker_id) from worker group by department having count(worker_id) >3;
-- Write a query to select 1st and last row of a worker table
(select w.worker_id,w.first_name,w.last_name,w.salary,w.joining_date,w.department from worker w limit 1)
union all
(select w.worker_id,w.first_name,w.last_name,w.salary,w.joining_date,w.department from worker w order by worker_id desc limit 1)
-- Write a query to select last 5 entries from worker table
select w.worker_id,w.first_name,w.last_name,w.salary,w.joining_date,w.department from worker w order by  worker_id desc limit 5 
-- Write a query to select people with highest salary in each group
select w.department,count(w.worker_id),max(w.salary) as highest_salary from worker w group by w.department;
-- Write a query to fetch departments along with the total salaries paid for each of them
select w.department,count(w.worker_id),sum(w.salary) as total_salary from worker w group by w.department;