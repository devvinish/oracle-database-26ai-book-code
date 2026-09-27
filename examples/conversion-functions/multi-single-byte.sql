select length(to_multi_byte('NM101'))  as chars,
       lengthb(to_multi_byte('NM101')) as bytes,
       dump(to_multi_byte('N'), 16)    as full_width_n,
       to_single_byte(to_multi_byte('NM101')) as single
from   dual;
