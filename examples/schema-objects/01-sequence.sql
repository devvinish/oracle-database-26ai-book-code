-- @setup drop sequence if exists booking_ref_seq
create sequence booking_ref_seq start with 1000 increment by 1 cache 20;

select booking_ref_seq.nextval as first, booking_ref_seq.nextval as same_row from dual;
select booking_ref_seq.nextval as second from dual;
select booking_ref_seq.currval as current_value from dual;
