SELECT
  REGEXP_INSTR
  ('0123456789',      
  '(123)(4(56)(78))', 
  1,                  
  1,                  
  0,                 
  'i',                
  1)             
"Position"
FROM dual;                                                                    