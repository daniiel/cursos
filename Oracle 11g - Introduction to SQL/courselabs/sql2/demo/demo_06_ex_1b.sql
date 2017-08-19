SELECT last_name,manager_id,department_id
FROM employees
WHERE (manager_id) IN (SELECT manager_id FROM employees WHERE last_name IN('Gietz','Whalen'))
AND (department_id) IN (SELECT department_id FROM employees WHERE last_name IN ('Gietz','Whalen'));