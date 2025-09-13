-- Write your PostgreSQL query statement below
select 
    name
from SalesPerson s
where not exists(
    select 1
    from Orders o
    join Company c
    on o.com_id= c.com_id
    where 
        o.sales_id = s.sales_id and
        c.name= 'RED'

)