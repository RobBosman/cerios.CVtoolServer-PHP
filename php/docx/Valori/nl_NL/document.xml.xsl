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
  xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml"
  xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
  xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
  xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
  xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
  exclude-result-prefixes="cv"
  version="1.0">

  <xsl:import href="common-per-locale.xsl" />

  <xsl:param name="layout" />

  <xsl:output method="xml" standalone="yes" encoding="UTF-8" indent="no" />

  <xsl:template match="/">
    <w:document mc:Ignorable="w14 w15 wp14">
      <w:body>
        <w:p w:rsidR="0041112D" w:rsidRDefault="00C34A5E" w:rsidP="0041112D">
          <w:bookmarkStart w:id="0" w:name="_GoBack"/>
          <w:bookmarkEnd w:id="0"/>
          <w:r>
            <w:rPr>
              <w:noProof/>
              <w:lang w:eastAsia="nl-NL"/>
            </w:rPr>
            <mc:AlternateContent>
              <mc:Choice Requires="wps">
                <w:drawing>
                  <wp:anchor distT="45720" distB="45720" distL="114300" distR="114300" simplePos="0" relativeHeight="251659264" behindDoc="0" locked="0" layoutInCell="1" allowOverlap="1">
                    <wp:simplePos x="0" y="0"/>
                    <wp:positionH relativeFrom="margin">
                      <wp:align>right</wp:align>
                    </wp:positionH>
                    <wp:positionV relativeFrom="paragraph">
                      <wp:posOffset>-561995</wp:posOffset>
                    </wp:positionV>
                    <wp:extent cx="5934251" cy="561315"/>
                    <wp:effectExtent l="0" t="0" r="9525" b="10795"/>
                    <wp:wrapNone/>
                    <wp:docPr id="217" name="Tekstvak 2"/>
                    <wp:cNvGraphicFramePr>
                      <a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"/>
                    </wp:cNvGraphicFramePr>
                    <a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
                      <a:graphicData uri="http://schemas.microsoft.com/office/word/2010/wordprocessingShape">
                        <wps:wsp>
                          <wps:cNvSpPr txBox="1">
                            <a:spLocks noChangeArrowheads="1"/>
                          </wps:cNvSpPr>
                          <wps:spPr bwMode="auto">
                            <a:xfrm>
                              <a:off x="0" y="0"/>
                              <a:ext cx="5934251" cy="561315"/>
                            </a:xfrm>
                            <a:prstGeom prst="rect">
                              <a:avLst/>
                            </a:prstGeom>
                            <a:noFill/>
                            <a:ln w="9525">
                              <a:noFill/>
                              <a:miter lim="800000"/>
                              <a:headEnd/>
                              <a:tailEnd/>
                            </a:ln>
                          </wps:spPr>
                          <wps:txbx>
                            <w:txbxContent>
                              <w:p w:rsidR="00C34A5E" w:rsidRPr="00C34A5E" w:rsidRDefault="00C34A5E" w:rsidP="00C34A5E">
                                <w:pPr>
                                  <w:pStyle w:val="Titel"/>
                                </w:pPr>
                                <w:r w:rsidRPr="00C34A5E">
                                  <w:t><xsl:apply-templates select="//cv:persoonsgegevens" mode="full-name" /></w:t>
                                </w:r>
                              </w:p>
                              <w:p w:rsidR="0041112D" w:rsidRPr="00057125" w:rsidRDefault="00C34A5E" w:rsidP="00057125">
                                <w:pPr>
                                  <w:pStyle w:val="Ondertitel"/>
                                  <w:rPr>
                                    <w:iCs/>
                                    <w:color w:val="F4931E"/>
                                    <w:szCs w:val="24"/>
                                  </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00057125">
                                  <w:rPr>
                                    <w:szCs w:val="24"/>
                                  </w:rPr>
                                  <w:t>[PROFIEL_TITEL]</w:t>
                                </w:r>
                                <w:r w:rsidRPr="002271D3">
                                  <w:rPr>
                                    <w:rStyle w:val="Valori-geel"/>
                                  </w:rPr>
                                  <w:t xml:space="preserve"> // </w:t>
                                </w:r>
                                <w:r w:rsidRPr="00057125">
                                  <w:rPr>
                                    <w:szCs w:val="24"/>
                                  </w:rPr>
                                  <w:t><xsl:apply-templates select="//cv:persoonsgegevens/cv:geboortedatum" mode="date-numeric" /></w:t>
                                </w:r>
                                <w:r w:rsidRPr="002271D3">
                                  <w:rPr>
                                    <w:rStyle w:val="Valori-geel"/>
                                  </w:rPr>
                                  <w:t xml:space="preserve"> // </w:t>
                                </w:r>
                                <w:r w:rsidRPr="00057125">
                                  <w:rPr>
                                    <w:szCs w:val="24"/>
                                  </w:rPr>
                                  <w:t><xsl:value-of select="//cv:persoonsgegevens/cv:woonplaats" /></w:t>
                                </w:r>
                                <w:r w:rsidRPr="002271D3">
                                  <w:rPr>
                                    <w:rStyle w:val="Valori-geel"/>
                                  </w:rPr>
                                  <w:t xml:space="preserve"> //</w:t>
                                </w:r>
                              </w:p>
                            </w:txbxContent>
                          </wps:txbx>
                          <wps:bodyPr rot="0" vert="horz" wrap="square" lIns="0" tIns="0" rIns="0" bIns="0" anchor="t" anchorCtr="0">
                            <a:noAutofit/>
                          </wps:bodyPr>
                        </wps:wsp>
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
              </mc:Choice>
              <mc:Fallback>
                <w:pict>
                  <v:shapetype id="_x0000_t202" coordsize="21600,21600" o:spt="202" path="m,l,21600r21600,l21600,xe">
                    <v:stroke joinstyle="miter"/>
                    <v:path gradientshapeok="t" o:connecttype="rect"/>
                  </v:shapetype>
                  <v:shape id="Tekstvak 2" o:spid="_x0000_s1026" type="#_x0000_t202" style="position:absolute;margin-left:416.05pt;margin-top:-44.25pt;width:467.25pt;height:44.2pt;z-index:251659264;visibility:visible;mso-wrap-style:square;mso-width-percent:0;mso-height-percent:0;mso-wrap-distance-left:9pt;mso-wrap-distance-top:3.6pt;mso-wrap-distance-right:9pt;mso-wrap-distance-bottom:3.6pt;mso-position-horizontal:right;mso-position-horizontal-relative:margin;mso-position-vertical:absolute;mso-position-vertical-relative:text;mso-width-percent:0;mso-height-percent:0;mso-width-relative:margin;mso-height-relative:margin;v-text-anchor:top" o:gfxdata="UEsDBBQABgAIAAAAIQC2gziS/gAAAOEBAAATAAAAW0NvbnRlbnRfVHlwZXNdLnhtbJSRQU7DMBBF&#xA;90jcwfIWJU67QAgl6YK0S0CoHGBkTxKLZGx5TGhvj5O2G0SRWNoz/78nu9wcxkFMGNg6quQqL6RA&#xA;0s5Y6ir5vt9lD1JwBDIwOMJKHpHlpr69KfdHjyxSmriSfYz+USnWPY7AufNIadK6MEJMx9ApD/oD&#xA;OlTrorhX2lFEilmcO2RdNtjC5xDF9pCuTyYBB5bi6bQ4syoJ3g9WQ0ymaiLzg5KdCXlKLjvcW893&#xA;SUOqXwnz5DrgnHtJTxOsQfEKIT7DmDSUCaxw7Rqn8787ZsmRM9e2VmPeBN4uqYvTtW7jvijg9N/y&#xA;JsXecLq0q+WD6m8AAAD//wMAUEsDBBQABgAIAAAAIQA4/SH/1gAAAJQBAAALAAAAX3JlbHMvLnJl&#xA;bHOkkMFqwzAMhu+DvYPRfXGawxijTi+j0GvpHsDYimMaW0Yy2fr2M4PBMnrbUb/Q94l/f/hMi1qR&#xA;JVI2sOt6UJgd+ZiDgffL8ekFlFSbvV0oo4EbChzGx4f9GRdb25HMsYhqlCwG5lrLq9biZkxWOiqY&#xA;22YiTra2kYMu1l1tQD30/bPm3wwYN0x18gb45AdQl1tp5j/sFB2T0FQ7R0nTNEV3j6o9feQzro1i&#xA;OWA14Fm+Q8a1a8+Bvu/d/dMb2JY5uiPbhG/ktn4cqGU/er3pcvwCAAD//wMAUEsDBBQABgAIAAAA&#xA;IQAo/UNFBQIAAOQDAAAOAAAAZHJzL2Uyb0RvYy54bWysU8tu2zAQvBfoPxC817KUKk0E00GaNEWB&#xA;9AEk/QCaoizCJJclaUvu12dJ2Y7R3orqQKzE3dmd2dHiZjSa7KQPCiyj5WxOibQCWmXXjP58fnh3&#xA;RUmI3LZcg5WM7mWgN8u3bxaDa2QFPehWeoIgNjSDY7SP0TVFEUQvDQ8zcNLiZQfe8Iivfl20ng+I&#xA;bnRRzeeXxQC+dR6EDAG/3k+XdJnxu06K+L3rgoxEM4qzxXz6fK7SWSwXvFl77nolDmPwf5jCcGWx&#xA;6QnqnkdOtl79BWWU8BCgizMBpoCuU0JmDsimnP/B5qnnTmYuKE5wJ5nC/4MV33Y/PFEto1X5gRLL&#xA;DS7pWW5C3PENqZI+gwsNpj05TIzjRxhxz5lrcI8gNoFYuOu5Xctb72HoJW9xvjJVFmelE05IIKvh&#xA;K7TYhm8jZKCx8yaJh3IQRMc97U+7kWMkAj/W1xfvq7qkROBdfVlelHVuwZtjtfMhfpZgSAoY9bj7&#xA;jM53jyGmaXhzTEnNLDworfP+tSUDo9d1VeeCsxujItpTK8Po1Tw9k2ESyU+2zcWRKz3F2EDbA+tE&#xA;dKIcx9WIiUmKFbR75O9hsiH+Nhj04H9TMqAFGQ2/ttxLSvQXixomvx4DfwxWx4BbgaWMRkqm8C5m&#xA;X0/cblHbTmXar50Ps6GVshoH2yevnr/nrNefc/kCAAD//wMAUEsDBBQABgAIAAAAIQCExhL43QAA&#xA;AAYBAAAPAAAAZHJzL2Rvd25yZXYueG1sTI/NTsMwEITvSH0Haytxa53yU6UhTlUhOCEh0nDg6MTb&#xA;xGq8DrHbhrdnOZXbzs5q5tt8O7lenHEM1pOC1TIBgdR4Y6lV8Fm9LlIQIWoyuveECn4wwLaY3eQ6&#xA;M/5CJZ73sRUcQiHTCroYh0zK0HTodFj6AYm9gx+djizHVppRXzjc9fIuSdbSaUvc0OkBnztsjvuT&#xA;U7D7ovLFfr/XH+WhtFW1SehtfVTqdj7tnkBEnOL1GP7wGR0KZqr9iUwQvQJ+JCpYpOkjCLY39w88&#xA;1LxZgSxy+R+/+AUAAP//AwBQSwECLQAUAAYACAAAACEAtoM4kv4AAADhAQAAEwAAAAAAAAAAAAAA&#xA;AAAAAAAAW0NvbnRlbnRfVHlwZXNdLnhtbFBLAQItABQABgAIAAAAIQA4/SH/1gAAAJQBAAALAAAA&#xA;AAAAAAAAAAAAAC8BAABfcmVscy8ucmVsc1BLAQItABQABgAIAAAAIQAo/UNFBQIAAOQDAAAOAAAA&#xA;AAAAAAAAAAAAAC4CAABkcnMvZTJvRG9jLnhtbFBLAQItABQABgAIAAAAIQCExhL43QAAAAYBAAAP&#xA;AAAAAAAAAAAAAAAAAF8EAABkcnMvZG93bnJldi54bWxQSwUGAAAAAAQABADzAAAAaQUAAAAA&#xA;" filled="f" stroked="f">
                    <v:textbox inset="0,0,0,0">
                      <w:txbxContent>
                        <w:p w:rsidR="00C34A5E" w:rsidRPr="00C34A5E" w:rsidRDefault="00C34A5E" w:rsidP="00C34A5E">
                          <w:pPr>
                            <w:pStyle w:val="Titel"/>
                          </w:pPr>
                          <w:r w:rsidRPr="00C34A5E">
                            <w:t><xsl:apply-templates select="//cv:persoonsgegevens" mode="full-name" /></w:t>
                          </w:r>
                        </w:p>
                        <w:p w:rsidR="0041112D" w:rsidRPr="00057125" w:rsidRDefault="00C34A5E" w:rsidP="00057125">
                          <w:pPr>
                            <w:pStyle w:val="Ondertitel"/>
                            <w:rPr>
                              <w:iCs/>
                              <w:color w:val="F4931E"/>
                              <w:szCs w:val="24"/>
                            </w:rPr>
                          </w:pPr>
                          <w:r w:rsidRPr="00057125">
                            <w:rPr>
                              <w:szCs w:val="24"/>
                            </w:rPr>
                            <w:t>[PROFIEL_TITEL]</w:t>
                          </w:r>
                          <w:r w:rsidRPr="002271D3">
                            <w:rPr>
                              <w:rStyle w:val="Valori-geel"/>
                            </w:rPr>
                            <w:t xml:space="preserve"> // </w:t>
                          </w:r>
                          <w:r w:rsidRPr="00057125">
                            <w:rPr>
                              <w:szCs w:val="24"/>
                            </w:rPr>
                            <w:t><xsl:apply-templates select="//cv:persoonsgegevens/cv:geboortedatum" mode="date-numeric" /></w:t>
                          </w:r>
                          <w:r w:rsidRPr="002271D3">
                            <w:rPr>
                              <w:rStyle w:val="Valori-geel"/>
                            </w:rPr>
                            <w:t xml:space="preserve"> // </w:t>
                          </w:r>
                          <w:r w:rsidRPr="00057125">
                            <w:rPr>
                              <w:szCs w:val="24"/>
                            </w:rPr>
                            <w:t><xsl:value-of select="//cv:persoonsgegevens/cv:woonplaats" /></w:t>
                          </w:r>
                          <w:r w:rsidRPr="002271D3">
                            <w:rPr>
                              <w:rStyle w:val="Valori-geel"/>
                            </w:rPr>
                            <w:t xml:space="preserve"> //</w:t>
                          </w:r>
                        </w:p>
                      </w:txbxContent>
                    </v:textbox>
                    <w10:wrap anchorx="margin"/>
                  </v:shape>
                </w:pict>
              </mc:Fallback>
            </mc:AlternateContent>
          </w:r>
        </w:p>
        <w:p w:rsidR="0041112D" w:rsidRDefault="0041112D" w:rsidP="0041112D"/>
        <w:p w:rsidR="00403D6F" w:rsidRDefault="00403D6F" w:rsidP="0041112D"/>
        <!--
        
          PROFIELSCHETS
          
        -->
        <xsl:variable name="profiel" select="//cv:cv/cv:profiel[(cv:locale = $locale) and (normalize-space() != cv:locale)]" />
        <w:p w:rsidR="0041112D" w:rsidRPr="00CE4E21" w:rsidRDefault="00403D6F" w:rsidP="00CE4E21">
          <w:pPr>
            <w:pStyle w:val="Kop1"/>
            <w:rPr>
              <w:iCs/>
            </w:rPr>
          </w:pPr>
          <w:r w:rsidRPr="00CE4E21">
            <w:t>Profielschets</w:t>
          </w:r>
        </w:p>
        <xsl:if test="normalize-space($profiel/cv:profiel)">
          <w:p w:rsidR="00403D6F" w:rsidRDefault="00D63E1B" w:rsidP="004609AB">
            <w:pPr>
              <w:pStyle w:val="Paragraaf"/>
            </w:pPr>
            <xsl:apply-templates select="$profiel/cv:profiel" mode="format-text" />
          </w:p>
        </xsl:if>
        <xsl:if test="normalize-space($profiel/cv:persoonlijke_eigenschappen)">
          <w:p w:rsidR="00403D6F" w:rsidRDefault="00D63E1B" w:rsidP="004609AB">
            <w:pPr>
              <w:pStyle w:val="Paragraaf"/>
            </w:pPr>
            <xsl:apply-templates select="$profiel/cv:persoonlijke_eigenschappen" mode="format-text" />
          </w:p>
        </xsl:if>
        <xsl:if test="normalize-space($profiel/cv:vaardigheden)">
          <w:p w:rsidR="00403D6F" w:rsidRDefault="00D63E1B" w:rsidP="004609AB">
            <w:pPr>
              <w:pStyle w:val="Paragraaf"/>
            </w:pPr>
            <xsl:apply-templates select="$profiel/cv:vaardigheden" mode="format-text" />
          </w:p>
        </xsl:if>
        <!--
        
          KENNIS EN VAARDIGHEDEN
          
        -->
        <w:p w:rsidR="002E2E53" w:rsidRDefault="00A37916" w:rsidP="00A37916">
          <w:pPr>
            <w:pStyle w:val="Kop1"/>
          </w:pPr>
          <w:r>
            <w:t>Kennis en vaardigheden</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="0081312E" w:rsidRPr="0081312E" w:rsidRDefault="0081312E" w:rsidP="0081312E">
          <w:pPr>
            <w:sectPr w:rsidR="0081312E" w:rsidRPr="0081312E" w:rsidSect="00720889">
              <w:headerReference w:type="default" r:id="rId8"/>
              <w:footerReference w:type="default" r:id="rId9"/>
              <w:pgSz w:w="11906" w:h="16838"/>
              <w:pgMar w:top="2268" w:right="707" w:bottom="1417" w:left="1843" w:header="708" w:footer="425" w:gutter="0"/>
              <w:cols w:space="708"/>
              <w:docGrid w:linePitch="360"/>
            </w:sectPr>
          </w:pPr>
        </w:p>
        <!--
          TALEN
        -->
        <xsl:variable name="talenkennis" select="//cv:talenkennis[normalize-space()]" />
        <xsl:if test="$talenkennis">
          <w:p w:rsidR="002E2E53" w:rsidRPr="00057125" w:rsidRDefault="002E2E53" w:rsidP="00DE6855">
            <w:pPr>
              <w:pStyle w:val="Kop2"/>
            </w:pPr>
            <w:r w:rsidRPr="00DE6855">
              <w:t>Talen</w:t>
            </w:r>
          </w:p>
          <xsl:apply-templates select="$talenkennis">
            <xsl:sort select="cv:mondeling" data-type="number" />
            <xsl:sort select="cv:schriftelijk" data-type="number" />
          </xsl:apply-templates>
        </xsl:if>
        <!--
          BRANCHES
        -->
        <w:p w:rsidR="002E2E53" w:rsidRPr="002E2E53" w:rsidRDefault="002E2E53" w:rsidP="0081312E">
          <w:pPr>
            <w:pStyle w:val="Kop2"/>
          </w:pPr>
          <w:r w:rsidRPr="002E2E53">
            <w:t>Branches</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="002E2E53" w:rsidRDefault="002E2E53" w:rsidP="00D63E1B">
          <w:pPr>
            <w:pStyle w:val="Valori-tabel"/>
          </w:pPr>
          <w:r>
            <w:t>[BRANCHE]</w:t>
          </w:r>
          <w:r>
            <w:tab/>
          </w:r>
          <w:r w:rsidR="00DE6855" w:rsidRPr="002271D3">
            <w:rPr>
              <w:rStyle w:val="Valori-niveau"/>
            </w:rPr>
            <w:t></w:t>
          </w:r>
        </w:p>
        <!--
          EXPERTISES
        -->
        <w:p w:rsidR="002E2E53" w:rsidRPr="002E2E53" w:rsidRDefault="002E2E53" w:rsidP="0081312E">
          <w:pPr>
            <w:pStyle w:val="Kop2"/>
          </w:pPr>
          <w:r w:rsidRPr="002E2E53">
            <w:t>Expertises</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="0081312E" w:rsidRDefault="002E2E53" w:rsidP="00D63E1B">
          <w:pPr>
            <w:pStyle w:val="Valori-tabel"/>
          </w:pPr>
          <w:r>
            <w:t>[CATEGORIE]</w:t>
          </w:r>
          <w:r>
            <w:tab/>
          </w:r>
          <w:r w:rsidRPr="002271D3">
            <w:rPr>
              <w:rStyle w:val="Valori-niveau"/>
            </w:rPr>
            <w:t></w:t>
          </w:r>
        </w:p>
        <!--
          DATABASES
        -->
        <w:p w:rsidR="002E2E53" w:rsidRPr="00057125" w:rsidRDefault="00BC0871" w:rsidP="0081312E">
          <w:pPr>
            <w:pStyle w:val="Kop2"/>
          </w:pPr>
          <w:r>
            <w:br w:type="column"/>
          </w:r>
          <w:r w:rsidR="002E2E53" w:rsidRPr="0081312E">
            <w:t>Databases</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="002E2E53" w:rsidRDefault="002E2E53" w:rsidP="00D63E1B">
          <w:pPr>
            <w:pStyle w:val="Valori-tabel"/>
          </w:pPr>
          <w:r>
            <w:t>[CATEGORIE]</w:t>
          </w:r>
          <w:r>
            <w:tab/>
          </w:r>
          <w:r w:rsidRPr="002271D3">
            <w:rPr>
              <w:rStyle w:val="Valori-niveau"/>
            </w:rPr>
            <w:t></w:t>
          </w:r>
        </w:p>
        <!--
          APPLICATIES
        -->
        <w:p w:rsidR="002E2E53" w:rsidRPr="002E2E53" w:rsidRDefault="002E2E53" w:rsidP="0081312E">
          <w:pPr>
            <w:pStyle w:val="Kop2"/>
          </w:pPr>
          <w:r w:rsidRPr="002E2E53">
            <w:t>Applicaties</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="002E2E53" w:rsidRDefault="002E2E53" w:rsidP="00D63E1B">
          <w:pPr>
            <w:pStyle w:val="Valori-tabel"/>
          </w:pPr>
          <w:r>
            <w:t>[CATEGORIE]</w:t>
          </w:r>
          <w:r>
            <w:tab/>
          </w:r>
          <w:r w:rsidRPr="002271D3">
            <w:rPr>
              <w:rStyle w:val="Valori-niveau"/>
            </w:rPr>
            <w:t></w:t>
          </w:r>
        </w:p>
        <!--
          OS EN NETWERKEN
        -->
        <w:p w:rsidR="00BC0871" w:rsidRPr="002E2E53" w:rsidRDefault="00BC0871" w:rsidP="0081312E">
          <w:pPr>
            <w:pStyle w:val="Kop2"/>
          </w:pPr>
          <w:r>
            <w:t>OS en Netwerken</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="00BC0871" w:rsidRDefault="00BC0871" w:rsidP="00D63E1B">
          <w:pPr>
            <w:pStyle w:val="Valori-tabel"/>
          </w:pPr>
          <w:r>
            <w:t>[CATEGORIE]</w:t>
          </w:r>
          <w:r>
            <w:tab/>
          </w:r>
          <w:r w:rsidRPr="002271D3">
            <w:rPr>
              <w:rStyle w:val="Valori-niveau"/>
            </w:rPr>
            <w:t></w:t>
          </w:r>
        </w:p>
        <!--
          TOOLS
        -->
        <w:p w:rsidR="002E2E53" w:rsidRPr="002E2E53" w:rsidRDefault="002E2E53" w:rsidP="0081312E">
          <w:pPr>
            <w:pStyle w:val="Kop2"/>
          </w:pPr>
          <w:r w:rsidRPr="002E2E53">
            <w:t>Tools</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="002E2E53" w:rsidRDefault="002E2E53" w:rsidP="00D63E1B">
          <w:pPr>
            <w:pStyle w:val="Valori-tabel"/>
          </w:pPr>
          <w:r>
            <w:t>[CATEGORIE]</w:t>
          </w:r>
          <w:r>
            <w:tab/>
          </w:r>
          <w:r w:rsidRPr="002271D3">
            <w:rPr>
              <w:rStyle w:val="Valori-niveau"/>
            </w:rPr>
            <w:t></w:t>
          </w:r>
        </w:p>
        <!--
          PROGRAMMEREN
        -->
        <w:p w:rsidR="002E2E53" w:rsidRPr="002E2E53" w:rsidRDefault="00BC0871" w:rsidP="0081312E">
          <w:pPr>
            <w:pStyle w:val="Kop2"/>
          </w:pPr>
          <w:r>
            <w:br w:type="column"/>
          </w:r>
          <w:r w:rsidR="002E2E53" w:rsidRPr="002E2E53">
            <w:t>Programmeren</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="002E2E53" w:rsidRDefault="002E2E53" w:rsidP="00D63E1B">
          <w:pPr>
            <w:pStyle w:val="Valori-tabel"/>
          </w:pPr>
          <w:r>
            <w:t>[CATEGORIE]</w:t>
          </w:r>
          <w:r>
            <w:tab/>
          </w:r>
          <w:r w:rsidRPr="002271D3">
            <w:rPr>
              <w:rStyle w:val="Valori-niveau"/>
            </w:rPr>
            <w:t></w:t>
          </w:r>
        </w:p>
        <!--
          METHODES
        -->
        <w:p w:rsidR="002E2E53" w:rsidRPr="002E2E53" w:rsidRDefault="002E2E53" w:rsidP="0081312E">
          <w:pPr>
            <w:pStyle w:val="Kop2"/>
          </w:pPr>
          <w:r w:rsidRPr="002E2E53">
            <w:t>Methodes</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="002E2E53" w:rsidRDefault="002E2E53" w:rsidP="00D63E1B">
          <w:pPr>
            <w:pStyle w:val="Valori-tabel"/>
          </w:pPr>
          <w:r>
            <w:t>[CATEGORIE]</w:t>
          </w:r>
          <w:r>
            <w:tab/>
          </w:r>
          <w:r w:rsidRPr="002271D3">
            <w:rPr>
              <w:rStyle w:val="Valori-niveau"/>
            </w:rPr>
            <w:t></w:t>
          </w:r>
        </w:p>
        <!--
          CERTIFICERINGEN
        -->
        <w:p w:rsidR="00BC0871" w:rsidRPr="002E2E53" w:rsidRDefault="00BC0871" w:rsidP="0081312E">
          <w:pPr>
            <w:pStyle w:val="Kop2"/>
          </w:pPr>
          <w:r w:rsidRPr="002E2E53">
            <w:t>Certificeringen</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="00BC0871" w:rsidRDefault="00BC0871" w:rsidP="00D63E1B">
          <w:pPr>
            <w:pStyle w:val="Valori-tabel"/>
          </w:pPr>
          <w:r>
            <w:t>[CATEGORIE]</w:t>
          </w:r>
          <w:r>
            <w:tab/>
          </w:r>
          <w:r w:rsidRPr="002271D3">
            <w:rPr>
              <w:rStyle w:val="Valori-niveau"/>
            </w:rPr>
            <w:t></w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="002E2E53" w:rsidRDefault="002E2E53" w:rsidP="002E2E53">
          <w:pPr>
            <w:sectPr w:rsidR="002E2E53" w:rsidSect="002E2E53">
              <w:type w:val="continuous"/>
              <w:pgSz w:w="11906" w:h="16838"/>
              <w:pgMar w:top="2268" w:right="707" w:bottom="1417" w:left="1843" w:header="708" w:footer="708" w:gutter="0"/>
              <w:cols w:num="3" w:space="212"/>
              <w:docGrid w:linePitch="360"/>
            </w:sectPr>
          </w:pPr>
        </w:p>
        <!--
        
          WERKERVARING
          
        -->
        <w:p w:rsidR="00A37916" w:rsidRDefault="002E2E53" w:rsidP="002E2E53">
          <w:pPr>
            <w:pStyle w:val="Kop1"/>
          </w:pPr>
          <w:r>
            <w:t>Werkervaring</w:t>
          </w:r>
        </w:p>
        <w:tbl>
          <w:tblPr>
            <w:tblStyle w:val="Tabelraster"/>
            <w:tblW w:w="0" w:type="auto"/>
            <w:tblBorders>
              <w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:bottom w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
            </w:tblBorders>
            <w:tblCellMar>
              <w:left w:w="0" w:type="dxa"/>
              <w:right w:w="0" w:type="dxa"/>
            </w:tblCellMar>
            <w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/>
          </w:tblPr>
          <w:tblGrid>
            <w:gridCol w:w="3261"/>
            <w:gridCol w:w="3118"/>
            <w:gridCol w:w="2967"/>
          </w:tblGrid>
          <w:tr w:rsidR="00CE4E21" w:rsidRPr="00CE4E21" w:rsidTr="005E4B3F">
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="3261" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00CE4E21" w:rsidRPr="00CE4E21" w:rsidRDefault="00CE4E21" w:rsidP="0081312E">
                <w:pPr>
                  <w:pStyle w:val="Kop2"/>
                  <w:outlineLvl w:val="1"/>
                </w:pPr>
                <w:r w:rsidRPr="00CE4E21">
                  <w:t>Periode</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="3118" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00CE4E21" w:rsidRPr="00CE4E21" w:rsidRDefault="00CE4E21" w:rsidP="0081312E">
                <w:pPr>
                  <w:pStyle w:val="Kop2"/>
                  <w:outlineLvl w:val="1"/>
                </w:pPr>
                <w:r w:rsidRPr="00CE4E21">
                  <w:t>Rol</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="2967" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00CE4E21" w:rsidRPr="00CE4E21" w:rsidRDefault="00CE4E21" w:rsidP="0081312E">
                <w:pPr>
                  <w:pStyle w:val="Kop2"/>
                  <w:outlineLvl w:val="1"/>
                </w:pPr>
                <w:r w:rsidRPr="00CE4E21">
                  <w:t>Opdrachtgever</w:t>
                </w:r>
              </w:p>
            </w:tc>
          </w:tr>
          <w:tr w:rsidR="00CE4E21" w:rsidRPr="00CE4E21" w:rsidTr="005E4B3F">
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="3261" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00CE4E21" w:rsidRPr="00CE4E21" w:rsidRDefault="00CE4E21" w:rsidP="00CE4E21">
                <w:r w:rsidRPr="00CE4E21">
                  <w:t>[PERIODE_VAN] – [PERIODE_TOT]</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="3118" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00CE4E21" w:rsidRPr="00CE4E21" w:rsidRDefault="00CE4E21" w:rsidP="00CE4E21">
                <w:r w:rsidRPr="00CE4E21">
                  <w:t>[ROL]</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="2967" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00CE4E21" w:rsidRPr="00CE4E21" w:rsidRDefault="00CE4E21" w:rsidP="00CE4E21">
                <w:r w:rsidRPr="00CE4E21">
                  <w:t>[OPDRACHTGEVER]</w:t>
                </w:r>
              </w:p>
            </w:tc>
          </w:tr>
        </w:tbl>
        <!--
        
          OPLEIDINGEN
          
        -->
        <w:p w:rsidR="00902CB9" w:rsidRDefault="00902CB9" w:rsidP="00902CB9">
          <w:pPr>
            <w:pStyle w:val="Kop1"/>
          </w:pPr>
          <w:r>
            <w:t>Opleidingen</w:t>
          </w:r>
        </w:p>
        <w:tbl>
          <w:tblPr>
            <w:tblStyle w:val="Tabelraster"/>
            <w:tblW w:w="0" w:type="auto"/>
            <w:tblBorders>
              <w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:bottom w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
            </w:tblBorders>
            <w:tblCellMar>
              <w:left w:w="0" w:type="dxa"/>
              <w:right w:w="0" w:type="dxa"/>
            </w:tblCellMar>
            <w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/>
          </w:tblPr>
          <w:tblGrid>
            <w:gridCol w:w="3261"/>
            <w:gridCol w:w="3118"/>
            <w:gridCol w:w="2967"/>
          </w:tblGrid>
          <w:tr w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidTr="005E4B3F">
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="3261" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidRDefault="00902CB9" w:rsidP="0081312E">
                <w:pPr>
                  <w:pStyle w:val="Kop2"/>
                  <w:outlineLvl w:val="1"/>
                </w:pPr>
                <w:r>
                  <w:t>Opleiding</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="3118" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidRDefault="00902CB9" w:rsidP="0081312E">
                <w:pPr>
                  <w:pStyle w:val="Kop2"/>
                  <w:outlineLvl w:val="1"/>
                </w:pPr>
                <w:r>
                  <w:t>Locatie</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="2967" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidRDefault="00902CB9" w:rsidP="0081312E">
                <w:pPr>
                  <w:pStyle w:val="Kop2"/>
                  <w:outlineLvl w:val="1"/>
                </w:pPr>
                <w:r>
                  <w:t>Diploma</w:t>
                </w:r>
              </w:p>
            </w:tc>
          </w:tr>
          <w:tr w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidTr="005E4B3F">
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="3261" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidRDefault="00902CB9" w:rsidP="00BA62E2">
                <w:r w:rsidRPr="00CE4E21">
                  <w:t>[OPLEIDING]</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="3118" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidRDefault="00902CB9" w:rsidP="00BA62E2">
                <w:r w:rsidRPr="00CE4E21">
                  <w:t>[INSTITUUT]</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="2967" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidRDefault="00902CB9" w:rsidP="00902CB9">
                <w:r>
                  <w:t>[JAAR_DIPLOMA]</w:t>
                </w:r>
                <w:r w:rsidRPr="002271D3">
                  <w:rPr>
                    <w:rStyle w:val="Valori-geel"/>
                  </w:rPr>
                  <w:t xml:space="preserve"> // </w:t>
                </w:r>
                <w:r w:rsidRPr="00CE4E21">
                  <w:t>[DIPLOMA]</w:t>
                </w:r>
              </w:p>
            </w:tc>
          </w:tr>
        </w:tbl>
        <!--
        
          CURSUSSEN
          
        -->
        <w:p w:rsidR="00902CB9" w:rsidRDefault="00902CB9" w:rsidP="00902CB9">
          <w:pPr>
            <w:pStyle w:val="Kop1"/>
          </w:pPr>
          <w:r>
            <w:t>Cursussen</w:t>
          </w:r>
        </w:p>
        <w:tbl>
          <w:tblPr>
            <w:tblStyle w:val="Tabelraster"/>
            <w:tblW w:w="0" w:type="auto"/>
            <w:tblInd w:w="-5" w:type="dxa"/>
            <w:tblBorders>
              <w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:bottom w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
            </w:tblBorders>
            <w:tblCellMar>
              <w:left w:w="0" w:type="dxa"/>
              <w:right w:w="0" w:type="dxa"/>
            </w:tblCellMar>
            <w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/>
          </w:tblPr>
          <w:tblGrid>
            <w:gridCol w:w="3266"/>
            <w:gridCol w:w="3118"/>
            <w:gridCol w:w="2962"/>
          </w:tblGrid>
          <w:tr w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidTr="005E4B3F">
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="3266" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidRDefault="00902CB9" w:rsidP="0081312E">
                <w:pPr>
                  <w:pStyle w:val="Kop2"/>
                  <w:outlineLvl w:val="1"/>
                </w:pPr>
                <w:r>
                  <w:t>Opleiding</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="3118" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidRDefault="00902CB9" w:rsidP="0081312E">
                <w:pPr>
                  <w:pStyle w:val="Kop2"/>
                  <w:outlineLvl w:val="1"/>
                </w:pPr>
                <w:r>
                  <w:t>Locatie</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="2962" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidRDefault="00902CB9" w:rsidP="0081312E">
                <w:pPr>
                  <w:pStyle w:val="Kop2"/>
                  <w:outlineLvl w:val="1"/>
                </w:pPr>
                <w:r>
                  <w:t>Certificaat</w:t>
                </w:r>
              </w:p>
            </w:tc>
          </w:tr>
          <w:tr w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidTr="005E4B3F">
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="3266" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidRDefault="00902CB9" w:rsidP="00BA62E2">
                <w:r w:rsidRPr="00CE4E21">
                  <w:t>[OPLEIDING]</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="3118" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidRDefault="00902CB9" w:rsidP="00BA62E2">
                <w:r w:rsidRPr="00CE4E21">
                  <w:t>[INSTITUUT]</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="2962" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00902CB9" w:rsidRPr="00CE4E21" w:rsidRDefault="00902CB9" w:rsidP="00BA62E2">
                <w:r>
                  <w:t>[JAAR_DIPLOMA]</w:t>
                </w:r>
                <w:r w:rsidRPr="002271D3">
                  <w:rPr>
                    <w:rStyle w:val="Valori-geel"/>
                  </w:rPr>
                  <w:t xml:space="preserve"> // </w:t>
                </w:r>
                <w:r w:rsidRPr="00CE4E21">
                  <w:t>[DIPLOMA]</w:t>
                </w:r>
              </w:p>
            </w:tc>
          </w:tr>
        </w:tbl>
        <!--
        
          INTERESSES
          
        -->
        <w:p w:rsidR="00902CB9" w:rsidRDefault="00902CB9" w:rsidP="00902CB9">
          <w:pPr>
            <w:pStyle w:val="Kop1"/>
          </w:pPr>
          <w:r>
            <w:t>Interesses</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="00902CB9" w:rsidRDefault="00902CB9" w:rsidP="004609AB">
          <w:pPr>
            <w:pStyle w:val="Paragraaf"/>
          </w:pPr>
          <w:r>
            <w:t>[INTERESSES]</w:t>
          </w:r>
        </w:p>
        <!--
        
          REFERENTIES
          
        -->
        <w:p w:rsidR="00902CB9" w:rsidRDefault="00902CB9" w:rsidP="00902CB9">
          <w:pPr>
            <w:pStyle w:val="Kop1"/>
          </w:pPr>
          <w:r>
            <w:t>Referenties</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="00902CB9" w:rsidRPr="00902CB9" w:rsidRDefault="00902CB9" w:rsidP="0081312E">
          <w:pPr>
            <w:pStyle w:val="Kop2"/>
          </w:pPr>
          <w:r w:rsidRPr="00902CB9">
            <w:t>[NAAM_REFERENT] [FUNCTIE_REFERENT]</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="00EA114C" w:rsidRDefault="00902CB9" w:rsidP="00902CB9">
          <w:r>
            <w:t>[REFERENTIES]</w:t>
          </w:r>
        </w:p>
        <w:p w:rsidR="00EA114C" w:rsidRDefault="00EA114C">
          <w:pPr>
            <w:spacing w:after="160"/>
          </w:pPr>
          <w:r>
            <w:br w:type="page"/>
          </w:r>
        </w:p>
        <!--
        
          WERKERVARING
          
        -->
        <w:p w:rsidR="00EA114C" w:rsidRDefault="00EA114C" w:rsidP="00EA114C">
          <w:pPr>
            <w:pStyle w:val="Kop1"/>
          </w:pPr>
          <w:r>
            <w:lastRenderedPageBreak/>
            <w:t>Werkervaring</w:t>
          </w:r>
        </w:p>
        <w:tbl>
          <w:tblPr>
            <w:tblStyle w:val="Tabelraster"/>
            <w:tblW w:w="0" w:type="auto"/>
            <w:tblInd w:w="-5" w:type="dxa"/>
            <w:tblBorders>
              <w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:bottom w:val="single" w:sz="4" w:space="0" w:color="F4931E"/>
              <w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:insideH w:val="single" w:sz="4" w:space="0" w:color="F4931E"/>
              <w:insideV w:val="dashed" w:sz="4" w:space="0" w:color="F4931E"/>
            </w:tblBorders>
            <w:tblCellMar>
              <w:left w:w="0" w:type="dxa"/>
              <w:right w:w="0" w:type="dxa"/>
            </w:tblCellMar>
            <w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/>
          </w:tblPr>
          <w:tblGrid>
            <w:gridCol w:w="2415"/>
            <w:gridCol w:w="6946"/>
          </w:tblGrid>
          <w:tr w:rsidR="00EA114C" w:rsidRPr="00CE4E21" w:rsidTr="00936F5B">
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="2415" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00EA114C" w:rsidRPr="0081312E" w:rsidRDefault="00EA114C" w:rsidP="00EA114C">
                <w:pPr>
                  <w:rPr>
                    <w:color w:val="0A1C5C"/>
                  </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0081312E">
                  <w:rPr>
                    <w:color w:val="0A1C5C"/>
                  </w:rPr>
                  <w:t>[PERIODE_VAN] – [PERIODE_TOT]</w:t>
                </w:r>
              </w:p>
              <w:p w:rsidR="00EA114C" w:rsidRPr="0081312E" w:rsidRDefault="00EA114C" w:rsidP="00EA114C">
                <w:pPr>
                  <w:rPr>
                    <w:color w:val="F39900"/>
                  </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0081312E">
                  <w:rPr>
                    <w:color w:val="F39900"/>
                  </w:rPr>
                  <w:t>[ROL]</w:t>
                </w:r>
              </w:p>
              <w:p w:rsidR="00EA114C" w:rsidRPr="00EA114C" w:rsidRDefault="00EA114C" w:rsidP="00EA114C">
                <w:r w:rsidRPr="0081312E">
                  <w:rPr>
                    <w:color w:val="F39900"/>
                  </w:rPr>
                  <w:t>[OPDRACHTGEVER]</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="6946" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00EA114C" w:rsidRDefault="00EA114C" w:rsidP="004609AB">
                <w:pPr>
                  <w:pStyle w:val="Paragraaf"/>
                </w:pPr>
                <w:r>
                  <w:t>[OPDRACHTFORMULERING]</w:t>
                </w:r>
              </w:p>
              <w:p w:rsidR="00EA114C" w:rsidRDefault="00EA114C" w:rsidP="0081312E">
                <w:pPr>
                  <w:pStyle w:val="Kop2"/>
                  <w:outlineLvl w:val="1"/>
                </w:pPr>
                <w:r w:rsidRPr="00936F5B">
                  <w:t>Taken en werkzaamheden</w:t>
                </w:r>
              </w:p>
              <w:p w:rsidR="00EA114C" w:rsidRDefault="00EA114C" w:rsidP="004609AB">
                <w:pPr>
                  <w:pStyle w:val="Paragraaf"/>
                </w:pPr>
                <w:r>
                  <w:t>[WERKZAAMHEDEN]</w:t>
                </w:r>
              </w:p>
              <w:p w:rsidR="00EA114C" w:rsidRDefault="00EA114C" w:rsidP="0081312E">
                <w:pPr>
                  <w:pStyle w:val="Kop2"/>
                  <w:outlineLvl w:val="1"/>
                </w:pPr>
                <w:r w:rsidRPr="00936F5B">
                  <w:t>Resultaat</w:t>
                </w:r>
              </w:p>
              <w:p w:rsidR="00EA114C" w:rsidRDefault="00EA114C" w:rsidP="004609AB">
                <w:pPr>
                  <w:pStyle w:val="Paragraaf"/>
                </w:pPr>
                <w:r>
                  <w:t>[RESULTAAT]</w:t>
                </w:r>
              </w:p>
              <w:p w:rsidR="00EA114C" w:rsidRDefault="00EA114C" w:rsidP="0081312E">
                <w:pPr>
                  <w:pStyle w:val="Kop2"/>
                  <w:outlineLvl w:val="1"/>
                </w:pPr>
                <w:r w:rsidRPr="00936F5B">
                  <w:t>Werkomgeving</w:t>
                </w:r>
              </w:p>
              <w:p w:rsidR="00936F5B" w:rsidRPr="00CE4E21" w:rsidRDefault="00EA114C" w:rsidP="004609AB">
                <w:pPr>
                  <w:pStyle w:val="Paragraaf"/>
                </w:pPr>
                <w:r>
                  <w:t>[STEEKWOORDEN]</w:t>
                </w:r>
              </w:p>
            </w:tc>
          </w:tr>
          
          <w:tr w:rsidR="00EA114C" w:rsidRPr="00CE4E21" w:rsidTr="00936F5B">
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="2415" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00EA114C" w:rsidRPr="0081312E" w:rsidRDefault="00EA114C" w:rsidP="00EA114C">
                <w:pPr>
                  <w:rPr>
                    <w:color w:val="0A1C5C"/>
                  </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0081312E">
                  <w:rPr>
                    <w:color w:val="0A1C5C"/>
                  </w:rPr>
                  <w:t>[PERIODE_VAN] – [PERIODE_TOT]</w:t>
                </w:r>
              </w:p>
              <w:p w:rsidR="00EA114C" w:rsidRPr="0081312E" w:rsidRDefault="00EA114C" w:rsidP="00EA114C">
                <w:pPr>
                  <w:rPr>
                    <w:color w:val="F39900"/>
                  </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0081312E">
                  <w:rPr>
                    <w:color w:val="F39900"/>
                  </w:rPr>
                  <w:t>[ROL]</w:t>
                </w:r>
              </w:p>
              <w:p w:rsidR="00EA114C" w:rsidRPr="00EA114C" w:rsidRDefault="00EA114C" w:rsidP="00EA114C">
                <w:pPr>
                  <w:rPr>
                    <w:iCs/>
                    <w:color w:val="F4931E"/>
                  </w:rPr>
                </w:pPr>
                <w:r w:rsidRPr="0081312E">
                  <w:rPr>
                    <w:color w:val="F39900"/>
                  </w:rPr>
                  <w:t>[OPDRACHTGEVER]</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr>
                <w:tcW w:w="6946" w:type="dxa"/>
              </w:tcPr>
              <w:p w:rsidR="00EA114C" w:rsidRPr="00CE4E21" w:rsidRDefault="00EA114C" w:rsidP="004609AB">
                <w:pPr>
                  <w:pStyle w:val="Paragraaf"/>
                </w:pPr>
                <w:r>
                  <w:t>[SAMENVATTING]</w:t>
                </w:r>
              </w:p>
            </w:tc>
          </w:tr>
        </w:tbl>
        <w:p w:rsidR="00902CB9" w:rsidRPr="00720889" w:rsidRDefault="00902CB9" w:rsidP="00720889">
          <w:pPr>
            <w:tabs>
              <w:tab w:val="left" w:pos="1875"/>
            </w:tabs>
          </w:pPr>
        </w:p>
        <w:sectPr w:rsidR="00902CB9" w:rsidRPr="00720889" w:rsidSect="00720889">
          <w:type w:val="continuous"/>
          <w:pgSz w:w="11906" w:h="16838"/>
          <w:pgMar w:top="2268" w:right="707" w:bottom="993" w:left="1843" w:header="708" w:footer="425" w:gutter="0"/>
          <w:cols w:space="708"/>
          <w:docGrid w:linePitch="360"/>
        </w:sectPr>
      </w:body>
    </w:document>
  </xsl:template>


















  <xsl:template match="cv:talenkennis">
    <w:p w:rsidR="002E2E53" w:rsidRDefault="002E2E53" w:rsidP="002271D3">
      <w:pPr>
        <w:pStyle w:val="Valori-tabel"/>
      </w:pPr>
      <w:r w:rsidRPr="002E2E53">
        <w:t><xsl:value-of select="cv:taal_NL" /></w:t>
        <w:tab/>
      </w:r>
      <w:r w:rsidR="00DE6855" w:rsidRPr="002271D3">
        <w:rPr>
          <w:rStyle w:val="Valori-niveau"/>
        </w:rPr>
        <w:t>
          <xsl:apply-templates select="cv:mondeling" mode="linguistics-level" />
        </w:t>
      </w:r>
    </w:p>
  </xsl:template>
  
</xsl:stylesheet>