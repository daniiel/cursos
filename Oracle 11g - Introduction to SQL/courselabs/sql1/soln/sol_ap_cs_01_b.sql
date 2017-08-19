CREATE TABLE title
       (title_id	     NUMBER(10)
         CONSTRAINT title_title_id_pk PRIMARY KEY,
       title         VARCHAR2(60)
         CONSTRAINT title_title_nn NOT NULL,
       description   VARCHAR2(400)
         CONSTRAINT title_description_nn NOT NULL,
       rating        VARCHAR2(4)
         CONSTRAINT title_rating_ck CHECK
         (rating IN ('G', 'PG', 'R', 'NC17', 'NR')),
       category      VARCHAR2(20) 
         CONSTRAINT title_category_ck CHECK
         (category IN ('DRAMA', 'COMEDY', 'ACTION',
         'CHILD', 'SCIFI', 'DOCUMENTARY')),
       release_date   DATE);
