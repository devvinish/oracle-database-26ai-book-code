-- @setup drop table if exists ddl_log purge
-- @setup create table ddl_log (logged_at timestamp, event varchar2(30), object_type varchar2(30), object_name varchar2(128))
create or replace trigger schema_ddl_trg
  after ddl on schema
begin
  insert into ddl_log
  values (localtimestamp, ora_sysevent, ora_dict_obj_type, ora_dict_obj_name);
end;
/
create table temp_notes (n number);
drop table temp_notes purge;

select event, object_type, object_name from ddl_log order by logged_at;
drop trigger schema_ddl_trg;
-- @cleanup drop table if exists ddl_log purge
