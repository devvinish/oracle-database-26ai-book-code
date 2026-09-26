select rowid, rowidtochar(rowid) as as_text, rowidtonchar(rowid) as as_nchar
from   airports
where  airport_code = 'DXB';

select airport_code
from   airports
where  rowid = chartorowid((select rowidtochar(rowid) from airports
                            where airport_code = 'SIN'));
