
	PL/SQL TRAINING


-- Hierarchical query
SELECT last_name emp, prior last_name mgr
from employees
connect by prior employee_id = manager_id;

SELECT last_name emp, prior last_name mgr
from employees
start with employee_id = 101
connect by prior employee_id = manager_id;


-- 1. Un bloque BEGIN-END, DEBE TENER algun contenido entre estas dos clausulas

	BEGIN
		null;
	END;

--! PROCEDURE

-- Def: Un PROCEDURE es un subprograma almacenado que sale y hace algo.
--      Un PL/SQL block nombrado que realiza una sequencia de acciones y opcional
-- 		retorna un valor o valores.
--		Usado para promover la reusabilidad y la mantenibilidad.

-- By Default, si no se especifica el tipo de modo 'IN, OUT, IN OUT' por defecto es IN

CREATE OR REPLACE PROCEDURE proName (
	p_cust_id NUMBER, p_cust_lName VARCHAR2
)
IS
...
END;
/

--! PARAMETERS MODE

-- Def: Hay 3 modos de parametros IN, OUT, IN OUT. 'IN' es el modo por defecto y significa que
--		un valor es pasado a el subprograma. 'OUT' indica que el subprograma esta pasando un valor
-- 		generado en el subprograma a el entorno de llamada. el 'IN OUT' mode significa que un valor
--		es pasado a el subprograma, el subprograma puede cambiar el valor y pasar el valor fuera a el 
--		entorno de llamada.

--! FUNCTION

-- Def: Una FUNCTION, es un bloque nombrado que DEBE retornar un valor
-- 		Llamado/Invocado como parte de una expresion o usado para proporcionar un
--		valor de parametro

CREATE OR REPLACE FUNCTION tax (p_amount NUMBER)
RETURN NUMBER IS
BEGIN
	RETURN p_amount*.19;
END;
/

SQL> EXECUTE proName (param1, param2);
Jackson

SQL> EXECUTE tax(20400);
ERROR!
-- una funcion no puede ser invocada directamente, debe ser parte de una expresion
-- una forma de validar puede ser con el dbms_output.put_line que es un subprograma
-- que recibe un parametro

SQL> dbms_output.put_line(tax(20400));
1234

-- Maneras de ejecutar una funcion

	-- Usando HOST VARIABLE, la variable va a mantener el valor de retorno de la funcion
	VARIABLE v_credit NUMBER
	EXECUTE :v_credit := get_credit(101);

	-- Usando una variable local
	DECLARE 
		v_credit 	customers.credit_limit%TYPE;
	BEGIN
		v_credit := get_credit(101);
		...
	END;
	
	-- Como un parametro de otro subprograma
	EXECUTE dbms_output.put_line(get_credit(101));

	-- Uso en una sentencia SQL (sujeto a restriccion)
	SELECT get_credit(customer_id) FROM customers;

-- Restricciones al invocar una FUNCION

	-- Funciones definidas por el usuario que son llamadas expresiones SQL deben:
		-- estar almacenadas en db 
		-- acepta solo parametros 'IN' con tipos de datos SQL, no tipos especificos de PL/SQL
		-- returna tipos de datos validos SQL, no PL/SQL.
	


-- FUNCTION VS PROCEDURE : La diferencia entre una FUNCION y un PROCEDIMIENTO es que la funcion debe tener 
-- 		un valor de retorno, ademas un procedimiento puede ser invocado directamente usando
--		el nombre (called as statements), mientras que una funcion debe ser parte de una expresion, (invocacion dentro
-- 		de una expresion, consulta, etc..)


-- BIND variable also known as a HOST variable
-- Def: Las BIND VARIABLES permiten pasar el valor al host, tambien conocidas como variables 
-- 		globales.
--		Es capaz de mantener el valor por la duracion de su sesion.

VAR b_name varchar2(25);

DECLARE
  v_name VARCHAR2(25);
BEGIN
  SELECT cust_last_name INTO :b_name
  FROM  customers WHERE  customer_id = 112; 
  --dbms_output.put_line(v_name);
END;
/
SELECT cust_first_name
FROM  customers
WHERE  cust_last_name = :b_name;


--! PACKAGES

-- Def: un 'package' is un objecto PL/SQL, el cual permite agrupar objetos relacionados juntos.
--		Consiste de 2 partes, una especificacion y un body. NO siempre debe tener un body

CREATE OR REPLACE PACKAGE get_cust_pkg IS
  PROCEDURE get_customer (p_id number);
  PROCEDURE get_customer (p_id VARCHAR2);
END get_cust_pkg;
/

CREATE OR REPLACE PACKAGE BODY get_cust_pkg IS
  --solucion para el problema de invocar una funcion definida despues de la invocacion
  FUNCTION get_id (p1 varchar2) 
    RETURN boolean;

  PROCEDURE get_customer (p_id number) IS
    v_name varchar2(25);
  BEGIN
    SELECT Cust_Last_Name INTO  v_name 
    FROM customers
    WHERE customer_id = p_id;
    dbms_output.put_line(v_name);
  END;
  
  PROCEDURE get_customer (p_id varchar2) IS
    v_name varchar2(25);
  BEGIN
   	IF get_id(p_id) THEN
    	SELECT Cust_Last_Name INTO  v_name 
      FROM customers
      WHERE cust_first_name = p_id;
      dbms_output.put_line(v_name);
    ELSE
      dbms_output.put_line('invalid emp name');
    END IF;
  EXCEPTION
    WHEN too_many_rows THEN
      raise_application_error(-20000, 'Search by customer id instead');
      --dbms_output.put_line('Search by customer id instead');
  END;
  
  -- private subprogram
  FUNCTION get_id (p1 varchar2) 
    RETURN boolean IS
    v_empid number;
  BEGIN
    SELECT customer_id INTO v_empid
    FROM customers WHERE cust_first_name = p1;
    RETURN true;
  EXCEPTION
    WHEN no_data_found THEN
      RETURN false;
  END;
  
END get_cust_pkg;
/
show errors

-- Cuando no se define un subprograma en la especificacion este es considerado un
-- PRIVATE SUBPROGRAM. Este subprograma solo podria ser usado dentro del BODY, el conjunto
-- de procedimiento dentro del body podrian hacer uso en el caso anterior de la funcion.
-- El orden en que se definen los precedures influye si en alguno se invoca alguna sibprograma
-- que esta definido mas abajo. Para esto se coloca la firma del subprograma en el inicio.


--! CURSOR

-- Def: Un cursor es un apuntar a un espacio de memoria asignada por el servidor de Oracle
-- 		Hay 2 tipos de cursores:
-- 		 . implicit cursors: Creados y manejados internamente por el servidor Oracle para procesar 
--			sentencias SQL, estos se crean cuando se ejecutan sentencias SQL tales como : SELECT,
--			INSERT, UPDATE, or DELETE
--		 . explicit cursors: explicitamente declarados por el programador. Son los cursores Creados
--			normalmente en el codigo de un precedure, etc.

DECLARE
  CURSOR empCursor IS SELECT * FROM employees 
    WHERE department_id = 90;
  rec_emp employees%ROWTYPE;
BEGIN
  OPEN empCursor;
  LOOP
  FETCH empCursor INTO rec_emp;
    EXIT WHEN empCursor%NOTFOUND OR empCursor%ROWCOUNT > 4; --explicit cursor attribute
    dbms_output.put_line(rec_emp.last_name);
  END LOOP;
  CLOSE empCursor;
END;

-- Comandos usados para procesar un explicit cursor: OPEN, FETCH, CLOSE; alternativamente se puede usar 
-- un CURSOR FOR LOOP

-- Atributos explicitos de los cursores
-- Todos los explicit cursors tiene los siguientes attributos: 
--		cursor_name%FOUND
--		cursor_name%ISOPEN
--		cursor_name%NOTFOUND
--		cursor_name%ROWCOUNT

--! Cursor FOR loops

-- Def: FOR loop, es un shortcut para procesar cursores explicitos, implicitamente hace el proceso de 
-- 		OPEN, FETCH, EXIT, y CLOSE. El registro es implicitamente declarado.
DECLARE
  CURSOR empCursor IS SELECT * FROM employees 
    WHERE department_id = 90;
  rec_emp employees%ROWTYPE;
BEGIN
  FOR emprec IN empCursor LOOP
    dbms_output.put_line(emprec.last_name);
  END LOOP;
END;


--! EXCEPTIONS

-- Def: Una EXCEPTION es un error en PL/SQL que es lanzado durante la ejecucion de un programa. Una exception 
--		puede ser lanzada Implicitamente por el servidor Oracle o Explicitamente por el programa
-- 		Una expection puede set manejada :
-- 			. atrapando esta con un handler
--			. propagando esta a el entorno de invocacion
--			. atrapando y propagando esta

-- 		hay tres categorias de Exceptions, Oracle predefined exceptions (too_many_rows, no_data_found,dup_val_on_index, etc),
--		Oracle non-predefined exceptions y 
--		user-defined exceptions

BEGIN
	NULL;
EXCEPTION
    WHEN too_many_rows THEN
      raise_application_error(-20000, 'Search by customer id instead'); 
	  -- El rango de user-defined error codes es -20.000 a -20.999
	  -- esta sentencia hace TERMINATE ABRUPTLY, -> rollback de lo que se tenga hasta este momento
END;


--! Dependencias

-- Def: Algunos objetos referencias a otros objetos como parte de su definicion. For ejemplo, un PROCEDIMIENTO
--		almacenado puede contener una sentencia SELECT que seleccionad columnas de una tabla. Por esta razon
--		el procedimiento es llamado 'objecto dependiente', mientras la tabla es llamada un 'objeto referenciado'

-- 		Para crear los objetos que habilitan la muestra de las dependencias directas e indirectas, correr el script
-- 		utldtree.sql (C:\app\dbuitrag\product\11.2.0\dbhome_1\RDBMS\ADMIN\utldtree.sql)

EXEC deptree_fill('table','HR','employees');
SELECT * FROM deptree;

-- Nested_level: 0 significa que ese es el objeto que nosotos queremos mirar
-- 				 1 significa que es directamente dependiente de este objeto


--! PAUTAS PARA EL DISEÑO DE CURSORES

-- 1. Usar un RECORD en vez de variables puntuales en el FETCH
DECLARE
 CURSOR empCursor IS SELECT first_name. last_name FROM employees;
 v_fname  varchar2(25);
 v_lname  varchar2(25);
 rec_emp empCursor%TYPE;
BEGIN
  OPEN empCursor;
  FETCH empCursor INTO v_fname, vlanme ... -- Forma no eficiente
  FETCH empCursor INTO rec_emp -- Esta es la mejor practica de programacion
  ...
END;
/

-- 2. Crear cursores con parametros, incrementa la flexibilidad y reusabilidad.
-- 		Parametros ayudan a evitar problemas de alcance (scoping)
DECLARE
 CURSOR cur_cust (p_crd_limit NUMBER, p_acct_mgr NUMBER)
  IS SELECT customer_id, cust_last_name FROM customers
    WHERE credit_limit = p_crd_limit
    AND account_mgr_id = p_acct_mgr;
BEGIN
  OPEN cur_cust (p_crd_limit_in, pacct_mgr_in);
    ...
  CLOSE cur_cust;
  
  OPEN cur_cust (v_credit_limit, 145);
    ...
END;
/

-- 3. Simplificar el codigo con FOR loops.
BEGIN
  FOR cur_rec IN cur_cust (p_crd_limit_in, p_acct_mgr_in)
  LOOP      -- implicit open and fetch
    ...
  END LOOP; -- implicit close
END;

--! REF CURSOR
-- Def: es un tipo de cursor que no esta atado a una sentencia SELECT especifica
--    este puede ser usadao varias veces en el codigo, sin importar la sentencia

DECLARE
  TYPE genType IS REF CURSOR; --weak ref cursor
  genCursor genType;
  emp_rec employees%ROWTYPE;
  dep_rec departments%ROWTYPE;
BEGIN
  OPEN genCursor FOR SELECT * FROM employees;
  LOOP
  FETCH genCursor INTO emp_rec;
  EXIT WHEN genCursor%NOTFOUND;
    dbms_output.put_line(emp_rec.last_name);
  END LOOP;
  CLOSE genCursor;
  
  OPEN genCursor FOR SELECT * FROM departments;
  LOOP
  FETCH genCursor INTO dep_rec;
  EXIT WHEN genCursor%NOTFOUND;
    dbms_output.put_line(dep_rec.department_name);
  END LOOP;
  CLOSE genCursor;
END;
/
  
