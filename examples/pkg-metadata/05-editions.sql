-- @connect sysdba
-- @setup drop user if exists ebr_demo cascade
-- @setup drop edition if exists release_2 cascade
create user ebr_demo no authentication;             -- a schema-only account
alter user ebr_demo enable editions;                -- cannot be undone
grant create procedure to ebr_demo;

create or replace function ebr_demo.fare_tax (p_fare number) return number is
begin
  return round(p_fare * 0.05, 2);                   -- release 1: 5 %
end;
/
create edition release_2 as child of ora$base;
alter session set edition = release_2;

create or replace function ebr_demo.fare_tax (p_fare number) return number is
begin
  return round(p_fare * 0.07, 2);                   -- release 2: 7 %
end;
/
select sys_context('USERENV', 'CURRENT_EDITION_NAME') as edition,
       ebr_demo.fare_tax(100) as tax from dual;

alter session set edition = ora$base;
select sys_context('USERENV', 'CURRENT_EDITION_NAME') as edition,
       ebr_demo.fare_tax(100) as tax from dual;

select object_name, edition_name, status from dba_objects_ae
where  owner = 'EBR_DEMO' order by edition_name;
-- @cleanup drop user if exists ebr_demo cascade
-- @cleanup drop edition if exists release_2 cascade
