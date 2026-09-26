-- @setup drop table if exists gate_log purge
-- @setup create table gate_log (flight_id number, gate varchar2(4))
declare
  c       integer := dbms_sql.open_cursor;
  v_ids   dbms_sql.number_table;
  v_gates dbms_sql.varchar2_table;
  v_rows  integer;
begin
  v_ids(1) := 2800; v_gates(1) := 'A1';
  v_ids(2) := 2801; v_gates(2) := 'B7';
  v_ids(3) := 2802; v_gates(3) := 'C3';
  dbms_sql.parse(c, 'insert into gate_log values (:id, :gate)', dbms_sql.native);
  dbms_sql.bind_array(c, 'id', v_ids);
  dbms_sql.bind_array(c, 'gate', v_gates);
  v_rows := dbms_sql.execute(c);                           -- one call, three rows
  dbms_output.put_line(v_rows || ' rows inserted');
  dbms_sql.close_cursor(c);
end;
/
select * from gate_log;
-- @cleanup drop table if exists gate_log purge
