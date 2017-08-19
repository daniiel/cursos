-- Because of the DEPT_MGR_FK constraint, you cannot delete the rows shown in the code example.
-- Create a copy of the employees table, employees2, to successfully delete the rows
CREATE table employees2 as (select * from employees);

DECLARE
deptno employees2.department_id%TYPE := 10;
BEGIN
DELETE FROM employees2
WHERE department_id = deptno;
END;
/