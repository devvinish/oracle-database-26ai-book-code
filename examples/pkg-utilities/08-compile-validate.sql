-- @setup create or replace view v_hubs as select airport_code, city from airports where is_hub
alter table airports modify (city varchar2(50));      -- a column the view uses changes type
select object_name, status from user_objects where object_name = 'V_HUBS';

exec dbms_utility.compile_schema(schema => user, compile_all => false)
select object_name, status from user_objects where object_name = 'V_HUBS';
-- @cleanup alter table airports modify (city varchar2(40))
-- @cleanup drop view if exists v_hubs
