DROP TABLE contacts;

CREATE TABLE contacts
(
  l_name    VARCHAR2(30), 
  p_number  VARCHAR2(30)
    CONSTRAINT p_number_format      
      CHECK ( REGEXP_LIKE ( p_number, '^\(\d{3}\) \d{3}-\d{4}$' ) )
);