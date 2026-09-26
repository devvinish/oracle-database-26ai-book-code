select airport_code, rowid, dump(rowid) as stored_as,
       utl_raw.cast_to_raw(airport_code) as as_raw
from   airports
where  airport_code = 'DXB';
