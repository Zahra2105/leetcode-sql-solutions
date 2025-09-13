-- Write your PostgreSQL query statement below
with mod_per as(
    select 
        id,
        email,
        row_number() over(partition by email order by id) rn
    from Person
)
delete from Person
where id in (
    select id from mod_per where rn>1
)