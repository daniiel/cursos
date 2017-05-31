--09_01_a
-- forma de ejecutar un scrip .sql
--@/home/oracle/labs/labs/lab_09_01_a.sql

CREATE OR REPLACE PACKAGE query_code_pkg
AUTHID CURRENT_USER
IS
  PROCEDURE find_text_in_code (str IN VARCHAR2);
  PROCEDURE encap_compliance;
END query_code_pkg;
/

CREATE OR REPLACE PACKAGE BODY query_code_pkg IS
  PROCEDURE find_text_in_code (str IN VARCHAR2)
  IS
    TYPE info_rt IS RECORD (NAME user_source.name%type, text user_source.text%type);
    TYPE info_aat IS TABLE OF info_rt INDEX BY PLS_INTEGER;
    info_aa INFO_AAT;
  BEGIN
    select name || '-' || line, text bulk collect into info_aa
    from user_source
    where UPPER(text) like '%' || UPPER(str) || '%'
      and name != 'VALSTD' and name != 'ERRNUMS'; 
      
    dbms_output.put_line ('Checking for presence of ' || str || ';');
    
    for indx IN info_aa.FIRST..info_aa.LAST LOOP
      dbms_output.put_line(info_aa (indx).name || ',' || info_aa(indx).text);
    end loop;
  END find_text_in_code;
  
  PROCEDURE encap_compliance 
  IS
    SUBTYPE qualified_name_t  IS VARCHAR2(200);
    TYPE refby_rt IS RECORD (NAME qualified_name_t, referenced_by qualified_name_t);
    TYPE refby_aat IS TABLE OF refby_rt INDEX BY PLS_INTEGER;
    refby_aa refby_aat;
  BEGIN
    SELECT  owner || '.' || name refs_table, referenced_owner || '.' ||
      referenced_name AS table_referenced 
    BULK COLLECT INTO refby_aa
    FROM all_dependencies
    WHERE owner = USER
      AND TYPE IN ('PACKAGE','PACKAGE BODY','PROCEDURE','FUNCTION')
      AND REFERENCED_TYPE IN ('TABLE','VIEW')
      AND referenced_owner NOT IN ('SYS','SYSTEM')
    ORDER BY owner, name, referenced_owner, referenced_name;
    
    dbms_output.put_line('Programs that reference tables or views');
    
    FOR indx IN refby_aa.FIRST..refby_aa.LAST LOOP 
      dbms_output.put_line (refby_aa(indx).name || ',' || refby_aa(indx).referenced_by);
    END LOOP;
  END encap_compliance;
END query_code_pkg;
/

--09_01_b
EXECUTE query_code_pkg.encap_compliance;

--09_01_c
-- show references of which object reference it.
EXECUTE query_code_pkg.find_text_in_code('ORDERS');

--09_02_a
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL';

--09_02_b
ALTER PACKAGE credit_card_pkg COMPILE;

--09_02_c
SELECT plscope_settings 
FROM user_plsql_object_settings
WHERE name = 'CREDIT_CARD_PKG' AND type = 'PACKAGE BOGY';


WITH v AS
  (SELECT line, col, initcap(name) name, lower(type) type, lower(usage) usage, usage_id, usage_context_id
    FROM USER_IDENTIFIERS
    WHERE object_name = 'CREDIT_CARD_PKG'
      AND object_type = 'PACKAGE BODY'
  )
  SELECT RPAD(LPAD(' ', 2*(level-1)) || name, 20,'.') || ' '
    || RPAD(type,20 || RPAD(usage,20)) IDENTIFIER_USAGE_CONTEXTS
  FROM v
  START WITH USAGE_CONTEXT_ID = 0
  CONNECT BY PRIOR USAGE_ID = USAGE_CONTEXT_ID
  ORDER SIBLINGS BY line, col;

--09_03_a
CREATE OR REPLACE FUNCTION get_table_md RETURN CLOB IS 
  v_hdl NUMBER; -- returned by OPEN
  v_th  NUMBER; -- returned by ADD_TRANSFORM
  v_doc CLOB;
BEGIN
  -- specify the OBJECT TYPE
  v_hdl := dbms_metadata.open('TABLE');
  -- use FILTERS to specify the objects desired
  dbms_metadata.SET_FILTER(v_hdl, 'SCHEMA','OE');
  dbms_metadata.SET_FILTER(v_hdl,'NAME','ORDER_ITEMS');
  
  --request to be TRANSFORMED into creation DDL
  v_th := dbms_metadata.ADD_TRANSFORM(v_hdl,'DDL');
  -- FETCH the object
  v_doc := dbms_metadata.FETCH_CLOB(v_hdl);
  -- release resources
  dbms_metadata.CLOSE(v_hdl);
  RETURN v_doc;
END;
/

--09_03_b
SET LONG 1000000
SELECT get_table_md FROM dual;

--09_04
SPOOL ORDER_ITEMS_XML.TXT
SELECT DBMS_METADATA.GET_XML('TABLE', 'ORDER_ITEMS','OE') FROM DUAL;
SPOOL OFF;


