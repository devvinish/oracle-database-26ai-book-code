-- @connect sysdba
begin
  -- HTTP to the test server of Chapter 54, and to example.com over HTTPS
  dbms_network_acl_admin.append_host_ace(
    host => 'host.docker.internal', lower_port => 8099, upper_port => 8099,
    ace  => xs$ace_type(privilege_list => xs$name_list('http'),
                        principal_name => 'NIMBUS', principal_type => xs_acl.ptype_db));
  dbms_network_acl_admin.append_host_ace(
    host => 'example.com',
    ace  => xs$ace_type(privilege_list => xs$name_list('http'),
                        principal_name => 'NIMBUS', principal_type => xs_acl.ptype_db));
  -- plain TCP connections (UTL_TCP, UTL_SMTP, UTL_MAIL) to the test server's ports
  dbms_network_acl_admin.append_host_ace(
    host => 'host.docker.internal', lower_port => 2525, upper_port => 2525,
    ace  => xs$ace_type(privilege_list => xs$name_list('connect'),
                        principal_name => 'NIMBUS', principal_type => xs_acl.ptype_db));
  dbms_network_acl_admin.append_host_ace(
    host => 'host.docker.internal', lower_port => 8099, upper_port => 8099,
    ace  => xs$ace_type(privilege_list => xs$name_list('connect'),
                        principal_name => 'NIMBUS', principal_type => xs_acl.ptype_db));
  -- name lookups (UTL_INADDR) for any host
  dbms_network_acl_admin.append_host_ace(
    host => '*',
    ace  => xs$ace_type(privilege_list => xs$name_list('resolve'),
                        principal_name => 'NIMBUS', principal_type => xs_acl.ptype_db));
end;
/
select host, lower_port as lport, upper_port as uport, privilege
from   dba_host_aces
where  principal = 'NIMBUS'
order  by host, privilege;
