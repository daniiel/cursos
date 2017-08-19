set autotrace on

SELECT * FROM emp2 WHERE UPPER(last_name) = 'KING';




CREATE INDEX upper_last_name_idx ON emp2 (UPPER(last_name));



SELECT * FROM emp2 WHERE UPPER(last_name) = 'KING';



set autotrace off;