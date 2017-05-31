--06_02 as SYS
CREATE OR REPLACE LIBRARY c_code
AS 'C:\app\dbuitrag\product\11.2.0\dbhome_1\BIN\calc_tax.so';
/

CREATE OR REPLACE LIBRARY c_code
AS 'C:/app/dbuitrag/product/11.2.0/dbhome_1/BIN/calc_tax.so';
/

--06_03 as SYS
GRANT EXECUTE ON c_code TO oe;

--06_04 as OE
CREATE OR REPLACE FUNCTION call_c (x BINARY_INTEGER)
RETURN binary_integer
AS LANGUAGE C
  LIBRARY sys.c_code
  NAME "calc_tax";
/

--06_05
CREATE OR REPLACE PROCEDURE c_output (p_in in BINARY_INTEGER)
IS 
  i binary_integer;
BEGIN
  i := call_c (p_in);
  DBMS_OUTPUT.PUT_LINE('the total tax is: ' || i);
END c_output;
/

--06_06
SET serveroutput ON
EXECUTE c_output(10000);

--06_07
-- cargar .java file
/* TERMINAL CMD
[cmd] C:\Users\dbuitrag\Desktop\github\cursos\Oracle db 11g advanced PLSQL\labs
[cmd] loadjava -user oe/oe FormatCreditCardNo.java
*/

--06_08
-- publicar la clase java definiendo un procedimiento CCFORMAT
CREATE OR REPLACE PROCEDURE ccformat (x IN OUT VARCHAR2)
AS LANGUAGE JAVA
  NAME 'FormatCreditCardNo.formatCard(java.lang.String[])';
/

--06_09
SET autoprint off
VARIABLE x VARCHAR2(20);
EXECUTE :x := '1234567887654321';
EXECUTE ccformat(:x);
PRINT

-- NOTA: para ejecutar, ejecutarlo desde le punto 06_08 hasta el final del codigo