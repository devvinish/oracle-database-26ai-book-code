select sys_guid() as guid1, sys_guid() as guid2, length(rawtohex(sys_guid())) as hex_len
from   dual;
