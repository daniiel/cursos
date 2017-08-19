SELECT  m.first_name||' '||m.last_name MEMBER, t.title, 
        r.book_date, r.act_ret_date - r.book_date DURATION
FROM  member m 
JOIN rental r
ON   r.member_id = m.member_id
JOIN title t
ON r.title_id = t.title_id
ORDER BY member;


