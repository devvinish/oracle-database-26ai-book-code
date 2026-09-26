with d as (
  select xmltype('<fare><amount>500</amount><cabin>ECONOMY</cabin></fare>') as old_doc,
         xmltype('<fare><amount>650</amount><cabin>ECONOMY</cabin></fare>') as new_doc
  from   dual
)
select x.operation, x.new_value,
       xmlserialize(content xmlpatch(old_doc, xmldiff(old_doc, new_doc))) as patched
from   d,
       xmltable(xmlnamespaces('http://xmlns.oracle.com/xdb/xdiff.xsd' as "xd"),
                '/xd:xdiff/*' passing xmldiff(old_doc, new_doc)
                columns operation varchar2(20) path 'local-name()',

                        new_value varchar2(10) path 'xd:content') x;
