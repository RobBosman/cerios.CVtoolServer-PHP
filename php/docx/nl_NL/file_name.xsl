<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:cv="http://ns.bransom.nl/cerios/cv/v20110401"
	version="1.0">

	<xsl:import href="common-per-locale.xsl" />

	<xsl:param name="layout" />

	<xsl:output method="text" encoding="UTF-8" />

	<xsl:template match="/">
		<xsl:text>cv </xsl:text>
		<xsl:apply-templates select="//cv:persoonsgegevens" mode="full-name" />
		<xsl:text> (</xsl:text>
		<xsl:value-of select="substring(/cv:*/@at, 1, 10)" />
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="$layout != ''"><xsl:value-of select="$layout" /></xsl:when>
			<xsl:otherwise>NO-LAYOUT</xsl:otherwise>
		</xsl:choose>
		<xsl:text>)</xsl:text>
	</xsl:template>

</xsl:stylesheet>
