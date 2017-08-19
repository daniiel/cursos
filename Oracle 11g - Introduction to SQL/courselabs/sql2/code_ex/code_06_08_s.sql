SELECT  employee_id, manager_id, department_id
FROM    empl_demo
WHERE   manager_id IN
                  (SELECT manager_id 
                   FROM empl_demo
                   WHERE first_name = 'John')
AND department_id IN
                 (SELECT department_id
                  FROM empl_demo
                  WHERE first_name = 'John') 
AND first_name <> 'John';
