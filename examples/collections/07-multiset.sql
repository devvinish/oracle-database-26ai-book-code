declare
  v_a t_code_list := t_code_list('DXB', 'LHR', 'SIN', 'LHR');
  v_b t_code_list := t_code_list('LHR', 'SYD');
  procedure show (p_label varchar2, p_list t_code_list) is
    v_text varchar2(100);
  begin
    for i in 1 .. p_list.count loop v_text := v_text || p_list(i) || ' '; end loop;
    dbms_output.put_line(rpad(p_label, 20) || v_text);
  end;
begin
  show('union',             v_a multiset union v_b);
  show('union distinct',    v_a multiset union distinct v_b);
  show('intersect',         v_a multiset intersect v_b);
  show('except',            v_a multiset except v_b);
  show('set',               set(v_a));
  dbms_output.put_line('SIN member of a? '
                       || case when 'SIN' member of v_a then 'yes' else 'no' end);
  dbms_output.put_line('a is a set? '
                       || case when v_a is a set then 'yes' else 'no' end);
  dbms_output.put_line('b submultiset of a? '
                       || case when v_b submultiset of v_a then 'yes' else 'no' end);
end;
/
-- @cleanup drop type if exists t_code_list force
