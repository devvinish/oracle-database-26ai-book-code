select '[' || ltrim('   Dubai   ') || ']'           as ltrim,
       '[' || rtrim('   Dubai   ') || ']'           as rtrim,
       '[' || trim('   Dubai   ') || ']'            as trim,
       trim(leading '0' from '000451')             as no_zeros,
       rtrim('NM101xyxy', 'xy')                    as rtrim_set,
       trim(both '*' from '**Gold**')              as stars
from   dual;
