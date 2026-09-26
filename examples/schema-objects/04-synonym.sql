-- @setup drop synonym if exists fl
create synonym fl for flights;
select count(*) as flights from fl;

select synonym_name, table_owner, table_name from user_synonyms;
drop synonym fl;
