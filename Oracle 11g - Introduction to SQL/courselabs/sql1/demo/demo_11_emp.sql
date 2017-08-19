SET ECHO OFF
PROMPT ** Create the view **
SET ECHO ON

CREATE OR REPLACE VIEW empvu90 (id_number, employee, profession)
AS SELECT employee_id, last_name, job_id
FROM employees
WHERE department_id = 90
/

SET ECHO OFF
PROMPT ** Describe the view structure **
SET ECHO ON
DESC empvu90

SET ECHO OFF
PROMPT ** Display the contents of the view **
SET ECHO ON
SELECT	*
FROM	empvu90
/

SET ECHO OFF
PROMPT ** Display only the employee names **
SET ECHO ON
SELECT	employee
FROM	empvu90
/
