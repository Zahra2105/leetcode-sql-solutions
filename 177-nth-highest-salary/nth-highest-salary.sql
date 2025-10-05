
    -- Write your PostgreSQL query statement below.
CREATE FUNCTION nthHighestSalary(N INT) 
RETURNS INT
AS $$
    SELECT CASE 
        WHEN N > 0 THEN (
            SELECT DISTINCT salary
            FROM Employee
            ORDER BY salary DESC
            LIMIT 1 OFFSET N - 1
        )
        ELSE NULL
    END;
$$ LANGUAGE sql;


