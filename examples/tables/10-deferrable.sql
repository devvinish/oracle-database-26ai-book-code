-- @setup drop table if exists crew_pairs purge
create table crew_pairs (
  employee_id number primary key,
  partner_id  number constraint crew_pairs_partner_fk references crew_pairs
                     deferrable initially deferred
);

-- each row references the other: possible only when the check waits until commit
insert into crew_pairs values (112, 116);
insert into crew_pairs values (116, 112);
commit;

select * from crew_pairs order by employee_id;
-- @cleanup drop table if exists crew_pairs purge
