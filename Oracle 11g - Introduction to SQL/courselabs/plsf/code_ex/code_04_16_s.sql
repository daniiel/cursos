SELECT first_name, salary FROM employees WHERE job_id = 'ST_CLERK';
DECLARE
  sal_increase employees.salary%TYPE := 800;
BEGIN
   UPDATE employees SET salary = salary + sal_increase WHERE job_id = 'ST_CLERK';
END;
/
SELECT first_name, salary FROM employees WHERE job_id = 'ST_CLERK';
rollback;
/