<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
	xmlns:cv="http://ns.bransom.nl/cerios/cv/v20110401"
	exclude-result-prefixes="cv"
	version="1.0">

	<xsl:import href="../common.xsl" />

	<xsl:param name="locale">uk_UK</xsl:param>
	
	<xsl:template match="* | @* | text()" mode="date-month-year">
		<xsl:variable name="month" select="number(substring(., 6, 2))" />
		<xsl:choose>
			<xsl:when test="$month = 1">January</xsl:when>
			<xsl:when test="$month = 2">February</xsl:when>
			<xsl:when test="$month = 3">March</xsl:when>
			<xsl:when test="$month = 4">April</xsl:when>
			<xsl:when test="$month = 5">May</xsl:when>
			<xsl:when test="$month = 6">June</xsl:when>
			<xsl:when test="$month = 7">July</xsl:when>
			<xsl:when test="$month = 8">August</xsl:when>
			<xsl:when test="$month = 9">September</xsl:when>
			<xsl:when test="$month = 10">October</xsl:when>
			<xsl:when test="$month = 11">November</xsl:when>
			<xsl:when test="$month = 12">December</xsl:when>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring(., 1, 4)" />
	</xsl:template>

	<xsl:template match="* | @* | text()" mode="date-numeric">
 		<xsl:value-of select="substring(., 9, 2)" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring(., 6, 2)" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring(., 1, 4)" />
	</xsl:template>

	<xsl:template match="* | @* | text()" mode="linguistics-level">
		<xsl:choose>
			<xsl:when test=". = 1">native language</xsl:when>
			<xsl:when test=". = 2">fluently</xsl:when>
			<xsl:when test=". = 3">good</xsl:when>
			<xsl:when test=". = 4">average</xsl:when>
			<xsl:when test=". = 5">poor</xsl:when>
			<xsl:when test=". = 6">bad</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="* | @* | text()" mode="skill-category">
		<xsl:choose>
			<xsl:when test=". = 'Methoden en technieken'">Methods and technologies</xsl:when>
			<xsl:when test=". = 'Programmeertalen'">Programming languages</xsl:when>
			<xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
