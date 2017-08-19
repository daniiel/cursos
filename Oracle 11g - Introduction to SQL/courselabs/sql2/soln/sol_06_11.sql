WITH 
summary AS (
  SELECT d.department_name, SUM(e.salary) AS dept_total
  FROM employees e, departments d
  WHERE e.department_id = d.department_id
  GROUP BY d.department_name)
SELECT department_name, dept_total
FROM summary
WHERE dept_total > (
                    SELECT SUM(dept_total) * 1/8
                    FROM summary  )
ORDER BY dept_total DESC;



