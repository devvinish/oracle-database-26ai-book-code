-- routes from Auckland with at most two changes, without visiting an airport twice
with trip (airport, path, stops, km) as (
  select cast('AKL' as varchar2(3)), cast('AKL' as varchar2(40)), 0, 0 from dual
  union all
  select r.destination, t.path || '>' || r.destination, t.stops + 1, t.km + r.distance_km
  from   trip t join routes r on r.origin = t.airport
  where  t.stops < 3
)
search depth first by airport set seq
cycle airport set is_cycle to 'Y' default 'N'
select path, km from trip
where  airport = 'LHR' and is_cycle = 'N'
order  by km;
