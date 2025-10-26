-- Write your PostgreSQL query statement below
WITH JOIN_TABLES AS (
    SELECT 
        d.name AS Department, 
        e.name AS Employee,
        e.salary AS Salary
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
),
 ranking_salary AS (
    SELECT
        *, 
        DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) rn
    FROM JOIN_TABLES
 )
 SELECT 
    Department,
    Employee,
    Salary
FROM ranking_salary
WHERE rn<4