select dbms_lob.getlength(bfilename('NIMBUS_FILES', 'logo.png'))      as bytes,
       dbms_lob.fileexists(bfilename('NIMBUS_FILES', 'logo.png'))     as logo_exists,
       dbms_lob.fileexists(bfilename('NIMBUS_FILES', 'nothing.txt'))  as missing_file
from   dual;
