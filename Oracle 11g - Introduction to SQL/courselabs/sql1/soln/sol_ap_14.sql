SELECT e.last_name, m.last_name manager, m.salary,  j.grade_level
FROM   employees e JOIN employees m 
ON     e.manager_id = m.employee_id
JOIN   job_grades j
ON     m.salary BETWEEN j.lowest_sal AND j.highest_sal
AND    m.salary > 15000;
