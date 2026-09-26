declare
  v_sum dbms_stat_funcs.summarytype;
begin
  dbms_stat_funcs.summary(user, 'TICKETS', 'FARE', 3, v_sum);
  dbms_output.put_line('count ' || v_sum.count || ', min ' || v_sum.min || ', max '
                       || v_sum.max);
  dbms_output.put_line('mean ' || round(v_sum.mean, 2) || ', median ' || v_sum.median
                       || ', stddev ' || round(v_sum.stddev, 2));
  dbms_output.put_line('quantile 25 ' || v_sum.quantile_25 || ', quantile 75 '
                       || v_sum.quantile_75);
end;
/
