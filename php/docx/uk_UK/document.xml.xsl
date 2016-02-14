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

	<xsl:import href="common-per-locale.xsl"/>

	<xsl:param name="layout" />

	<xsl:key name="vaardigheid-categorie" match="cv:vaardigheid" use="cv:categorie" />

	<xsl:output method="xml" standalone="yes" encoding="UTF-8" indent="no"/>

	<xsl:template match="/">
		<w:document mc:Ignorable="w14 wp14">
			<w:body>
				<!--
				
					VISITEKAARTJE
				
				-->
				<xsl:if test="($layout != '') and (//cv:visitekaartje)">
					<w:p w:rsidR="00455566" w:rsidRDefault="00455566" w:rsidP="00455566">
						<w:pPr>
							<w:pStyle w:val="kolomeinde"/>
						</w:pPr>
						<w:bookmarkStart w:id="0" w:name="_GoBack"/>
						<w:bookmarkEnd w:id="0"/>
						<w:r w:rsidRPr="0091280F">
							<w:rPr>
								<w:highlight w:val="yellow"/>
							</w:rPr>
							<w:drawing>
								<wp:anchor distT="0" distB="0" distL="114300" distR="114300" simplePos="0" relativeHeight="251659264" behindDoc="1" locked="1" layoutInCell="1" allowOverlap="1" wp14:anchorId="043075D3" wp14:editId="5224E4E3">
									<wp:simplePos x="0" y="0"/>
									<wp:positionH relativeFrom="page">
										<wp:posOffset>762000</wp:posOffset>
									</wp:positionH>
									<wp:positionV relativeFrom="page">
										<wp:posOffset>447675</wp:posOffset>
									</wp:positionV>
									<wp:extent cx="6047740" cy="2217420"/>
									<wp:effectExtent l="0" t="0" r="0" b="0"/>
									<wp:wrapTopAndBottom/>
									<wp:docPr id="34" name="Picture 34" descr="visitekaartje.jpeg"/>
									<wp:cNvGraphicFramePr>
										<a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" noChangeAspect="1"/>
									</wp:cNvGraphicFramePr>
									<a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
										<a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
											<pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
												<pic:nvPicPr>
													<pic:cNvPr id="0" name="Picture 3" descr="visitekaartje.jpeg"/>
													<pic:cNvPicPr>
														<a:picLocks noChangeAspect="1" noChangeArrowheads="1"/>
													</pic:cNvPicPr>
												</pic:nvPicPr>
												<pic:blipFill>
													<a:blip r:embed="rId8">
														<a:extLst>
															<a:ext>
																<xsl:attribute name="uri">{28A0092B-C50C-407E-A947-70E740481C1C}</xsl:attribute>
																<a14:useLocalDpi xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main" val="0"/>
															</a:ext>
														</a:extLst>
													</a:blip>
													<a:srcRect/>
													<a:stretch>
														<a:fillRect/>
													</a:stretch>
												</pic:blipFill>
												<pic:spPr bwMode="auto">
													<a:xfrm>
														<a:off x="0" y="0"/>
														<a:ext cx="6047740" cy="2217420"/>
													</a:xfrm>
													<a:prstGeom prst="rect">
														<a:avLst/>
													</a:prstGeom>
													<a:noFill/>
													<a:ln>
														<a:noFill/>
													</a:ln>
												</pic:spPr>
											</pic:pic>
										</a:graphicData>
									</a:graphic>
									<wp14:sizeRelH relativeFrom="margin">
										<wp14:pctWidth>0</wp14:pctWidth>
									</wp14:sizeRelH>
									<wp14:sizeRelV relativeFrom="margin">
										<wp14:pctHeight>0</wp14:pctHeight>
									</wp14:sizeRelV>
								</wp:anchor>
							</w:drawing>
						</w:r>
					</w:p>
				</xsl:if>
				<!--
				
					TITEL
				
				-->
				<w:p w:rsidR="00C3613C" w:rsidRDefault="0091280F" w:rsidP="0091280F">
					<w:pPr>
						<w:pStyle w:val="Heading1"/>
					</w:pPr>
					<w:r w:rsidR="00CE3931" w:rsidRPr="00F26BF3">
						<w:t>
							<xsl:text>Curriculum vitae – </xsl:text>
							<xsl:apply-templates select="//cv:persoonsgegevens" mode="full-name" />
						</w:t>
					</w:r>
				</w:p>
				<xsl:choose>
					<xsl:when test="($layout != '') and ((//cv:businessunit/cv:manager_email) or (//cv:businessunit/cv:manager_telofoonnummer))">
						<w:p w:rsidR="00A47DC9" w:rsidRDefault="004064CD">
							<w:r w:rsidRPr="00BE478D">
								<w:t xml:space="preserve">For more information please call or e-mail <xsl:value-of select="//cv:businessunit/cv:manager_naam" /> at </w:t>
							</w:r>
							<w:hyperlink r:id="rId9" w:history="1">
								<w:r w:rsidR="007809F8">
									<w:rPr>
										<w:rStyle w:val="Hyperlink"/>
										<w:szCs w:val="20"/>
									</w:rPr>
									<w:t><xsl:value-of select="//cv:businessunit/cv:manager_email" /></w:t>
								</w:r>
							</w:hyperlink>
							<w:r w:rsidRPr="00BE478D">
								<w:t xml:space="preserve"> or <xsl:value-of select="//cv:businessunit/cv:manager_telefoonnummer" />.</w:t>
							</w:r>
						</w:p>
					</xsl:when>
					<xsl:otherwise>
						<w:p w:rsidR="00A47DC9" w:rsidRDefault="004064CD">
							<w:r w:rsidRPr="00BE478D"> </w:r>
						</w:p>
					</xsl:otherwise>
				</xsl:choose>
				<!--
				
					OVER CERIOS
					
				-->
				<xsl:if test="$layout != ''">
					<w:p w:rsidR="00CE3931" w:rsidRDefault="00A404D5" w:rsidP="00A9087A">
						<w:pPr>
							<w:pStyle w:val="Heading1"/>
						</w:pPr>
						<w:r>
							<w:t>About Cerios</w:t>
						</w:r>
					</w:p>
					<w:p w:rsidR="00A47DC9" w:rsidRDefault="004064CD">
						<w:r w:rsidRPr="00BE478D">
							<w:t xml:space="preserve">Cerios realizes successful IT projects. To achieve this Cerios strengthens clients with expertise in the area of ​​project implementation, IT &amp; architecture and quality control. The result-driven professionals of Cerios go for 100% success. Want to know more? See </w:t>
						</w:r>
						<w:hyperlink r:id="rId27" w:history="1">
							<w:r w:rsidR="00B50CC0">
								<w:rPr>
									<w:rStyle w:val="Hyperlink"/>
									<w:rFonts w:cstheme="minorBidi"/>
								</w:rPr>
								<w:t>www.cerios.nl</w:t>
							</w:r>
						</w:hyperlink>
						<w:r w:rsidR="00B50CC0">
							<w:t>.</w:t>
						</w:r>
					</w:p>
				</xsl:if>
				<!--
				
					PERSOONLIJKE INFORMATIE
					
				-->
				<xsl:if test="//cv:persoonsgegevens/cv:geboortedatum
					or //cv:persoonsgegevens/cv:woonplaats
					or //cv:persoonsgegevens/cv:it_ervaring_sinds
					or //cv:persoonsgegevens/cv:werkervaring_sinds">
					<w:p w:rsidR="00CE3931" w:rsidRDefault="00A404D5" w:rsidP="00A9087A">
						<w:pPr>
							<w:pStyle w:val="Heading2"/>
						</w:pPr>
						<w:r>
							<w:t>Personal data</w:t>
						</w:r>
					</w:p>
					<w:tbl>
						<w:tblPr>
							<w:tblW w:w="9072" w:type="dxa"/>
							<w:tblCellMar>
								<w:left w:w="0" w:type="dxa"/>
								<w:right w:w="0" w:type="dxa"/>
							</w:tblCellMar>
							<w:tblLook w:val="01E0" w:firstRow="1" w:lastRow="1" w:firstColumn="1" w:lastColumn="1" w:noHBand="0" w:noVBand="0"/>
						</w:tblPr>
						<w:tblGrid>
							<w:gridCol w:w="2000"/>
							<w:gridCol w:w="7072"/>
						</w:tblGrid>
						<xsl:if test="//cv:persoonsgegevens/cv:geboortedatum">
							<w:tr w:rsidR="00A9087A" w:rsidTr="00CC5388">
								<w:tc>
									<w:tcPr>
										<w:tcW w:w="2000" w:type="dxa"/>
									</w:tcPr>
									<w:p w:rsidR="00A9087A" w:rsidRPr="00A9087A" w:rsidRDefault="00A9087A" w:rsidP="00A9087A">
										<w:pPr>
											<w:pStyle w:val="Tabelregel"/>
											<w:rPr>
												<w:b/>
											</w:rPr>
										</w:pPr>
										<w:r w:rsidRPr="00A9087A">
											<w:rPr>
												<w:b/>
											</w:rPr>
											<w:t>Date of birth</w:t>
										</w:r>
									</w:p>
								</w:tc>
								<w:tc>
									<w:tcPr>
										<w:tcW w:w="7072" w:type="dxa"/>
									</w:tcPr>
									<w:p w:rsidR="00A9087A" w:rsidRPr="00A9087A" w:rsidRDefault="009A700D" w:rsidP="00A9087A">
										<w:pPr>
											<w:pStyle w:val="Tabelregel"/>
										</w:pPr>
										<w:r>
											<w:t><xsl:apply-templates select="//cv:persoonsgegevens/cv:geboortedatum" mode="date-numeric" /></w:t>
										</w:r>
									</w:p>
								</w:tc>
							</w:tr>
						</xsl:if>
						<xsl:if test="//cv:persoonsgegevens/cv:woonplaats">
							<w:tr w:rsidR="00A9087A" w:rsidTr="00CC5388">
								<w:tc>
									<w:tcPr>
										<w:tcW w:w="2000" w:type="dxa"/>
									</w:tcPr>
									<w:p w:rsidR="00A9087A" w:rsidRPr="003C6056" w:rsidRDefault="00A9087A" w:rsidP="00CC5388">
										<w:pPr>
											<w:pStyle w:val="Tabelregel"/>
											<w:rPr>
												<w:b/>
											</w:rPr>
										</w:pPr>
										<w:r w:rsidRPr="003C6056">
											<w:rPr>
												<w:b/>
											</w:rPr>
											<w:t>Residence</w:t>
										</w:r>
									</w:p>
								</w:tc>
								<w:tc>
									<w:tcPr>
										<w:tcW w:w="7072" w:type="dxa"/>
									</w:tcPr>
									<w:p w:rsidR="00A9087A" w:rsidRPr="005B3519" w:rsidRDefault="009A700D" w:rsidP="00CC5388">
										<w:pPr>
											<w:pStyle w:val="Tabelregel"/>
										</w:pPr>
										<w:r>
											<w:t><xsl:value-of select="//cv:persoonsgegevens/cv:woonplaats" /></w:t>
										</w:r>
									</w:p>
								</w:tc>
							</w:tr>
						</xsl:if>
						<xsl:if test="//cv:persoonsgegevens/cv:it_ervaring_sinds">
							<w:tr w:rsidR="00A9087A" w:rsidTr="00CC5388">
								<w:tc>
									<w:tcPr>
										<w:tcW w:w="2000" w:type="dxa"/>
									</w:tcPr>
									<w:p w:rsidR="00A9087A" w:rsidRPr="003C6056" w:rsidRDefault="00A9087A" w:rsidP="00CC5388">
										<w:pPr>
											<w:pStyle w:val="Tabelregel"/>
											<w:rPr>
												<w:b/>
											</w:rPr>
										</w:pPr>
										<w:r w:rsidRPr="003C6056">
											<w:rPr>
												<w:b/>
											</w:rPr>
											<w:t>IT experience since</w:t>
										</w:r>
									</w:p>
								</w:tc>
								<w:tc>
									<w:tcPr>
										<w:tcW w:w="7072" w:type="dxa"/>
									</w:tcPr>
									<w:p w:rsidR="00A9087A" w:rsidRPr="005B3519" w:rsidRDefault="009A700D" w:rsidP="00CC5388">
										<w:pPr>
											<w:pStyle w:val="Tabelregel"/>
										</w:pPr>
										<w:r>
											<w:t><xsl:value-of select="//cv:persoonsgegevens/cv:it_ervaring_sinds" /></w:t>
										</w:r>
									</w:p>
								</w:tc>
							</w:tr>
						</xsl:if>
						<xsl:if test="//cv:persoonsgegevens/cv:werkervaring_sinds">
							<w:tr w:rsidR="00A9087A" w:rsidTr="00CC5388">
								<w:tc>
									<w:tcPr>
										<w:tcW w:w="2000" w:type="dxa"/>
									</w:tcPr>
									<w:p w:rsidR="00A9087A" w:rsidRPr="003C6056" w:rsidRDefault="00A9087A" w:rsidP="00CC5388">
										<w:pPr>
											<w:pStyle w:val="Tabelregellaatste"/>
											<w:rPr>
												<w:b/>
											</w:rPr>
										</w:pPr>
										<w:r w:rsidRPr="003C6056">
											<w:rPr>
												<w:b/>
											</w:rPr>
											<w:t>Work experience since</w:t>
										</w:r>
									</w:p>
								</w:tc>
								<w:tc>
									<w:tcPr>
										<w:tcW w:w="7072" w:type="dxa"/>
									</w:tcPr>
									<w:p w:rsidR="00A9087A" w:rsidRPr="005B3519" w:rsidRDefault="009A700D" w:rsidP="00CC5388">
										<w:pPr>
											<w:pStyle w:val="Tabelregellaatste"/>
										</w:pPr>
										<w:r>
											<w:t><xsl:value-of select="//cv:persoonsgegevens/cv:werkervaring_sinds" /></w:t>
										</w:r>
									</w:p>
								</w:tc>
							</w:tr>
						</xsl:if>
					</w:tbl>
				</xsl:if>
				<!--
				
					PROFIEL
					
				-->
				<xsl:variable name="profiel" select="//cv:cv/cv:profiel[(cv:locale = $locale) and (normalize-space() != cv:locale)]" />
				<xsl:if test="$profiel">
					<w:p w:rsidR="009A700D" w:rsidRDefault="009A700D" w:rsidP="009A700D">
						<w:pPr>
							<w:pStyle w:val="Heading2"/>
						</w:pPr>
						<w:r>
							<w:t>Characterization</w:t>
						</w:r>
					</w:p>
					<w:tbl>
						<w:tblPr>
							<w:tblW w:w="9072" w:type="dxa"/>
							<w:tblCellMar>
								<w:left w:w="0" w:type="dxa"/>
								<w:right w:w="0" w:type="dxa"/>
							</w:tblCellMar>
							<w:tblLook w:val="01E0" w:firstRow="1" w:lastRow="1" w:firstColumn="1" w:lastColumn="1" w:noHBand="0" w:noVBand="0"/>
						</w:tblPr>
						<w:tblGrid>
							<w:gridCol w:w="2000"/>
							<w:gridCol w:w="7072"/>
						</w:tblGrid>
						<w:tr w:rsidR="00A9087A" w:rsidTr="00CC5388">
							<w:tc>
								<w:tcPr>
									<w:tcW w:w="2000" w:type="dxa"/>
								</w:tcPr>
								<w:p w:rsidR="00A9087A" w:rsidRPr="003C6056" w:rsidRDefault="00A9087A" w:rsidP="00CC5388">
									<w:pPr>
										<w:pStyle w:val="Tabeltekst"/>
										<w:rPr>
											<w:b/>
										</w:rPr>
									</w:pPr>
									<w:r w:rsidRPr="003C6056">
										<w:rPr>
											<w:b/>
										</w:rPr>
										<w:t>Characterization</w:t>
									</w:r>
								</w:p>
							</w:tc>
							<w:tc>
								<w:tcPr>
									<w:tcW w:w="7072" w:type="dxa"/>
								</w:tcPr>
								<w:p w:rsidR="00A9087A" w:rsidRPr="005B3519" w:rsidRDefault="009A700D" w:rsidP="00A9087A">
									<w:pPr>
										<w:pStyle w:val="Tabeltekst"/>
									</w:pPr>
									<xsl:apply-templates select="$profiel/cv:profiel" mode="format-text" />
								</w:p>
							</w:tc>
						</w:tr>
						<xsl:if test="normalize-space($profiel/cv:persoonlijke_eigenschappen)">
							<w:tr w:rsidR="00A9087A" w:rsidTr="00CC5388">
								<w:tc>
									<w:tcPr>
										<w:tcW w:w="2000" w:type="dxa"/>
									</w:tcPr>
									<w:p w:rsidR="00A9087A" w:rsidRPr="003C6056" w:rsidRDefault="00A9087A" w:rsidP="00CC5388">
										<w:pPr>
											<w:pStyle w:val="Tabeltekst"/>
											<w:rPr>
												<w:b/>
											</w:rPr>
										</w:pPr>
										<w:r w:rsidRPr="003C6056">
											<w:rPr>
												<w:b/>
											</w:rPr>
											<w:t>Personality</w:t>
										</w:r>
									</w:p>
								</w:tc>
								<w:tc>
									<w:tcPr>
										<w:tcW w:w="7072" w:type="dxa"/>
									</w:tcPr>
									<w:p w:rsidR="00A9087A" w:rsidRPr="005B3519" w:rsidRDefault="009A700D" w:rsidP="009A700D">
										<w:pPr>
											<w:pStyle w:val="Tabeltekst"/>
										</w:pPr>
										<xsl:apply-templates select="$profiel/cv:persoonlijke_eigenschappen" mode="format-text" />
									</w:p>
								</w:tc>
							</w:tr>
						</xsl:if>
						<xsl:if test="normalize-space($profiel/cv:vaardigheden)">
							<w:tr w:rsidR="00A9087A" w:rsidTr="00CC5388">
								<w:tc>
									<w:tcPr>
										<w:tcW w:w="2000" w:type="dxa"/>
									</w:tcPr>
									<w:p w:rsidR="00A9087A" w:rsidRPr="003C6056" w:rsidRDefault="00A9087A" w:rsidP="00CC5388">
										<w:pPr>
											<w:pStyle w:val="Tabeltekstlaatste"/>
											<w:rPr>
												<w:b/>
											</w:rPr>
										</w:pPr>
										<w:r w:rsidRPr="003C6056">
											<w:rPr>
												<w:b/>
											</w:rPr>
											<w:t>Personal skills</w:t>
										</w:r>
									</w:p>
								</w:tc>
								<w:tc>
									<w:tcPr>
										<w:tcW w:w="7072" w:type="dxa"/>
									</w:tcPr>
									<w:p w:rsidR="00A9087A" w:rsidRPr="005B3519" w:rsidRDefault="009A700D" w:rsidP="00CC5388">
										<w:pPr>
											<w:pStyle w:val="Tabeltekstlaatste"/>
										</w:pPr>
										<xsl:apply-templates select="$profiel/cv:vaardigheden" mode="format-text" />
									</w:p>
								</w:tc>
							</w:tr>
						</xsl:if>
					</w:tbl>
				</xsl:if>
				<!--
				
					ALGEMENE OPLEIDINGEN
				
				-->
				<xsl:variable name="algemene-opleidingen"
						select="//cv:opleiding[(not(cv:soort_opleiding) or (cv:soort_opleiding = 0)) and (normalize-space(cv:naam_opleiding | cv:naam_instituut))]" />
				<xsl:if test="$algemene-opleidingen">
					<w:p w:rsidR="003B5042" w:rsidRDefault="003B5042" w:rsidP="003B5042">
						<w:pPr>
							<w:pStyle w:val="Heading2"/>
						</w:pPr>
						<w:r>
							<w:t>Education</w:t>
						</w:r>
					</w:p>
					<w:tbl>
						<w:tblPr>
							<w:tblW w:w="9072" w:type="dxa"/>
							<w:tblInd w:w="60" w:type="dxa"/>
							<w:tblBorders>
								<w:top w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:left w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:bottom w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:right w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:insideH w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:insideV w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
							</w:tblBorders>
							<w:tblLayout w:type="fixed"/>
							<w:tblCellMar>
								<w:left w:w="60" w:type="dxa"/>
								<w:right w:w="60" w:type="dxa"/>
							</w:tblCellMar>
							<w:tblLook w:val="01E0" w:firstRow="1" w:lastRow="1" w:firstColumn="1" w:lastColumn="1" w:noHBand="0" w:noVBand="0"/>
						</w:tblPr>
						<w:tblGrid>
							<w:gridCol w:w="2264"/>
							<w:gridCol w:w="2264"/>
							<w:gridCol w:w="3226"/>
							<w:gridCol w:w="1318"/>
						</w:tblGrid>
						<xsl:apply-templates select="$algemene-opleidingen" mode="algemene-opleiding">
							<xsl:sort select="cv:jaar_diploma" data-type="number" order="descending" />
							<xsl:sort select="cv:diploma" data-type="number" />
						</xsl:apply-templates>
					</w:tbl>
				</xsl:if>
				<!--
				
					VAKTECHNISCHE OPLEIDINGEN
				
				-->
				<xsl:variable name="vaktechnische-opleidingen"
						select="//cv:opleiding[(cv:soort_opleiding = 1) and (normalize-space(cv:naam_opleiding | cv:naam_instituut))]" />
				<xsl:if test="$vaktechnische-opleidingen">
					<w:p w:rsidR="003B5042" w:rsidRDefault="003B5042" w:rsidP="003B5042">
						<w:pPr>
							<w:pStyle w:val="Heading2"/>
						</w:pPr>
						<w:r>
							<w:t>Education</w:t>
						</w:r>
					</w:p>
					<w:tbl>
						<w:tblPr>
							<w:tblW w:w="9072" w:type="dxa"/>
							<w:tblInd w:w="60" w:type="dxa"/>
							<w:tblBorders>
								<w:top w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:left w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:bottom w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:right w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:insideH w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:insideV w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
							</w:tblBorders>
							<w:tblLayout w:type="fixed"/>
							<w:tblCellMar>
								<w:left w:w="60" w:type="dxa"/>
								<w:right w:w="60" w:type="dxa"/>
							</w:tblCellMar>
							<w:tblLook w:val="01E0" w:firstRow="1" w:lastRow="1" w:firstColumn="1" w:lastColumn="1" w:noHBand="0" w:noVBand="0"/>
						</w:tblPr>
						<w:tblGrid>
							<w:gridCol w:w="2264"/>
							<w:gridCol w:w="5490"/>
							<w:gridCol w:w="1318"/>
						</w:tblGrid>
						<xsl:apply-templates select="$vaktechnische-opleidingen" mode="vaktechnische-opleiding">
							<xsl:sort select="cv:jaar_diploma" data-type="number" order="descending" />
							<xsl:sort select="cv:diploma" data-type="number" />
						</xsl:apply-templates>
					</w:tbl>
				</xsl:if>
				<!--
				
					TALEN
				
				-->
				<xsl:variable name="talenkennis" select="//cv:talenkennis[normalize-space()]" />
				<xsl:if test="$talenkennis">
					<w:p w:rsidR="003B5042" w:rsidRDefault="003B5042" w:rsidP="003B5042">
						<w:pPr>
							<w:pStyle w:val="Heading2"/>
						</w:pPr>
						<w:r>
							<w:t>Linguistics</w:t>
						</w:r>
					</w:p>
					<w:tbl>
						<w:tblPr>
							<w:tblW w:w="6804" w:type="dxa"/>
							<w:tblInd w:w="60" w:type="dxa"/>
							<w:tblBorders>
								<w:top w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:left w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:bottom w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:right w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:insideH w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:insideV w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
							</w:tblBorders>
							<w:tblLayout w:type="fixed"/>
							<w:tblCellMar>
								<w:left w:w="60" w:type="dxa"/>
								<w:right w:w="60" w:type="dxa"/>
							</w:tblCellMar>
							<w:tblLook w:val="01E0" w:firstRow="1" w:lastRow="1" w:firstColumn="1" w:lastColumn="1" w:noHBand="0" w:noVBand="0"/>
						</w:tblPr>
						<w:tblGrid>
							<w:gridCol w:w="2268"/>
							<w:gridCol w:w="2268"/>
							<w:gridCol w:w="2268"/>
						</w:tblGrid>
						<w:tr w:rsidR="003B5042" w:rsidRPr="000F5812" w:rsidTr="00CC5388">
							<w:trPr>
								<w:cantSplit/>
								<w:trHeight w:val="20"/>
							</w:trPr>
							<w:tc>
								<w:tcPr>
									<w:tcW w:w="2268" w:type="dxa"/>
								</w:tcPr>
								<w:p w:rsidR="003B5042" w:rsidRPr="000F5812" w:rsidRDefault="003B5042" w:rsidP="00CC5388">
									<w:pPr>
										<w:pStyle w:val="Tabelregel"/>
										<w:rPr>
											<w:b/>
										</w:rPr>
									</w:pPr>
									<w:r>
										<w:rPr>
											<w:b/>
										</w:rPr>
										<w:t>Language</w:t>
									</w:r>
								</w:p>
							</w:tc>
							<w:tc>
								<w:tcPr>
									<w:tcW w:w="2268" w:type="dxa"/>
								</w:tcPr>
								<w:p w:rsidR="003B5042" w:rsidRPr="000F5812" w:rsidRDefault="003B5042" w:rsidP="00CC5388">
									<w:pPr>
										<w:pStyle w:val="Tabelregel"/>
										<w:rPr>
											<w:b/>
										</w:rPr>
									</w:pPr>
									<w:r>
										<w:rPr>
											<w:b/>
										</w:rPr>
										<w:t>Verbal</w:t>
									</w:r>
								</w:p>
							</w:tc>
							<w:tc>
								<w:tcPr>
									<w:tcW w:w="2268" w:type="dxa"/>
								</w:tcPr>
								<w:p w:rsidR="003B5042" w:rsidRPr="000F5812" w:rsidRDefault="003B5042" w:rsidP="00CC5388">
									<w:pPr>
										<w:pStyle w:val="Tabelregel"/>
										<w:rPr>
											<w:b/>
										</w:rPr>
									</w:pPr>
									<w:r>
										<w:rPr>
											<w:b/>
										</w:rPr>
										<w:t>In writing</w:t>
									</w:r>
								</w:p>
							</w:tc>
						</w:tr>
						<xsl:apply-templates select="$talenkennis">
							<xsl:sort select="cv:mondeling" data-type="number" />
							<xsl:sort select="cv:schriftelijk" data-type="number" />
						</xsl:apply-templates>
					</w:tbl>
				</xsl:if>
				<!--
				
					BRANCHEKENNIS
				
				-->
				<xsl:variable name="branchekennis" select="//cv:branchekennis[normalize-space(cv:omschrijving_UK)]" />
				<xsl:if test="$branchekennis">
					<w:p w:rsidR="00011166" w:rsidRDefault="003B5042" w:rsidP="00B8757E">
						<w:pPr>
							<w:pStyle w:val="Heading2"/>
						</w:pPr>
						<w:r>
							<w:t>Branche knowledge</w:t>
						</w:r>
					</w:p>
					<w:p w:rsidR="0091280F" w:rsidRDefault="0091280F" w:rsidP="0091280F">
						<w:pPr>
							<w:sectPr w:rsidR="0091280F" w:rsidSect="00480FB7">
								<w:headerReference w:type="default" r:id="rId10"/>
								<w:footerReference w:type="default" r:id="rId11"/>
								<xsl:if test="($layout = '') or not(//cv:visitekaartje)">
									<w:headerReference w:type="first" r:id="rId10"/>
								</xsl:if>
								<w:footerReference w:type="first" r:id="rId11"/>
								<w:type w:val="continuous"/>
								<w:pgSz w:w="11906" w:h="16838"/>
								<w:pgMar w:top="1985" w:right="1418" w:bottom="1418" w:left="1418" w:header="709" w:footer="709" w:gutter="0"/>
								<w:cols w:space="708"/>
								<w:titlePg/>
								<w:docGrid w:linePitch="360"/>
							</w:sectPr>
						</w:pPr>
					</w:p>
					<w:p w:rsidR="00011166" w:rsidRDefault="00011166" w:rsidP="00455566">
						<w:pPr>
							<w:pStyle w:val="kolomeinde"/>
						</w:pPr>
					</w:p>
					<w:tbl>
						<w:tblPr>
							<w:tblW w:w="4366" w:type="dxa"/>
							<w:tblInd w:w="60" w:type="dxa"/>
							<w:tblBorders>
								<w:top w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:left w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:bottom w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:right w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:insideH w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:insideV w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
							</w:tblBorders>
							<w:tblLayout w:type="fixed"/>
							<w:tblCellMar>
								<w:left w:w="60" w:type="dxa"/>
								<w:right w:w="60" w:type="dxa"/>
							</w:tblCellMar>
							<w:tblLook w:val="01E0" w:firstRow="1" w:lastRow="1" w:firstColumn="1" w:lastColumn="1" w:noHBand="0" w:noVBand="0"/>
						</w:tblPr>
						<w:tblGrid>
							<w:gridCol w:w="3544"/>
							<w:gridCol w:w="822"/>
						</w:tblGrid>
						<xsl:for-each select="$branchekennis">
							<xsl:sort select="cv:kennisniveau" data-type="number" order="descending" />
							<xsl:sort select="cv:omschrijving_UK" />
							<xsl:choose>
								<xsl:when test="(position() = ceiling(last() div 2)) or (position() = last())">
									<xsl:apply-templates select="." mode="last" />
								</xsl:when>
								<xsl:otherwise><xsl:apply-templates select="." /></xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</w:tbl>
					<w:p w:rsidR="00011166" w:rsidRDefault="00011166" w:rsidP="00455566">
						<w:pPr>
							<w:pStyle w:val="kolomeinde"/>
						</w:pPr>
					</w:p>
					<w:p w:rsidR="0091280F" w:rsidRDefault="0091280F" w:rsidP="00455566">
						<w:pPr>
							<w:pStyle w:val="kolomeinde"/>
						</w:pPr>
					</w:p>
					<w:p w:rsidR="0091280F" w:rsidRDefault="0091280F" w:rsidP="00011166">
						<w:pPr>
							<w:sectPr w:rsidR="0091280F" w:rsidSect="00D97F86">
								<w:headerReference w:type="default" r:id="rId10"/>
								<w:footerReference w:type="default" r:id="rId11"/>
								<xsl:if test="($layout = '') or not(//cv:visitekaartje)">
									<w:headerReference w:type="first" r:id="rId10"/>
								</xsl:if>
								<w:footerReference w:type="first" r:id="rId11"/>
								<w:type w:val="continuous"/>
								<w:pgSz w:w="11906" w:h="16838"/>
								<w:pgMar w:top="1985" w:right="1418" w:bottom="1418" w:left="1418" w:header="567" w:footer="709" w:gutter="0"/>
								<w:cols w:num="2" w:space="284"/>
								<w:docGrid w:linePitch="360"/>
							</w:sectPr>
						</w:pPr>
					</w:p>
					<w:p w:rsidR="00455566" w:rsidRDefault="00455566" w:rsidP="00455566">
						<w:pPr>
							<w:pStyle w:val="kolomeinde"/>
						</w:pPr>
					</w:p>
				</xsl:if>
				<!--
				
					KENNISOVERZICHT
				
				-->
				<xsl:variable name="vaardigheden" select="//cv:vaardigheid[normalize-space()]" />
				<xsl:if test="$vaardigheden">
					<w:p w:rsidR="00480FB7" w:rsidRDefault="00480FB7" w:rsidP="00C443E7">
						<w:pPr>
							<w:pStyle w:val="Heading2"/>
						</w:pPr>
						<w:r>
							<w:t>Profesional skills and knowledge</w:t>
						</w:r>
					</w:p>
					<w:p w:rsidR="0091280F" w:rsidRDefault="0091280F" w:rsidP="00D2745D">
						<w:pPr>
							<w:sectPr w:rsidR="0091280F" w:rsidSect="00D97F86">
								<w:headerReference w:type="default" r:id="rId10"/>
								<w:footerReference w:type="default" r:id="rId11"/>
								<xsl:if test="($layout = '') or not(//cv:visitekaartje)">
									<w:headerReference w:type="first" r:id="rId10"/>
								</xsl:if>
								<w:footerReference w:type="first" r:id="rId11"/>
								<w:type w:val="continuous"/>
								<w:pgSz w:w="11906" w:h="16838"/>
								<w:pgMar w:top="1985" w:right="1418" w:bottom="1418" w:left="1418" w:header="567" w:footer="709" w:gutter="0"/>
								<w:cols w:space="708"/>
								<w:titlePg/>
								<w:docGrid w:linePitch="360"/>
							</w:sectPr>
						</w:pPr>
					</w:p>
					<w:p w:rsidR="00D2745D" w:rsidRDefault="00D2745D" w:rsidP="00455566">
						<w:pPr>
							<w:pStyle w:val="kolomeinde"/>
						</w:pPr>
					</w:p>
					<w:tbl>
						<w:tblPr>
							<w:tblW w:w="4366" w:type="dxa"/>
							<w:tblInd w:w="60" w:type="dxa"/>
							<w:tblBorders>
								<w:top w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:left w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:bottom w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:right w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:insideH w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
								<w:insideV w:val="single" w:sz="2" w:space="0" w:color="231F20"/>
							</w:tblBorders>
							<w:tblLayout w:type="fixed"/>
							<w:tblCellMar>
								<w:left w:w="60" w:type="dxa"/>
								<w:right w:w="60" w:type="dxa"/>
							</w:tblCellMar>
							<w:tblLook w:val="01E0" w:firstRow="1" w:lastRow="1" w:firstColumn="1" w:lastColumn="1" w:noHBand="0" w:noVBand="0"/>
						</w:tblPr>
						<w:tblGrid>
							<w:gridCol w:w="3544"/>
							<w:gridCol w:w="822"/>
						</w:tblGrid>
						<!-- Pas de 'Muenchian Method' toe om alle vaardigheden per categorie te groeperen. -->
						<xsl:for-each select="$vaardigheden[. = key('vaardigheid-categorie', cv:categorie)[1]]">
							<xsl:sort select="cv:categorie" />
							<!-- Eerst een categorie-koptekst... -->
							<xsl:if test="normalize-space()">
								<xsl:apply-templates select="cv:categorie" />
							</xsl:if>
							<!-- ...en dan alle vaardigheden van deze categorie. -->
							<xsl:for-each select="$vaardigheden[cv:categorie = current()/cv:categorie]">
								<!-- Sorteer case-insensitive. -->
								<xsl:sort select="translate(cv:omschrijving, $UPPERCASE, $LOWERCASE)" />
								<xsl:choose>
									<xsl:when test="position() = last()"><xsl:apply-templates select="." mode="last" /></xsl:when>
									<xsl:otherwise><xsl:apply-templates select="." /></xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</xsl:for-each>
					</w:tbl>
					<w:p w:rsidR="00480FB7" w:rsidRDefault="00480FB7" w:rsidP="00455566">
						<w:pPr>
							<w:pStyle w:val="kolomeinde"/>
						</w:pPr>
					</w:p>
					<w:p w:rsidR="0091280F" w:rsidRDefault="0091280F" w:rsidP="00455566">
						<w:pPr>
							<w:pStyle w:val="kolomeinde"/>
						</w:pPr>
					</w:p>
					<w:p w:rsidR="0091280F" w:rsidRDefault="0091280F" w:rsidP="00480FB7">
						<w:pPr>
							<w:sectPr w:rsidR="0091280F" w:rsidSect="00D97F86">
								<w:headerReference w:type="default" r:id="rId10"/>
								<w:footerReference w:type="default" r:id="rId11"/>
								<xsl:if test="($layout = '') or not(//cv:visitekaartje)">
									<w:headerReference w:type="first" r:id="rId10"/>
								</xsl:if>
								<w:footerReference w:type="first" r:id="rId11"/>
								<w:type w:val="continuous"/>
								<w:pgSz w:w="11906" w:h="16838"/>
								<w:pgMar w:top="1985" w:right="1418" w:bottom="1418" w:left="1418" w:header="567" w:footer="709" w:gutter="0"/>
								<w:cols w:num="2" w:space="284"/>
								<w:docGrid w:linePitch="360"/>
							</w:sectPr>
						</w:pPr>
					</w:p>
					<w:p w:rsidR="00455566" w:rsidRDefault="00455566" w:rsidP="00455566">
						<w:pPr>
							<w:pStyle w:val="kolomeinde"/>
						</w:pPr>
					</w:p>
				</xsl:if>
				<!--
				
					PUBLICATIES
				
				-->
				<xsl:variable name="publicaties" select="//cv:publicatie[normalize-space()]" />
				<xsl:if test="$publicaties">
					<w:p w:rsidR="00480FB7" w:rsidRDefault="00480FB7" w:rsidP="00C443E7">
						<w:pPr>
							<w:pStyle w:val="Heading2"/>
						</w:pPr>
						<w:r>
							<w:t>Publications</w:t>
						</w:r>
					</w:p>
					<w:p w:rsidR="0091280F" w:rsidRDefault="0091280F" w:rsidP="00D2745D">
						<w:pPr>
							<w:sectPr w:rsidR="0091280F" w:rsidSect="00D97F86">
								<w:headerReference w:type="default" r:id="rId10"/>
								<w:footerReference w:type="default" r:id="rId11"/>
								<xsl:if test="($layout = '') or not(//cv:visitekaartje)">
									<w:headerReference w:type="first" r:id="rId10"/>
								</xsl:if>
								<w:footerReference w:type="first" r:id="rId11"/>
								<w:type w:val="continuous"/>
								<w:pgSz w:w="11906" w:h="16838"/>
								<w:pgMar w:top="1985" w:right="1418" w:bottom="1418" w:left="1418" w:header="567" w:footer="709" w:gutter="0"/>
								<w:cols w:space="708"/>
								<w:titlePg/>
								<w:docGrid w:linePitch="360"/>
							</w:sectPr>
						</w:pPr>
					</w:p>
					<w:p w:rsidR="00D2745D" w:rsidRDefault="00D2745D" w:rsidP="00455566">
						<w:pPr>
							<w:pStyle w:val="kolomeinde"/>
						</w:pPr>
					</w:p>
					<xsl:apply-templates select="$publicaties">
						<xsl:sort select="cv:jaar" order="descending" data-type="number" />
					</xsl:apply-templates>
				</xsl:if>
				<!--
				
					WERKERVARING
				
				-->
				<xsl:variable name="werkopdrachten"
						select="//cv:werkopdracht[(cv:opnemen_in_cv = 1) and (normalize-space(cv:opdrachtgever))]" />
				<!-- Sorteer op 'sort_index' als die is gedefinieerd, anders op 'periode_eind'. -->
				<xsl:choose>
					<xsl:when test="$werkopdrachten[normalize-space(cv:sort_index) != '']">
						<xsl:apply-templates select="$werkopdrachten">
							<xsl:sort select="cv:sort_index" data-type="number" />
						</xsl:apply-templates>
					</xsl:when>
					<xsl:otherwise>
						<!-- Eerst de werkopdrachten die tot 'heden' lopen... -->
						<xsl:apply-templates select="$werkopdrachten[not(cv:periode_eind)]" />
						<!-- ...en dan de rest. -->
						<xsl:apply-templates select="$werkopdrachten[cv:periode_eind]">
							<xsl:sort select="cv:periode_eind" order="descending" />
							<xsl:sort select="cv:sort_index" data-type="number" />
						</xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
				<w:p w:rsidR="00A47DC9" w:rsidRPr="00C3613C" w:rsidRDefault="00A47DC9" w:rsidP="00356BC5">
					<w:pPr>
						<w:rPr>
							<w:szCs w:val="20"/>
						</w:rPr>
					</w:pPr>
				</w:p>
				<w:sectPr w:rsidR="00A47DC9" w:rsidRPr="00C3613C" w:rsidSect="00D97F86">
					<w:headerReference w:type="default" r:id="rId10"/>
					<w:footerReference w:type="default" r:id="rId11"/>
					<xsl:if test="($layout = '') or not(//cv:visitekaartje)">
						<w:headerReference w:type="first" r:id="rId10"/>
					</xsl:if>
					<w:footerReference w:type="first" r:id="rId11"/>
					<w:type w:val="continuous"/>
					<w:pgSz w:w="11906" w:h="16838"/>
					<w:pgMar w:top="1985" w:right="1418" w:bottom="1418" w:left="1418" w:header="567" w:footer="709" w:gutter="0"/>
					<w:cols w:space="708"/>
					<w:titlePg/>
					<w:docGrid w:linePitch="360"/>
				</w:sectPr>
			</w:body>
		</w:document>
	</xsl:template>


	<xsl:template match="cv:opleiding" mode="algemene-opleiding">
		<xsl:variable name="table-style">
			<xsl:choose>
				<xsl:when test="position() != last()">Tabelregel</xsl:when>
				<xsl:otherwise>Tabelregellaatste</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<w:tr w:rsidR="005D5566" w:rsidRPr="00A731A7" w:rsidTr="00CC5388">
			<w:trPr>
				<w:cantSplit/>
				<w:trHeight w:val="20"/>
			</w:trPr>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="2264" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="005D5566" w:rsidRPr="00A731A7" w:rsidRDefault="005D5566" w:rsidP="00937C58">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<w:r>
						<w:t><xsl:value-of select="cv:naam_instituut" /></w:t>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="2264" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="005D5566" w:rsidRPr="00A731A7" w:rsidRDefault="005D5566" w:rsidP="00937C58">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<w:r>
						<w:t><xsl:value-of select="cv:plaats_instituut" /></w:t>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="3226" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="005D5566" w:rsidRPr="00A731A7" w:rsidRDefault="005D5566" w:rsidP="00937C58">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<w:r>
						<w:t><xsl:value-of select="cv:naam_opleiding" /></w:t>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="1318" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="005D5566" w:rsidRPr="00A731A7" w:rsidRDefault="005D5566" w:rsidP="00937C58">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<w:r>
						<w:t>
							<xsl:if test="cv:jaar_diploma">
								<xsl:value-of select="cv:jaar_diploma" />
								<xsl:if test="cv:diploma = 1">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:if>
							<xsl:if test="cv:diploma = 1">
								<xsl:text>diploma</xsl:text>
							</xsl:if>
						</w:t>
					</w:r>
				</w:p>
			</w:tc>
		</w:tr>
	</xsl:template>

	<xsl:template match="cv:opleiding" mode="vaktechnische-opleiding">
		<xsl:variable name="table-style">
			<xsl:choose>
				<xsl:when test="position() != last()">Tabelregel</xsl:when>
				<xsl:otherwise>Tabelregellaatste</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<w:tr w:rsidR="005D5566" w:rsidRPr="00A731A7" w:rsidTr="00CC5388">
			<w:trPr>
				<w:cantSplit/>
				<w:trHeight w:val="20"/>
			</w:trPr>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="2264" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="005D5566" w:rsidRPr="00A731A7" w:rsidRDefault="005D5566" w:rsidP="00937C58">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<w:r>
						<w:t><xsl:value-of select="cv:naam_instituut" /></w:t>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="5490" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="005D5566" w:rsidRPr="00A731A7" w:rsidRDefault="005D5566" w:rsidP="00937C58">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<w:r>
						<w:t><xsl:value-of select="cv:naam_opleiding" /></w:t>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="1318" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="005D5566" w:rsidRPr="00A731A7" w:rsidRDefault="005D5566" w:rsidP="00937C58">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<w:r>
						<w:t>
							<xsl:if test="cv:jaar_diploma">
								<xsl:value-of select="cv:jaar_diploma" />
								<xsl:if test="cv:diploma = 1">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:if>
							<xsl:if test="cv:diploma = 1">
								<xsl:text>diploma</xsl:text>
							</xsl:if>
						</w:t>
					</w:r>
				</w:p>
			</w:tc>
		</w:tr>
	</xsl:template>

	<xsl:template match="cv:talenkennis">
		<xsl:variable name="table-style">
			<xsl:choose>
				<xsl:when test="position() != last()">Tabelregel</xsl:when>
				<xsl:otherwise>Tabelregellaatste</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<w:tr w:rsidR="003B5042" w:rsidRPr="00A731A7" w:rsidTr="00CC5388">
			<w:trPr>
				<w:cantSplit/>
				<w:trHeight w:val="20"/>
			</w:trPr>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="2268" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="003B5042" w:rsidRPr="00A731A7" w:rsidRDefault="00414A1D" w:rsidP="00CC5388">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<w:r>
						<w:t><xsl:value-of select="cv:taal" /></w:t>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="2268" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="003B5042" w:rsidRPr="00A731A7" w:rsidRDefault="00414A1D" w:rsidP="00CC5388">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<w:r>
						<w:t><xsl:apply-templates select="cv:mondeling" mode="linguistics-level" /></w:t>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="2268" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="003B5042" w:rsidRPr="00A731A7" w:rsidRDefault="00414A1D" w:rsidP="00CC5388">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<w:r>
						<w:t><xsl:apply-templates select="cv:schriftelijk" mode="linguistics-level" /></w:t>
					</w:r>
				</w:p>
			</w:tc>
		</w:tr>
	</xsl:template>

	<xsl:template match="cv:branchekennis" mode="last">
		<xsl:apply-templates select=".">
			<xsl:with-param name="table-style">Tabelregellaatste</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="cv:branchekennis">
		<xsl:param name="table-style">Tabelregel</xsl:param>
		<w:tr w:rsidR="00011166" w:rsidRPr="00A731A7" w:rsidTr="00C90161">
			<w:trPr>
				<w:cantSplit/>
				<w:trHeight w:val="20"/>
			</w:trPr>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="3544" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="00011166" w:rsidRPr="00A731A7" w:rsidRDefault="00011166" w:rsidP="00C90161">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<w:r>
						<w:t><xsl:value-of select="cv:omschrijving_UK" /></w:t>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="822" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="00011166" w:rsidRPr="00A731A7" w:rsidRDefault="00011166" w:rsidP="00C90161">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<xsl:call-template name="skill-level">
						<xsl:with-param name="level" select="cv:kennisniveau" />
					</xsl:call-template>
				</w:p>
			</w:tc>
		</w:tr>
	</xsl:template>

	<xsl:template match="cv:vaardigheid/cv:categorie">
		<w:tr w:rsidR="00480FB7" w:rsidRPr="00A731A7" w:rsidTr="00C90161">
			<w:trPr>
				<w:cantSplit/>
				<w:trHeight w:val="20"/>
			</w:trPr>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="3544" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="00480FB7" w:rsidRPr="00D62DBF" w:rsidRDefault="00480FB7" w:rsidP="00D62DBF">
					<w:pPr>
						<w:pStyle w:val="Tabelregel"/>
						<w:rPr>
							<w:b/>
						</w:rPr>
					</w:pPr>
					<w:r w:rsidRPr="00D62DBF">
						<w:rPr>
							<w:b/>
						</w:rPr>
						<w:t><xsl:apply-templates select="." mode="skill-category" /></w:t>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="822" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="00480FB7" w:rsidRPr="00D62DBF" w:rsidRDefault="00480FB7" w:rsidP="00D62DBF">
					<w:pPr>
						<w:pStyle w:val="Tabelregel"/>
					</w:pPr>
				</w:p>
			</w:tc>
		</w:tr>
	</xsl:template>

	<xsl:template match="cv:vaardigheid" mode="last">
		<xsl:apply-templates select=".">
			<xsl:with-param name="table-style">Tabelregellaatste</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="cv:vaardigheid">
		<xsl:param name="table-style">Tabelregel</xsl:param>
		<w:tr w:rsidR="00D62DBF" w:rsidRPr="00A731A7" w:rsidTr="00C90161">
			<w:trPr>
				<w:cantSplit/>
				<w:trHeight w:val="20"/>
			</w:trPr>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="3544" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="00D62DBF" w:rsidRPr="00D62DBF" w:rsidRDefault="00D62DBF" w:rsidP="00D62DBF">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<w:r w:rsidRPr="00D62DBF">
						<w:t><xsl:value-of select="cv:omschrijving" /></w:t>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="822" w:type="dxa"/>
				</w:tcPr>
				<w:p w:rsidR="00D62DBF" w:rsidRPr="00A731A7" w:rsidRDefault="00D62DBF" w:rsidP="00C90161">
					<w:pPr>
						<w:pStyle w:val="{$table-style}"/>
					</w:pPr>
					<xsl:call-template name="skill-level">
						<xsl:with-param name="level" select="cv:kennisniveau" />
					</xsl:call-template>
				</w:p>
			</w:tc>
		</w:tr>
	</xsl:template>
    
	<xsl:template match="cv:publicatie">
        <w:p w:rsidR="00480FB7" w:rsidRPr="00A579DF" w:rsidRDefault="00480FB7" w:rsidP="00C90161">
            <w:pPr>
                <w:tabs>
                    <w:tab w:val="right" w:pos="9070"/>
                </w:tabs>
            </w:pPr>
            <w:r w:rsidRPr="00BE478D">
                <w:rPr>
                    <w:b/>
                    <w:i/>
                </w:rPr>
                <w:t><xsl:value-of select="cv:titel" /></w:t>
            </w:r>
            <w:r w:rsidRPr="00BE478D">
                <w:tab/>
                <xsl:if test="cv:media">
                    <w:t xml:space="preserve"><xsl:value-of select="cv:media" />, </w:t>
                </xsl:if>
                <w:t><xsl:value-of select="cv:jaar" /></w:t>
            </w:r>
            <w:r w:rsidRPr="00BE478D">
                <w:br/>
                <w:t><xsl:value-of select="cv:omschrijving" /></w:t>
            </w:r>
        </w:p>
	</xsl:template>

	<xsl:template match="cv:werkopdracht">
		<xsl:variable name="werkervaring" select="cv:werkervaring[cv:locale = $locale]" />
		<w:p w:rsidR="00480FB7" w:rsidRDefault="00480FB7" w:rsidP="00480FB7">
			<w:pPr>
				<w:pStyle w:val="Heading2"/>
			</w:pPr>
			<w:r>
				<w:t>Client</w:t>
				<w:tab/>
				<w:t>
					<xsl:value-of select="cv:opdrachtgever" />
				</w:t>
			</w:r>
		</w:p>
		<w:tbl>
			<w:tblPr>
				<w:tblW w:w="9072" w:type="dxa"/>
				<w:tblCellMar>
					<w:left w:w="0" w:type="dxa"/>
					<w:right w:w="0" w:type="dxa"/>
				</w:tblCellMar>
				<w:tblLook w:val="01E0" w:firstRow="1" w:lastRow="1" w:firstColumn="1" w:lastColumn="1" w:noHBand="0" w:noVBand="0"/>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="2268"/>
				<w:gridCol w:w="4313"/>
				<w:gridCol w:w="2491"/>
			</w:tblGrid>
			<xsl:variable name="periodeTekst">
				<xsl:apply-templates select="cv:periode_begin" mode="date-month-year" />
				<xsl:text> - </xsl:text>
				<xsl:choose>
					<xsl:when test="cv:periode_eind">
						<xsl:apply-templates select="cv:periode_eind" mode="date-month-year" />
					</xsl:when>
					<xsl:otherwise>up till now</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:if test="(normalize-space(cv:titel)) or (normalize-space($werkervaring/cv:rol) = '')">
				<w:tr w:rsidR="00480FB7" w:rsidRPr="00A579DF" w:rsidTr="00C90161">
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="2268" w:type="dxa"/>
						</w:tcPr>
						<w:p w:rsidR="00480FB7" w:rsidRPr="003C6056" w:rsidRDefault="00480FB7" w:rsidP="00C90161">
							<w:pPr>
								<w:pStyle w:val="Tabeltekst"/>
								<w:keepNext/>
								<w:rPr>
									<w:b/>
								</w:rPr>
							</w:pPr>
							<w:r w:rsidRPr="003C6056">
								<w:rPr>
									<w:b/>
								</w:rPr>
								<w:t>
									<xsl:choose>
										<xsl:when test="cv:titel">Title</xsl:when>
										<xsl:otherwise>Period</xsl:otherwise>
									</xsl:choose>
								</w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="4313" w:type="dxa"/>
						</w:tcPr>
						<w:p w:rsidR="00480FB7" w:rsidRPr="00A579DF" w:rsidRDefault="00480FB7" w:rsidP="00C90161">
							<w:pPr>
								<w:pStyle w:val="Tabeltekst"/>
								<w:keepNext/>
							</w:pPr>
							<xsl:apply-templates select="cv:titel" mode="format-text" />
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="2491" w:type="dxa"/>
						</w:tcPr>
						<w:p w:rsidR="00480FB7" w:rsidRPr="00A579DF" w:rsidRDefault="00480FB7" w:rsidP="00C90161">
							<w:pPr>
								<w:pStyle w:val="Tabeltekst"/>
								<w:keepNext/>
                                                                <w:jc w:val="right"/>
							</w:pPr>
							<w:r>
								<w:t><xsl:value-of select="$periodeTekst"/></w:t>
							</w:r>
						</w:p>
					</w:tc>
				</w:tr>
			</xsl:if>
			<xsl:if test="normalize-space($werkervaring/cv:rol)">
				<w:tr w:rsidR="00480FB7" w:rsidRPr="00A579DF" w:rsidTr="00C90161">
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="2268" w:type="dxa"/>
						</w:tcPr>
						<w:p w:rsidR="00480FB7" w:rsidRPr="003C6056" w:rsidRDefault="00480FB7" w:rsidP="00C90161">
							<w:pPr>
								<w:pStyle w:val="Tabeltekst"/>
								<w:keepNext/>
								<w:rPr>
									<w:b/>
								</w:rPr>
							</w:pPr>
							<w:r w:rsidRPr="003C6056">
								<w:rPr>
									<w:b/>
								</w:rPr>
								<w:t>Position</w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<xsl:choose>
								<xsl:when test="normalize-space(cv:titel) = ''">
									<w:tcW w:w="4313" w:type="dxa"/>
								</xsl:when>
								<xsl:otherwise>
									<w:tcW w:w="7006" w:type="dxa"/>
									<w:gridSpan w:val="2"/>
								</xsl:otherwise>
							</xsl:choose>
						</w:tcPr>
						<w:p w:rsidR="00480FB7" w:rsidRPr="00A579DF" w:rsidRDefault="00480FB7" w:rsidP="00C90161">
							<w:pPr>
								<w:pStyle w:val="Tabeltekst"/>
								<w:keepNext/>
							</w:pPr>
							<w:r>
								<w:t><xsl:value-of select="$werkervaring/cv:rol" /></w:t>
							</w:r>
						</w:p>
					</w:tc>
					<xsl:if test="(normalize-space(cv:titel) = '')">
						<w:tc>
							<w:tcPr>
								<w:tcW w:w="2491" w:type="dxa"/>
							</w:tcPr>
							<w:p w:rsidR="00480FB7" w:rsidRPr="00A579DF" w:rsidRDefault="00480FB7" w:rsidP="00C90161">
								<w:pPr>
									<w:pStyle w:val="Tabeltekst"/>
									<w:keepNext/>
                                        	                        <w:jc w:val="right"/>
								</w:pPr>
								<w:r>
									<w:t><xsl:value-of select="$periodeTekst"/></w:t>
								</w:r>
							</w:p>
						</w:tc>
					</xsl:if>
                                </w:tr>
			</xsl:if>
			<xsl:if test="normalize-space($werkervaring/cv:opdrachtformulering)">
				<w:tr w:rsidR="00480FB7" w:rsidRPr="00A579DF" w:rsidTr="00C90161">
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="2268" w:type="dxa"/>
						</w:tcPr>
						<w:p w:rsidR="00480FB7" w:rsidRPr="003C6056" w:rsidRDefault="00480FB7" w:rsidP="00C90161">
							<w:pPr>
								<w:pStyle w:val="Tabeltekst"/>
								<w:rPr>
									<w:b/>
								</w:rPr>
							</w:pPr>
							<w:r w:rsidRPr="003C6056">
								<w:rPr>
									<w:b/>
								</w:rPr>
								<w:t>Job description</w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="7006" w:type="dxa"/>
							<w:gridSpan w:val="2"/>
						</w:tcPr>
						<w:p w:rsidR="00480FB7" w:rsidRPr="00A579DF" w:rsidRDefault="00480FB7" w:rsidP="00C90161">
							<w:pPr>
								<w:pStyle w:val="Tabeltekst"/>
							</w:pPr>
							<xsl:apply-templates select="$werkervaring/cv:opdrachtformulering" mode="format-text" />
						</w:p>
					</w:tc>
				</w:tr>
			</xsl:if>
			<xsl:if test="normalize-space($werkervaring/cv:werkzaamheden)">
				<w:tr w:rsidR="00480FB7" w:rsidRPr="00A579DF" w:rsidTr="00C90161">
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="2268" w:type="dxa"/>
						</w:tcPr>
						<w:p w:rsidR="00480FB7" w:rsidRPr="00366729" w:rsidRDefault="00480FB7" w:rsidP="00C90161">
							<w:pPr>
								<w:pStyle w:val="Tabeltekstlaatste"/>
								<w:rPr>
									<w:b/>
								</w:rPr>
							</w:pPr>
							<w:r w:rsidRPr="003C6056">
								<w:rPr>
									<w:b/>
								</w:rPr>
								<w:t>Activities and results</w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="7006" w:type="dxa"/>
							<w:gridSpan w:val="2"/>
						</w:tcPr>
						<w:p w:rsidR="00480FB7" w:rsidRPr="00A579DF" w:rsidRDefault="00480FB7" w:rsidP="00C90161">
							<w:pPr>
								<w:pStyle w:val="Tabeltekstlaatste"/>
							</w:pPr>
							<xsl:apply-templates select="$werkervaring/cv:werkzaamheden" mode="format-text" />
						</w:p>
					</w:tc>
				</w:tr>
			</xsl:if>
			<xsl:if test="normalize-space($werkervaring/cv:steekwoorden)">
				<w:tr w:rsidR="00480FB7" w:rsidRPr="00A579DF" w:rsidTr="00C90161">
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="2268" w:type="dxa"/>
						</w:tcPr>
						<w:p w:rsidR="00480FB7" w:rsidRPr="00366729" w:rsidRDefault="00480FB7" w:rsidP="00C90161">
							<w:pPr>
								<w:pStyle w:val="Tabeltekstlaatste"/>
								<w:rPr>
									<w:b/>
								</w:rPr>
							</w:pPr>
							<w:r w:rsidRPr="003C6056">
								<w:rPr>
									<w:b/>
								</w:rPr>
								<w:t>Keywords</w:t>
							</w:r>
						</w:p>
					</w:tc>
					<w:tc>
						<w:tcPr>
							<w:tcW w:w="7006" w:type="dxa"/>
							<w:gridSpan w:val="2"/>
						</w:tcPr>
						<w:p w:rsidR="00480FB7" w:rsidRPr="00A579DF" w:rsidRDefault="00480FB7" w:rsidP="00C90161">
							<w:pPr>
								<w:pStyle w:val="Tabeltekstlaatste"/>
							</w:pPr>
							<xsl:apply-templates select="$werkervaring/cv:steekwoorden" mode="format-text" />
						</w:p>
					</w:tc>
				</w:tr>
			</xsl:if>
		</w:tbl>
	</xsl:template>

</xsl:stylesheet>
