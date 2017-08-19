--If you execute both code_04_07_s.sql and code_04_07_n.sql you will get
--two rows for location_id 3300
SELECT l.location_id, l.city, l.country_id
FROM   loc l
JOIN   countries c
ON(l.country_id = c.country_id)
JOIN regions USING(region_id)
WHERE region_name = 'Europe'
