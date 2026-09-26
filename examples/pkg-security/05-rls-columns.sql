begin
  dbms_rls.drop_policy('NIMBUS', 'CUSTOMERS', 'AGENT_COUNTRY');
  -- all rows stay visible; the sensitive columns are only shown for the agent's country
  dbms_rls.add_policy(object_schema         => 'NIMBUS',
                      object_name           => 'CUSTOMERS',
                      policy_name           => 'AGENT_COUNTRY',
                      policy_function       => 'AGENT_COUNTRY_FILTER',
                      statement_types       => 'SELECT',
                      policy_type           => dbms_rls.context_sensitive,
                      sec_relevant_cols     => 'EMAIL, PHONE',
                      sec_relevant_cols_opt => dbms_rls.all_rows);
end;
/
exec set_agent_country('AE')
select customer_id, country_code, email, phone
from   customers
where  customer_id between 1 and 5
order  by customer_id;

select object_name, policy_name, function, sel, upd from user_policies;
-- @cleanup begin dbms_rls.drop_policy('NIMBUS', 'CUSTOMERS', 'AGENT_COUNTRY'); end;
