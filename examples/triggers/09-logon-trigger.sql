-- @setup drop table if exists logon_log purge
-- @setup create table logon_log (logged_at timestamp, username varchar2(30), program varchar2(64))
create or replace trigger nimbus_logon_trg
  after logon on schema
begin
  insert into logon_log values (localtimestamp, user, sys_context('USERENV', 'MODULE'));
end;
/
connect nimbus/"&nimbus_password"@localhost:1521/FREEPDB1
select username, program from logon_log;
drop trigger nimbus_logon_trg;
-- @cleanup drop table if exists logon_log purge
