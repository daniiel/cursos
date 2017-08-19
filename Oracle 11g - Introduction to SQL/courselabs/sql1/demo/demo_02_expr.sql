SET ECHO OFF
SET VERIFY OFF

SELECT	employee_id, &column_name_of_the_emp_table
FROM	employees
WHERE	&condition_to_apply
/
SET VERIFY ON
SET ECHO OFF
