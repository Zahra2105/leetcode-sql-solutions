-- Write your PostgreSQL query statement below

select
    id as Id
from(
    select 
        id,
        recordDate,
        temperature,
        lag(temperature ) over(order by recordDate) previous_temp,
        lag(recordDate ) over(order by recordDate ) previous_date
    from Weather) t
where 
    temperature  > previous_temp and
    recordDate = previous_date + interval '1 day'