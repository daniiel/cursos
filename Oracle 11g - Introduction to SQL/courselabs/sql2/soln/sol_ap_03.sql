CREATE TABLE LOCATIONS_NAMED_INDEX
 (location_id NUMBER(4)
         PRIMARY KEY USING INDEX
        (CREATE INDEX locations_pk_idx ON
         LOCATIONS_NAMED_INDEX(location_id)),
location_name VARCHAR2(20));