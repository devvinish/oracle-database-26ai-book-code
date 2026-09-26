-- @setup drop context if exists nimbus_ctx
create or replace context nimbus_ctx using nimbus_ctx_api;

create or replace procedure nimbus_ctx_api (p_airport varchar2) is
begin
  dbms_session.set_context('NIMBUS_CTX', 'HOME_AIRPORT', p_airport);
end;
/
exec nimbus_ctx_api('LHR')

select sys_context('NIMBUS_CTX', 'HOME_AIRPORT') as home_airport from dual;
-- @cleanup drop procedure if exists nimbus_ctx_api
