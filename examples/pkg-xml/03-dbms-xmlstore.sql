-- @setup drop table if exists gate_plan purge
-- @setup create table gate_plan (flight_no varchar2(6) primary key, gate varchar2(4), remark varchar2(40))
declare
  ctx  dbms_xmlstore.ctxtype;
  v_n  number;
begin
  ctx := dbms_xmlstore.newcontext('GATE_PLAN');
  v_n := dbms_xmlstore.insertxml(ctx,
    '<ROWSET><ROW><FLIGHT_NO>NM150</FLIGHT_NO><GATE>A1</GATE></ROW>
             <ROW><FLIGHT_NO>NM101</FLIGHT_NO><GATE>C3</GATE></ROW></ROWSET>');
  dbms_output.put_line(v_n || ' inserted');

  dbms_xmlstore.setkeycolumn(ctx, 'FLIGHT_NO');         -- update and delete by key
  dbms_xmlstore.setupdatecolumn(ctx, 'GATE');
  dbms_xmlstore.setupdatecolumn(ctx, 'REMARK');
  v_n := dbms_xmlstore.updatexml(ctx,
    '<ROWSET><ROW><FLIGHT_NO>NM150</FLIGHT_NO><GATE>B12</GATE>
                  <REMARK>gate change</REMARK></ROW></ROWSET>');
  dbms_output.put_line(v_n || ' updated');
  dbms_xmlstore.closecontext(ctx);
end;
/
select * from gate_plan order by flight_no;
-- @cleanup drop table if exists gate_plan purge
