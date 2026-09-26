-- @setup drop table if exists cabin_explained purge
create or replace view ml_cabin_factors as
  select cabin, tier, points, days_ahead, distance_km, legs, age from ml_tickets;

begin
  dbms_predictive_analytics.explain(
    data_table_name     => 'ML_CABIN_FACTORS',
    explain_column_name => 'CABIN',
    result_table_name   => 'CABIN_EXPLAINED');
end;
/
select attribute_name, round(explanatory_value, 4) as explanatory_value, rank
from   cabin_explained
order  by rank;
-- @cleanup drop table if exists cabin_explained purge
