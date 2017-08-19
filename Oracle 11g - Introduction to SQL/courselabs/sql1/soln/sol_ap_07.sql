SELECT d.department_name, d.location_id, e.last_name, e.job_id, e.salary
FROM   employees e, departments d
WHERE   e.department_id = d.department_id
AND     d.location_id = &location_id;
