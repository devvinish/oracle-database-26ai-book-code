-- @setup drop sequence if exists gate_seq
create sequence gate_seq minvalue 1 maxvalue 3 cycle nocache;

select level as call_no, gate_seq.nextval as gate from dual connect by level <= 5;

alter sequence booking_ref_seq increment by 10;
alter sequence booking_ref_seq restart start with 5000;
select booking_ref_seq.nextval as after_restart from dual;

select sequence_name, increment_by, cycle_flag, cache_size, last_number
from   user_sequences
where  sequence_name in ('BOOKING_REF_SEQ', 'GATE_SEQ');
-- @cleanup drop sequence if exists gate_seq
