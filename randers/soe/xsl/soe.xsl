<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output encoding="ISO-8859-1"/> 

  <xsl:param name="sessionid"/>
  <xsl:param name="guid"><xsl:value-of select="$sessionid"></xsl:value-of> </xsl:param>
  <xsl:param name="logo">[module:formular.dir]/images/byvaaben.jpg</xsl:param>
  <xsl:param name="rklogo">[module:formular-randers.dir]/images/RKlogo.png</xsl:param>
  <xsl:param name="vibeke_signatur">[module:formular-randers.dir]/images/vibeke_signatur.png</xsl:param>
  
  <xsl:param name="dagsdato"></xsl:param>
  <xsl:param name="journalnr"></xsl:param>

  <!-- INDSAET EKSTRA URLPARAM HER (SOM DU PLEJER) -->
  <xsl:param name="address">IKKE ANGIVET</xsl:param>
  <xsl:param name="areal">0</xsl:param>
  <xsl:param name="konflikttekst1">Ejerinformationer: Ingen</xsl:param>
  <xsl:param name="konflikttekst2">Ejendomsinformationer: Ingen</xsl:param>
  <xsl:param name="hvad">IKKE ANGIVET</xsl:param>
  <xsl:param name="udnyttelse">IKKE ANGIVET</xsl:param>
  <xsl:param name="draenet">IKKE ANGIVET</xsl:param>
  
  <xsl:param name="email">IKKE ANGIVET</xsl:param>
  <xsl:param name="tlf">IKKE ANGIVET</xsl:param>
  <xsl:param name="begrundelse">IKKE ANGIVET</xsl:param>
  <xsl:param name="navn">IKKE ANGIVET</xsl:param>
  <xsl:param name="navn1"></xsl:param>
  
  <xsl:decimal-format decimal-separator = "," grouping-separator = "." NaN=" "/> 
    
  <xsl:attribute-set name="fixed-cell">
    <xsl:attribute name="overflow">hidden</xsl:attribute>
    <xsl:attribute name="wrap-option">no-wrap</xsl:attribute>
    <xsl:attribute name="padding-end">3pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="thisfont">
    <xsl:attribute name="font-family">Calibri</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
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
    <xsl:attribute name="wrap-option">nowrap</xsl:attribute>
    <xsl:attribute name="font-size">8pt</xsl:attribute>
  </xsl:attribute-set>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="all" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="1cm" margin-left="1.0cm" margin-right="1.0cm">
                    <fo:region-before extent="5mm" overflow="hidden"/>
                    <fo:region-body margin-top="5mm" margin-bottom="5mm"/>
                    <fo:region-after extent="5mm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="all" xsl:use-attribute-sets="thisfont">
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
        <!-- FOERSTE/OEVERSTE SEKTION - INDEHOLDER BYVAABEN OG 'RANDERS KOMMUNE' SOM BILLEDFIL -->
		<xsl:call-template name="reportheader">
        </xsl:call-template>
		<fo:table table-layout="fixed" >
        <fo:table-column column-width="80%"/>
        <fo:table-column column-width="20%"/>
        <!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
		<fo:table-body>
            <fo:table-row>
				<fo:table-cell> 
					<fo:block>
						<!-- <xsl:value-of select="$dagsdato"/> <xsl:value-of select="$journalnr"/> -->
						INDSENDES TIL
						
					</fo:block>
				</fo:table-cell>
				<fo:table-cell number-rows-spanned="6"> 
					<fo:block font-size="8pt">
						Miljø og Teknik
					</fo:block>					
					<fo:block font-size="8pt">
						 Natur og Miljø
					</fo:block>					
					<fo:block font-size="8pt">
						Laksetorvet
					</fo:block>					
					<fo:block font-size="8pt">
						DK-8900 Randers C
					</fo:block>					
					<fo:block font-size="8pt">
						<xsl:attribute name="margin-top">3mm</xsl:attribute>
					</fo:block>					
					<fo:block font-size="8pt">
						Direkte +45 8915 1515
					</fo:block>					
					<fo:block font-size="8pt">
						Telefax +45 8915 1660
					</fo:block>					
					<fo:block font-size="8pt">
						<xsl:attribute name="margin-top">3mm</xsl:attribute>
					</fo:block>					
					<fo:block font-size="8pt">
						miljoe@randers.dk
					</fo:block>					
					<fo:block font-size="8pt">
						www.randers.dk
					</fo:block>					
				</fo:table-cell>				
			</fo:table-row>
			<!-- DENNE DEL INDEHOLDER 'INDSENDES TIL' INFORMATIONERNE -->
            <fo:table-row>
				<fo:table-cell> 
					<fo:block>
						<xsl:attribute name="margin-top">3mm</xsl:attribute>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell> 
					<fo:block >
						<!-- bevidst tom -->
					</fo:block>
				</fo:table-cell>				
			</fo:table-row>

            <fo:table-row>
				<fo:table-cell> 
					<fo:block>
						Randers Kommune
					</fo:block>
				</fo:table-cell>
				<fo:table-cell> 
					<fo:block >
						<!-- bevidst tom -->
					</fo:block>
				</fo:table-cell>				
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell> 
					<fo:block>
						Miljø og Teknik
					</fo:block>
				</fo:table-cell>
				<fo:table-cell> 
					<fo:block >
						<!-- bevidst tom -->
					</fo:block>
				</fo:table-cell>				
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell> 
					<fo:block>
						Laksetorvet
					</fo:block>
				</fo:table-cell>
				<fo:table-cell> 
					<fo:block >
						<!-- bevidst tom -->
					</fo:block>
				</fo:table-cell>				
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell> 
					<fo:block>
						8900 Randers C
					</fo:block>
				</fo:table-cell>
				<fo:table-cell> 
					<fo:block >
						<!-- bevidst tom -->
					</fo:block>
				</fo:table-cell>				
			</fo:table-row>
		</fo:table-body>
	</fo:table>
	<!-- HER KOMMER DAGS DATO OG JOURNALNR (KRAEVER JAVASCRIPT OG SPECIEL PAGE OPSAETNING - SE BLA. SLAM FORMULAREN SOM EKSEMPEL)  -->
	<fo:block>
		<xsl:attribute name="margin-top">3mm</xsl:attribute>
		<xsl:value-of select="$dagsdato"/><xsl:text>  </xsl:text><xsl:value-of select="$journalnr"/>
	</fo:block>
	<!-- OVERSKRIFT SVARENDE TIL HEADER SEKTIONEN I FORMULAR FILEN -->
	<fo:block font-size="14pt" >
		<xsl:attribute name="margin-top">3mm</xsl:attribute>
		<fo:inline font-weight="bold">Ansøgning om <xsl:value-of select="$hvad"/></fo:inline>
	</fo:block>
	<!-- HEREFTER KOMMER DE VANLIGE INFORMATIONER FRA FORMULAREN - FOERSTE SAET DATA HAR EN 'MARGIN-TOP' PAA 3MM - RESTEN 2MM -->
	<fo:block>
		<xsl:attribute name="margin-top">3mm</xsl:attribute>
		Adresse: <xsl:value-of select="$address"/> 
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Areal.: <xsl:value-of select="$areal"/> m2
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
	<xsl:value-of select="$konflikttekst1"/> 
	</fo:block>  
		<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
	<xsl:value-of select="$konflikttekst2"/> 
	</fo:block>  

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Hvad søges der om: <xsl:value-of select="$hvad"/> 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
            Det ansøgte areal udgør: <xsl:value-of select="$areal"/> m2 og benyttes i dag til <xsl:value-of select="$udnyttelse"/>
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Drænet: <xsl:value-of select="$draenet"/> 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Ansøger navn: <xsl:value-of select="$navn"/> 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		E-mail: <xsl:value-of select="$email"/> 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		TLF: <xsl:value-of select="$tlf"/> 
	</fo:block>  
	<xsl:choose>
		<xsl:when test="$navn1 != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Ejer: <xsl:value-of select="$navn1"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Begrundelse for ansøgningen: <xsl:value-of select="$begrundelse"/> 
	</fo:block>  


	<fo:block page-break-before="always">
			<xsl:attribute name="margin-top">30mm</xsl:attribute>
			Bilag kort i 1:<xsl:value-of select="format-number(//row/col[@name='scale'], '#')"/>
		</fo:block>
		<fo:block>
		<fo:external-graphic height="150mm" width="190mm" content-height="150mm" content-width="190mm">
			<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/tmp/<xsl:value-of select="//row/col[@name='img']"/>')</xsl:attribute>
		</fo:external-graphic>
	</fo:block>
					<fo:block>
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
						Med venlig hilsen
					</fo:block>  
					<fo:block>
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
						Randers Kommune
					</fo:block>  

					
<!-- 					<fo:block>  
                       <fo:external-graphic height="50mm" width="44mm" 
                           content-height="50mm" content-width="44mm">
                           <xsl:attribute name="src">url('<xsl:value-of 
                               select="$vibeke_signatur"/>')</xsl:attribute>
                       </fo:external-graphic>
					</fo:block>  -->
  </xsl:template>
	<!-- SOM UDGANGSPUNKT - NIX PILLE HERUNDER -->
    <xsl:template name="reportheader">
        <fo:table table-layout="fixed" break-before="page">
        <fo:table-column column-width="80%"/>
        <fo:table-column column-width="20%"/>
        <fo:table-body>
            <fo:table-row>
				<!-- INDSAETTER 'RANDERS KOMMUNE' -->
                <fo:table-cell height="30mm" border-end-style="none" padding="1mm">
                    <fo:block>
                       <fo:external-graphic height="30mm" width="50mm" 
                           content-height="30mm" content-width="50mm">
                           <xsl:attribute name="src">url('<xsl:value-of 
                               select="$rklogo"/>')</xsl:attribute>
                       </fo:external-graphic>
                    </fo:block>
                </fo:table-cell>
				<!-- INDSAETTER BYVAABEN -->
                <fo:table-cell height="25mm" border-start-style="none" padding="1mm">
                   <fo:block text-align="start">
                       <fo:external-graphic height="25mm" width="22mm" 
                           content-height="25mm" content-width="22mm">
                           <xsl:attribute name="src">url('<xsl:value-of 
                               select="$logo"/>')</xsl:attribute>
                       </fo:external-graphic>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </fo:table-body>
    </fo:table>
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
                    <fo:table-cell margin="3mm" width="90%">
                        <fo:block text-align="right">Ref: <xsl:value-of select="$guid"/></fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
</xsl:stylesheet>
