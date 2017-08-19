SELECT last_name, 
       TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) YEARS, 
       TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, hire_date), 12)) 	MONTHS
FROM employees
ORDER BY years DESC, MONTHS desc;
