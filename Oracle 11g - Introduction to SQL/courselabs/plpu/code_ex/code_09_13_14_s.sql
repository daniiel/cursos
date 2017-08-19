CREATE OR REPLACE TRIGGER check_salary
  FOR INSERT OR UPDATE OF salary, job_id
  ON employees
  WHEN (NEW.job_id <> 'AD_PRES')
  COMPOUND TRIGGER

  TYPE salaries_t            IS TABLE OF employees.salary%TYPE;
  min_salaries               salaries_t;
  max_salaries               salaries_t;

  TYPE department_ids_t       IS TABLE OF employees.department_id%TYPE;
  department_ids              department_ids_t;

  TYPE department_salaries_t  IS TABLE OF employees.salary%TYPE
                                INDEX BY VARCHAR2(80);
  department_min_salaries     department_salaries_t;
  department_max_salaries     department_salaries_t;

  BEFORE STATEMENT IS
  BEGIN
  SELECT MIN(salary), MAX(salary), NVL(department_id, -1)
      BULK COLLECT INTO  min_Salaries, max_salaries, department_ids
   FROM    employees
   GROUP BY department_id;

   FOR j IN 1..department_ids.COUNT() LOOP
    department_min_salaries(department_ids(j)) := min_salaries(j);
    department_max_salaries(department_ids(j)) := max_salaries(j);
   END LOOP;
  END BEFORE STATEMENT;

  AFTER EACH ROW IS
  BEGIN
  IF :NEW.salary < department_min_salaries(:NEW.department_id)
     OR :NEW.salary > department_max_salaries(:NEW.department_id) THEN
    RAISE_APPLICATION_ERROR(-20505,'New Salary is out of acceptable range');
  END IF;
  END AFTER EACH ROW;

END check_salary;
/
