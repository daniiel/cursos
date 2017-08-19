--This can be executed only by teach_b account
--Make sure that you execute the code examples first 
--code_01_12_sa.sql, code_01_12_sb.sql
--Then,create users
CREATE USER BELL
IDENTIFIED BY BELL;
CREATE USER KOCHHAR
IDENTIFIED BY KOCHHAR;
--Now, grant the role
GRANT manager TO BELL, KOCHHAR;