SELECT 
  REGEXP_SUBSTR
  ('acgctgcactgca', 
   'acg(.*)gca',    
   1,               
   1,               
   'i',             
   1)               
 "Value" 
FROM dual;
