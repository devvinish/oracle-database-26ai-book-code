create or replace package request_counter is
  pragma serially_reusable;
  g_count pls_integer := 0;
end request_counter;
/
begin
  request_counter.g_count := request_counter.g_count + 1;
  dbms_output.put_line('first call: ' || request_counter.g_count);
end;
/
begin
  request_counter.g_count := request_counter.g_count + 1;
  dbms_output.put_line('second call: ' || request_counter.g_count);
end;
/
-- @cleanup drop package if exists request_counter
-- @cleanup drop package if exists fmt
-- @cleanup drop package if exists booking_api
