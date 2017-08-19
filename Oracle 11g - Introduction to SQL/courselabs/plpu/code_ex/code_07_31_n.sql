SET SERVEROUTPUT ON

CREATE TABLE num_table (n NUMBER);
DECLARE
  TYPE num_list_type IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
  v_nums num_list_type;
BEGIN
 v_nums(1) := 1;
 v_nums(2) := 3;
 v_nums(3) := 5;
 v_nums(4) := 7;
 v_nums(5) := 11;
  FORALL i IN v_nums.FIRST .. v_nums.LAST
    INSERT INTO num_table (n) VALUES (v_nums(i));
  FOR i IN v_nums.FIRST .. v_nums.LAST
  LOOP
    dbms_output.put_line('Inserted ' || 
      SQL%BULK_ROWCOUNT(i) || ' row(s)'
      || ' on iteration ' || i);
  END LOOP;
END;
/
DROP TABLE num_table;
