-- @setup drop table if exists cabin_scores purge
begin
  dbms_data_mining.apply(model_name          => 'CABIN_CLASS',
                         data_table_name     => 'ML_TICKETS',
                         case_id_column_name => 'TICKET_ID',
                         result_table_name   => 'CABIN_SCORES');
end;
/
select * from cabin_scores where ticket_id = 850 order by probability desc;

exec dbms_data_mining.rename_model('ODD_BOOKINGS', 'UNUSUAL_BOOKINGS')
exec dbms_data_mining.drop_model('UNUSUAL_BOOKINGS')

select model_name from user_mining_models order by model_name;
-- @cleanup drop table if exists cabin_scores purge
