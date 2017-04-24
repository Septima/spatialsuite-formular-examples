<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output encoding="ISO-8859-1"/> 

  <xsl:param name="sessionid"/>
  <xsl:param name="guid"><xsl:value-of select="$sessionid"></xsl:value-of> </xsl:param>
  <xsl:param name="logo">[module:formular.dir]/images/byvaaben.jpg</xsl:param>
  <xsl:param name="rklogo">[module:formular-randers.dir]/images/RKlogo.png</xsl:param>
  <xsl:param name="bsik">[module:formular-randers.dir]/images/bsik.png</xsl:param>
  
  <xsl:param name="dagsdato"></xsl:param>
  <xsl:param name="journalnr"></xsl:param>

  <!-- INDSAET EKSTRA URLPARAM HER (SOM DU PLEJER) -->
  <xsl:param name="address">Ikke oplyst</xsl:param>
  <xsl:param name="stedetsnavn">Ikke oplyst</xsl:param>
<!--  <xsl:param name="areal">0</xsl:param> -->
  <xsl:param name="date1">Ikke oplyst</xsl:param>
  <xsl:param name="date2">Ikke oplyst</xsl:param>
  <xsl:param name="antal_dage">Ikke oplyst</xsl:param>
  <xsl:param name="startkl">Ikke oplyst</xsl:param>
  <xsl:param name="slutkl">Ikke oplyst</xsl:param>
  <xsl:param name="lokale">Ikke oplyst</xsl:param>
  <xsl:param name="antalvoksne">Ikke oplyst</xsl:param>
  <xsl:param name="antalboern">Ingen foto valgt</xsl:param>
  <xsl:param name="bilag">Ikke oplyst</xsl:param> 
  <xsl:param name="ansvarlig">Ikke oplyst</xsl:param>
  <xsl:param name="ansvarligmobilnr">Ikke oplyst</xsl:param>
  <xsl:param name="antalvoksne">Ikke oplyst</xsl:param>
  <xsl:param name="email">Ikke oplyst</xsl:param>  
  <xsl:param name="accepterer">Ikke oplyst</xsl:param>  
  <xsl:param name="email">Ikke oplyst</xsl:param>  
  
  
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
                    <fo:region-after extent="15mm"/>
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
	<!-- HER KOMMER DAGS DATO OG JOURNALNR (KRAEVER JAVASCRIPT OG SPECIEL PAGE OPSAETNING - SE BLA. SLAM FORMULAREN SOM EKSEMPEL)  -->
	<fo:block>
		<xsl:attribute name="margin-top">3mm</xsl:attribute>
		<xsl:value-of select="$dagsdato"/><xsl:text>  </xsl:text><xsl:value-of select="$journalnr"/>
	</fo:block>
	<!-- OVERSKRIFT SVARENDE TIL HEADER SEKTIONEN I FORMULAR FILEN -->
	<fo:block font-size="14pt" >
		<xsl:attribute name="margin-top">3mm</xsl:attribute>
		<fo:inline font-weight="bold">Ansøgning om overnatning</fo:inline>
	</fo:block>
	<!-- HEREFTER KOMMER DE VANLIGE INFORMATIONER FRA FORMULAREN - FOERSTE SAET DATA HAR EN 'MARGIN-TOP' PAA 3MM - RESTEN 2MM -->
	<fo:block>
		<xsl:attribute name="margin-top">3mm</xsl:attribute>
		Ansøger adresse: <xsl:value-of select="$address"/> 
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Stedetsnavn: <xsl:value-of select="$stedetsnavn"/> 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Ankomst dato: <xsl:value-of select="$date1"/> 
	</fo:block>  
		<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Afrejse dato: <xsl:value-of select="$date2"/> 
	</fo:block>  

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Antal dage: <xsl:value-of select="$antal_dage"/> 
	</fo:block>  

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Ankommer kl.? <xsl:value-of select="$startkl"/> 
	</fo:block>  

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Afrejse kl.? <xsl:value-of select="$slutkl"/> 
	</fo:block>  

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Lokale/lokale nr.: <xsl:value-of select="$lokale"/> 
	</fo:block>  

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Antal voksne: <xsl:value-of select="$antalvoksne"/> 
	</fo:block>  

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Antal børn: <xsl:value-of select="$antalboern"/> 
	</fo:block>  

       <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Vedhæft evt. bilag <xsl:value-of select="$bilag"/>
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Navn på ansvarlig: <xsl:value-of select="$ansvarlig"/>
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Ansvarlig mobil nr: <xsl:value-of select="$ansvarligmobilnr"/>
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            E-mail: <xsl:value-of select="$email"/>
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
						Såfremt der er spørgsmål er du velkommen til at kontakte os.
					</fo:block>
					<fo:block>
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
						Med venlig hilsen
					</fo:block>  
					<fo:block>  
                       <![CDATA[Beredskab & Sikkerhed]]>
					</fo:block> 
	
  </xsl:template>
	<!-- SOM UDGANGSPUNKT - NIX PILLE HERUNDER -->
    <xsl:template name="reportheader">
        <fo:table table-layout="fixed" break-before="page">
        <fo:table-column column-width="70%"/>
        <fo:table-column column-width="30%"/>
        <fo:table-body>
            <fo:table-row>
                <fo:table-cell height="30mm" border-end-style="none" padding="1mm">
                    <fo:block>
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell height="40mm" border-start-style="none" padding="1mm">
                   <fo:block text-align="start">
                       <fo:external-graphic height="57mm" width="50mm" 
                           content-height="57mm" content-width="50mm">
                           <xsl:attribute name="src">url('<xsl:value-of select="$bsik"/>')</xsl:attribute>
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
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell height="40mm" margin="3mm" width="50%">
						<fo:block font-size="8pt">
							RANDERS-FAVRSKOV-DJURSLAND
						</fo:block>  
                    </fo:table-cell>
                    <fo:table-cell height="40mm" margin="3mm" width="50%">
                        <fo:block text-align="right" font-size="7pt">
							Vestergrave 30
						</fo:block>	
                        <fo:block text-align="right" font-size="7pt">
						8900 Randers C
						</fo:block>	
                        <fo:block text-align="right" font-size="7pt">
						Tlf. 8959 4000
						</fo:block>	
                        <fo:block text-align="right" font-size="7pt">
						post@bsik.dk
						</fo:block>								
                        <fo:block text-align="right" font-size="7pt">
						www.bsik.dk
						</fo:block>								
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
</xsl:stylesheet>
