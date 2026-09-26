-- @setup declare n number; begin n := dbms_soda.drop_collection('lostBaggage'); end;
declare
  v_coll soda_collection_t;
  v_cur  soda_cursor_t;
  v_doc  soda_document_t;
  v_n    number;
  v_ok   boolean;
  function doc (p_json varchar2) return soda_document_t is
  begin
    return soda_document_t(b_content => utl_raw.cast_to_raw(p_json));
  end;
begin
  v_coll := dbms_soda.create_collection('lostBaggage');
  v_n := v_coll.insert_one(doc('{"tag":"DXB123456","flight":"NM150","status":"found"}'));
  v_n := v_coll.insert_one(doc('{"tag":"LHR987654","flight":"NM101","status":"missing"}'));
  dbms_output.put_line('documents: ' || v_coll.find().count);

  -- query by example: the documents whose status is "missing"
  v_cur := v_coll.find().filter('{"status":"missing"}').get_cursor;
  while v_cur.has_next loop
    v_doc := v_cur.next;
    dbms_output.put_line('missing: ' || json_value(v_doc.get_json, '$.tag'));
    -- replace it by its key, which SODA generated
    v_n := v_coll.find().key(v_doc.get_key)
                 .replace_one(doc('{"tag":"LHR987654","flight":"NM101","status":"found"}'));
  end loop;
  v_ok := v_cur.close;

  v_n := v_coll.find().filter('{"status":"found"}').remove;
  dbms_output.put_line('removed: ' || v_n || ', left: ' || v_coll.find().count);
end;
/
select column_value as collections from dbms_soda.list_collection_names();
-- @cleanup commit
-- @cleanup declare n number; begin n := dbms_soda.drop_collection('lostBaggage'); end;
