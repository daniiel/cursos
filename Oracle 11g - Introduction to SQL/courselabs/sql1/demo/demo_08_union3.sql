SELECT location_id, department_name "Department", 
   TO_CHAR(NULL) "Warehouse location"  
FROM departments
UNION
SELECT location_id, TO_CHAR(NULL) "Department", 
   state_province
FROM locations;
