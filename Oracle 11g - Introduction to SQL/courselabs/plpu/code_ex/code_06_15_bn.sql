-- Run code_06_15_as before running this code example. 
--
-- The examples with prodedure list_employees, and package mypack
-- are commented out as these objects do not exists they are syntax
-- only examples. YOu must create these object for the compile to work.
--

REM EXEC compile_plsql ('list_employees', 'procedure')
EXEC compile_plsql ('get_emp', 'function')
REM EXEC compile_plsql ('mypack', 'package', 'specification') 
REM EXEC compile_plsql ('mypack', 'package', 'body')

-- Compiling with DEBUG enabled for the get_employee function:
EXEC compile_plsql ('get_emp', 'function', 'debug')
