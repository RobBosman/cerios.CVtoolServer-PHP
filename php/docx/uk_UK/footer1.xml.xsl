<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cv="http://ns.bransom.nl/cerios/cv/v20110401"
    xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:o="urn:schemas-microsoft-com:office:office"
    xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
    xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
    xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
    xmlns:w10="urn:schemas-microsoft-com:office:word"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
    xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
    xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
    exclude-result-prefixes="cv"
    version="1.0">

  <xsl:import href="common-per-locale.xsl" />

  <xsl:output method="xml" standalone="yes" encoding="UTF-8" indent="no" />

  <xsl:template match="/">
    <w:ftr mc:Ignorable="w14 wp14">
      <w:p w:rsidR="00011166" w:rsidRDefault="00011166" w:rsidP="003D53DB">
        <w:pPr>
          <w:pStyle w:val="Footer"/>
          <w:tabs>
            <w:tab w:val="clear" w:pos="4536"/>
          </w:tabs>
        </w:pPr>
        <w:r w:rsidRPr="003B2E6A">
          <w:rPr>
            <w:sz w:val="18"/>
            <w:szCs w:val="20"/>
          </w:rPr>
          <w:t>
            <xsl:text>Curriculum vitae </xsl:text>
            <xsl:apply-templates select="//cv:persoonsgegevens" mode="full-name" />
            <xsl:text>, </xsl:text>
            <xsl:apply-templates select="/cv:*/@at" mode="date-month-year" />
          </w:t>
          <w:tab/>
          <w:t xml:space="preserve">page </w:t>
          <w:fldChar w:fldCharType="begin"/>
          <w:instrText xml:space="preserve"> PAGE   \* MERGEFORMAT </w:instrText>
          <w:fldChar w:fldCharType="separate"/>
          <w:t>1</w:t>
          <w:fldChar w:fldCharType="end"/>
          <w:t xml:space="preserve"> of </w:t>
          <w:fldChar w:fldCharType="begin"/>
          <w:instrText xml:space="preserve"> NUMPAGES   \* MERGEFORMAT </w:instrText>
          <w:fldChar w:fldCharType="separate"/>
          <w:t>0</w:t>
          <w:fldChar w:fldCharType="end"/>
        </w:r>
      </w:p>
    </w:ftr>
  </xsl:template>

</xsl:stylesheet>