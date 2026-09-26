select con_name_to_id('FREEPDB1')          as con_id,
       con_id_to_con_name(3)              as con_name,
       con_id_to_dbid(3)                  as dbid,
       con_dbid_to_id(con_id_to_dbid(3))  as back_to_id,
       con_id_to_uid(3)                   as uid_value
from   dual;

select con_id_to_guid(3) as guid, con_guid_to_id(con_id_to_guid(3)) as from_guid,
       con_uid_to_id(con_id_to_uid(3)) as from_uid
from   dual;
