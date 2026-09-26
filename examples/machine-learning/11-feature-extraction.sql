-- @setup begin dbms_data_mining.drop_model('CUSTOMER_FEATURES', force => true); end;
declare
  v_settings dbms_data_mining.setting_list;
begin
  v_settings('ALGO_NAME')          := 'ALGO_SINGULAR_VALUE_DECOMP';
  v_settings('FEAT_NUM_FEATURES')  := '2';
  v_settings('PREP_AUTO')          := 'ON';
  dbms_data_mining.create_model2('CUSTOMER_FEATURES', 'FEATURE_EXTRACTION',
    'select * from ml_customers', v_settings, 'CUSTOMER_ID');
end;
/
select customer_id, bookings, spent, points,
       feature_id(customer_features using *)                 as top_feature,
       round(feature_value(customer_features, 1 using *), 3) as feature_1,
       round(feature_value(customer_features, 2 using *), 3) as feature_2
from   ml_customers
where  customer_id in (1, 2, 50, 90);

select s.feature_id, round(s.value, 3) as value
from   ml_customers m, table(feature_set(customer_features using *)) s
where  m.customer_id = 1;
