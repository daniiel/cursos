drop table emp_books cascade constraints;
create table emp_books (book_id number,title varchar2(20), constraint emp_books_pk  primary key (book_id));