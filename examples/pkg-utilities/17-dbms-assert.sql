-- @expect-error
begin
  dbms_output.put_line(dbms_assert.enquote_literal('DXB'));
  dbms_output.put_line(dbms_assert.enquote_literal(replace('O''Hare', '''', '''''')));
  dbms_output.put_line(dbms_assert.enquote_name('flights'));
  dbms_output.put_line(dbms_assert.simple_sql_name('Flight_Log'));
  dbms_output.put_line(dbms_assert.qualified_sql_name('nimbus.flights@loopback'));
  dbms_output.put_line(dbms_assert.schema_name('NIMBUS'));
  dbms_output.put_line(dbms_assert.sql_object_name('routes'));
  dbms_output.put_line(dbms_assert.noop('anything, unchecked'));
  dbms_output.put_line(dbms_assert.simple_sql_name('routes where 1=1'));
end;
/
