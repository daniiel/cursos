CREATE OR REPLACE VIEW european_cities 
AS
SELECT location_id, city, country_id
FROM   locations 
WHERE  country_id IN
  (SELECT country_id 
   FROM countries 
   NATURAL JOIN regions
   WHERE region_name = 'Europe')
WITH CHECK OPTION;
