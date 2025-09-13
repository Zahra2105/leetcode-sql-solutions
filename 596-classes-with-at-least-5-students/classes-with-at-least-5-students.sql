-- Write your PostgreSQL query statement below
select 
    class
from Courses
group by class
having count(student)>= 5
order by count(student) desc
