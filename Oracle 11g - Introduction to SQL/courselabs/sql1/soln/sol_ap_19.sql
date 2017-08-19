SELECT e.employee_id, e.last_name, e.department_id, e.salary,  AVG(s.salary)
FROM   employees e JOIN employees s
ON     e.department_id = s.department_id
GROUP BY e.employee_id, e.last_name, e.department_id, e.salary;
