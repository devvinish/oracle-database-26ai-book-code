-- @setup drop table if exists travel_notes purge
-- @setup begin ctx_ddl.drop_preference('NIMBUS_LEXER'); exception when others then null; end;
create table travel_notes (note_id number primary key, note varchar2(400));
insert into travel_notes values
  (1, 'The lounge in Dubai is open all night; showers are free for Gold members.'),
  (2, 'Wi-Fi on board is free on flights longer than six hours.'),
  (3, 'Our Singapore lounge serves laksa and has a quiet room for sleeping.'),
  (4, 'Pets travel in the hold, except guide dogs, which travel in the cabin.'),
  (5, 'Gold and Platinum members board first and may bring two cabin bags.'),
  (6, 'The e-gates in Dubai and London speed up passport control.');
commit;

begin
  ctx_ddl.create_preference('NIMBUS_LEXER', 'BASIC_LEXER');
  ctx_ddl.set_attribute('NIMBUS_LEXER', 'PRINTJOINS', '-');     -- keep "Wi-Fi" as one word
end;
/
create index travel_notes_ctx on travel_notes (note) indextype is ctxsys.context
  parameters ('lexer nimbus_lexer sync (manual)');

select score(1) as score, note_id, note
from   travel_notes
where  contains(note, 'lounge', 1) > 0
order  by score desc;
