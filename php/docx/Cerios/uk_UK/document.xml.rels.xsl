<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cv="http://ns.bransom.nl/cerios/cv/v20110401"
    xmlns="http://schemas.openxmlformats.org/package/2006/relationships"
    exclude-result-prefixes="cv"
    version="1.0">

  <xsl:param name="layout"/>

  <xsl:output method="xml" standalone="yes" encoding="UTF-8" indent="no"/>

  <xsl:template match="/">
    <Relationships>
      <xsl:if test="($layout != '') and (//cv:visitekaartje)">
        <Relationship Id="rId8" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image" Target="media/image1.jpeg"/>
      </xsl:if>
      <Relationship Id="rId3" Type="http://schemas.microsoft.com/office/2007/relationships/stylesWithEffects" Target="stylesWithEffects.xml"/>
      <Relationship Id="rId7" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/endnotes" Target="endnotes.xml"/>
      <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>
      <Relationship Id="rId29" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/fontTable" Target="fontTable.xml"/>
      <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/customXml" Target="../customXml/item1.xml"/>
      <Relationship Id="rId6" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/footnotes" Target="footnotes.xml"/>
      <Relationship Id="rId11" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/footer" Target="footer1.xml"/>
      <Relationship Id="rId5" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/webSettings" Target="webSettings.xml"/>
      <Relationship Id="rId10" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/header" Target="header1.xml"/>
      <Relationship Id="rId4" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings" Target="settings.xml"/>
      <Relationship Id="rId9" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink" TargetMode="External">
        <xsl:attribute name="Target">mailto:<xsl:value-of select="//cv:businessunit/cv:manager_email" /></xsl:attribute>
      </Relationship>
      <Relationship Id="rId27" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink" Target="http://www.cerios.nl/" TargetMode="External"/>
      <Relationship Id="rId30" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme" Target="theme/theme1.xml"/>
    </Relationships>
  </xsl:template>

</xsl:stylesheet>