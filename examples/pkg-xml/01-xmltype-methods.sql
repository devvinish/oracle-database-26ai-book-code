declare
  v_doc xmltype := xmltype('<flight no="NM150"><from>DXB</from><to>LHR</to>'
                           || '<seats><seat>12A</seat><seat>12B</seat></seats></flight>');
  v_seat varchar2(10);
begin
  dbms_output.put_line('root:   ' || v_doc.getrootelement);
  dbms_output.put_line('number: ' || v_doc.extract('/flight/@no').getstringval);
  dbms_output.put_line('seats:  ' || v_doc.extract('//seat').getstringval);
  dbms_output.put_line('has to? ' || v_doc.existsnode('/flight/to'));
  select xmlcast(xmlquery('/flight/seats/seat[2]' passing v_doc returning content)
                 as varchar2(10))
  into   v_seat from dual;                           -- XMLQUERY is SQL, not PL/SQL
  dbms_output.put_line('second: ' || v_seat);
  dbms_output.put_line(v_doc.transform(xmltype(
    '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
       <xsl:output method="text"/>
       <xsl:template match="/flight">
         <xsl:value-of select="@no"/>: <xsl:value-of select="from"/>
         <xsl:text> to </xsl:text><xsl:value-of select="to"/>
       </xsl:template>
     </xsl:stylesheet>')).getstringval);
end;
/
