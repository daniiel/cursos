-- The following example assumes you are the student with the account ora61. 
SET SERVEROUTPUT ON

CALL DBMS_PREPROCESSOR.PRINT_POST_PROCESSED_SOURCE('PACKAGE', 'ORA61', 'MY_PKG');