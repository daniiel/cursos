-- ---------------------------------------------
--  FUNCTION
-- ---------------------------------------------

DECLARE
  v_name VARCHAR2(25);
BEGIN
  SELECT cust_last_name INTO v_name
  FROM  customers WHERE  customer_id = 112; 
  dbms_output.put_line(v_name);
END;
/
SELECT cust_first_name
FROM  customer
WHERE  cust_last_name = v_name;
/
-- ---------------------------------
set serveroutput on
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


-- ---------------------------------------------
--  PACKAGE
-- ---------------------------------------------

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

exec Get_Cust_Pkg.get_customer(112);
exec Get_Cust_Pkg.get_customer('Eddie');

-- ---------------------------------------------
--  CURSORES
-- ---------------------------------------------

-- opcion 1
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

-- opcion 2
DECLARE
  CURSOR empCursor IS SELECT * FROM employees 
    WHERE department_id = 90;
BEGIN
  FOR emprec IN empCursor LOOP
    dbms_output.put_line(emprec.last_name);
  END LOOP;
END;

-- opcion 3
BEGIN
  FOR emprec IN (SELECT * FROM employees WHERE department_id = 90) LOOP
    dbms_output.put_line(emprec.last_name);
  END LOOP;
END;

-- ---------------------------------------------
-- 	REF CURSOR
-- ---------------------------------------------
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

-- ---------------------------------------------
-- 	REF CURSOR, USING 'IN OUT' parameter
-- ---------------------------------------------
CREATE OR REPLACE PACKAGE cust_data
IS 
  TYPE rt_cust IS REF CURSOR RETURN customers%ROWTYPE;
  PROCEDURE open_cust_cur_var (cv_cust IN OUT rt_cust, p_your_choice IN NUMBER);
END cust_data;
/

CREATE OR REPLACE PACKAGE BODY cust_data
IS
  PROCEDURE open_cust_cur_var (cv_cust IN OUT rt_cust, p_your_choice IN NUMBER) IS
  BEGIN
    IF p_your_choice = 1 THEN
      OPEN cv_cust FOR SELECT * FROM customers;
    ELSIF p_your_choice = 2 THEN
      OPEN cv_cust FOR SELECT * FROM customers WHERE credit_limit >3000;
    END IF;
  END open_cust_cur_var;
END cust_data;
/
SHOW ERRORS


CREATE OR REPLACE PACKAGE cust_data2
IS 
  TYPE typ_cust_rec IS RECORD (cust_id NUMBER(6), custname VARCHAR2(20), credit NUMBER(9,2), CUST_EMAIL VARCHAR2(30));
  TYPE rt_cust IS REF CURSOR RETURN typ_cust_rec;
  PROCEDURE get_cust(p_custId IN NUMBER, p_cv_cust IN OUT rt_cust);
END cust_data2;
/

CREATE OR REPLACE PACKAGE BODY cust_data2
IS
  PROCEDURE get_cust(p_custId IN NUMBER, p_cv_cust IN OUT rt_cust) IS
  BEGIN
    OPEN p_cv_cust FOR SELECT customer_id, cust_first_name, credit_limit, cust_email
                      FROM customers WHERE customer_id = p_custid;
  END get_cust;
END cust_data2;
/
SHOW ERRORS
      
SET autoprint ON
VARIABLE cv REFCURSOR; -- bind  /baind/ variable
EXECUTE cust_data2.get_cust(112, :cv);

-- ---------------------------------------------
--  COLLECTIONS - ASSOCIATIVE ARRAY
-- ---------------------------------------------

DECLARE
  TYPE  empType IS TABLE OF employees.last_name%TYPE INDEX BY pls_integer;
  empTable empType;
  v_empId NUMBER := 100;
BEGIN
  SELECT last_name INTO empTable(v_empId) FROM employees
  WHERE employee_id = v_empId;
  dbms_output.put_line(empTable(v_empId));
  
  FOR i in 1..10 LOOP
    SELECT last_name INTO empTable(v_empId) FROM employees
    WHERE employee_id = v_empId;
    v_empId := v_empId +1;
  END LOOP;
  
  -- eliminar un elemento puntual
  empTable.delete(103);
  
  FOR j in empTable.FIRST..empTable.LAST LOOP
    IF empTable.EXISTS(j) THEN
      dbms_output.put_line(empTable(j));
    ELSE
      NULL;
    END IF;
  END LOOP;
END;
/

DECLARE
  TYPE  empType IS TABLE OF employees%ROWTYPE INDEX BY pls_integer;
  empTable empType;
  v_empId NUMBER := 100;
BEGIN

  FOR i in 1..10 LOOP
    SELECT * INTO empTable(v_empId) FROM employees
    WHERE employee_id = v_empId;
    v_empId := v_empId +1;
  END LOOP;
  
  -- eliminar un elemento puntual
  empTable.delete(103);
  
  FOR j in empTable.FIRST..empTable.LAST LOOP
    IF empTable.EXISTS(j) THEN
      dbms_output.put_line(empTable(j).last_name ||' '|| empTable(j).first_name);
    ELSE
      NULL;
    END IF;
  END LOOP;
END;
/

-- ---------------------------------------------
--  COLLECTIONS - NESTED TABLE (tablas anidadas)
-- ---------------------------------------------

CREATE TYPE phone_type AS OBJECT (label varchar2(25), phone varchar2(25));

CREATE TYPE phone_nst AS TABLE OF  phone_type;

CREATE TABLE employee_info (
  employee_id number primary key,
  first_name varchar2(25),
  last_name varchar2(25),
  phone_number phone_nst
) NESTED TABLE phone_number store as phone_type_table;

INSERT INTO employee_info VALUES (100, 'Steven','King',phone_nst(phone_type('home','5551212'), phone_type('office','5551213')));
COMMIT;

SELECT * FROM employee_info;

SELECT ei.last_name, pn.* FROM employee_info ei, TABLE(ei.phone_number) pn;

DECLARE
  v_phone   phone_nst:=phone_nst(); -- inicializando usando el constructor
                                    -- v_phone es inicializada con un colleccion vacia 
BEGIN
  v_phone.extend(3); -- 'extend' es un metodo, donde en la variable voy a color 3 numeros,
                     -- los numeros v_phone(1) , (2), .. son como los indics de un array
  v_phone(1) := phone_type('home','5551111');
  v_phone(2) := phone_type('office','5551112');
  v_phone(3) := phone_type('movil','5551113');
  INSERT INTO employee_info VALUES (101,'Neena','Kochar',v_phone);
END;
/

-- ---------------------------------------------
--  COLLECTIONS - VARRAYS
-- ---------------------------------------------

CREATE TYPE phone_type AS OBJECT (label varchar2(25), phone varchar2(25));
/
CREATE OR REPLACE TYPE phone_varray AS VARRAY(2) of phone_type;
/
-- Varrays are quicker, more efficient
-- because the data's actually stored inline
CREATE TABLE employee_info_v (
  employee_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(25),
  last_name VARCHAR2(25),
  phone_number phone_varray);
  
INSERT INTO employee_info_v VALUES(100,'Steven','king',phone_varray(phone_type('home','5551212'),phone_type('office','5551213')));

SELECT * FROM employee_info_v;

-- ver los numeros de telefonos 
SELECT p2.last_name, p1.*
FROM employee_info_v p2, TABLE(p2.phone_number) p1;

-- En un Varray, no se pueden eliminar los elementos.








