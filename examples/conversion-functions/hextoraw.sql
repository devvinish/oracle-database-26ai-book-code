select rawtohex(utl_raw.cast_to_raw('NM')) as hex, hextoraw('4E4D') as raw_value,
       utl_raw.cast_to_varchar2(hextoraw('4E696D627573')) as text,
       rawtonhex(hextoraw('4E4D')) as nhex
from   dual;
