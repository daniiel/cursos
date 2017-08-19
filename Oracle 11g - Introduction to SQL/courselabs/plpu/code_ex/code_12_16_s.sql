-- Run code_12_15_as.sql and code_12_15_bs.sql before running this code example. 

ALTER TABLE t2 MODIFY (col_a VARCHAR2(20))
/
SELECT ud.name, ud.referenced_name, ud.referenced_type, uo.status
FROM user_dependencies ud, user_objects uo
WHERE ud.name = uo.object_name AND ud.name = 'V'
/
