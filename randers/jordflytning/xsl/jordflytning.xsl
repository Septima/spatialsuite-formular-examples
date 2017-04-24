<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output encoding="ISO-8859-1"/> 

  <xsl:param name="sessionid"/>
  <xsl:param name="guid"><xsl:value-of select="$sessionid"></xsl:value-of> </xsl:param>
  <xsl:param name="logo">[module:formular.dir]/images/byvaaben.jpg</xsl:param>
  <xsl:param name="rklogo">[module:formular-randers.dir]/images/RKlogo.png</xsl:param>
  
  <xsl:param name="dagsdato"></xsl:param>
  <xsl:param name="journalnr"></xsl:param>

  <!-- INDSAET EKSTRA URLPARAM HER (SOM DU PLEJER) -->
  <xsl:param name="konflikttekst1"></xsl:param>
  <xsl:param name="konflikttekst2"></xsl:param>
  <xsl:param name="konflikttekst3"></xsl:param>
  <xsl:param name="konflikttekst4"></xsl:param>
  <xsl:param name="konflikttekst5"></xsl:param>
  <xsl:param name="konflikttekst6"></xsl:param>
  <xsl:param name="konflikttekst7"></xsl:param>
  
  <xsl:param name="fyldjord"></xsl:param>
  <xsl:param name="intaktjord"></xsl:param>
  <xsl:param name="byggeaffald"></xsl:param>
  <xsl:param name="organiskmateriale"></xsl:param>
  <xsl:param name="boreslam"></xsl:param>
  <xsl:param name="jordtype_andet"></xsl:param>
  <xsl:param name="jordtype_andet_txt"></xsl:param>

  <xsl:param name="akutflytning"></xsl:param>
  <xsl:param name="akutflytning_begrundelse"></xsl:param>
  <xsl:param name="godkendtplan"></xsl:param>
  <xsl:param name="fil_plan"></xsl:param>
  <xsl:param name="kategori"></xsl:param>
  
  <xsl:param name="kubikmeter"></xsl:param>
  <xsl:param name="ton"></xsl:param>
  <xsl:param name="formaal"></xsl:param>
  <xsl:param name="andet_formaal"></xsl:param>
  
  <xsl:param name="datostart"></xsl:param>
  <xsl:param name="datoslut"></xsl:param>

  <xsl:param name="anmeldcvr"></xsl:param>
  <xsl:param name="anmeldnavn"></xsl:param>
  <xsl:param name="anmeldadr"></xsl:param>
  <xsl:param name="anmeldtlf"></xsl:param>
  <xsl:param name="anmeldemail"></xsl:param>
  <xsl:param name="anmeldkontaktnavn"></xsl:param>
  <xsl:param name="anmeldkontakttlf"></xsl:param>
  
  <xsl:param name="anmeld_og_trans_ens"></xsl:param>
  
  <xsl:param name="transcvr"></xsl:param>
  <xsl:param name="transnavn"></xsl:param>
  <xsl:param name="transadr"></xsl:param>
  <xsl:param name="transtlf"></xsl:param>
  <xsl:param name="transemail"></xsl:param>
  <xsl:param name="transkontaktnavn"></xsl:param>
  <xsl:param name="transkontakttlf"></xsl:param>
  

  
  
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
        <fo:table-column column-width="79%"/>
        <fo:table-column column-width="21%"/>
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
						randers@randers.dk
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
		<fo:inline font-weight="bold">Jordflytning</fo:inline>
	</fo:block>
	<!-- HEREFTER KOMMER DE VANLIGE INFORMATIONER FRA FORMULAREN - FOERSTE SAET DATA HAR EN 'MARGIN-TOP' PAA 3MM - RESTEN 2MM -->
	
	<xsl:choose>
		<xsl:when test="$konflikttekst1 != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Det ansøgte vedrører følgende ejendom(e): <xsl:value-of select="$konflikttekst1"/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$konflikttekst2 != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Det ansøgte vedrører følgende ejer: <xsl:value-of select="$konflikttekst2"/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$konflikttekst3 != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Områdeklassifikation: <xsl:value-of select="$konflikttekst3"/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$konflikttekst4 != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Analysefri område: <xsl:value-of select="$konflikttekst4"/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$konflikttekst5 != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Kortlægning V1: <xsl:value-of select="$konflikttekst5"/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$konflikttekst6 != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Kortlægning V2: <xsl:value-of select="$konflikttekst6"/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$konflikttekst7 != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Kortlægningsnummer: <xsl:value-of select="$konflikttekst7"/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<fo:block font-size="12pt">
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Jordtyper
	</fo:block>

	<xsl:choose>
		<xsl:when test="$fyldjord != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				* Fyldjord
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$intaktjord != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				* Intakt jord
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$byggeaffald != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				* Indhold af byggeaffald
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$organiskmateriale != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				* Indhold af organisk materiale
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$boreslam != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				* Boreslam
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$jordtype_andet != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				* Andet: <xsl:value-of select="$jordtype_andet_txt"/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$akutflytning != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Akutflytning: <xsl:value-of select="$akutflytning_begrundelse"/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Kategori: <xsl:value-of select="$kategori"/>
	</fo:block>  
	<xsl:choose>
		<xsl:when test="$godkendtplan != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Godkendt jordhåndteringsplan (fil: <xsl:value-of select="$fil_plan"/>)
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		M3: <xsl:value-of select="$kubikmeter"/>
	</fo:block>  

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Ton: <xsl:value-of select="$ton"/>
	</fo:block>  
	
	<xsl:choose>
		<xsl:when test="$formaal != 'andet'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Formål: <xsl:value-of select="$formaal"/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Formål (andet): <xsl:value-of select="$andet_formaal"/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Start: <xsl:value-of select="$datostart"/>
	</fo:block>  

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Slut: <xsl:value-of select="$datoslut"/>
	</fo:block>  

	<fo:block font-size="12pt">
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Kontaktoplysninger - anmelder
	</fo:block>

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		CVR: <xsl:value-of select="$anmeldcvr"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Navn: <xsl:value-of select="$anmeldnavn"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Adresse: <xsl:value-of select="$anmeldadr"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Telefon: <xsl:value-of select="$anmeldtlf"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Email: <xsl:value-of select="$anmeldemail"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Kontakt: <xsl:value-of select="$anmeldkontaktnavn"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Kontakttelefon: <xsl:value-of select="$anmeldkontakttlf"/>
	</fo:block>
	
	<xsl:choose>
		<xsl:when test="$anmeld_og_trans_ens != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Anmelder og transportør er ens
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block font-size="12pt">
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Kontaktoplysninger - transportør
			</fo:block>

			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				CVR: <xsl:value-of select="$transcvr"/>
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Navn: <xsl:value-of select="$transnavn"/>
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Adresse: <xsl:value-of select="$transadr"/>
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Telefon: <xsl:value-of select="$transtlf"/>
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Email: <xsl:value-of select="$transemail"/>
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Kontakt: <xsl:value-of select="$transkontaktnavn"/>
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Kontakttelefon: <xsl:value-of select="$transkontakttlf"/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
	
	<fo:block page-break-before="always">
			<xsl:attribute name="margin-top">30mm</xsl:attribute>
			Bilag kort i 1:<xsl:value-of select="format-number(//row/col[@name='scale'], '#')"/>
		</fo:block>
		<fo:block>
		<fo:external-graphic height="150mm" width="190mm" content-height="150mm" content-width="190mm">
			<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/tmp/<xsl:value-of select="//row/col[@name='img']"/>')</xsl:attribute>
		</fo:external-graphic>
	</fo:block>
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
