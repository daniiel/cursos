-- You must run code_01_26_as.sql before running this code example.

VARIABLE  b_phone_no VARCHAR2(15)
EXECUTE  :b_phone_no := '8006330575' 
PRINT   b_phone_no
EXECUTE  format_phone (:b_phone_no)
PRINT b_phone_no
