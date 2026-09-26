declare
  v_start timestamp with time zone := timestamp '2026-03-15 09:00:00 Asia/Dubai';
  procedure show (p_calendar varchar2) is
    v_next timestamp with time zone := v_start;
  begin
    dbms_output.put_line(p_calendar);
    for i in 1 .. 3 loop
      dbms_scheduler.evaluate_calendar_string(p_calendar, v_start, v_next, v_next);
      dbms_output.put_line('  ' || to_char(v_next, 'Dy DD-MON-YYYY HH24:MI'));
    end loop;
  end;
begin
  show('FREQ=HOURLY; INTERVAL=4');
  show('FREQ=WEEKLY; BYDAY=MON,FRI; BYHOUR=6; BYMINUTE=0');
  show('FREQ=MONTHLY; BYMONTHDAY=-1; BYHOUR=23');            -- last day of the month
  show('FREQ=MONTHLY; BYDAY=1SUN; BYHOUR=4');                -- first Sunday
  show('FREQ=YEARLY; BYDATE=0101,0701; BYHOUR=0');
end;
/
