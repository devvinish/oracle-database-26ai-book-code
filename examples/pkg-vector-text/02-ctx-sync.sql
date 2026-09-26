insert into travel_notes values
  (7, 'A new lounge opens in London Heathrow Terminal 3 in April.');
commit;

select count(*) as found_before_sync from travel_notes where contains(note, 'Heathrow') > 0;
exec ctx_ddl.sync_index('TRAVEL_NOTES_CTX')

select count(*) as found_after_sync from travel_notes where contains(note, 'Heathrow') > 0;

exec ctx_ddl.optimize_index('TRAVEL_NOTES_CTX', ctx_ddl.optlevel_full)
