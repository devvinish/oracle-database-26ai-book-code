declare
  ctx   dbms_mle.context_handle_t := dbms_mle.create_context();
  v_aed number;
  v_msg varchar2(100);
begin
  dbms_mle.export_to_mle(ctx, 'fare', 520);                  -- PL/SQL to JavaScript
  dbms_mle.export_to_mle(ctx, 'route', 'DXB-LHR');
  dbms_mle.eval(ctx, 'JAVASCRIPT', q'[
    const bindings = require("mle-js-bindings");
    const fare = bindings.importValue("fare");
    bindings.exportValue("aed", Math.round(fare * 3.6725 * 100) / 100);
    bindings.exportValue("msg", `${bindings.importValue("route")}: ${fare} USD`);
  ]');
  dbms_mle.import_from_mle(ctx, 'aed', v_aed);             -- and back
  dbms_mle.import_from_mle(ctx, 'msg', v_msg);
  dbms_output.put_line(v_msg || ' = ' || v_aed || ' AED');
  dbms_mle.drop_context(ctx);
end;
/
