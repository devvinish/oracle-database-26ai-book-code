-- @setup begin dbms_data_mining.drop_model('CABIN_CLASS_COPY', force => true); end;
declare
  v_model blob;
begin
  dbms_lob.createtemporary(v_model, true);
  dbms_data_mining.export_sermodel(v_model, 'CABIN_CLASS');
  dbms_output.put_line('Serialized model: ' || dbms_lob.getlength(v_model) || ' bytes');
  dbms_data_mining.import_sermodel(v_model, 'CABIN_CLASS_COPY');
end;
/
select model_name, algorithm from user_mining_models where model_name like 'CABIN%';
-- @cleanup begin dbms_data_mining.drop_model('CABIN_CLASS_COPY', force => true); end;
