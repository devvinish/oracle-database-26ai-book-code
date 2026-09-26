-- @setup begin dbms_data_mining.drop_model('FARE_GLM', force => true); end;
-- economy fares as a straight line of distance, with 95% bounds
declare
  v_settings dbms_data_mining.setting_list;
begin
  v_settings('ALGO_NAME') := 'ALGO_GENERALIZED_LINEAR_MODEL';
  dbms_data_mining.create_model2('FARE_GLM', 'REGRESSION',
    'select t.ticket_id, t.fare, r.distance_km
     from   tickets t join flights f using (flight_id) join routes r using (route_id)
     where  t.cabin = ''ECONOMY''',
    v_settings, 'TICKET_ID', 'FARE');
end;
/
select distance_km,
       round(prediction(fare_glm using distance_km), 2)              as predicted_fare,
       round(prediction_bounds(fare_glm using distance_km).lower, 2) as lower_95,
       round(prediction_bounds(fare_glm using distance_km).upper, 2) as upper_95
from   (values (1137), (5497), (11641)) t (distance_km);
