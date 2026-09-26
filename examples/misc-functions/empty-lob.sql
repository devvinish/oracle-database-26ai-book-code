-- @setup drop table if exists documents purge
create table documents (id number, body clob default empty_clob(), image blob);

insert into documents (id, image) values (1, empty_blob());
insert into documents (id, body, image) values (2, null, null);

select id, dbms_lob.getlength(body) as body_len, dbms_lob.getlength(image) as image_len,
       case when body is null then 'NULL' else 'empty LOB' end as body_state
from   documents
order  by id;
-- @cleanup drop table if exists documents purge
