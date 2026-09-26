create or replace procedure where_am_i is
begin
  for i in 1 .. utl_call_stack.dynamic_depth loop
    dbms_output.put_line(i || ': ' || utl_call_stack.concatenate_subprogram(
                                         utl_call_stack.subprogram(i))
                         || ' line ' || utl_call_stack.unit_line(i));
  end loop;
end;
/
create or replace package trip_planner is
  procedure plan;
end;
/
create or replace package body trip_planner is
  procedure check_route is begin where_am_i; end;
  procedure plan is begin check_route; end;
end;
/
exec trip_planner.plan
-- @cleanup drop package if exists trip_planner
-- @cleanup drop procedure if exists where_am_i
