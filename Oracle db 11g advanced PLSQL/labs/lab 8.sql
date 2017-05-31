--08_01
SELECT COUNT(*), ROUND(AVG(quantity_on_hand)) AVG_AMT,
  PRODUCT_ID, PRODUCT_NAME
FROM inventories NATURAL JOIN product_information
GROUP BY product_id, product_name;

--08_02
SELECT /*+ result_cache*/COUNT(*), ROUND(AVG(quantity_on_hand)) AVG_AMT,
  PRODUCT_ID, PRODUCT_NAME
FROM inventories NATURAL JOIN product_information
GROUP BY product_id, product_name;

--08_03
CREATE OR REPLACE TYPE list_tYP IS TABLE OF VARCHAR2(35);
/

CREATE OR REPLACE FUNCTION get_warehoise_names 
RETURN list_typ
IS
  v_count   BINARY_INTEGER;
  v_wh_names  LIST_TYP;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM warehouses;
  
  FOR i IN 1..v_count LOOP
    SELECT warehouse_name INTO v_wh_names(i)
    FROM warehouses;
  END LOOP;
  RETURN v_wh_names;
END get_warehoise_names;
/

--08_04
CREATE OR REPLACE FUNCTION get_warehoise_names 
RETURN list_typ
RESULT_CACHE relies_on (warehouses)
IS
  v_count   BINARY_INTEGER;
  v_wh_names  LIST_TYP;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM warehouses;
  
  FOR i IN 1..v_count LOOP
    SELECT warehouse_name INTO v_wh_names(i)
    FROM warehouses;
  END LOOP;
  RETURN v_wh_names;
END get_warehoise_names;
/