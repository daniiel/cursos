SELECT   TO_CHAR(NEXT_DAY(ADD_MONTHS
         (hire_date, 6), 'FRIDAY'),
         'fmDay, Month ddth, YYYY')
         "Next 6 Month Review"
FROM      employees
ORDER BY  hire_date;
