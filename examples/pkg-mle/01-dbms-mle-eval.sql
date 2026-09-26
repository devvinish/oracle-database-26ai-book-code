declare
  ctx dbms_mle.context_handle_t;
begin
  ctx := dbms_mle.create_context();
  dbms_mle.eval(ctx, 'JAVASCRIPT', q'[
    const flights = ["NM150", "NM101", "NM205"];
    console.log(`${flights.length} flights: ${flights.join(", ")}`);
    console.log("6 x 7 =", 6 * 7);
  ]');
  dbms_mle.drop_context(ctx);
end;
/
