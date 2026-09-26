-- @expect-error
declare
  v_loyalty json;
  v_obj     json_object_t;
begin
  select loyalty into v_loyalty from customers where customer_id = 37;
  v_obj := json_object_t(v_loyalty);                    -- from the JSON type
  v_obj.put('tier', 'PLATINUM');
  v_loyalty := v_obj.to_json;                           -- back to the JSON type, for SQL
  update customers set loyalty = v_loyalty where customer_id = 37;
  dbms_output.put_line('points: ' || v_obj.get_number('points'));
  dbms_output.put_line('missing key: ' || nvl(to_char(v_obj.get_number('miles')), 'NULL'));
  v_obj.on_error(1);                                    -- raise errors instead of NULL
  dbms_output.put_line('tier as a number: ' || v_obj.get_number('tier'));
exception
  when others then
    dbms_output.put_line(sqlerrm);
end;
/
select json_value(loyalty, '$.tier') as tier from customers where customer_id = 37;
rollback;
