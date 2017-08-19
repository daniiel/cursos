CREATE OR REPLACE PACKAGE video_pkg IS
  PROCEDURE new_member
    (p_lname       IN member.last_name%TYPE,
     p_fname       IN member.first_name%TYPE   DEFAULT NULL,
     p_address     IN member.address%TYPE      DEFAULT NULL,
     p_city        IN member.city%TYPE         DEFAULT NULL,
     p_phone       IN member.phone%TYPE        DEFAULT NULL);

  FUNCTION new_rental
    (p_memberid   IN rental.member_id%TYPE,
     p_titleid    IN rental.title_id%TYPE)
    RETURN DATE;
  
  FUNCTION new_rental
    (p_membername IN member.last_name%TYPE,
     p_titleid    IN rental.title_id%TYPE)
    RETURN DATE;
 
  PROCEDURE return_movie
    (p_titleid    IN rental.title_id%TYPE,
     p_copyid     IN rental.copy_id%TYPE,
     p_sts        IN title_copy.status%TYPE);
END video_pkg;
/
SHOW ERRORS

CREATE OR REPLACE PACKAGE BODY video_pkg IS
  PROCEDURE exception_handler(errcode IN  NUMBER, p_context IN VARCHAR2) IS
  BEGIN
    IF errcode = -1 THEN 
      RAISE_APPLICATION_ERROR(-20001,
        'The number is assigned to this member is already in use, '||
        'try again.');
    ELSIF errcode = -2291 THEN
      RAISE_APPLICATION_ERROR(-20002, p_context || 
        ' has attempted to use a foreign key value that is invalid');
    ELSE
      RAISE_APPLICATION_ERROR(-20999, 'Unhandled error in ' ||
        p_context || '. Please contact your application '||
        'administrator with the following information: '
        || CHR(13) || SQLERRM);
    END IF;
  END exception_handler;

  PROCEDURE reserve_movie
    (p_memberid  IN  reservation.member_id%TYPE,
     p_titleid   IN  reservation.title_id%TYPE) IS
    CURSOR c_rented_csr IS
      SELECT exp_ret_date
        FROM rental
        WHERE title_id = p_titleid
        AND act_ret_date IS NULL;
  BEGIN
    INSERT INTO reservation (res_date, member_id, title_id)
    VALUES (SYSDATE, p_memberid, p_titleid);
    COMMIT;
    FOR rented_rec IN c_rented_csr LOOP
      DBMS_OUTPUT.PUT_LINE('Movie reserved. Expected back on: '
        || rented_rec.exp_ret_date);
      EXIT WHEN c_rented_csr%found;
    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      exception_handler(SQLCODE, 'RESERVE_MOVIE');
  END reserve_movie;

PROCEDURE return_movie(
   p_titleid IN rental.title_id%TYPE,
   p_copyid IN rental.copy_id%TYPE,
   p_sts IN title_copy.status%TYPE) IS
   v_dummy VARCHAR2(1);
   CURSOR c_res_csr IS
      SELECT * 
      FROM reservation
      WHERE title_id = p_titleid;
  BEGIN
    SELECT '' INTO v_dummy
      FROM title
      WHERE title_id = p_titleid;
    UPDATE rental
      SET act_ret_date = SYSDATE
      WHERE title_id = p_titleid
      AND copy_id = p_copyid AND act_ret_date IS NULL;
    UPDATE title_copy
      SET status = UPPER(p_sts)
      WHERE title_id = p_titleid AND copy_id = p_copyid;
    FOR res_rec IN c_res_csr LOOP
      IF c_res_csr%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Put this movie on hold -- '||
          'reserved by member #' || res_rec.member_id);
      END IF;
    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      exception_handler(SQLCODE, 'RETURN_MOVIE');
  END return_movie;

  FUNCTION new_rental(
    p_memberid  IN  rental.member_id%TYPE,
    p_titleid   IN  rental.title_id%TYPE) RETURN DATE IS
    CURSOR c_copy_csr IS
      SELECT * FROM title_copy
      WHERE title_id = p_titleid
      FOR UPDATE;
    v_flag   BOOLEAN  := FALSE;
  BEGIN
    FOR copy_rec IN c_copy_csr LOOP
      IF copy_rec.status = 'AVAILABLE' THEN
        UPDATE title_copy 
          SET status = 'RENTED'
          WHERE CURRENT OF c_copy_csr;
        INSERT INTO rental(book_date, copy_id, member_id,
                           title_id, exp_ret_date)
        VALUES (SYSDATE, copy_rec.copy_id, p_memberid, 
                           p_titleid, SYSDATE + 3);
        v_flag := TRUE;
        EXIT;
      END IF;
    END LOOP;
    COMMIT;
    IF v_flag THEN
      RETURN (SYSDATE + 3);
    ELSE
      reserve_movie(p_memberid, p_titleid);
      RETURN NULL;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      exception_handler(SQLCODE, 'NEW_RENTAL');
      RETURN NULL;
  END new_rental;

  FUNCTION new_rental(
    p_membername IN member.last_name%TYPE,
    p_titleid    IN rental.title_id%TYPE) RETURN DATE IS
    CURSOR c_copy_csr IS
      SELECT * FROM title_copy
        WHERE title_id = p_titleid
        FOR UPDATE;
    v_flag  BOOLEAN  := FALSE;
    v_memberid  member.member_id%TYPE;
    CURSOR c_member_csr IS
      SELECT member_id, last_name, first_name
        FROM member
        WHERE LOWER(last_name) = LOWER(p_membername)
        ORDER BY last_name, first_name;
  BEGIN
    SELECT member_id INTO v_memberid
      FROM member
      WHERE lower(last_name) = lower(p_membername);
    FOR copy_rec IN c_copy_csr LOOP
      IF copy_rec.status = 'AVAILABLE' THEN
        UPDATE title_copy
          SET status = 'RENTED'
          WHERE CURRENT OF c_copy_csr;
        INSERT INTO rental (book_date, copy_id, member_id,
                            title_id, exp_ret_date)
          VALUES (SYSDATE, copy_rec.copy_id, v_memberid, 
                            p_titleid, SYSDATE + 3);
        v_flag := TRUE;
        EXIT;
      END IF;
    END LOOP;
    COMMIT;
    IF v_flag THEN
      RETURN(SYSDATE + 3);
    ELSE 
      reserve_movie(v_memberid, p_titleid);
      RETURN NULL;
    END IF;
  EXCEPTION
    WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE(
       'Warning! More than one member by this name.');
      FOR member_rec IN c_member_csr LOOP
        DBMS_OUTPUT.PUT_LINE(member_rec.member_id || CHR(9) ||
          member_rec.last_name || ', ' || member_rec.first_name);
      END LOOP;
      RETURN NULL;
    WHEN OTHERS THEN
      exception_handler(SQLCODE, 'NEW_RENTAL');
      RETURN NULL;
  END new_rental;

  PROCEDURE new_member(
    p_lname       IN member.last_name%TYPE,
    p_fname       IN member.first_name%TYPE   DEFAULT NULL,
    p_address     IN member.address%TYPE      DEFAULT NULL,
    p_city        IN member.city%TYPE         DEFAULT NULL,
    p_phone       IN member.phone%TYPE        DEFAULT NULL) IS
  BEGIN
    INSERT INTO member(member_id, last_name, first_name, 
                       address, city, phone, join_date)
      VALUES(member_id_seq.NEXTVAL, p_lname, p_fname, 
              p_address, p_city, p_phone, SYSDATE);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      exception_handler(SQLCODE, 'NEW_MEMBER');
  END new_member; 
END video_pkg;
/
SHOW ERRORS
