CREATE OR REPLACE PROCEDURE add_col(p_table_name VARCHAR2,
                         p_col_spec VARCHAR2) IS
  v_stmt VARCHAR2(100) := 'ALTER TABLE ' || p_table_name ||
                        ' ADD '|| p_col_spec;
BEGIN
  EXECUTE IMMEDIATE v_stmt;
END;
/

