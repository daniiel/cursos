SET SERVEROUTPUT ON

DECLARE s VARCHAR2(1000);
BEGIN
   s := dbms_warning.get_warning_setting_string();
   dbms_output.put_line (s);
END;
/