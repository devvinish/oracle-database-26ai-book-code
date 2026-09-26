select airport_code, rowid,
       dbms_rowid.rowid_object(rowid)       as object_no,
       dbms_rowid.rowid_relative_fno(rowid) as file_no,
       dbms_rowid.rowid_block_number(rowid) as block_no,
       dbms_rowid.rowid_row_number(rowid)   as row_no,
       dbms_rowid.rowid_type(rowid)         as type
from   airports
where  airport_code in ('DXB', 'LHR');
