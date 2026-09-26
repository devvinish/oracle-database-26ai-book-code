-- @setup create or replace trigger airports_touch_trg before update on airports for each row begin null; end;
begin
  dbms_ddl.alter_compile('TRIGGER', user, 'AIRPORTS_TOUCH_TRG');
  dbms_ddl.set_trigger_firing_property(user, 'AIRPORTS_TOUCH_TRG', fire_once => false);
  dbms_output.put_line('fire once? ' || case when dbms_ddl.is_trigger_fire_once(user,
                                         'AIRPORTS_TOUCH_TRG') then 'yes' else 'no' end);
  dbms_output.put_line(substr(dbms_ddl.wrap(
    'create function f return number is begin return 1; end;'), 1, 60));
end;
/
-- @cleanup drop trigger if exists airports_touch_trg
