SELECT last_name, department_id, salary
FROM employees
WHERE salary = (SELECT max(salary)
                FROM employees);                                                                                                         