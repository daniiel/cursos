DROP TABLE REWARDS;
CREATE TABLE rewards
  (employee_id    NUMBER(6) NOT NULL,
   pay_raise NUMBER(8,2),
   payraise_date DATE NOT NULL
   )
/

insert into rewards
  values(103, 10000, TO_DATE('13-AUG-1992', 'DD-MON-YYYY'));
insert into rewards
  values(141, 2500,TO_DATE( '07-DEC-1997', 'DD-MON-YYYY'));
insert into rewards
  values(201, 4875, TO_DATE( '27-NOV-1998', 'DD-MON-YYYY'));
insert into rewards
  values(206, 1800, TO_DATE( '10-NOV-1996', 'DD-MON-YYYY'));
 
COMMIT;

SELECT last_name, salary from empl6
WHERE  empl6.employee_id 
IN     (SELECT employee_id FROM rewards);
UPDATE empl6
SET    salary = (SELECT empl6.salary + rewards.pay_raise
                 FROM   rewards
                 WHERE  employee_id  =  
                        empl6.employee_id
                 AND  payraise_date = 
                      (SELECT MAX(payraise_date) 
                      FROM   rewards
                      WHERE  employee_id = empl6.employee_id))
WHERE  empl6.employee_id 
IN     (SELECT employee_id FROM rewards);

commit;

SELECT last_name, salary from empl6
WHERE  empl6.employee_id 
IN     (SELECT employee_id FROM rewards);




