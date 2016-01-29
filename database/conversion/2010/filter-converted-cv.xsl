<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:cv="http://ns.bransom.nl/cerios/cv/v20110401"
	exclude-result-prefixes="cv"
	version="1.0">

	<!-- put the content of specific nodes in CDATA tags -->
	<xsl:output method="xml" encoding="utf-8" indent="no" />

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="cv:branchekennis">
		<xsl:if test="not(following-sibling::cv:branchekennis/cv:omschrijving = cv:omschrijving)">
			<xsl:copy>
				<xsl:apply-templates />
			</xsl:copy>
		</xsl:if>
	</xsl:template>

	<xsl:template match="cv:vaardigheid">
		<xsl:if test="not((following-sibling::cv:vaardigheid/cv:categorie = cv:categorie)
				and (following-sibling::cv:vaardigheid/cv:omschrijving = cv:omschrijving))">
			<xsl:copy>
				<xsl:apply-templates />
			</xsl:copy>
		</xsl:if>
	</xsl:template>

	<!-- copy all nodes, attributes and text by default, ignoring any namespaces -->
	<xsl:template match="@* | * | text()" priority="-1">
		<xsl:copy>
			<xsl:apply-templates select="@* | * | text()" />
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>