select	last_name, decode( to_char(hire_date, 'Q'),
	        1, 'First quarter of ',
	        2, 'Second quarter of ',
	        3, 'Third quarter of ',
	        4, 'Last quarter of '
 ) || to_char(hire_date, 'YYYY') quarter_of_the_year,
              trunc(months_between(sysdate, hire_date)) "#_of_months"
from employees
order by 3 desc 
/
