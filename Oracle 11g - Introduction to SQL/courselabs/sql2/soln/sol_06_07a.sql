SELECT outer.last_name
FROM    employees outer
WHERE  NOT EXISTS (SELECT 'X'
                   FROM employees inner
                   WHERE inner.manager_id = outer.employee_id);
