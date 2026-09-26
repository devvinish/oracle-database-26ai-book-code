-- @connect sysdba
begin
  dbms_session.set_identifier('agent_42');              -- the end user behind a session
  dbms_monitor.client_id_stat_enable('agent_42');       -- collect statistics for it
end;
/
select count(*) from nimbus.bookings where status = 'CONFIRMED';
select count(*) from nimbus.tickets where cabin = 'BUSINESS';

select stat_name, case when value > 0 then 'yes' end as recorded
from   v$client_stats
where  client_identifier = 'agent_42'
and    stat_name in ('user calls', 'parse count (total)', 'execute count', 'DB time')
order  by stat_name;

begin
  dbms_monitor.client_id_stat_disable('agent_42');
  dbms_session.clear_identifier;
end;
/
