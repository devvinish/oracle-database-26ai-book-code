-- @setup drop type if exists t_pilot_emp force
-- @setup drop type if exists t_staff force
create or replace type t_staff as object (
  name varchar2(40),
  member function describe return varchar2
) not final;
/
create or replace type body t_staff as
  member function describe return varchar2 is begin return name; end;
end;
/
create or replace type t_pilot_emp under t_staff (
  licence varchar2(12),
  overriding member function describe return varchar2
);
/
create or replace type body t_pilot_emp as
  overriding member function describe return varchar2 is
  begin return 'Captain ' || name || ' (' || licence || ')'; end;
end;
/
declare
  type t_list is table of t_staff;
  v_people t_list := t_list(t_staff('Emma Williams'),
                            t_pilot_emp('Kenji Sato', 'ATPL-40771'));
begin
  for i in 1 .. v_people.count loop
    dbms_output.put_line(v_people(i).describe);          -- dynamic dispatch
  end loop;
end;
/
-- @cleanup drop type if exists t_pilot_emp force
-- @cleanup drop type if exists t_staff force
