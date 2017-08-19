--Execute demo_04_update_rows.sql before executing this.
DELETE FROM emp_demo4
WHERE  department_id =
                (SELECT department_id
                 FROM   departments
                 WHERE  department_name 
                        LIKE 'IT');
