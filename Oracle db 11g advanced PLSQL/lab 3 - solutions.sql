-- Labs_03_01
BEGIN
  UPDATE orders SET order_status = order_status;
  FOR v_rec IN (SELECT order_id FROM orders)
  LOOP
    IF SQL%ISOPEN THEN
      DBMS_OUTPUT.PUT_LINE('TRUE' || SQL%ROWCOUNT);
    ELSE
      DBMS_OUTPUT.PUT_LINE('FALSE' || SQL%ROWCOUNT);
    END IF;
  END LOOP;
END;
/

-- Labs_03_02
DECLARE
  CURSOR cur_update
    IS SELECT * FROM customers WHERE credit_limit < 5000 FOR UPDATE;
BEGIN
  FOR v_rec IN cur_update
  LOOP
    IF v_rec IS NOT NULL THEN
      UPDATE customers SET credit_limit = credit_limit + 200
      WHERE customer_id = v_rec.customer_id;
      /*codigo mejorado en rendimiento CURRENT OF*/
      UPDATE customers SET credit_limit = credit_limit + 200
      WHERE CURRENT OF cur_update;
    END IF;
  END LOOP;
END;
/

-- Labs_03_03
CREATE OR REPLACE PACKAGE myTypes
IS 
  TYPE typ_warranty IS RECORD (month positive, year pls_integer);
  SUBTYPE warranty IS typ_warranty;
END myTypes;
/

-- Labs_03_04
CREATE OR REPLACE PACKAGE show_details
IS 
  TYPE rt_order IS REF CURSOR RETURN orders%ROWTYPE;
  TYPE typ_cust_rec IS RECORD (cust_id NUMBER(6), cust_name VARCHAR2(20),
      cust_phone customers.phone_numbers%TYPE, credit NUMBER(9,2), cust_email VARCHAR2(30));
  TYPE rt_cust IS REF CURSOR RETURN typ_cust_rec;
  
  PROCEDURE get_order(p_orderId IN NUMBER, p_cv_order IN OUT rt_order);
  PROCEDURE get_cust(p_custId IN NUMBER, p_cv_cust IN OUT rt_cust);
END show_details;
/

CREATE OR REPLACE PACKAGE BODY show_details
IS 

  PROCEDURE get_order(p_orderId IN NUMBER, p_cv_order IN OUT rt_order) IS
  BEGIN
    OPEN p_cv_order FOR SELECT * FROM orders WHERE order_id = p_orderId;
    -- close p_cv_order
  END get_order;
  
  PROCEDURE get_cust(p_custId IN NUMBER, p_cv_cust IN OUT rt_cust) IS
  BEGIN
    OPEN p_cv_cust FOR SELECT customer_id, cust_first_name, phone_numbers, credit_limit, cust_email 
      FROM customers WHERE customer_id = p_custId;
    -- close p_cv_cust
  END get_cust;
  
END;
/
  
