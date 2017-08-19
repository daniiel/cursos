-- First determine current timezone and time
SELECT SESSIONTIMEZONE,
       TO_CHAR(CURRENT_DATE, 'DD-MON-YYYY HH24:MI') CURR_DATE
FROM DUAL;

-- Change your time zone usinge [+|-]HH:MI format such that the current
-- time returns a time between 6pm and 8am
ALTER SESSION SET TIME_ZONE='-07:00';

-- Add a new member (for a sample test)
EXECUTE  video_pkg.new_member('Elias', 'Elliane',  'Vine Street', 'California', '789-123-4567')

-- Restore the original time zone for your session.
ALTER SESSION SET TIME_ZONE='-00:00';
