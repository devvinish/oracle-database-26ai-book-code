-- @setup drop table if exists test_scores purge
-- @setup drop table if exists test_matrix purge
-- @setup drop table if exists test_roc purge
-- @setup create or replace view test_tickets as select * from ml_tickets where mod(ticket_id, 5) = 0
exec dbms_data_mining.apply('CABIN_CLASS', 'TEST_TICKETS', 'TICKET_ID', 'TEST_SCORES')

declare
  v_accuracy number;
  v_auc      number;
begin
  dbms_data_mining.compute_confusion_matrix(
    accuracy                    => v_accuracy,
    apply_result_table_name     => 'TEST_SCORES',
    target_table_name           => 'TEST_TICKETS',
    case_id_column_name         => 'TICKET_ID',
    target_column_name          => 'CABIN',
    confusion_matrix_table_name => 'TEST_MATRIX',
    score_column_name           => 'PREDICTION',
    score_criterion_column_name => 'PROBABILITY');
  dbms_data_mining.compute_roc(
    roc_area_under_curve        => v_auc,
    apply_result_table_name     => 'TEST_SCORES',
    target_table_name           => 'TEST_TICKETS',
    case_id_column_name         => 'TICKET_ID',
    target_column_name          => 'CABIN',
    roc_table_name              => 'TEST_ROC',
    positive_target_value       => 'BUSINESS',
    score_column_name           => 'PREDICTION',
    score_criterion_column_name => 'PROBABILITY');
  dbms_output.put_line('Accuracy: ' || round(v_accuracy, 3)
                       || ', area under ROC: ' || round(v_auc, 3));
end;
/
select actual_target_value, predicted_target_value, value from test_matrix order by 1, 2;
-- @cleanup drop table if exists test_scores purge
-- @cleanup drop table if exists test_matrix purge
-- @cleanup drop table if exists test_roc purge
-- @cleanup drop view if exists test_tickets
