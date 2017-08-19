SET SERVEROUTPUT ON

SET VERIFY OFF
DECLARE
  v_countryid varchar2(20):= 'CA';
  v_country_record countries%ROWTYPE;
BEGIN
 SELECT	* 
 INTO	v_country_record
 FROM	countries
 WHERE	country_id = UPPER(v_countryid);

 DBMS_OUTPUT.PUT_LINE ('Country Id: ' || v_country_record.country_id || 
  ' Country Name: ' || v_country_record.country_name   
  || ' Region: ' || v_country_record.region_id);

END;
