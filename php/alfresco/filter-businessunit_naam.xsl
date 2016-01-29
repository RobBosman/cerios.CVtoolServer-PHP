<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cv="http://ns.bransom.nl/cerios/cv/v20110401"
    exclude-result-prefixes="cv"
    version="1.0">

    <xsl:output method="text" encoding="utf-8" />

    <!-- main entry -->
    <xsl:template match="/">
        <xsl:apply-templates select="//cv:businessunit" />
    </xsl:template>

    <xsl:template match="cv:businessunit">
        <xsl:value-of select="cv:naam" />
    </xsl:template>

</xsl:stylesheet>