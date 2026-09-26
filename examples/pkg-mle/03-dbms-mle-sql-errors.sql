-- @expect-error
declare
  ctx    dbms_mle.context_handle_t := dbms_mle.create_context();
  v_st   dbms_mle.error_frames_t;
begin
  -- JavaScript can run SQL in the same session, through the session object
  dbms_mle.eval(ctx, 'JAVASCRIPT', source_name => 'feed_check', source => q'[
    const result = session.execute(
      "select count(*) as n from flights where status = :s", ["CANCELLED"]);
    console.log("cancelled flights:", result.rows[0].N);
    throw new Error("fuel price feed missing");
  ]');
exception
  when others then
    dbms_output.put_line(sqlerrm);
    v_st := dbms_mle.get_ctx_error_stack(ctx);           -- where it happened in JavaScript
    for i in 1 .. v_st.count loop
      dbms_output.put_line('  at line ' || v_st(i).line || ', column ' || v_st(i).col);
    end loop;
    dbms_mle.drop_context(ctx);
end;
/
