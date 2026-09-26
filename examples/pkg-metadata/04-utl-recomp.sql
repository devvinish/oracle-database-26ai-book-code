-- @connect sysdba
-- @setup create or replace function nimbus.fx_rate return number is begin return 3.6725; end;
-- @setup create or replace function nimbus.fare_in_aed (p_usd number) return number is begin return round(p_usd * fx_rate, 2); end;
-- a new signature for FX_RATE invalidates the objects that depend on it
create or replace function nimbus.fx_rate (p_currency varchar2 default 'AED')
  return number is
begin
  return case p_currency when 'AED' then 3.6725 end;
end;
/
select object_name, object_type, status from dba_objects
where  owner = 'NIMBUS' and object_name = 'FARE_IN_AED';

exec utl_recomp.recomp_serial('NIMBUS')

select object_name, object_type, status from dba_objects
where  owner = 'NIMBUS' and object_name = 'FARE_IN_AED';
-- @cleanup drop function if exists nimbus.fare_in_aed
-- @cleanup drop function if exists nimbus.fx_rate
