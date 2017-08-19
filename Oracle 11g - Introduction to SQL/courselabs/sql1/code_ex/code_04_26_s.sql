SELECT 	TO_CHAR(ROUND((salary/7), 2),'99G999D99', 
	'NLS_NUMERIC_CHARACTERS = '',.'' ') 
	"Formatted Salary"
FROM employees;
