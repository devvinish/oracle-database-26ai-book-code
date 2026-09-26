begin
  execute immediate
    'create table if not exists fare_snapshot (route_id number, fare number)';
  execute immediate 'truncate table fare_snapshot';
  dbms_output.put_line('Table ready');
end;
/
