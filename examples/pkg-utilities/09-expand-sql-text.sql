-- @setup create or replace view v_long_routes as select route_id, origin, destination from routes where distance_km > 10000
declare
  v_out clob;
begin
  dbms_utility.expand_sql_text('select count(*) from v_long_routes where origin = ''DXB''',
                               v_out);
  dbms_output.put_line(v_out);
end;
/
-- @cleanup drop view if exists v_long_routes
