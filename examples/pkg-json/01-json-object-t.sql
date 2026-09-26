declare
  v_doc  json_object_t;
  v_keys json_key_list;
begin
  v_doc := json_object_t.parse(
             '{"flight":"NM150","gate":"A1","delay":0,"crew":{"captain":"Rao"}}');
  dbms_output.put_line('flight ' || v_doc.get_string('flight') || ', delay '
                       || v_doc.get_number('delay') || ', captain '
                       || v_doc.get_object('crew').get_string('captain'));
  v_doc.put('gate', 'B12');                          -- replaces the value
  v_doc.put('delay', 45);
  v_doc.put('boarding', true);                       -- adds a key
  v_doc.remove('crew');
  v_keys := v_doc.get_keys;
  for i in 1 .. v_keys.count loop
    dbms_output.put_line('  ' || v_keys(i) || ': ' || v_doc.get(v_keys(i)).to_string
                         || ' (' || v_doc.get_type(v_keys(i)) || ')');
  end loop;
  dbms_output.put_line(v_doc.to_string);
end;
/
