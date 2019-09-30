<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:cv="http://ns.bransom.nl/cerios/cv/v20110401"
    exclude-result-prefixes="cv"
    version="1.0">

  <xsl:import href="../common.xsl" />

  <xsl:param name="locale">nl_NL</xsl:param>

  <xsl:template match="* | @* | text()" mode="date-month-year">
    <xsl:variable name="month" select="number(substring(., 6, 2))" />
    <xsl:choose>
      <xsl:when test="$month = 1">januari</xsl:when>
      <xsl:when test="$month = 2">februari</xsl:when>
      <xsl:when test="$month = 3">maart</xsl:when>
      <xsl:when test="$month = 4">april</xsl:when>
      <xsl:when test="$month = 5">mei</xsl:when>
      <xsl:when test="$month = 6">juni</xsl:when>
      <xsl:when test="$month = 7">juli</xsl:when>
      <xsl:when test="$month = 8">augustus</xsl:when>
      <xsl:when test="$month = 9">september</xsl:when>
      <xsl:when test="$month = 10">oktober</xsl:when>
      <xsl:when test="$month = 11">november</xsl:when>
      <xsl:when test="$month = 12">december</xsl:when>
    </xsl:choose>
    <xsl:text> </xsl:text>
    <xsl:value-of select="substring(., 1, 4)" />
  </xsl:template>

  <xsl:template match="* | @* | text()" mode="date-numeric">
    <xsl:value-of select="substring(., 9, 2)" />
    <xsl:text>-</xsl:text>
    <xsl:value-of select="substring(., 6, 2)" />
    <xsl:text>-</xsl:text>
    <xsl:value-of select="substring(., 1, 4)" />
  </xsl:template>

  <xsl:template match="* | @* | text()" mode="linguistics-level">
    <xsl:choose>
      <xsl:when test=". = 1">moedertaal</xsl:when>
      <xsl:when test=". = 2">vloeiend</xsl:when>
      <xsl:when test=". = 3">goed</xsl:when>
      <xsl:when test=". = 4">redelijk</xsl:when>
      <xsl:when test=". = 5">matig</xsl:when>
      <xsl:when test=". = 6">zwak</xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="* | @* | text()" mode="skill-category">
    <xsl:value-of select="." />
  </xsl:template>

</xsl:stylesheet>