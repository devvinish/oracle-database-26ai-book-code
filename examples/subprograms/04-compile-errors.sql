-- @expect-error
create or replace procedure bad_proc is
begin
  dbms_output.put_line(v_undeclared);
end;
/
show errors procedure bad_proc

select line, position, text from user_errors where name = 'BAD_PROC' order by sequence;
select object_name, status from user_objects where object_name = 'BAD_PROC';
-- @cleanup drop procedure if exists bad_proc
