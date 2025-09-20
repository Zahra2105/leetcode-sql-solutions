-- Write your PostgreSQL query statement below
select
    activity_date as "day",
    count(distinct user_id) active_users 
from Activity
where activity_date between DATE '2019-06-28' and DATE '2019-07-27'
group by activity_date

