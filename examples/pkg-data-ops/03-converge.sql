declare
  v_scan   dbms_comparison.comparison_type;
  v_result dbms_comparison.comparison_type;
  v_same   boolean;
begin
  v_same := dbms_comparison.compare('ROUTES_CMP', v_scan, perform_row_dif => true);
  -- make the copy (the "remote" object) the same as the original
  dbms_comparison.converge('ROUTES_CMP', v_scan.scan_id, v_result,
                           converge_options => dbms_comparison.cmp_converge_local_wins);
  commit;
  dbms_output.put_line('merged ' || v_result.rmt_rows_merged || ', deleted '
                       || v_result.rmt_rows_deleted);
  v_same := dbms_comparison.compare('ROUTES_CMP', v_scan);
  dbms_output.put_line('identical now? ' || case when v_same then 'yes' end);
end;
/
-- @cleanup begin dbms_comparison.drop_comparison('ROUTES_CMP'); end;
-- @cleanup drop table if exists routes_copy purge
