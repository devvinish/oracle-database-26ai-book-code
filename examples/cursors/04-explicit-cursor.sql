declare
  cursor c_crew is
    select e.first_name || ' ' || e.last_name as name, a.crew_role
    from   crew_assignments a join employees e on e.employee_id = a.employee_id
    where  a.flight_id = 100
    order  by a.crew_role;
  v_crew c_crew%rowtype;
begin
  open c_crew;
  loop
    fetch c_crew into v_crew;
    exit when c_crew%notfound;
    dbms_output.put_line(c_crew%rowcount || '. ' || v_crew.name
                         || ' (' || v_crew.crew_role || ')');
  end loop;
  close c_crew;
end;
/
