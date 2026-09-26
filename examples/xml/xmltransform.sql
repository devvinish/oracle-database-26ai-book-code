select xmlserialize(content
         xmltransform(
           xmltype('<airport code="DXB"><city>Dubai</city></airport>'),
           xmltype('<xsl:stylesheet version="1.0"
                        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                      <xsl:output method="text"/>
                      <xsl:template match="/airport">
                        <xsl:value-of select="city"/> (<xsl:value-of select="@code"/>)
                      </xsl:template>
                    </xsl:stylesheet>'))) as transformed
from   dual;
