-- Run demo_10_33.sql before running this code example. This demo script creates the 
-- MY_PKG package.

-- 1) Save and print current warning settings. 
-- 2) Disable warnings for the PERFORMANCE category and print the new setting. 
-- 3) Compile a PL/SQL package. 
-- 4) Restore and print the original warning setting.
-- To test this, run this script, then EXECUTE compile_code('MY_PKG').

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE compile_code(p_pkg_name VARCHAR2) IS
  v_warn_value   VARCHAR2(200);
  v_compile_stmt VARCHAR2(200) := 'ALTER PACKAGE '|| p_pkg_name ||' COMPILE';

BEGIN

-- Save and print current session settings.   
   v_warn_value := DBMS_WARNING.GET_WARNING_SETTING_STRING; 
   DBMS_OUTPUT.PUT_LINE('Current warning settings: '|| v_warn_value);

-- Disable performance and print the settings.
   DBMS_WARNING.ADD_WARNING_SETTING_CAT('PERFORMANCE', 'DISABLE', 'SESSION');
   DBMS_OUTPUT.PUT_LINE('Modified warning settings: ' || DBMS_WARNING.GET_WARNING_SETTING_STRING); 

-- Compile an existing package. NOTE: Before you run the command, you must create 
-- the MY_PKG script found in the demo_07_33.sql. This demo script creates the MY_PKG package.

   EXECUTE IMMEDIATE v_compile_stmt;

-- Restore original settings.
   DBMS_WARNING.SET_WARNING_SETTING_STRING(v_warn_value, 'SESSION'); 

-- Prints restored orginal settings.
   DBMS_OUTPUT.PUT_LINE('Restored warning settings: '|| DBMS_WARNING.GET_WARNING_SETTING_STRING);

END;
/
