SELECT   employee_id, last_name
FROM     employees e
ORDER BY (SELECT department_name
           FROM departments d
            WHERE e.department_id = d.department_id);