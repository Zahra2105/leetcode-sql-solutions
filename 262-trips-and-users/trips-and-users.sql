WITH cancelled_requests AS (
    SELECT 
        t.request_at::date AS Day,
        COUNT(*) AS cancelled_count
    FROM Trips t
    JOIN Users uc ON t.client_id = uc.users_id
    JOIN Users ud ON t.driver_id = ud.users_id
    WHERE uc.banned = 'No'
      AND ud.banned = 'No'
      AND t.status IN ('cancelled_by_driver', 'cancelled_by_client')
      AND t.request_at >= '2013-10-01'
      AND t.request_at <= '2013-10-03'
    GROUP BY t.request_at::date
),
total_requests AS (
    SELECT 
        t.request_at::date AS day,
        COUNT(*) AS total_count
    FROM Trips t
    JOIN Users uc ON t.client_id = uc.users_id
    JOIN Users ud ON t.driver_id = ud.users_id
    WHERE uc.banned = 'No'
      AND ud.banned = 'No'
      AND t.request_at >= '2013-10-01'
      AND t.request_at <= '2013-10-03'
    GROUP BY t.request_at::date
)
SELECT 
    tr.day AS "Day",
    ROUND(COALESCE(cr.cancelled_count::numeric,0) / NULLIF(tr.total_count,0), 2) AS  "Cancellation Rate" 
FROM total_requests tr
LEFT JOIN cancelled_requests cr ON tr.Day = cr.Day
ORDER BY tr.Day;
