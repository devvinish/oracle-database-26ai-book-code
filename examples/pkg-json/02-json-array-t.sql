declare
  v_list  json_array_t := json_array_t();
  v_item  json_object_t;
  v_total number := 0;
begin
  for r in (select airport_code, city from airports
            where country_code = 'IN' order by 1) loop
    v_item := json_object_t();
    v_item.put('code', r.airport_code);
    v_item.put('city', r.city);
    v_list.append(v_item);
  end loop;
  v_list.append('more to come');                        -- arrays can mix types
  dbms_output.put_line(v_list.get_size || ' elements, the last '
                       || v_list.get(v_list.get_size - 1).to_string);

  for i in 0 .. v_list.get_size - 1 loop                -- positions start at 0
    if v_list.get(i).is_object then
      v_item := treat(v_list.get(i) as json_object_t);
      dbms_output.put_line('  ' || i || ': ' || v_item.to_string);
    end if;
  end loop;
end;
/
