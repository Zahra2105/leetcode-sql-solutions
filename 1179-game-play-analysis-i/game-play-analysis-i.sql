-- Write your PostgreSQL query statement below

select distinct
    player_id,
    first_login
from(
    select
        player_id,
        device_id,
        event_date,
        min(event_date) over (partition by player_id  order by event_date) first_login
    from Activity) t