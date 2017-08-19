SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION annual_sal( p_emp_id NUMBER)
RETURN NUMBER IS
  v_plsql varchar2(200) :=
    'DECLARE '||
    ' rec_emp employees%ROWTYPE; '||
    'BEGIN '||
    ' rec_emp := get_emp(:empid); ' ||
    ' :res := rec_emp.salary  * 12; ' ||
    'END;';
  v_result NUMBER;
BEGIN
 EXECUTE IMMEDIATE v_plsql
         USING IN p_emp_id, OUT v_result;
  RETURN v_result;
END; 
/
EXECUTE DBMS_OUTPUT.PUT_LINE(annual_sal(100))