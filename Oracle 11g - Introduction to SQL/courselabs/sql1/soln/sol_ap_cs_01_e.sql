CREATE TABLE reservation
      (res_date      DATE,
       member_id	     NUMBER(10)
         CONSTRAINT reservation_member_id REFERENCES member(member_id),
       title_id	     NUMBER(10)
         CONSTRAINT reservation_title_id REFERENCES title(title_id),
       CONSTRAINT reservation_resdate_mem_tit_pk PRIMARY KEY 
         (res_date, member_id, title_id));


