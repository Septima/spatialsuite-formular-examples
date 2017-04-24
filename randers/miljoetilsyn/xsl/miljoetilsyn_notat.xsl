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
  <xsl:param name="sbsys_brugerid"></xsl:param>
<!--
  <xsl:param name="journalnr"></xsl:param>
  <xsl:param name="sagsbehandler_mail">miljoe@randers.dk</xsl:param>
  <xsl:param name="sagsbehandler_tlf">89151515</xsl:param>
  <xsl:param name="cvr_nummer"></xsl:param>
  <xsl:param name="p_nummer"></xsl:param>
  <xsl:param name="virksomhed"></xsl:param>
  <xsl:param name="virksomhed_adresse"></xsl:param>
  <xsl:param name="virksomhed_postnr_by"></xsl:param>
  <xsl:param name="virksomhed_tlf"></xsl:param>
-->

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
						<!-- bevidst tom -->
						
					</fo:block>
				</fo:table-cell>
				<fo:table-cell number-rows-spanned="6"> 
					<fo:block font-size="8pt">
						Miljø og Teknik
					</fo:block>					
					<fo:block font-size="8pt">
						Miljø
					</fo:block>					
					<fo:block font-size="8pt">
						Laksetorvet 1
					</fo:block>					
					<fo:block font-size="8pt">
						DK-8900 Randers C
					</fo:block>					
					<fo:block font-size="8pt">
						<xsl:attribute name="margin-top">3mm</xsl:attribute>
					</fo:block>					
					<fo:block font-size="8pt">
						Telefon +45 8915 1515
					</fo:block>					
					<fo:block font-size="8pt">
						Direkte <xsl:value-of select="//row/col[@name='sagsbehandler_tlf']"/>
					</fo:block>					
					<fo:block font-size="8pt">
						<xsl:attribute name="margin-top">3mm</xsl:attribute>
					</fo:block>					
					<fo:block font-size="8pt">
						<xsl:value-of select="//row/col[@name='sagsbehandler_mail']"/>
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
						<xsl:value-of select="//row/col[@name='virksomhed']"/>
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
						<xsl:value-of select="//row/col[@name='virksomhed_adresse']"/>
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
						<xsl:value-of select="//row/col[@name='virksomhed_postnr_by']"/>
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
						<!-- bevidst tom -->
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
		D. <xsl:value-of select="$dagsdato"/> / <xsl:value-of select="//row/col[@name='journalnr']"/>
	</fo:block>

	<!-- OVERSKRIFT SVARENDE TIL HEADER SEKTIONEN I FORMULAR FILEN -->
	<fo:block font-size="14pt" >
		<xsl:attribute name="margin-top">15mm</xsl:attribute>
		<fo:inline font-weight="bold">BAGGRUNDSDATA TIL TILSYNSNOTAT</fo:inline>
	</fo:block>
	<!-- HEREFTER KOMMER DE VANLIGE INFORMATIONER FRA FORMULAREN - FOERSTE SAET DATA HAR EN 'MARGIN-TOP' PAA 3MM - RESTEN 2MM -->
	<fo:block font-size="12pt" >
		<xsl:attribute name="margin-top">5mm</xsl:attribute>
		<fo:inline font-weight="bold">INDRETNING OG DRIFT</fo:inline>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">5mm</xsl:attribute>
		<fo:inline font-weight="bold">Kort beskrivelse og af virksomhedens produktion.</fo:inline>
	</fo:block>

	<xsl:choose>
		<xsl:when test="//row/col[@name='virksomhedstype'] = 'Autovirksomheder'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Virksomheden er en autovirksomhed, der beskæftiger sig med følgende:
			</fo:block>
		</xsl:when>
		<xsl:when test="//row/col[@name='virksomhedstype'] = 'Bilag 1 Listevirksomheder' or //row/col[@name='virksomhedstype'] = 'Bilag 2 Listevirksomheder'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Virksomheden er en listevirksomhed, der anvender følgende produktionsprocesser:
			</fo:block>
		</xsl:when>
		<xsl:when test="//row/col[@name='virksomhedstype'] = 'Bilag 1 Brugerbetalingsbekendtgørelse'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Virksomheden er omfattet af brugerbetalingsbekendtgørelsens bilag 1.
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Virksomheden tilhører typen: <xsl:value-of select="//row/col[@name='virksomhedstype']"/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='mekanisk_reparation'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Mekanisk reparation
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='pladearbejde'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Pladearbejde
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='serviceeftersyn'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Serviceeftersyn
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='klargoering'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Klargøring til syn
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='koeb_salg_biler'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Køb og salg af biler
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='lakering'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Lakering
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='undervognsbehandling'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Undervognsbehandling
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='montage'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Montage
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='valsning'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Valsning
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='bukning'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Bukning
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='tig_svejsening'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- TIG-svejsening
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='mig_mag_svejsning'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- MIG-MAG-svejsning
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='opskaering'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Opskæring
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='spaandtagning'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Spåndtagning
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='bemaerkning_andre_virksomheder'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='bemaerkning_andre_virksomheder']"/>
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		

	
	
	<xsl:choose>
		<xsl:when test="//row/col[@name='antal_ansatte'] = 1">
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				<fo:inline font-weight="bold">Antal ansatte</fo:inline>
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Der er i produktionen beskæftiget <xsl:value-of select="//row/col[@name='antal_ansatte']"/> person.
			</fo:block>
		</xsl:when>
		<xsl:when test="//row/col[@name='antal_ansatte'] &gt; 1">
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				<fo:inline font-weight="bold">Antal ansatte</fo:inline>
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Der er i produktionen beskæftiget <xsl:value-of select="//row/col[@name='antal_ansatte']"/> personer.
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		

	<xsl:choose>
		<xsl:when test="//row/col[@name='driftstid'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				<fo:inline font-weight="bold">Driftstid</fo:inline>
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='driftstid']"/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		

	<xsl:choose>
		<xsl:when test="//row/col[@name='produktionsforhold'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				<fo:inline font-weight="bold">Produktionsforhold</fo:inline>
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='produktionsforhold']"/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	
	<fo:block>
		<xsl:attribute name="margin-top">15mm</xsl:attribute>
		<fo:inline font-weight="bold">OVERSIGT MILJØFORHOLD</fo:inline>
	</fo:block>
	<fo:table table-layout="fixed" >
        <fo:table-column column-width="30%"/>
		<fo:table-column column-width="64%"/>
        <fo:table-column column-width="6%"/>
        <!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
		<fo:table-body>
            <fo:table-row>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block font-weight="bold">
						Støj og viberationer
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						Foregår der støjende aktiviteter?
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						<xsl:value-of select="//row/col[@name='stoej_viberationer']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
		<fo:table-body>
            <fo:table-row>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block font-weight="bold">
						Luftemission
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						Forekommer der udledninger til luften fra virksomheden?
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						<xsl:value-of select="//row/col[@name='luftemission']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
		<fo:table-body>
            <fo:table-row>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block font-weight="bold">
						Spildevand
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						Afledes der andet spildevand end sanitært spildevand fra virksomheden?
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						<xsl:value-of select="//row/col[@name='spildevand']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
		<fo:table-body>
            <fo:table-row>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block font-weight="bold">
						Råvarer og oplagerede materialer
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						Er der oplag af olie og kemikalier på virksomheden?
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						<xsl:value-of select="//row/col[@name='raavarer_oplag']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
		<fo:table-body>
            <fo:table-row>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block font-weight="bold">
						Tanke
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						Er der nedgravede eller fritstående tanke?
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						<xsl:value-of select="//row/col[@name='tanke']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
		<fo:table-body>
            <fo:table-row>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block font-weight="bold">
						Affald
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						Er der andet affald end alm. dagrenovation/ brændbart affald?
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						<xsl:value-of select="//row/col[@name='affald']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
		<fo:table-body>
            <fo:table-row>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block font-weight="bold">
						Andre miljøforhold
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						Lugt eller andet af miljømæssig betydning?
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
					<fo:block>
						<xsl:value-of select="//row/col[@name='andre_miljoeforhold']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>

	<xsl:choose>
		<xsl:when test="//row/col[@name='stoej_viberationer'] != 'Nej'">
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				<fo:inline font-weight="bold">STØJ OG VIBRATIONER</fo:inline>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='stoej_viberationer_tekst1'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				- Randers Kommune har ikke siden sidste tilsyn modtaget klager over støj fra virksomheden.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='stoej_viberationer_tekst2'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				- Driften vurderes ikke, at medføre væsentlige støjgener, der overstiger de vejledende støjgrænseværdier, der gælder for området.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='stoej_viberationer_tekst3'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				- Virksomheden påvirker ikke sine omgivelser med uacceptable vibrationer.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='stoej_viberationer_bemaerkning'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='stoej_viberationer_bemaerkning']"/>
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='stoej_viberationer_foto'] != '' ">
			<fo:block >
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				<fo:external-graphic height="98mm" width="130mm" content-height="98mm" content-width="130mm">
					<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="//row/col[@name='stoej_viberationer_foto']"/>')</xsl:attribute>
				</fo:external-graphic>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		

	<xsl:choose>
		<xsl:when test="//row/col[@name='luftemission'] != 'Nej'">
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				<fo:inline font-weight="bold">LUFTEMISSION</fo:inline>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:if test="//row/col[@name='luftafkast1_proces'] != '' or //row/col[@name='luftafkast1_rensning'] != '' or //row/col[@name='luftafkast1_hoejde'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="25%"/>
			<fo:table-column column-width="35%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell background-color="rgb(200,200,200)" border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block font-weight="bold">
							Proces
						</fo:block>
					</fo:table-cell>
					<fo:table-cell background-color="rgb(200,200,200)" border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block font-weight="bold">
							Rensning
						</fo:block>
					</fo:table-cell>
					<fo:table-cell background-color="rgb(200,200,200)" border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block font-weight="bold">
							Højde over tag
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast1_proces']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast1_rensning']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast1_hoejde']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>
	<xsl:if test="//row/col[@name='luftafkast2_proces'] != '' or //row/col[@name='luftafkast2_rensning'] != '' or //row/col[@name='luftafkast2_hoejde'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="25%"/>
			<fo:table-column column-width="35%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast2_proces']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast2_rensning']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast2_hoejde']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>
	<xsl:if test="//row/col[@name='luftafkast3_proces'] != '' or //row/col[@name='luftafkast3_rensning'] != '' or //row/col[@name='luftafkast3_hoejde'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="25%"/>
			<fo:table-column column-width="35%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast3_proces']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast3_rensning']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast3_hoejde']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>
	<xsl:if test="//row/col[@name='luftafkast4_proces'] != '' or //row/col[@name='luftafkast4rensning'] != '' or //row/col[@name='luftafkast4_hoejde'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="25%"/>
			<fo:table-column column-width="35%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast4_proces']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast4_rensning']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast4_hoejde']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>
	<xsl:if test="//row/col[@name='luftafkast5_proces'] != '' or //row/col[@name='luftafkast5_rensning'] != '' or //row/col[@name='luftafkast5_hoejde'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="25%"/>
			<fo:table-column column-width="35%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast5_proces']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast5_rensning']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast5_hoejde']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>
	<xsl:if test="//row/col[@name='luftafkast6_proces'] != '' or //row/col[@name='luftafkast6_rensning'] != '' or //row/col[@name='luftafkast6_hoejde'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="25%"/>
			<fo:table-column column-width="35%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast6_proces']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast6_rensning']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast6_hoejde']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>
	<xsl:if test="//row/col[@name='luftafkast7_proces'] != '' or //row/col[@name='luftafkast7_rensning'] != '' or //row/col[@name='luftafkast7_hoejde'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="25%"/>
			<fo:table-column column-width="35%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast7_proces']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast7_rensning']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast7_hoejde']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>
	<xsl:if test="//row/col[@name='luftafkast8_proces'] != '' or //row/col[@name='luftafkast8_rensning'] != '' or //row/col[@name='luftafkast8_hoejde'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="25%"/>
			<fo:table-column column-width="35%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast8_proces']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast8_rensning']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast8_hoejde']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>
	<xsl:if test="//row/col[@name='luftafkast9_proces'] != '' or //row/col[@name='luftafkast9_rensning'] != '' or //row/col[@name='luftafkast9_hoejde'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="25%"/>
			<fo:table-column column-width="35%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast9_proces']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast9_rensning']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast9_hoejde']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>
	<xsl:if test="//row/col[@name='luftafkast10_proces'] != '' or //row/col[@name='luftafkast10_rensning'] != '' or //row/col[@name='luftafkast10_hoejde'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="25%"/>
			<fo:table-column column-width="35%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast10_proces']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast10_rensning']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="3"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='luftafkast10_hoejde']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>

	<xsl:choose>
		<xsl:when test="//row/col[@name='luftemission_tekst1'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				- Randers Kommune har ikke siden sidste tilsyn ikke modtaget klager over luftemission fra virksomheden.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='luftemission_bemaerkning'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='luftemission_bemaerkning']"/>
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='luftemission_foto'] != '' ">
			<fo:block >
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				<fo:external-graphic height="98mm" width="130mm" content-height="98mm" content-width="130mm">
					<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="//row/col[@name='luftemission_foto']"/>')</xsl:attribute>
				</fo:external-graphic>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		

	<xsl:choose>
		<xsl:when test="//row/col[@name='spildevand'] != 'Nej'">
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				<fo:inline font-weight="bold">SPILDEVAND</fo:inline>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='spildevand_tekst1'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				- Virksomhedens spildevandstilladelse overholdes.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='spildevand_tekst2'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				- Virksomheden afleder udelukkende sanitært spildevand.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='spildevand_tekst3'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				- Virksomheden er tilsluttet Randers Kommunes ordning for kontrol af olie- og benzinudskillere.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='spildevand_bemaerkning'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='spildevand_bemaerkning']"/>
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='spildevand_foto'] != '' ">
			<fo:block >
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				<fo:external-graphic height="98mm" width="130mm" content-height="98mm" content-width="130mm">
					<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="//row/col[@name='spildevand_foto']"/>')</xsl:attribute>
				</fo:external-graphic>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		

	<xsl:choose>
		<xsl:when test="//row/col[@name='raavarer_oplag'] != 'Nej'">
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				<fo:inline font-weight="bold">RÅVARER OG OPLAGEREDE MATERIALER</fo:inline>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='raavarer_oplag_tekst1'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				- Råvarer og materialer opbevares overvejede indendørs.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='raavarer_oplag_bemaerkning'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='raavarer_oplag_bemaerkning']"/>
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='raavarer_oplag_foto'] != '' ">
			<fo:block >
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				<fo:external-graphic height="98mm" width="130mm" content-height="98mm" content-width="130mm">
					<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="//row/col[@name='raavarer_oplag_foto']"/>')</xsl:attribute>
				</fo:external-graphic>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		

	<xsl:if test="//row/col[@name='tanke'] != 'Nej'">
		<fo:block>
			<xsl:attribute name="margin-top">10mm</xsl:attribute>
			<fo:inline font-weight="bold">TANKE</fo:inline>
		</fo:block>
	</xsl:if>
	<xsl:if test="//row/col[@name='tank1_aarstal'] != 0 or //row/col[@name='tank1_placering'] != '' or //row/col[@name='tank1_indhold'] != '' or //row/col[@name='tank1_stoerrelse'] != 0 or //row/col[@name='tank1_fabrikationsnr'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="10%"/>
			<fo:table-column column-width="23%"/>
			<fo:table-column column-width="12%"/>
			<fo:table-column column-width="15%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell background-color="rgb(200,200,200)" border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block font-weight="bold">
							Årstal
						</fo:block>
					</fo:table-cell>
					<fo:table-cell background-color="rgb(200,200,200)" border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block font-weight="bold">
							Placering
						</fo:block>
					</fo:table-cell>
					<fo:table-cell background-color="rgb(200,200,200)" border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block font-weight="bold">
							Indhold
						</fo:block>
					</fo:table-cell>
					<fo:table-cell background-color="rgb(200,200,200)" border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block font-weight="bold">
							Størrelse
						</fo:block>
					</fo:table-cell>
					<fo:table-cell background-color="rgb(200,200,200)" border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block font-weight="bold">
							Fabrikationsnr.
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank1_aarstal']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank1_placering']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank1_indhold']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank1_stoerrelse']"/> liter
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank1_fabrikationsnr']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>
	<xsl:if test="//row/col[@name='tank2_aarstal'] != 0 or //row/col[@name='tank2_placering'] != '' or //row/col[@name='tank2_indhold'] != '' or //row/col[@name='tank2_stoerrelse'] != 0 or //row/col[@name='tank2_fabrikationsnr'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="10%"/>
			<fo:table-column column-width="23%"/>
			<fo:table-column column-width="12%"/>
			<fo:table-column column-width="15%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank2_aarstal']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank2_placering']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank2_indhold']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank2_stoerrelse']"/> liter
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank2_fabrikationsnr']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>
	<xsl:if test="//row/col[@name='tank3_aarstal'] != 0 or //row/col[@name='tank3_placering'] != '' or //row/col[@name='tank3_indhold'] != '' or //row/col[@name='tank3_stoerrelse'] != 0 or //row/col[@name='tank3_fabrikationsnr'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="10%"/>
			<fo:table-column column-width="23%"/>
			<fo:table-column column-width="12%"/>
			<fo:table-column column-width="15%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank3_aarstal']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank3_placering']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank3_indhold']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank3_stoerrelse']"/> liter
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank3_fabrikationsnr']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>
	<xsl:if test="//row/col[@name='tank4_aarstal'] != 0 or //row/col[@name='tank4_placering'] != '' or //row/col[@name='tank4_indhold'] != '' or //row/col[@name='tank4_stoerrelse'] != 0 or //row/col[@name='tank4_fabrikationsnr'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="10%"/>
			<fo:table-column column-width="23%"/>
			<fo:table-column column-width="12%"/>
			<fo:table-column column-width="15%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank4_aarstal']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank4_placering']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank4_indhold']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank4_stoerrelse']"/> liter
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank4_fabrikationsnr']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>
	<xsl:if test="//row/col[@name='tank5_aarstal'] != 0 or //row/col[@name='tank5_placering'] != '' or //row/col[@name='tank5_indhold'] != '' or //row/col[@name='tank5_stoerrelse'] != 0 or //row/col[@name='tank5_fabrikationsnr'] != ''">
		<fo:table table-layout="fixed" >
			<fo:table-column column-width="10%"/>
			<fo:table-column column-width="23%"/>
			<fo:table-column column-width="12%"/>
			<fo:table-column column-width="15%"/>
			<fo:table-column column-width="40%"/>
			<!-- NAESTE SEKTION - INDEHOLDER 'INDSENDES TIL RANDERS KOMMUNE' MM I VENSTRE SIDE OG KONTAKTOPLYSNINGER (AFDELING,ADRESSE, MAIL, TLF MM.) I HOEJRE SIDE -->
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank5_aarstal']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank5_placering']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank5_indhold']"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank5_stoerrelse']"/> liter
						</fo:block>
					</fo:table-cell>
					<fo:table-cell border-color="black"  border-style="solid"  border-width="thin" padding="1mm" number-rows-spanned="5"> 
						<fo:block>
							<xsl:value-of select="//row/col[@name='tank5_fabrikationsnr']"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:if>

	<xsl:choose>
		<xsl:when test="//row/col[@name='tanke_bemaerkning'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">3mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='tanke_bemaerkning']"/>
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='tanke_foto'] != '' ">
			<fo:block >
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				<fo:external-graphic height="98mm" width="130mm" content-height="98mm" content-width="130mm">
					<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="//row/col[@name='tanke_foto']"/>')</xsl:attribute>
				</fo:external-graphic>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		

	<xsl:choose>
		<xsl:when test="//row/col[@name='affald'] != 'Nej'">
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				<fo:inline font-weight="bold">AFFALD</fo:inline>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_batterier'] != 'false' or //row/col[@name='affald_savsmuld'] != 'false' or //row/col[@name='affald_spildolie'] != 'false' or //row/col[@name='affald_blyakkumulatorer'] != 'false' or //row/col[@name='affald_koelervaeske'] != 'false' or //row/col[@name='affald_bremsevaeske'] != 'false' or //row/col[@name='affald_oliefiltre'] != 'false' or //row/col[@name='affald_bremsevaskevand'] != 'false' or //row/col[@name='affald_tomme_spraydaaser'] != 'false' or //row/col[@name='affald_lysstofroer'] != 'false' or //row/col[@name='farligt_affald_tekst1'] != 'false' or //row/col[@name='farligt_affald_tekst2'] != 'false' or //row/col[@name='farligt_affald_tekst3'] != 'false' or //row/col[@name='farligt_affald_tekst4'] != 'false' or //row/col[@name='farligt_affald_bemaerkning'] != '' or //row/col[@name='farligt_affald_foto'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Farligt affald:
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_batterier'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Alm. batterier
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_savsmuld'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Savsmuld (olieholdigt)
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_spildolie'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Spildolie
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_blyakkumulatorer'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Blyakkumulatorer
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_koelervaeske'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Kølervæske
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_bremsevaeske'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Bremsevæske
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_oliefiltre'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Oliefiltre
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_bremsevaskevand'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Alkalisk bremsevaskevand
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_tomme_spraydaaser'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Tomme spraydåser
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_lysstofroer'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Lysstofrør
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='farligt_affald_bemaerkning'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='farligt_affald_bemaerkning']"/>
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='farligt_affald_tekst1'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Opbevaringsforholdene for farligt affald er i overensstemmelse med forskrift for opbevaring af affald i Randers Kommuen.
				</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='farligt_affald_tekst2'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Affaldsbortskaffelsen af farligt affald er i overensstemmelse med regulativ for erhvervsaffald i Randers Kommuen.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='farligt_affald_tekst3'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Opbevaringsforholdene for farligt affald er IKKE i overensstemmelse med forskrift for opbevaring af affald i Randers Kommuen.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='farligt_affald_tekst4'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Affaldsbortskaffelsen af farligt affald er IKKE i overensstemmelse med regulativ for erhvervsaffald i Randers Kommuen.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='farligt_affald_foto'] != '' ">
			<fo:block >
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				<fo:external-graphic height="98mm" width="130mm" content-height="98mm" content-width="130mm">
					<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="//row/col[@name='farligt_affald_foto']"/>')</xsl:attribute>
				</fo:external-graphic>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		





	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_braendbart'] != 'false' or //row/col[@name='affald_dagrenovation'] != 'false' or //row/col[@name='affald_papir_pap'] != 'false' or //row/col[@name='affald_metal'] != 'false' or //row/col[@name='affald_daek'] != 'false' or //row/col[@name='affald_isolering'] != 'false' or //row/col[@name='affald_beton'] != 'false' or //row/col[@name='affald_tekst1'] != 'false' or //row/col[@name='affald_tekst2'] != 'false' or //row/col[@name='affald_tekst3'] != 'false' or //row/col[@name='affald_tekst4'] != 'false' or //row/col[@name='affald_bemaerkning'] != '' or //row/col[@name='affald_foto'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				Affald i øvrigt:
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_braendbart'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Brændbart affald
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_dagrenovation'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Dagrenovation
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_papir_pap'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Papir/pap
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_metal'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Metal
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_daek'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Dæk
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_isolering'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Isolering
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_beton'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				- Betonrester og betonslam fra bassiner
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_bemaerkning'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='affald_bemaerkning']"/>
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_tekst1'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Opbevaringsforholdene for affald er i overensstemmelse med forskrift for opbevaring af affald i Randers Kommuen.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_tekst2'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Affaldsbortskaffelsen er i overensstemmelse med regulativ for erhvervsaffald i Randers Kommuen.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_tekst3'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Opbevaringsforholdene for affald er IKKE i overensstemmelse med forskrift for opbevaring af affald i Randers Kommuen.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_tekst4'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Affaldsbortskaffelsen er IKKE i overensstemmelse med regulativ for erhvervsaffald i Randers Kommuen.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='affald_foto'] != '' ">
			<fo:block >
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				<fo:external-graphic height="98mm" width="130mm" content-height="98mm" content-width="130mm">
					<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="//row/col[@name='affald_foto']"/>')</xsl:attribute>
				</fo:external-graphic>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		

	<xsl:choose>
		<xsl:when test="//row/col[@name='andre_miljoeforhold'] != 'Nej'">
			<fo:block>
				<xsl:attribute name="margin-top">10mm</xsl:attribute>
				<fo:inline font-weight="bold">ANDRE MILJØFORHOLD</fo:inline>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='andre_miljoeforhold_bem'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='andre_miljoeforhold_bem']"/>
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='andre_miljoeforhold_foto'] != '' ">
			<fo:block >
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				<fo:external-graphic height="98mm" width="130mm" content-height="98mm" content-width="130mm">
					<xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/formular/upload/<xsl:value-of select="//row/col[@name='andre_miljoeforhold_foto']"/>')</xsl:attribute>
				</fo:external-graphic>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		

	<fo:block>
		<xsl:attribute name="margin-top">10mm</xsl:attribute>
		<fo:inline font-weight="bold">OPVARMNING</fo:inline>
	</fo:block>
	<xsl:choose>
		<xsl:when test="//row/col[@name='opvarmningsmiddel'] != 'andet' ">
			<fo:block >
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Virksomheden opvarmes med <xsl:value-of select="//row/col[@name='opvarmningsmiddel']"/>.
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='opvarmningsmiddel_andet']"/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose> 		

	<fo:block>
		<xsl:attribute name="margin-top">10mm</xsl:attribute>
		<fo:inline font-weight="bold">REGULERINGSGRUNDLAG</fo:inline>
	</fo:block>
	<xsl:choose>
		<xsl:when test="//row/col[@name='dato_miljoegodkendelse'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Virksomhedens miljøgodkendelse af <xsl:value-of select="//row/col[@name='dato_miljoegodkendelse']"/>.
			</fo:block>			
		</xsl:when>
		<xsl:when test="//row/col[@name='reguleringsgrundlag_tekst7'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Virksomhedens miljøgodkendelse.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='dato_spildevandstilladelse'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Virksomhedens spildevandstilladelse af <xsl:value-of select="//row/col[@name='dato_spildevandstilladelse']"/>.
			</fo:block>			
		</xsl:when>
		<xsl:when test="//row/col[@name='reguleringsgrundlag_tekst8'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Virksomhedens spildevandstilladelse.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='reguleringsgrundlag_tekst1'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Virksomheden reguleres efter bekendtgørelse om miljøkrav i forbindelse med etablering og drift af autoværksteder m. v., bekendtgørelse nr. 1447 af 2. december 2015.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='reguleringsgrundlag_tekst2'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Virksomheden er omfattet af bilskrotbekendtgørelse nr. 1312 af 19. december 2012 om håndtering af affald i form af motordrevne køretøjer og affaldsfraktioner herfra.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='reguleringsgrundlag_tekst3'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Virksomheden er omfattet af Randers Kommunes Regulativ for erhvervsaffald.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='reguleringsgrundlag_tekst4'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Virksomheden er omfattet af bekendtgørelse nr. 1417 af 2. december 2015 om brugerbetaling for godkendelse og tilsyn efter lov om miljøbeskyttelse.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='reguleringsgrundlag_tekst5'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Virksomheden er omfattet af Miljøbeskyttelseslovens § 42, der giver lovmæssig hjemmel til påbud og forbud.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='reguleringsgrundlag_tekst6'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Virksomheden er omfattet af bekendtgørelse nr. 1611 af 10. december 2015 om indretning, etablering og drift af olietanke, rørsystemer og pipelines.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='reguleringsgrundlag_tekst9'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Virksomheden er omfattet af bekendtgørelse nr. 669 af 18. juni 2014 om godkendelse af listevirksomhed.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<xsl:choose>
		<xsl:when test="//row/col[@name='reguleringsgrundlag_tekst10'] != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">5mm</xsl:attribute>
				Virksomheden er omfattet af bekendtgørelse nr. 1418 af 2. december 2015 om standardvilkår.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		


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
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
</xsl:stylesheet>
