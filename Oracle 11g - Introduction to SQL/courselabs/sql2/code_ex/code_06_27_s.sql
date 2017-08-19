DROP TABLE emp_history;
CREATE TABLE emp_history
  (employee_id    NUMBER(6) NOT NULL,
   resignation_date DATE)
   
/

insert into emp_history
  values(102, TO_DATE('13-AUG-1992', 'DD-MON-YYYY'));
insert into emp_history
  values(103,TO_DATE( '07-DEC-1997', 'DD-MON-YYYY'));
insert into emp_history
  values(106, TO_DATE( '27-NOV-1998', 'DD-MON-YYYY'));
insert into emp_history
  values(107, TO_DATE( '10-NOV-1996', 'DD-MON-YYYY'));
 
COMMIT;


DELETE FROM empl6 E
WHERE employee_id =  
           (SELECT employee_id
            FROM   emp_history 
            WHERE  employee_id = E.employee_id);
