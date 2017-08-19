CREATE TABLE member	  
     (member_id	     NUMBER(10) 
         CONSTRAINT member_member_id_pk PRIMARY KEY,
       last_name     VARCHAR2(25)
         CONSTRAINT member_last_name_nn NOT NULL,
       first_name    VARCHAR2(25),
       address       VARCHAR2(100),
       city          VARCHAR2(30),
       phone         VARCHAR2(15),
       join_date     DATE DEFAULT SYSDATE
         CONSTRAINT member_join_date_nn NOT NULL);
