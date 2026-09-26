begin
  dbms_credential.create_credential(
    credential_name => 'OPS_REPORTS',
    username        => 'ops',
    password        => 'ops-demo',
    comments        => 'Daily report service');
end;
/
select credential_name, username, enabled, comments from user_credentials;

begin
  dbms_credential.disable_credential('OPS_REPORTS');
  dbms_credential.update_credential('OPS_REPORTS', 'username', 'ops_reader');
  dbms_credential.enable_credential('OPS_REPORTS');
end;
/
select credential_name, username, enabled from user_credentials;
-- @cleanup begin dbms_credential.drop_credential('OPS_REPORTS'); end;
