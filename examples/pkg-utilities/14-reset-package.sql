create or replace package visit_counter is
  g_visits pls_integer := 0;
end;
/
begin
  visit_counter.g_visits := 5;
end;
/
exec dbms_session.reset_package
begin
  dbms_output.enable;          -- RESET_PACKAGE reset DBMS_OUTPUT's state too
  dbms_output.put_line('visits after reset: ' || visit_counter.g_visits);
end;
/
-- @cleanup drop package if exists visit_counter
