SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE process_data IS
  TYPE cur_ref_type 	IS REF CURSOR; -- weak ref cursor
  TYPE cur_ref_emp_type IS REF CURSOR  -- strong ref. cursor
     RETURN employees%ROWTYPE;
  v_dept_csr	cur_ref_type;
  v_emp_csr  	cur_ref_emp_type;
  rec_emp       employees%rowtype;
  rec_dept      departments%rowtype;
BEGIN
  OPEN v_emp_csr FOR SELECT * FROM employees;
  LOOP
    FETCH v_emp_csr INTO rec_emp;
    EXIT when v_emp_csr%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(rec_emp.employee_id ||' '|| rec_emp.last_name);
  END LOOP;
  CLOSE v_emp_csr;

  OPEN v_dept_csr FOR SELECT * from departments;
  LOOP
    FETCH v_dept_csr INTO rec_dept;
    EXIT when v_dept_csr%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(rec_dept.department_id ||' '|| rec_dept.department_name);
  END LOOP;
  CLOSE v_dept_csr;
END;
/
