CREATE OR REPLACE FUNCTION query_call_sql(p_a NUMBER) RETURN NUMBER IS
   v_s NUMBER;
BEGIN
   SELECT salary INTO v_s FROM employees
   WHERE employee_id = 170;
   RETURN (v_s + p_a);
END;
/
