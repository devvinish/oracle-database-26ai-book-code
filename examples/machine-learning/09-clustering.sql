-- @setup begin dbms_data_mining.drop_model('CUSTOMER_SEGMENTS', force => true); end;
-- @setup create or replace view ml_customers as select b.customer_id, count(*) as bookings, round(sum(b.total_amount)) as spent, max(nvl(json_value(c.loyalty, '$.points' returning number), 0)) as points from bookings b join customers c on c.customer_id = b.customer_id group by b.customer_id
declare
  v_settings dbms_data_mining.setting_list;
begin
  v_settings('ALGO_NAME')         := 'ALGO_KMEANS';
  v_settings('CLUS_NUM_CLUSTERS') := '3';
  v_settings('PREP_AUTO')         := 'ON';
  dbms_data_mining.create_model2('CUSTOMER_SEGMENTS', 'CLUSTERING',
    'select * from ml_customers', v_settings, 'CUSTOMER_ID');
end;
/
select cluster_id(customer_segments using *) as segment, count(*) as customers,
       round(avg(bookings), 1) as avg_bookings, round(avg(spent)) as avg_spent,
       round(avg(points)) as avg_points
from   ml_customers
group  by cluster_id(customer_segments using *)
order  by avg_spent;
