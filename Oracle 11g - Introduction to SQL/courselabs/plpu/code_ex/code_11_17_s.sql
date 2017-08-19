-- Run code_11_15_s.sql, code_11_16_as.sql, and code_11_16_bs.sql before running this code example.

SET SERVEROUTPUT ON
CALL DBMS_PREPROCESSOR.PRINT_POST_PROCESSED_SOURCE('PACKAGE', 'ora61', 'MY_PKG');