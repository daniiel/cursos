SELECT e.last_name, hire_date,sysdate
   ,     (CASE
	     WHEN  (sysdate -TO_YMINTERVAL('15-0'))>= hire_date THEN 				'15 years of service'
        WHEN (sysdate -TO_YMINTERVAL('10-0'))>= hire_date THEN 				'10 years of service'
        WHEN (sysdate - TO_YMINTERVAL('5-0'))>= hire_date THEN 				'5 years of service'
		   ELSE 'maybe next year!'
          END)           AS "Awards"
    FROM   employees e;

