grant select on flights to nimbus_app;
grant select on routes to nimbus_app;
grant update (status) on flights to nimbus_app;

select grantee, table_name, privilege from user_tab_privs_made
where  grantee = 'NIMBUS_APP' order by table_name, privilege;

select grantee, table_name, column_name, privilege from user_col_privs_made
where  grantee = 'NIMBUS_APP';
