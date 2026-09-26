select note_id, note from travel_notes
where  contains(note, 'lounge AND (Dubai OR Singapore)') > 0 order by note_id;

select note_id, note from travel_notes
where  contains(note, 'NEAR((gold, board), 3)') > 0;             -- within 3 words

select note_id from travel_notes where contains(note, 'fuzzy(passpor)') > 0;  -- misspelled
select note_id from travel_notes where contains(note, '$travels') > 0;          -- stems
select note_id from travel_notes where contains(note, '{wi-fi}') > 0;   -- - alone is MINUS

select ctx_query.count_hits('TRAVEL_NOTES_CTX', 'free', exact => true) as hits from dual;
