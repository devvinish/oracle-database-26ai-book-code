-- @setup drop table if exists days_bins purge
-- @setup drop view if exists ml_tickets_binned
begin
  dbms_data_mining_transform.create_bin_num(bin_table_name => 'DAYS_BINS');
  dbms_data_mining_transform.insert_bin_num_eqwidth(
    bin_table_name  => 'DAYS_BINS',
    data_table_name => 'ML_TICKETS',
    bin_num         => 4,
    exclude_list    => dbms_data_mining_transform.column_list(
                         'TICKET_ID', 'POINTS', 'DISTANCE_KM', 'LEGS', 'AGE'));
  dbms_data_mining_transform.xform_bin_num(
    bin_table_name => 'DAYS_BINS', data_table_name => 'ML_TICKETS',
    xform_view_name => 'ML_TICKETS_BINNED');
end;
/
select col, val, bin from days_bins order by val nulls first;

select days_ahead as bin, count(*) as tickets
from   ml_tickets_binned
group  by days_ahead
order  by 1;
-- @cleanup drop view if exists ml_tickets_binned
-- @cleanup drop table if exists days_bins purge
-- @cleanup begin for m in (select model_name from user_mining_models) loop dbms_data_mining.drop_model(m.model_name); end loop; end;
-- @cleanup drop view if exists ml_cabin_factors
-- @cleanup drop view if exists ml_customers
-- @cleanup drop view if exists ml_tickets
