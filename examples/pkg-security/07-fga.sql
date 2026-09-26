-- @setup begin dbms_fga.drop_policy('NIMBUS', 'CUSTOMERS', 'DOB_ACCESS'); exception when others then null; end;
-- @setup drop table if exists dob_access_log purge
-- @setup create table dob_access_log (accessed_at timestamp default systimestamp, db_user varchar2(128), sql_text varchar2(400))
create or replace procedure log_dob_access (p_schema varchar2, p_table varchar2,
                                            p_policy varchar2) is
  pragma autonomous_transaction;
begin
  insert into dob_access_log (db_user, sql_text)
  values (sys_context('USERENV', 'SESSION_USER'),
          substr(sys_context('USERENV', 'CURRENT_SQL'), 1, 400));
  commit;
end;
/
begin
  dbms_fga.add_policy(object_schema   => 'NIMBUS',
                      object_name     => 'CUSTOMERS',
                      policy_name     => 'DOB_ACCESS',
                      audit_condition => 'country_code = ''IN''',
                      audit_column    => 'DATE_OF_BIRTH',
                      handler_module  => 'LOG_DOB_ACCESS',
                      statement_types => 'SELECT');
end;
/
select count(*) from customers where country_code = 'IN';                 -- no audit column
select max(date_of_birth) from customers where country_code = 'AE';       -- no matching row
select max(date_of_birth) from customers where country_code = 'IN';       -- audited

select db_user, sql_text from dob_access_log;
-- @cleanup begin dbms_fga.drop_policy('NIMBUS', 'CUSTOMERS', 'DOB_ACCESS'); end;
-- @cleanup drop procedure if exists log_dob_access
-- @cleanup drop table if exists dob_access_log purge
-- @cleanup drop procedure if exists set_agent_country
-- @cleanup drop function if exists agent_country_filter
