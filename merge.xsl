<?xml version="1.0" encoding="utf-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:strip-space elements="*" />
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" />
  
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="//manifest">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
      <xsl:variable name="info" select="document($target)/manifest" />
      <xsl:for-each select="$info/uses-permission">
          <xsl:copy-of select="." />
      </xsl:for-each>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="//manifest/application">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
      <xsl:variable name="info" select="document($target)/manifest/application" />
      <xsl:for-each select="$info/*">
          <xsl:copy-of select="." />
      </xsl:for-each>
    </xsl:copy>
  </xsl:template>

</xsl:transform>

