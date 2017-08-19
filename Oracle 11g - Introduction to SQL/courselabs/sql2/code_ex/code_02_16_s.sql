drop table emp_new_sal cascade constraints;
create table emp_new_sal
( salary number constraint 
         sal_ck check ( salary > 100 ) 
         deferrable 
         initially immediate,
   bonus number constraint 
         bonus_ck check (bonus > 0 ) 
         deferrable 
         initially deferred
  );