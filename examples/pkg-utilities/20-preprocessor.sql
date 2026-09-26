alter session set plsql_ccflags = 'debug:false';
create or replace procedure show_mode is
begin
  $if $$debug $then
    dbms_output.put_line('debug');
  $else
    dbms_output.put_line('release');
  $end
end;
/
exec dbms_preprocessor.print_post_processed_source('PROCEDURE', user, 'SHOW_MODE')
-- @cleanup drop procedure if exists show_mode
