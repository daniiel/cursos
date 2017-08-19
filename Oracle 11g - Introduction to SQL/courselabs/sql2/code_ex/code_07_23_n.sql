SELECT REGEXP_COUNT
   ('123123123123', 
   '123',          
    2,             
   'i')            
   As Count
FROM dual;