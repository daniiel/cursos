select t.title, m.member_id, t.price, (t.price*6) latefee 
from title t, member m, rental r 
WHERE t.title_id = r.title_id AND
   m.member_id = r.member_id AND
   r.act_ret_date is null