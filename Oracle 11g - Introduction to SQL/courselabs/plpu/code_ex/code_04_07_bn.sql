-- Run code_04_07_as.sql before running this code example. 

EXECUTE dept_pkg.add_department(980,'Education',2500)
SELECT * FROM departments
WHERE department_id = 980;
