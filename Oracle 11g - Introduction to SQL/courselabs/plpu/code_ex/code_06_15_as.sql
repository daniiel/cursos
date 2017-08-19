CREATE OR REPLACE PROCEDURE compile_plsql(p_name VARCHAR2,
 p_plsql_type VARCHAR2, p_options VARCHAR2 := NULL) IS
  v_stmt varchar2(200) := 'ALTER '|| p_plsql_type ||
                        ' '|| p_name || ' COMPILE';
BEGIN
 IF p_options IS NOT NULL THEN
   v_stmt := v_stmt || ' ' || p_options;
 END IF;
 EXECUTE IMMEDIATE v_stmt;
END;
/

