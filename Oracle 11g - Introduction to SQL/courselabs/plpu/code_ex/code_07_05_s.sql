CREATE OR REPLACE PACKAGE error_pkg IS
  e_fk_err	     EXCEPTION;
  e_seq_nbr_err	EXCEPTION;
  PRAGMA EXCEPTION_INIT (e_fk_err, -2292);
  PRAGMA EXCEPTION_INIT (e_seq_nbr_err, -2277);
  -- Partial code.
END error_pkg;
/
