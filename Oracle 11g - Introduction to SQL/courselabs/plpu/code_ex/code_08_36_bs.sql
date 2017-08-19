-- Run code_08_18_s.sql before running this code example. 

SELECT trigger_type, trigger_body
FROM user_triggers
WHERE trigger_name = 'SECURE_EMP';
