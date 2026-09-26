-- @setup create or replace type t_codes as table of varchar2(10)
select origin, destinations, cardinality(destinations) as how_many
from   (select r.origin,
               cast(collect(cast(r.destination as varchar2(10)) order by r.destination)
                    as t_codes) as destinations
        from   routes r
        where  r.origin in ('SIN', 'SYD')
        group  by r.origin);
