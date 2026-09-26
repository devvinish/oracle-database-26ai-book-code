select to_clob('Nimbus Air')               as a_clob,
       to_nclob('Nimbus Air')              as an_nclob,
       to_blob(hextoraw('4E696D627573'))   as a_blob
from   dual;

select to_clob(bfilename('NIMBUS_FILES', 'welcome.txt'), 873, 'text/plain') as file_text
from   dual;

select dbms_lob.getlength(to_blob(bfilename('NIMBUS_FILES', 'logo.png'))) as logo_bytes
from   dual;
