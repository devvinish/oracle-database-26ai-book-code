-- @connect sysdba
select name, value from v$diag_info
where  name in ('ADR Home', 'Diag Trace', 'Diag Alert')
order  by name;

