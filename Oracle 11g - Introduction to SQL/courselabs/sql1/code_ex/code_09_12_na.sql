CREATE TABLE copy_emp
 AS SELECT * FROM employees WHERE 1 = 2;

INSERT INTO copy_emp
       SELECT * 
       FROM   employees;
