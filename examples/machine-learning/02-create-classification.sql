-- @setup begin dbms_data_mining.drop_model('CABIN_CLASS', force => true); end;
declare
  v_settings dbms_data_mining.setting_list;
begin
  v_settings('ALGO_NAME')     := 'ALGO_DECISION_TREE';
  v_settings('PREP_AUTO')     := 'ON';
  v_settings('TREE_TERM_MAX_DEPTH') := '5';
  dbms_data_mining.create_model2(
    model_name          => 'CABIN_CLASS',
    mining_function     => 'CLASSIFICATION',
    data_query          => 'select * from ml_tickets where mod(ticket_id, 5) <> 0',
    set_list            => v_settings,
    case_id_column_name => 'TICKET_ID',
    target_column_name  => 'CABIN');
end;
/
select model_name, mining_function, algorithm, build_duration, model_size
from   user_mining_models
where  model_name = 'CABIN_CLASS';
