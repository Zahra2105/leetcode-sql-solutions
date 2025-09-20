-- Write your PostgreSQL query statement below
select
    project_id,
    round(avg(experience_years),2) average_years 
from Employee e
inner join Project p
on e.employee_id = p.employee_id 
group by project_id


