-- You must run code_01_30_s.sql before running this code example. 

EXECUTE add_dept ('TRAINING', 2500)

SELECT *
FROM departments
WHERE department_name = 'TRAINING';
