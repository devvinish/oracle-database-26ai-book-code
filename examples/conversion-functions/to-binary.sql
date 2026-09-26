select to_binary_double('3.14159') as bd, to_binary_float(1/3) as bf,
       to_binary_double('INF') as inf,
       to_binary_float('abc' default 0 on conversion error) as bad
from   dual;
