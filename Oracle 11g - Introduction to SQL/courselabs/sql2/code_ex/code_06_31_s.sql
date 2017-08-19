WITH dept_costs  AS (
   SELECT d.department_name, SUM(e.salary) AS dept_total
   FROM   employees e JOIN departments d
   ON     e.department_id = d.department_id
   GROUP BY d.department_name),
avg_cost    AS (
   SELECT SUM(dept_total)/COUNT(*) AS dept_avg
   FROM   dept_costs)
SELECT * 
FROM   dept_costs 
WHERE  dept_total >
        (SELECT dept_avg 
         FROM avg_cost)
ORDER BY department_name;
