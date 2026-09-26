-- @setup begin dbms_xmlschema.deleteschema('http://nimbus.example/gate.xsd', dbms_xmlschema.delete_cascade_force); exception when others then null; end;
begin
  dbms_xmlschema.registerschema(
    schemaurl => 'http://nimbus.example/gate.xsd',
    schemadoc => '<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
                    <xs:element name="gateChange">
                      <xs:complexType><xs:sequence>
                        <xs:element name="flight" type="xs:string"/>
                        <xs:element name="gate">
                          <xs:simpleType><xs:restriction base="xs:string">
                            <xs:pattern value="[A-D][0-9]{1,2}"/>
                          </xs:restriction></xs:simpleType>
                        </xs:element>
                      </xs:sequence></xs:complexType>
                    </xs:element>
                  </xs:schema>',
    local     => true, gentypes => false, gentables => false);
end;
/
select xmltype('<gateChange><flight>NM150</flight><gate>B12</gate></gateChange>')
         .createschemabasedxml('http://nimbus.example/gate.xsd').isschemavalid() as good,
       xmltype('<gateChange><flight>NM150</flight><gate>Z99</gate></gateChange>')
         .createschemabasedxml('http://nimbus.example/gate.xsd').isschemavalid() as bad
from   dual;

select schema_url, local from user_xml_schemas;
-- @cleanup begin dbms_xmlschema.deleteschema('http://nimbus.example/gate.xsd', dbms_xmlschema.delete_cascade_force); end;
