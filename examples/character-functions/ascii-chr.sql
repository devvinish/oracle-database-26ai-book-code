select ascii('A') as a, ascii('a') as lower_a, ascii('Ü') as u_umlaut,
       chr(78) || chr(77) as code, nchr(252) as nchr_252
from   dual;

select 'Line one' || chr(10) || 'Line two' as two_lines from dual;
