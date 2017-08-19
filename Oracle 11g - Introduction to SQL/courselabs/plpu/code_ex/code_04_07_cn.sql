-- -- Run code_04_07_as.sql before running this code example. 

EXECUTE dept_pkg.add_department ('Training', 2400)
SELECT * FROM departments
WHERE department_name = 'Training';
