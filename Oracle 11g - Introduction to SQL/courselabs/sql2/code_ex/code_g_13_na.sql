SELECT  department_id, employee_id, 
last_name, job_id, salary
FROM    employees
WHERE   last_name  != 'Higgins'
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;
