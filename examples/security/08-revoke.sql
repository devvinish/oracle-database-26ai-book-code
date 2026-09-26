revoke update on flights from nimbus_app;
revoke select on routes from nimbus_app;

select table_name, privilege from user_tab_privs_made where grantee = 'NIMBUS_APP';
