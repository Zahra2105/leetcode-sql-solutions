-- Write your PostgreSQL query statement below
select
    Department,
    Employee,  
    Salary 
from (
    select 
        d.name as Department,
        e.name as Employee,
        e.salary as Salary,
        rank() over (partition by d.name order by e.salary desc ) rn
    from Employee e
    join Department d
    on e.departmentId = d.id) t
where rn = 1

