drop table dept_add_ext;

--The HR department needs a report of addresses of all departments.
--Use the LOCATIONS and COUNTRIES tables.
--Show the details using NATURAL JOIN to produce the results.
CREATE TABLE dept_add_ext
  (location_id, street_address, city, state_province, country_name)
   ORGANIZATION EXTERNAL
    (
     TYPE ORACLE_DATAPUMP
     DEFAULT DIRECTORY emp_dir
     LOCATION
      ('emp4.exp','emp5.exp')
    )
   PARALLEL
AS
SELECT location_id, street_address, city, state_province, country_name
FROM locations
NATURAL JOIN countries;
 
