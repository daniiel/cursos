SELECT employee_id, hire_date,
	MONTHS_BETWEEN (SYSDATE, hire_date) TENURE,
	ADD_MONTHS (hire_date, 6) REVIEW,
	NEXT_DAY (hire_date, 'FRIDAY'), LAST_DAY(hire_date)
FROM   employees
WHERE  MONTHS_BETWEEN (SYSDATE, hire_date) < 150;
