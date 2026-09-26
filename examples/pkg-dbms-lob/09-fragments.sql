-- @setup drop table if exists gate_notices purge
-- @setup create table gate_notices (id number primary key, text clob) lob (text) store as securefile
insert into gate_notices values (1, 'NA417 to LHR: gate A1, boarding 10:05');

declare
  v_text clob;
begin
  select text into v_text from gate_notices where id = 1 for update;
  dbms_lob.fragment_replace(v_text, 2, 3, 20, 'B12');       -- A1 becomes B12
  dbms_output.put_line(v_text);
  dbms_lob.fragment_insert(v_text, 9, 1, 'DELAYED: ');       -- insert at the start
  dbms_output.put_line(v_text);
  dbms_lob.fragment_delete(v_text, 9, 1);                    -- and take it out again
  dbms_output.put_line(v_text);
  commit;
end;
/
-- @cleanup drop table if exists gate_notices purge
