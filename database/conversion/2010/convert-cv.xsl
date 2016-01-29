<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://ns.bransom.nl/cerios/cv/v20110401"
	xmlns:cv="http://ns.bransom.nl/cerios/cv/v20110401"
	exclude-result-prefixes="cv"
	version="1.0">

	<!-- put the content of specific nodes in CDATA tags -->
	<xsl:output method="xml" encoding="utf-8" indent="no" cdata-section-elements="
			profiel persoonlijke_eigenschappen vaardigheden opdrachtformulering werkzaamheden" />

	<xsl:variable name="accountSet" select="document('accountSet.xml')" />
	<xsl:variable name="geboortedata" select="document('geboortedata.xml')" />

	<xsl:template match="/">
		<set>
			<xsl:apply-templates select="//cv" />
		</set>
	</xsl:template>

	<xsl:template match="cv">
		<xsl:if test="$accountSet//account[@id = current()/account_id]">
			<cv created="true">
				<xsl:apply-templates />
				<xsl:apply-templates select="werkervaring/vaardigheid">
					<xsl:sort select="categorie" />
					<xsl:sort select="omschrijving" />
					<xsl:sort select="kennisniveau" />
				</xsl:apply-templates>
				<xsl:apply-templates select="werkervaring" mode="branchekennis">
					<xsl:sort select="branche" />
					<xsl:sort select="branchekennis" />
				</xsl:apply-templates>
			</cv>
		</xsl:if>
	</xsl:template>

	<xsl:template match="account_id">
		<xsl:variable name="_account" select="$accountSet//account[@id = current()]" />
		<_account>
			<businessunit>
				<xsl:attribute name="id"><xsl:value-of select="$_account/businessunit/@id" /></xsl:attribute>
			</businessunit>
			<name><xsl:value-of select="$_account/gebruikersnaam" /></name>
			<!-- MD5-encrypted '!' -->
			<password>9033e0e305f247c0c3c80d0c7848c8b3</password>
			<roles><xsl:value-of select="$_account/rol" /></roles>
		</_account>
	</xsl:template>

	<xsl:template match="persoonsgegevens[1]">
		<persoonsgegevens>
			<xsl:apply-templates select="* | ../profiel/it_ervaring_sinds | ../profiel/werkervaring_sinds" />
			<xsl:if test="not(geboortedatum)">
				<geboortedatum>
					<xsl:value-of select="$geboortedata//geboortedatum[@achternaam = current()/achternaam]" />
				</geboortedatum>
			</xsl:if>
		</persoonsgegevens>
	</xsl:template>

	<xsl:template match="foto" />

	<xsl:template match="cv/profiel">
		<profiel>
			<locale>nl_NL</locale>
			<xsl:apply-templates select="profiel | persoonlijke_eigenschappen | vaardigheden | functie" />
		</profiel>
		<!-- add profile structure for other language -->
		<profiel>
			<locale>uk_UK</locale>
			<profiel />
			<persoonlijke_eigenschappen />
			<vaardigheden />
			<functie />
		</profiel>
	</xsl:template>

	<xsl:template match="werkervaring">
		<werkopdracht>
			<opdrachtgever><xsl:value-of select="bedrijf" /></opdrachtgever>
			<xsl:apply-templates select="periode_begin | periode_eind | opnemen_in_cv" />
			<werkervaring>
				<locale>nl_NL</locale>
				<xsl:apply-templates select="rol | opdrachtformulering | werkzaamheden" />
			</werkervaring>
			<!-- add werkervaring structure for other language -->
			<werkervaring>
				<locale>uk_UK</locale>
				<rol />
				<opdrachtformulering />
				<werkzaamheden />
			</werkervaring>
		</werkopdracht>
	</xsl:template>

	<xsl:template match="werkervaring" mode="branchekennis">
		<branchekennis>
			<omschrijving><xsl:value-of select="branche" /></omschrijving>
			<kennisniveau><xsl:value-of select="branchekennis" /></kennisniveau>
		</branchekennis>
	</xsl:template>

	<!-- convert boolean to int -->
	<xsl:template match="diploma/text()
			| geslacht/text()
			| soort_opleiding/text()
			| opnemen_in_cv/text()">
		<xsl:choose>
			<xsl:when test=". = 'true'">1</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- CDATA -->
	<xsl:template match="profiel/profiel">
		<profiel><xsl:value-of select="." /></profiel>
	</xsl:template>
	<xsl:template match="persoonlijke_eigenschappen">
		<persoonlijke_eigenschappen><xsl:value-of select="." /></persoonlijke_eigenschappen>
	</xsl:template>
	<xsl:template match="vaardigheden">
		<vaardigheden><xsl:value-of select="." /></vaardigheden>
	</xsl:template>
	<xsl:template match="opdrachtformulering">
		<opdrachtformulering><xsl:value-of select="." /></opdrachtformulering>
	</xsl:template>
	<xsl:template match="werkzaamheden">
		<werkzaamheden><xsl:value-of select="." /></werkzaamheden>
	</xsl:template>

	<!-- to be ignored -->
	<xsl:template match="cv_id | werkervaring_id | @id | @updated_at" />

	<!-- copy all nodes by default -->
	<xsl:template match="*">
		<xsl:element name="{local-name()}">
			<xsl:apply-templates select="@* | * | text()" />
		</xsl:element>
	</xsl:template>

	<!-- copy all attributes and non-empty text by default, ignoring any namespaces -->
	<xsl:template match="@* | text()">	
		<xsl:copy-of select="@*" />
		<xsl:if test="normalize-space()">
			<xsl:copy>
				<xsl:value-of select="text()" />
			</xsl:copy>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>