SET SERVEROUTPUT ON

DECLARE    
   v_sum_sal   NUMBER(10,2); 
   v_deptno      NUMBER NOT NULL := 60;           
BEGIN
   SELECT	SUM(salary)  -- group function
   INTO v_sum_sal  FROM	employees
   WHERE     department_id = v_deptno;
   DBMS_OUTPUT.PUT_LINE ('The sum of salary is ' || v_sum_sal);
END;
/
