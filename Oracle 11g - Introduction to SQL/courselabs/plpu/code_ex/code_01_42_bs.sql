-- You must run code_01_32_as.sql before running this code example. 

SELECT text
FROM   user_source
WHERE  name = 'ADD_DEPT' AND type = 'PROCEDURE'
ORDER BY line; 
