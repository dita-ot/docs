<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

  <xsl:template match="/">
    <val>
      <xsl:for-each select="plugins/plugin">
        <prop action="include" att="plugin" val="{@id}"/>
      </xsl:for-each>
      <prop action="exclude" att="plugin"/>
    </val>
  </xsl:template>

</xsl:stylesheet>
