INSERT INTO (SELECT location_id, city, country_id
             FROM   loc 
             WHERE  country_id IN
             (SELECT country_id 
              FROM countries 
              NATURAL JOIN regions
              WHERE region_name = 'Europe')
              WITH CHECK OPTION)
VALUES (3500, 'Berlin', 'DE');
