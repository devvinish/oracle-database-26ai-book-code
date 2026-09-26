select to_multi_byte('NM101') as multi, length(to_multi_byte('NM101')) as chars,
       lengthb(to_multi_byte('NM101')) as bytes,
       to_single_byte(to_multi_byte('NM101')) as single
from   dual;
