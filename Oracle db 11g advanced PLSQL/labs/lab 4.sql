-- lab 04

-- 04_01. Create object
CREATE TYPE typ_item AS OBJECT (
  prodId NUMBER(5),
  price NUMBER(7,2)
);
/
-- definiendo un tipo nested table
CREATE TYPE typ_item_nst AS TABLE OF typ_item;
/

CREATE TABLE pOrder (
  ordId NUMBER(5),
  supplier NUMBER(5),
  requester NUMBER(4),
  ordered date,
  items typ_item_nst
  ) NESTED TABLE items STORE AS item_stor_tab;
  /


-- 04_02
BEGIN
  -- insertar una orden
  INSERT INTO pOrder (ordId, supplier, requester, ordered, items)
  VALUES (1000, 12345, 9876, SYSDATE, NULL);
  
  -- insertar los items para cada orden creada
  INSERT INTO TABLE (SELECT items FROM pOrder WHERE ordId = 1000)
  VALUES (typ_item(99,129.00));
END;
/

-- ORA-06512: en línea 7 22908. 00000 -  "reference to NULL table value"

-- Solucionando la ejecucion anterior queda:

BEGIN
  -- insertar una orden,
  -- A better approach is to avoid setting the table column to NULL,
  -- and instead, use a nested table's default constructor to initialize
  INSERT INTO pOrder (ordId, supplier, requester, ordered, items)
  VALUES (1000, 12345, 9876, SYSDATE, typ_item_nst(typ_item(99,129.00)));

END;
/

BEGIN
  -- this is another alternative
  UPDATE pOrder SET items = typ_item_nst(typ_item(99,129.00))
  WHERE ordId = 1000;
END;
/

-- 04_03 
DECLARE
  TYPE credit_card_typ IS VARRAY(100) OF VARCHAR2(30);
  v_mc    credit_card_typ := credit_card_typ();
  v_visa  credit_card_typ := credit_card_typ();
  v_am    credit_card_typ ;
  v_disc  credit_card_typ := credit_card_typ();
  v_dc    credit_card_typ := credit_card_typ();
BEGIN
  v_mc.EXTEND;
  v_visa.EXTEND;
  v_am.EXTEND;
  v_disc.EXTEND;
  v_dc.EXTEND;
END;
/
