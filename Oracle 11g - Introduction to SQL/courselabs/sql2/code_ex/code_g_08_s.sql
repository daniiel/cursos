SELECT employee_id, last_name, job_id, manager_id
FROM   employees
START WITH  employee_id = 101
CONNECT BY PRIOR manager_id = employee_id;


