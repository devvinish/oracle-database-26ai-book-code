-- @setup begin dbms_rls.drop_policy('NIMBUS', 'CUSTOMERS', 'AGENT_COUNTRY'); exception when others then null; end;
-- the application sets the agent's country in a context; only this procedure can
create or replace context agent_ctx using set_agent_country;

create or replace procedure set_agent_country (p_country varchar2) is
begin
  dbms_session.set_context('AGENT_CTX', 'COUNTRY', p_country);
end;
/
-- the policy function returns the predicate that Oracle adds to every query
create or replace function agent_country_filter (p_schema varchar2, p_object varchar2)
  return varchar2 is
begin
  return 'country_code = sys_context(''AGENT_CTX'', ''COUNTRY'')';
end;
/
begin
  dbms_rls.add_policy(object_schema   => 'NIMBUS',
                      object_name     => 'CUSTOMERS',
                      policy_name     => 'AGENT_COUNTRY',
                      policy_function => 'AGENT_COUNTRY_FILTER',
                      statement_types => 'SELECT, UPDATE, DELETE',
                      policy_type     => dbms_rls.context_sensitive);
end;
/
exec set_agent_country('IN')
select count(*) as customers, min(country_code) as country from customers;

exec set_agent_country('AE')
select count(*) as customers, min(country_code) as country from customers;
