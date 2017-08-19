DROP TABLE emp_demo4;
CREATE TABLE emp_demo4 AS SELECT * FROM employees;
UPDATE   emp_demo4
SET      job_id  = (SELECT  job_id 
                    FROM    emp_demo4 
                    WHERE   employee_id = 205), 
         salary  = (SELECT  salary 
                    FROM    emp_demo4 
                    WHERE   employee_id = 205) 
WHERE    employee_id    =  124;
