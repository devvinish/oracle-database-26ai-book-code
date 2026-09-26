update aircraft set status = 'MAINTENANCE' where tail_number = 'A6-NAA';
select tail_number, status from aircraft where tail_number = 'A6-NAA';
rollback;
select tail_number, status from aircraft where tail_number = 'A6-NAA';
