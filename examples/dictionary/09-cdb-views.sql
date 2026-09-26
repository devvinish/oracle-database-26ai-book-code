-- @connect sysdba
select con_id, name, open_mode from v$pdbs order by con_id;
