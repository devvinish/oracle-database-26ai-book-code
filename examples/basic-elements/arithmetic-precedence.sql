select 2 + 3 * 4 as no_parens, (2 + 3) * 4 as parens, -2 * -3 as unary,
       10 / 4 as division, 7 - 2 - 1 as left_to_right, 'NM' || (100 + 1) as concat_sum
from   dual;
