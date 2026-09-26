-- @setup drop table if exists search_results purge
create global temporary table search_results (
  flight_id number, fare number
) on commit delete rows;

insert into search_results values (100, 499), (101, 520);
select count(*) as rows_in_transaction from search_results;
commit;
select count(*) as rows_after_commit from search_results;
-- @cleanup drop table if exists search_results purge
