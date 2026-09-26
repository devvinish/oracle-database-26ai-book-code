declare
  type t_names  is table of varchar2(30);                -- nested table
  type t_top3   is varray(3) of varchar2(30);            -- varray, at most 3 elements
  v_crew  t_names := t_names('Dubois', 'Müller', 'Laurent');
  v_best  t_top3  := t_top3();
begin
  v_crew.extend;
  v_crew(v_crew.last) := 'Zhang';
  v_crew.delete(2);                                      -- leaves a gap
  dbms_output.put_line('crew: count ' || v_crew.count || ', last index ' || v_crew.last);

  v_best.extend(2);
  v_best(1) := 'Haddad';
  v_best(2) := 'Evans';
  dbms_output.put_line('varray: count ' || v_best.count || ' of limit ' || v_best.limit);
  dbms_output.put_line('exists(2)? '
                       || case when v_crew.exists(2) then 'yes' else 'no' end);
end;
/
