-- @connect sysdba
alter session set container = cdb$root;           -- the root of the container database
show pdbs

select con_id, name, open_mode from v$containers order by con_id;
