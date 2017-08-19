SELECT e.last_name
   ,     (CASE extract(year from e.hire_date)
           WHEN 1998 THEN 'Needs Review'
           ELSE 'not this year!'
           END )           AS "Review "
FROM   employees e
ORDER BY e.hire_date;
