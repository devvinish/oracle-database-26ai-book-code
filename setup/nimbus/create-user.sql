-- Creates the NIMBUS schema of the book. Run as a DBA (SYS or SYSTEM) in the pluggable database:
--   sql sys@localhost:1521/FREEPDB1 as sysdba @create-user.sql
-- You are asked for the password of the new user.
accept nimbus_pw char prompt 'Password for NIMBUS: ' hide
create user nimbus identified by "&nimbus_pw"
  default tablespace users temporary tablespace temp
  quota unlimited on users;
grant db_developer_role to nimbus;
grant create any directory, create database link, create materialized view to nimbus;
grant create any context, create credential to nimbus;
grant execute on sys.dbms_crypto to nimbus;
grant execute on sys.dbms_fga to nimbus;                   -- fine-grained auditing (Chapter 57)
grant administer redaction policy to nimbus;               -- data redaction (Chapter 57)
grant execute on sys.dbms_lock to nimbus;
grant execute on sys.dbms_flashback to nimbus;
grant execute on sys.dbms_comparison to nimbus;            -- Chapter 63
grant execute on sys.dbms_redefinition to nimbus;          -- Chapter 63
grant execute on sys.dbms_hprof to nimbus;                 -- PL/SQL profiler (Chapter 64)
grant execute on sys.utl_file to nimbus;
-- queues, pipes, alerts, and change notification (Chapter 56)
grant execute on sys.dbms_aq to nimbus;
grant execute on sys.dbms_aqadm to nimbus;
grant execute on sys.dbms_pipe to nimbus;
grant execute on sys.dbms_alert to nimbus;
grant execute on sys.dbms_change_notification to nimbus;   -- DBMS_CQ_NOTIFICATION
grant change notification to nimbus;
grant select_catalog_role to nimbus;
grant soda_app to nimbus;                                  -- SODA collections (Chapter 59)
grant ctxapp to nimbus;                                    -- Oracle Text (Chapter 61)
-- job chains of DBMS_SCHEDULER (Chapter 55) are built on rules
begin
  dbms_rule_adm.grant_system_privilege(dbms_rule_adm.create_rule_set_obj, 'NIMBUS');
  dbms_rule_adm.grant_system_privilege(dbms_rule_adm.create_rule_obj, 'NIMBUS');
  dbms_rule_adm.grant_system_privilege(dbms_rule_adm.create_evaluation_context_obj, 'NIMBUS');
end;
/

-- The folder of sample files (welcome.txt, fuel_prices.csv, logo.png) that the examples of
-- BFILEs, UTL_FILE, DBMS_LOB, and external tables read and write. Copy setup/nimbus/files to
-- this path on the database server first, or change the path.
create or replace directory nimbus_files as '/opt/oracle/nimbus_files';
grant read, write on directory nimbus_files to nimbus;
