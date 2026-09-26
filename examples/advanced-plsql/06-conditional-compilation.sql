alter session set plsql_ccflags = 'debug:true, trace_level:2';

create or replace procedure show_build is
begin
  $if $$debug $then
    dbms_output.put_line('debug build, trace level ' || $$trace_level);
  $else
    dbms_output.put_line('production build');
  $end
  $if dbms_db_version.version >= 23 $then
    dbms_output.put_line('compiled on release ' || dbms_db_version.version || '.'
                         || dbms_db_version.release || ' in ' || $$plsql_unit);
  $end
end;
/
exec show_build
