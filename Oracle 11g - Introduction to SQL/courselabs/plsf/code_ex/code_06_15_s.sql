SET VERIFY OFF

DROP TABLE retired_emps;

CREATE TABLE retired_emps
   (EMPNO      NUMBER(4),
    ENAME      VARCHAR2(10),
    JOB        VARCHAR2(9),
    MGR        NUMBER(4),
    HIREDATE   DATE,
    LEAVEDATE  DATE,
    SAL        NUMBER(7,2),
    COMM       NUMBER(7,2),
    DEPTNO     NUMBER(2))
/

DECLARE
  v_employee_number number:= 124;
  v_emp_rec   retired_emps%ROWTYPE;
BEGIN
 SELECT employee_id, last_name, job_id, manager_id, hire_date, hire_date,
  salary, commission_pct, department_id 
 INTO v_emp_rec FROM employees
 WHERE  employee_id = v_employee_number;
 INSERT INTO retired_emps  VALUES v_emp_rec;
END;

/

SELECT * FROM retired_emps;
/




