CREATE TABLE rental
      (book_date    DATE DEFAULT SYSDATE,
       member_id	    NUMBER(10)
         CONSTRAINT rental_member_id_fk REFERENCES member(member_id),
       copy_id      NUMBER(10),
       act_ret_date DATE,
       exp_ret_date DATE DEFAULT SYSDATE + 2,
       title_id     NUMBER(10),
       CONSTRAINT rental_book_date_copy_title_pk 
         PRIMARY KEY (book_date, member_id, copy_id,title_id),
       CONSTRAINT rental_copy_id_title_id_fk 
         FOREIGN KEY (copy_id, title_id)
         REFERENCES title_copy(copy_id, title_id));

