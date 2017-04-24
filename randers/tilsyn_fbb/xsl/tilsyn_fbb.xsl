<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output encoding="ISO-8859-1"/> 

  <xsl:param name="frid"/>
  <xsl:param name="sessionid"/>
  <xsl:param name="guid"><xsl:value-of select="$frid"></xsl:value-of> </xsl:param>
  <xsl:param name="logo">[module:formular.dir]/images/byvaaben.jpg</xsl:param>
  <xsl:param name="logo2">[module:formular.dir]/images/randerskommune.jpg</xsl:param>
  
  <xsl:param name="date"></xsl:param>
  <xsl:param name="journalnr"></xsl:param>

  <xsl:param name="adresse">Ikke oplyst</xsl:param>
  <xsl:param name="adr">Ikke oplyst</xsl:param>
  <xsl:param name="konflikttekst1">Ikke oplyst</xsl:param>
  <xsl:param name="konflikttekst2">Ikke oplyst</xsl:param>
  <xsl:param name="hovedplan">Ikke oplyst</xsl:param>
  <xsl:param name="sokkel">Ikke oplyst</xsl:param>
  <xsl:param name="ydermur">Ikke oplyst</xsl:param>
  <xsl:param name="tagkonstruktion">Ikke oplyst</xsl:param>
  <xsl:param name="gavlkonstruktion">Ikke oplyst</xsl:param>
  <xsl:param name="kvist">Ikke oplyst</xsl:param>
  <xsl:param name="gesims">Ikke oplyst</xsl:param>
  <xsl:param name="doer_port">Ikke oplyst</xsl:param>
  <xsl:param name="vindue">Ikke oplyst</xsl:param>
  <xsl:param name="bygningsdel">Ikke oplyst</xsl:param>
  <xsl:param name="udsmykning">Ikke oplyst</xsl:param>
  <xsl:param name="stilart">Ikke oplyst</xsl:param>
  <xsl:param name="oprindelig_fuktion">Ikke oplyst</xsl:param>
  <xsl:param name="nuvaerende_fuktion">Ikke oplyst</xsl:param>
  <xsl:param name="komplekstype">Ikke oplyst</xsl:param>
  <xsl:param name="indre_forhold">Ikke oplyst</xsl:param>
  <xsl:param name="ydre_forhold">Ikke oplyst</xsl:param>
  <xsl:param name="notatomindreogydreforhold">Ikke oplyst</xsl:param>
  <xsl:param name="omgivelser">Ikke oplyst</xsl:param>
  <xsl:param name="notatomomgivelser">Ikke oplyst</xsl:param>
  <xsl:param name="bebyggelsesmiljo">Ikke oplyst</xsl:param>
  <xsl:param name="notatombygningsmiljo">Ikke oplyst</xsl:param>
  <xsl:param name="arkitektoniskvaerdi">Ikke oplyst</xsl:param>
  <xsl:param name="arkitektonisk">Ikke oplyst</xsl:param>
  <xsl:param name="kulturhistoriskvaerdi">Ikke oplyst</xsl:param>
  <xsl:param name="kulturhistorisk">Ikke oplyst</xsl:param>
  <xsl:param name="miljomaessigvaerdi">Ikke oplyst</xsl:param>
  <xsl:param name="miljomaessig">Ikke oplyst</xsl:param>
  <xsl:param name="originalitetsvaerdi">Ikke oplyst</xsl:param>
  <xsl:param name="originalitets">Ikke oplyst</xsl:param>
  <xsl:param name="tilstandsvaerdi">Ikke oplyst</xsl:param>
  <xsl:param name="tilstand">Ikke oplyst</xsl:param>
  <xsl:param name="bevaringsmaessigvaerdi">Ikke oplyst</xsl:param>
  <xsl:param name="bevaringsmaessig">Ikke oplyst</xsl:param>
  <xsl:param name="foto1"></xsl:param>
  <xsl:param name="foto1_tekst"></xsl:param>
  <xsl:param name="foto2"></xsl:param>
  <xsl:param name="foto2_tekst"></xsl:param>
  <xsl:param name="foto3"></xsl:param>
  <xsl:param name="foto3_tekst"></xsl:param>
  <xsl:param name="foto4"></xsl:param>
  <xsl:param name="foto4_tekst"></xsl:param>
  <xsl:param name="foto5"></xsl:param>
  <xsl:param name="foto5_tekst"></xsl:param>
  <xsl:param name="foto6"></xsl:param>
  <xsl:param name="foto6_tekst"></xsl:param>
  <xsl:param name="betegnelse">Ikke oplyst</xsl:param>

  <xsl:decimal-format decimal-separator = "," grouping-separator = "." NaN=" "/> 
    
  <xsl:attribute-set name="fixed-cell">
    <xsl:attribute name="overflow">hidden</xsl:attribute>
    <xsl:attribute name="wrap-option">no-wrap</xsl:attribute>
    <xsl:attribute name="padding-end">3pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="thisfont">
    <xsl:attribute name="font-family">arial</xsl:attribute>
    <xsl:attribute name="font-size">10pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="fixed-cell-header" >
    <xsl:attribute name="overflow">hidden</xsl:attribute>
    <xsl:attribute name="wrap-option">no-wrap</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="padding-end">3pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="header-cell" >
    <xsl:attribute name="border-after-width">0.5pt</xsl:attribute>
    <xsl:attribute name="border-after-color">black</xsl:attribute>
    <xsl:attribute name="border-after-style">solid</xsl:attribute>
    <xsl:attribute name="margin-left">1mm</xsl:attribute>
    <xsl:attribute name="wrap-option">nowrap</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="normal-cell" >
    <xsl:attribute name="margin-left">1mm</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="sum-cell" >
    <xsl:attribute name="border-after-width">1pt</xsl:attribute>
    <xsl:attribute name="border-after-color">black</xsl:attribute>
    <xsl:attribute name="border-after-style">double</xsl:attribute>
    <xsl:attribute name="margin-left">1mm</xsl:attribute>
    <xsl:attribute name="wrap-option">nowrap</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="footer-cell" >
<!--    <xsl:attribute name="border-before-width">0.5pt</xsl:attribute>-->
<!--    <xsl:attribute name="border-before-color">black</xsl:attribute>-->
<!--    <xsl:attribute name="border-before-style">solid</xsl:attribute>-->
<!--    <xsl:attribute name="margin-left">1mm</xsl:attribute>-->
    <xsl:attribute name="wrap-option">nowrap</xsl:attribute>
    <xsl:attribute name="font-size">8pt</xsl:attribute>
  </xsl:attribute-set>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="all" page-height="29.7cm" page-width="21cm" margin-top="0.3cm" margin-bottom="1cm" margin-left="2.1cm" margin-right="1cm">
                    <fo:region-before extent="5mm" overflow="hidden"/>
                    <fo:region-body margin-top="5mm" margin-bottom="5mm"/>
                    <fo:region-after extent="5mm"/>
<!--                     <fo:region-after extent="5mm" border-top="0.1pt solid black"/> -->
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="all" 
                xsl:use-attribute-sets="thisfont">
                <fo:static-content flow-name="xsl-region-before">
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <xsl:call-template name="report-page-footer">
                        <xsl:with-param name="guid" select="$guid"/>
                    </xsl:call-template>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <xsl:call-template name="bodyTemplate"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template name="bodyTemplate">
        <xsl:call-template name="reportheader">
            <xsl:with-param name="date" select="$date"/>
         
        </xsl:call-template>

		<!-- Kort -->
		<fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				BASISOPLYSNINGER
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Adresse: <xsl:value-of select="$adr"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Ejerinformationer: <xsl:value-of select="$konflikttekst1"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Bygningsinformation: <xsl:value-of select="$konflikttekst2"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Journalnummer:01.10.00-A26-1-16
			</fo:block>
			
		</fo:block>
		
		
		<!-- Bygningskontruktion -->
		<fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				BYGNINGSKONTRUKTION
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Hovedplan: <xsl:value-of select="$hovedplan"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Sokkel: <xsl:value-of select="$sokkel"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Ydermur: <xsl:value-of select="$ydermur"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Tagkonstruktion: <xsl:value-of select="$tagkonstruktion"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Gavlkonstruktion: <xsl:value-of select="$gavlkonstruktion"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Kvist: <xsl:value-of select="$kvist"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Gesims: <xsl:value-of select="$gesims"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Dør/port:: <xsl:value-of select="$doer_port"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Vindue: <xsl:value-of select="$vindue"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Bygningsdel: <xsl:value-of select="$bygningsdel"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Udsmykning: <xsl:value-of select="$udsmykning"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Stilart: <xsl:value-of select="$stilart"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Oprindelig funktion: <xsl:value-of select="$oprindelig_fuktion"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Nuværende funktion: <xsl:value-of select="$nuvaerende_fuktion"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Komplekstype: <xsl:value-of select="$komplekstype"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Betegnelse: <xsl:value-of select="$betegnelse"/>
			</fo:block>
		</fo:block>
		
		
		
		<!-- Bygningsomgivelser -->
        <fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				BYGNINGSOMGIVELSER
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Indre forhold: <xsl:value-of select="$indre_forhold"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Ydre forhold: <xsl:value-of select="$ydre_forhold"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Notat om indre og ydre forhold: <xsl:value-of select="$notatomindreogydreforhold"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Omgivelser af særlig interesse: <xsl:value-of select="$omgivelser"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Notat om omgivelser: <xsl:value-of select="$notatomomgivelser"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Bebyggelsesmiljø: <xsl:value-of select="$bebyggelsesmiljo"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Notat om bygningsmiljø: <xsl:value-of select="$notatombygningsmiljo"/>.
			</fo:block>
		</fo:block>
		
		
		
		<!-- SAVE-vurdering -->
        <fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				SAVE-VURDERING
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Arkitektonisk værdi: <xsl:value-of select="$arkitektoniskvaerdi"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Arkitektonisk: <xsl:value-of select="$arkitektonisk"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Kulturhistorisk værdi: <xsl:value-of select="$kulturhistoriskvaerdi"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Kulturhistorisk: <xsl:value-of select="$kulturhistorisk"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Miljømæssig værdi: <xsl:value-of select="$miljomaessigvaerdi"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Miljømæssig: <xsl:value-of select="$miljomaessig"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Originalitetsværdi: <xsl:value-of select="$originalitetsvaerdi"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Originalitet: <xsl:value-of select="$originalitets"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Tilstandsværdi: <xsl:value-of select="$tilstandsvaerdi"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Tilstand: <xsl:value-of select="$tilstand"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Bevaringsmæssig værdi: <xsl:value-of select="$bevaringsmaessigvaerdi"/>.
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				Bevaringsmæssig: <xsl:value-of select="$bevaringsmaessig"/>.
			</fo:block>
		</fo:block>
		
		
		
		<!-- Foto 
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Adresse: <xsl:value-of select="$adresse"/>.
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Adresse: <xsl:value-of select="$adresse"/>.
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Adresse: <xsl:value-of select="$adresse"/>.
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Adresse: <xsl:value-of select="$adresse"/>.
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Adresse: <xsl:value-of select="$adresse"/>.
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Adresse: <xsl:value-of select="$adresse"/>.
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Adresse: <xsl:value-of select="$adresse"/>.
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Adresse: <xsl:value-of select="$adresse"/>.
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Adresse: <xsl:value-of select="$adresse"/>.
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Adresse: <xsl:value-of select="$adresse"/>.
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Adresse: <xsl:value-of select="$adresse"/>.
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Adresse: <xsl:value-of select="$adresse"/>.
        </fo:block>
		-->
		
<!--       
	<xsl:choose>
		  <xsl:when test="$aktivitet = 'udstyr'">
	<fo:block>
			<xsl:attribute name="margin-top">3mm</xsl:attribute>
			Udstyr: <xsl:value-of select="$udstyr"/>
			</fo:block>			
			</xsl:when>
		 <xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose> -->


		<!-- KORT
		-->
		<fo:block page-break-before="always">
            <xsl:attribute name="margin-top">30mm</xsl:attribute>
            Bilag kort i 1:<xsl:value-of select="format-number(//row/col[@name='scale'], '#')"/>
		</fo:block>
		<fo:block>
		<fo:external-graphic height="150mm" width="190mm" content-height="150mm" content-width="190mm">
			<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/tmp/<xsl:value-of select="//row/col[@name='img']"/>')</xsl:attribute>
		</fo:external-graphic>
		</fo:block>
		
		<fo:block page-break-before="always">
			<xsl:choose>
				<xsl:when test="$foto1 != ''">
					<fo:block>
						<xsl:attribute name="margin-top">10mm</xsl:attribute>
						<fo:external-graphic height="150mm" width="190mm" content-height="150mm" content-width="190mm">
							<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="$foto1"/>')</xsl:attribute>
						</fo:external-graphic>
					</fo:block>			
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$foto1_tekst != ''">
					<fo:block>
						<xsl:attribute name="margin-top">3mm</xsl:attribute>
						Tekst (foto1): <xsl:value-of select="$foto1_tekst"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
		
		<fo:block page-break-before="always">
			<xsl:choose>
				<xsl:when test="$foto2 != ''">
					<fo:block>
						<xsl:attribute name="margin-top">10mm</xsl:attribute>
						<fo:external-graphic height="150mm" width="190mm" content-height="150mm" content-width="190mm">
							<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="$foto2"/>')</xsl:attribute>
						</fo:external-graphic>
					</fo:block>			
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$foto2_tekst != ''">
					<fo:block>
						<xsl:attribute name="margin-top">3mm</xsl:attribute>
						Tekst (foto2): <xsl:value-of select="$foto2_tekst"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>
         
		<fo:block page-break-before="always">
			<xsl:choose>
				<xsl:when test="$foto3 != ''">
					<fo:block>
						<xsl:attribute name="margin-top">10mm</xsl:attribute>
						<fo:external-graphic height="150mm" width="190mm" content-height="150mm" content-width="190mm">
							<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="$foto3"/>')</xsl:attribute>
						</fo:external-graphic>
					</fo:block>			
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$foto3_tekst != ''">
					<fo:block>
						<xsl:attribute name="margin-top">10mm</xsl:attribute>
						<xsl:attribute name="margin-top">3mm</xsl:attribute>
						Tekst (foto3): <xsl:value-of select="$foto3_tekst"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>

		<fo:block page-break-before="always">
			<xsl:choose>
				<xsl:when test="$foto4 != ''">
					<fo:block>
						<xsl:attribute name="margin-top">10mm</xsl:attribute>
						<fo:external-graphic height="150mm" width="190mm" content-height="150mm" content-width="190mm">
							<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="$foto4"/>')</xsl:attribute>
						</fo:external-graphic>
					</fo:block>			
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$foto4_tekst != ''">
					<fo:block>
						<xsl:attribute name="margin-top">10mm</xsl:attribute>
						<xsl:attribute name="margin-top">3mm</xsl:attribute>
						Tekst (foto4): <xsl:value-of select="$foto4_tekst"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>

		<fo:block page-break-before="always">
			<xsl:choose>
				<xsl:when test="$foto5 != ''">
					<fo:block>
						<xsl:attribute name="margin-top">10mm</xsl:attribute>
						<fo:external-graphic height="150mm" width="190mm" content-height="150mm" content-width="190mm">
							<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="$foto5"/>')</xsl:attribute>
						</fo:external-graphic>
					</fo:block>			
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$foto5_tekst != ''">
					<fo:block>
						<xsl:attribute name="margin-top">3mm</xsl:attribute>
						Tekst (foto5): <xsl:value-of select="$foto5_tekst"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>

		<fo:block page-break-before="always">
			<xsl:choose>
				<xsl:when test="$foto6 != ''">
					<fo:block>
						<xsl:attribute name="margin-top">10mm</xsl:attribute>
						<fo:external-graphic height="150mm" width="190mm" content-height="150mm" content-width="190mm">
							<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="$foto6"/>')</xsl:attribute>
						</fo:external-graphic>
					</fo:block>			
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$foto6_tekst != ''">
					<fo:block>
						<xsl:attribute name="margin-top">3mm</xsl:attribute>
						Tekst (foto6): <xsl:value-of select="$foto6_tekst"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</fo:block>

	</xsl:template>

    <xsl:template name="reportheader">
        <xsl:param name="date"/>
    <fo:table table-layout="fixed" break-before="page">
        <fo:table-column column-width="79%"/>
        <fo:table-column column-width="21%"/>
        <fo:table-body>
            <fo:table-row>
                <fo:table-cell 
                     height="25mm" border="none"  border-end-style="none" padding="1mm">
                    <fo:block text-align="left">
                   <fo:block text-align="left">
                       <fo:external-graphic height="4mm" width="45mm" 
                           content-height="4mm" content-width="45mm">
                           <xsl:attribute name="src">url('<xsl:value-of 
                               select="$logo2"/>')</xsl:attribute>
                       </fo:external-graphic>
                   </fo:block>
                    </fo:block>
                    <fo:block font-weight="bold" font-size="10pt">
                        <xsl:attribute  name="margin-top">24mm</xsl:attribute>
                        
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell 
                     height="50mm" border="none" border-start-style="none" padding="1mm">
                    <fo:block text-align="left">
                   <fo:block text-align="left">
                       <fo:external-graphic height="20mm" width="17mm" 
                           content-height="20mm" content-width="17mm">
                           <xsl:attribute name="src">url('<xsl:value-of 
                               select="$logo"/>')</xsl:attribute>
                       </fo:external-graphic>
                   </fo:block>
                    </fo:block>
                    <fo:block margin="1pt" font-weight="bold" font-size="8pt">
                        <xsl:attribute  name="margin-top">2mm</xsl:attribute>
                        Randers Kommune
                    </fo:block>
                    <fo:block margin="1pt" font-weight="bold" font-size="8pt">
                        <xsl:attribute  name="margin-top">0mm</xsl:attribute>
                        Miljø og Teknik
                    </fo:block>
                    <fo:block margin="1pt" font-weight="bold" font-size="8pt">
                        <xsl:attribute  name="margin-top">0mm</xsl:attribute>
                        Laksetorvet 1
                    </fo:block>
                    <fo:block margin="1pt" font-weight="bold" font-size="8pt">
                        <xsl:attribute  name="margin-top">0mm</xsl:attribute>
                        8900 Randers C
                    </fo:block>
                    <fo:block margin="1pt" font-weight="bold" font-size="8pt">
                        <xsl:attribute  name="margin-top">4mm</xsl:attribute>
                        Telefon +45 8915 1515
                    </fo:block>
                    <fo:block margin="1pt" font-weight="bold" font-size="8pt">
                        <xsl:attribute  name="margin-top">4mm</xsl:attribute>
                        www.randers.dk
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </fo:table-body>
    </fo:table>
    <fo:block margin="1pt" font-size="12pt"><xsl:value-of select="$date"/></fo:block>

  </xsl:template>

    <xsl:template name="report-page-footer">
      <xsl:param name="guid" select="''"/>
        <fo:table width="100%">
            <fo:table-column/>
            <fo:table-column/>
            <fo:table-column/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell margin="3mm" width="10%">
                    </fo:table-cell>
                    <fo:table-cell margin="3mm" width="90%" 
                        xsl:use-attribute-sets="footer-cell">
                        <fo:block text-align="right">Ref: <xsl:value-of select="$guid"/></fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
</xsl:stylesheet>
