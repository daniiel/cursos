SET SERVEROUTPUT ON
ALTER SESSION SET plsql_compiler_flags = 'NATIVE';
ALTER PROCEDURE waste_time COMPILE;
EXEC waste_time; 
EXEC waste_time;