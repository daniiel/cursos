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
  v_emp_rec   employees%ROWTYPE;
BEGIN
 SELECT * INTO v_emp_rec FROM employees
 WHERE  employee_id = v_employee_number;
 INSERT INTO retired_emps(empno, ename, job, mgr,  hiredate,  
                                         leavedate, sal, comm, deptno)  
 VALUES (v_emp_rec.employee_id, v_emp_rec.last_name,  
 v_emp_rec.job_id, v_emp_rec.manager_id,  v_emp_rec.hire_date, SYSDATE, 
 v_emp_rec.salary,  v_emp_rec.commission_pct, v_emp_rec.department_id);
END;

/

SELECT * FROM retired_emps;
/


