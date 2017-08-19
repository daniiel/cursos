ALTER SESSION SET plsql_compiler_flags = 'INTERPRETED';
SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE waste_time IS
v_start TIMESTAMP;
v_end TIMESTAMP;
v_duration INTERVAL DAY TO SECOND;
v_dummy NUMBER(38, 12) := 1;

BEGIN 
  v_start := localtimestamp;
  dbms_output.put_line (TO_CHAR(v_start));
  for i in 1 .. 10000000 loop  /* Loops ten million times!  */
    v_dummy := v_dummy * 1.0000001;
  END LOOP;  
  v_end := LOCALTIMESTAMP;
  DBMS_OUTPUT.PUT_LINE (TO_CHAR(v_end));
  v_duration := v_end - v_start;  
  DBMS_OUTPUT.PUT_LINE ('Total Run Time: '||to_char(v_duration));

dbms_output.put_line ('Dummy: '||v_dummy);
end waste_time;
/
exec waste_time;
exec waste_time;

--always run time test stuff twice and average them.

