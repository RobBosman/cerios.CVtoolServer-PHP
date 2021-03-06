<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:cv="http://ns.bransom.nl/cerios/cv/v20110401"
    exclude-result-prefixes="cv"
    version="1.0">

  <xsl:variable name="LOWERCASE">abcdefghijklmnopqrstuvwxyz</xsl:variable>
  <xsl:variable name="UPPERCASE">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

  <xsl:template match="cv:persoonsgegevens" mode="full-name">
    <xsl:value-of select="cv:voornaam" />
    <xsl:if test="cv:tussenvoegsel">
      <xsl:text> </xsl:text>
      <xsl:value-of select="cv:tussenvoegsel" />
    </xsl:if>
    <xsl:text> </xsl:text>
    <xsl:value-of select="cv:achternaam" />
  </xsl:template>

  <xsl:template name="skill-level">
    <xsl:param name="level" />
    <w:r>
      <w:rPr>
        <w:color w:val="666666"/>
      </w:rPr>
      <w:t>
        <xsl:choose>
          <xsl:when test="$level = '1'">&#x2022;</xsl:when>
          <xsl:when test="$level = '2'">&#x2022; &#x2022;</xsl:when>
          <xsl:when test="$level = '3'">&#x2022; &#x2022; &#x2022;</xsl:when>
          <xsl:when test="$level = '4'">&#x2022; &#x2022; &#x2022; &#x2022;</xsl:when>
          <xsl:when test="$level = '5'">&#x2022; &#x2022; &#x2022; &#x2022; &#x2022;</xsl:when>
        </xsl:choose>
      </w:t>
    </w:r>
  </xsl:template>

  <xsl:template match="* | @* | text()" mode="format-text">
    <xsl:call-template name="substitute-line-breaks">
      <xsl:with-param name="text" select="." />
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="substitute-line-breaks">
    <xsl:param name="text" />
    <xsl:variable name="line-break" select="'&#x0A;'" />
    <xsl:choose>
      <xsl:when test="contains($text, $line-break)">
        <xsl:variable name="text-before-line-break" select="substring-before($text, $line-break)" />
        <xsl:variable name="text-after-line-break" select="substring-after($text, $line-break)" />
        <xsl:if test="$text-before-line-break">
          <w:r>
            <w:t><xsl:value-of select="$text-before-line-break" /></w:t>
          </w:r>
        </xsl:if>
        <w:r>
          <w:br />
        </w:r>
        <xsl:if test="$text-after-line-break">
          <xsl:call-template name="substitute-line-breaks">
            <xsl:with-param name="text" select="$text-after-line-break" />
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <w:r>
          <w:t><xsl:value-of select="$text" /></w:t>
        </w:r>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>