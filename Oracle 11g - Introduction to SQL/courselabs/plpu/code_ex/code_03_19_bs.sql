-- Run code_03_19_as.sql before running this code example. 

SET SERVEROUTPUT ON

BEGIN
  DBMS_OUTPUT.PUT_LINE('20 miles = ' ||
        20 * global_consts.c_mile_2_kilo || ' km');
END;
/
