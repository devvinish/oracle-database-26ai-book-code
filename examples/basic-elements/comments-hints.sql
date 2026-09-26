select /* a comment */ count(*) as flights   -- another comment
from   flights
where  status = 'CANCELLED';

select /*+ index(f flights_departure_ix) */ count(*) as flights_on_jan_1
from   flights f
where  scheduled_departure >= timestamp '2026-01-01 00:00:00 UTC'
and    scheduled_departure <  timestamp '2026-01-02 00:00:00 UTC';
