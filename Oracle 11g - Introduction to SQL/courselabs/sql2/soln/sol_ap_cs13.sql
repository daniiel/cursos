SELECT REGEXP_COUNT(phone,'99',1,'i') position, member_id, last_name, first_name
FROM member
WHERE REGEXP_COUNT(phone,'99',1,'i') > 0;
