SELECT last_name,phone_number phone
FROM employees;
SELECT last_name, regexp_replace(phone_number, '\.',  '-') phone
FROM employees;