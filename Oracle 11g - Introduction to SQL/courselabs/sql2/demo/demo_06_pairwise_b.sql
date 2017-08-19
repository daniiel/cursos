SELECT department_id, salary, last_name
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, max(salary)
                                  FROM employees
                                  GROUP BY department_id)
ORDER BY department_id, salary;