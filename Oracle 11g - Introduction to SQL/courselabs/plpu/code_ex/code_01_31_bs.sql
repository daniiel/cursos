-- You must run code_01_30_s.sql before running this code example. 

EXECUTE add_dept (p_loc=>2400, p_name=>'EDUCATION')

SELECT *
FROM departments
WHERE department_name = 'EDUCATION';
