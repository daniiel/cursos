SELECT last_name, department_id, salary
FROM employees
WHERE salary IN (SELECT max(salary)
                FROM employees
                GROUP BY department_id);       