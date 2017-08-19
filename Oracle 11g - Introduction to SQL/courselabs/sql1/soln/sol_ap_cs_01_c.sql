CREATE TABLE title_copy
     ( copy_id       NUMBER(10),
       title_id      NUMBER(10)
         CONSTRAINT title_copy_title_if_fk REFERENCES title(title_id),
       status        VARCHAR2(15)
         CONSTRAINT title_copy_status_nn NOT NULL
         CONSTRAINT title_copy_status_ck CHECK (status IN    
         ('AVAILABLE', 'DESTROYED','RENTED', 'RESERVED')),
       CONSTRAINT title_copy_copy_id_title_id_pk
         PRIMARY KEY (copy_id, title_id));

