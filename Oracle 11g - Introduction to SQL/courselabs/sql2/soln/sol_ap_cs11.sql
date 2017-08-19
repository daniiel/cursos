select member_id, last_name, first_name from member m
where 2 <= (select count(*) from rental_history where member_id = m.member_id);