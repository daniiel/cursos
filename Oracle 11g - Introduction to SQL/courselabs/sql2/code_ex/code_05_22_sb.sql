SELECT last_name, hire_date, 
       EXTRACT (MONTH FROM HIRE_DATE)
FROM employees
WHERE manager_id = 100;