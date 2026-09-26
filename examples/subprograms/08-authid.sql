create or replace function count_my_tables return number
  authid current_user                -- runs with the caller's privileges
is
  v_count number;
begin
  select count(*) into v_count from user_tables;
  return v_count;
end;
/
select object_name, authid from user_procedures where object_name = 'COUNT_MY_TABLES';
select count_my_tables as tables from dual;
-- @cleanup drop function if exists count_my_tables
