-- @setup drop table if exists media purge
create table media (id number, notes clob, logo blob, file_ref bfile, profile json,
                    embedding vector(3, float32));
insert into media values (1, 'Long text', empty_blob(),
                          bfilename('NIMBUS_FILES', 'logo.png'),
                          json('{"tier":"Gold"}'), to_vector('[0.1, 0.2, 0.3]'));

select id, notes, dbms_lob.getlength(file_ref) as file_bytes, profile,
       embedding
from   media;
-- @cleanup drop table if exists media purge
