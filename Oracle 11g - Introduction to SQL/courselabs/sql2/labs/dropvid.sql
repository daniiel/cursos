--This script is a destructive script.
--It drops all tables in the Video application.
--Run this script from SQL*Plus or SQL Developer.

drop table reservation;
drop table rental;
drop table title_copy;
drop table member;
drop table title;
drop sequence member_id_seq;
drop sequence title_id_seq;
drop view title_avail;

PROMPT ALL VIDEO TABLES DROPPED