SELECT last_name FROM employees
WHERE  employee_id NOT IN
                        (SELECT manager_id 
                         FROM   employees 
                         WHERE  manager_id IS NOT NULL);
