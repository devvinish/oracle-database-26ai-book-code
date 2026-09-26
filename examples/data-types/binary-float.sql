select 0.1 + 0.2 as number_sum,
       to_binary_double(0.1) + to_binary_double(0.2) as double_sum,
       to_binary_float(0.1) + to_binary_float(0.2)   as float_sum,
       case when to_binary_double(0.1) + to_binary_double(0.2) = 0.3d
            then 'equal' else 'not equal' end          as double_equals_0_3
from   dual;
