set null UNKNOWN
select a, b, a and b as a_and_b, a or b as a_or_b, not a as not_a
from   (values (true, true), (true, false), (true, null), (false, null), (null, null))
       t (a, b);
