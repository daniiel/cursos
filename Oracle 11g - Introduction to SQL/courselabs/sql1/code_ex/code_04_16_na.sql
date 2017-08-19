SELECT  last_name,
        TO_CHAR(hire_date, 
               'fmDdspth "of" Month YYYY fmHH:MI:SS AM')
        HIREDATE
FROM    employees;
