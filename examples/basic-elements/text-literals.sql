select 'Chicago O''Hare'            as doubled_quote,
       q'[Chicago O'Hare]'          as q_quote,
       q'{It's "Nimbus" Air}'       as q_braces,
       n'São Paulo'                 as national,
       ''                           as empty_is_null,
       'Line 1' || chr(10) || 'Line 2' as with_newline
from   dual;
