-- Write your PostgreSQL query statement below
select distinct
email Email
from(
    select 
        email,
        count(email) over(partition by email) no_email
    from Person) t
where no_email> 1