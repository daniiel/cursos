CREATE OR REPLACE PROCEDURE get_employee
    (p_empid IN  employees.employee_id%TYPE,
     p_sal   OUT employees.salary%TYPE,
     p_job   OUT employees.job_id%TYPE) IS
BEGIN
  SELECT  salary, job_id
  INTO    p_sal, p_job
  FROM    employees
  WHERE   employee_id = p_empid;
END get_employee;
/
