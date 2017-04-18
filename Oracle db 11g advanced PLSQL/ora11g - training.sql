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
  
  --  -----------
      
  SET autoprint ON
  VARIABLE cv REFCURSOR; -- bind  /baind/ variable
  EXECUTE cust_data2.get_cust(112, :cv);
  
