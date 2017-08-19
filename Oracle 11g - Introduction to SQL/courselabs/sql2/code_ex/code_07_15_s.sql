SELECT street_address,
REGEXP_INSTR(street_address,'[[:alpha:]]') AS First_Alpha_Position
FROM  locations; 
