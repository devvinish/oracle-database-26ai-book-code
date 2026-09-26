-- @setup begin dbms_redact.drop_policy('NIMBUS', 'CUSTOMERS', 'HIDE_CONTACT'); exception when others then null; end;
begin
  dbms_redact.add_policy(
    object_schema       => 'NIMBUS',
    object_name         => 'CUSTOMERS',
    policy_name         => 'HIDE_CONTACT',
    column_name         => 'DATE_OF_BIRTH',
    function_type       => dbms_redact.full,            -- dates become 01-JAN-2001
    expression          =>
      q'[sys_context('USERENV', 'CLIENT_IDENTIFIER') is null
         or sys_context('USERENV', 'CLIENT_IDENTIFIER') != 'SUPERVISOR']');
  dbms_redact.alter_policy(
    object_schema       => 'NIMBUS',
    object_name         => 'CUSTOMERS',
    policy_name         => 'HIDE_CONTACT',
    action              => dbms_redact.add_column,
    column_name         => 'PHONE',
    function_type       => dbms_redact.partial,
    function_parameters => 'VVVVVVVVVVVVVVVVVVVV,VVVVVVVVVVVVVVVVVVVV,*,1,8');
  dbms_redact.alter_policy(
    object_schema          => 'NIMBUS',
    object_name            => 'CUSTOMERS',
    policy_name            => 'HIDE_CONTACT',
    action                 => dbms_redact.add_column,
    column_name            => 'EMAIL',
    function_type          => dbms_redact.regexp,
    regexp_pattern         => dbms_redact.re_pattern_email_address,
    regexp_replace_string  => dbms_redact.re_redact_email_name);
end;
/
select customer_id, email, phone, date_of_birth from customers where customer_id <= 3;

exec dbms_session.set_identifier('SUPERVISOR')
select customer_id, email, phone, date_of_birth from customers where customer_id <= 3;
exec dbms_session.clear_identifier
-- @cleanup begin dbms_redact.drop_policy('NIMBUS', 'CUSTOMERS', 'HIDE_CONTACT'); end;
