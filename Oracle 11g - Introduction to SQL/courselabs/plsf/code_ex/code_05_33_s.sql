SET SERVEROUTPUT ON

DECLARE
  v_total SIMPLE_INTEGER := 0;
BEGIN
  FOR i IN 1..10 LOOP
    v_total := v_total + i;
    dbms_output.put_line
     ('Total is: '|| v_total);
    CONTINUE WHEN i > 5;
    v_total := v_total + i; 
    dbms_output.put_line
     ('Out of Loop Total is:
      '|| v_total);    
  END LOOP;
END;
/
