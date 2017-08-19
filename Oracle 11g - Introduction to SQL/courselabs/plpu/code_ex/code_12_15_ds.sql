-- Run code_12_15_bs.sql before running this code example. 

SELECT ud.name, ud.type, ud.referenced_name, 
       ud.referenced_type, uo.status
FROM user_dependencies ud, user_objects uo
WHERE ud.name = uo.object_name AND ud.name = 'V';
