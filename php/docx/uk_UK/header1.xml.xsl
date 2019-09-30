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

  <xsl:param name="layout"/>

  <xsl:output method="xml" standalone="yes" encoding="UTF-8" indent="no" />

  <xsl:template match="/">
    <w:hdr mc:Ignorable="w14 wp14">
      <w:p w:rsidR="00011166" w:rsidRDefault="00011166" w:rsidP="00D450FA">
        <w:pPr>
          <w:pStyle w:val="Header"/>
        </w:pPr>
        <w:r>
          <w:rPr>
            <w:noProof/>
            <w:lang w:eastAsia="nl-NL"/>
          </w:rPr>
          <xsl:if test="$layout != ''">
            <w:drawing>
              <wp:anchor distT="0" distB="0" distL="114300" distR="114300" simplePos="0" relativeHeight="251681792" behindDoc="1" locked="0" layoutInCell="1" allowOverlap="1" wp14:anchorId="54A2F8FA" wp14:editId="0B3662BE">
                <wp:simplePos x="0" y="0"/>
                <wp:positionH relativeFrom="page">
                  <wp:posOffset>776605</wp:posOffset>
                </wp:positionH>
                <wp:positionV relativeFrom="page">
                  <wp:posOffset>447040</wp:posOffset>
                </wp:positionV>
                <wp:extent cx="1929600" cy="252000"/>
                <wp:effectExtent l="0" t="0" r="0" b="0"/>
                <wp:wrapNone/>
                <wp:docPr id="25" name="Picture 25" descr="cerios_logo.png"/>
                <wp:cNvGraphicFramePr>
                  <a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" noChangeAspect="1"/>
                </wp:cNvGraphicFramePr>
                <a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
                  <a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
                    <pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
                      <pic:nvPicPr>
                        <pic:cNvPr id="0" name="Picture 1" descr="cerios_logo.png"/>
                        <pic:cNvPicPr>
                          <a:picLocks noChangeAspect="1" noChangeArrowheads="1"/>
                        </pic:cNvPicPr>
                      </pic:nvPicPr>
                      <pic:blipFill>
                        <a:blip r:embed="rId1" cstate="print">
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
                          <a:ext cx="1929600" cy="252000"/>
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
          </xsl:if>
        </w:r>
        <w:r>
          <w:rPr>
            <w:noProof/>
            <w:lang w:eastAsia="nl-NL"/>
          </w:rPr>
          <xsl:if test="$layout != ''">
            <w:drawing>
              <wp:anchor distT="0" distB="0" distL="114300" distR="114300" simplePos="0" relativeHeight="251682816" behindDoc="1" locked="1" layoutInCell="1" allowOverlap="1" wp14:anchorId="4076D749" wp14:editId="2A2DD134">
                <wp:simplePos x="0" y="0"/>
                <wp:positionH relativeFrom="page">
                  <wp:posOffset>4286885</wp:posOffset>
                </wp:positionH>
                <wp:positionV relativeFrom="page">
                  <wp:posOffset>219075</wp:posOffset>
                </wp:positionV>
                <wp:extent cx="2520000" cy="615600"/>
                <wp:effectExtent l="0" t="0" r="0" b="0"/>
                <wp:wrapNone/>
                <wp:docPr id="26" name="Picture 26" descr="cerios_symbolen.jpeg"/>
                <wp:cNvGraphicFramePr>
                  <a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" noChangeAspect="1"/>
                </wp:cNvGraphicFramePr>
                <a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
                  <a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
                    <pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
                      <pic:nvPicPr>
                        <pic:cNvPr id="0" name="Picture 2" descr="cerios_symbolen.jpeg"/>
                        <pic:cNvPicPr>
                          <a:picLocks noChangeAspect="1" noChangeArrowheads="1"/>
                        </pic:cNvPicPr>
                      </pic:nvPicPr>
                      <pic:blipFill>
                        <a:blip r:embed="rId2" cstate="print">
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
                          <a:ext cx="2520000" cy="615600"/>
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
          </xsl:if>
        </w:r>
      </w:p>
    </w:hdr>
  </xsl:template>

</xsl:stylesheet>