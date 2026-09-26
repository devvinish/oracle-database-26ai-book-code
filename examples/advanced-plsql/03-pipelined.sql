-- @setup create or replace type t_day_row as object (day date, departures number)
-- @setup create or replace type t_day_tab as table of t_day_row
create or replace function busiest_days (p_top number) return t_day_tab pipelined is
begin
  for r in (select trunc(cast(sys_extract_utc(scheduled_departure) as date)) as d,
                   count(*) as n
            from   flights
            group  by trunc(cast(sys_extract_utc(scheduled_departure) as date))
            order  by n desc, d fetch first p_top rows only) loop
    pipe row (t_day_row(r.d, r.n));                         -- returns a row at once
  end loop;
  return;
end;
/
select * from busiest_days(3);
-- @cleanup drop function if exists busiest_days
-- @cleanup drop type if exists t_day_tab force
-- @cleanup drop type if exists t_day_row force
