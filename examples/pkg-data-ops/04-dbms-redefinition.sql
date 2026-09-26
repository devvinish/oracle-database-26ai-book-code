-- @setup begin dbms_redefinition.abort_redef_table(user, 'CREW_NOTES', 'CREW_NOTES_INT'); exception when others then null; end;
-- @setup drop table if exists crew_notes purge
-- @setup drop table if exists crew_notes_int purge
-- the table to change, while it stays in use
create table crew_notes (
  note_id number primary key, employee_id number, note varchar2(200));
insert into crew_notes
select rownum, employee_id, 'Base ' || base_airport from employees;
commit;

-- the new structure: a wider note and a creation date, partitioned by date
create table crew_notes_int (
  note_id     number,
  employee_id number,
  note        varchar2(1000),
  created_on  date default date '2026-03-15'
) partition by range (created_on) interval (numtoyminterval(1, 'MONTH'))
  (partition p0 values less than (date '2026-01-01'));

declare
  v_errors pls_integer;
begin
  dbms_redefinition.can_redef_table(user, 'CREW_NOTES', dbms_redefinition.cons_use_pk);
  dbms_redefinition.start_redef_table(user, 'CREW_NOTES', 'CREW_NOTES_INT',
    col_mapping => 'note_id note_id, employee_id employee_id, note note');
  dbms_redefinition.copy_table_dependents(user, 'CREW_NOTES', 'CREW_NOTES_INT',
    num_errors => v_errors);            -- indexes, constraints, triggers, grants
  dbms_redefinition.finish_redef_table(user, 'CREW_NOTES', 'CREW_NOTES_INT');
  dbms_output.put_line('dependents copied with ' || v_errors || ' errors');
end;
/
select column_name, data_type, data_length from user_tab_columns
where  table_name = 'CREW_NOTES' order by column_id;

select partitioned, (select count(*) from crew_notes) as notes
from   user_tables where table_name = 'CREW_NOTES';
-- @cleanup drop table if exists crew_notes purge
-- @cleanup drop table if exists crew_notes_int purge
