-- @expect-error
begin
  dbms_stats.set_table_prefs(user, 'FLIGHT_COPY', 'STALE_PERCENT', '5');
  dbms_stats.lock_table_stats(user, 'FLIGHT_COPY');          -- keep them as they are
end;
/
select dbms_stats.get_prefs('STALE_PERCENT', user, 'FLIGHT_COPY') as stale_percent,
       dbms_stats.get_prefs('STALE_PERCENT')                      as database_default
from   dual;

select stattype_locked from user_tab_statistics where table_name = 'FLIGHT_COPY';

exec dbms_stats.gather_table_stats(user, 'FLIGHT_COPY')
-- @cleanup drop table if exists flight_copy purge
