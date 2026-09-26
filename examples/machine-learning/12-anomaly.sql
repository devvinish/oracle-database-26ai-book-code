-- @setup begin dbms_data_mining.drop_model('ODD_BOOKINGS', force => true); end;
declare
  v_settings dbms_data_mining.setting_list;
begin
  v_settings('ALGO_NAME') := 'ALGO_SUPPORT_VECTOR_MACHINES';
  v_settings('PREP_AUTO') := 'ON';
  dbms_data_mining.create_model2('ODD_BOOKINGS', 'CLASSIFICATION',
    'select ticket_id, days_ahead, distance_km, points, legs from ml_tickets',
    v_settings, 'TICKET_ID', null);          -- no target: a one-class model
end;
/
select ticket_id, days_ahead, distance_km, points,
       round(prediction_probability(odd_bookings, 0 using *), 3) as p_anomaly
from   ml_tickets
order  by prediction_probability(odd_bookings, 0 using *) desc
fetch  first 4 rows only;
