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

  
  <xsl:param name="address"></xsl:param>
  <xsl:param name="soe"></xsl:param>
  <xsl:param name="konflikttekst1"></xsl:param>
  <xsl:param name="konflikttekst2">INTET FUNDET</xsl:param>
  <xsl:param name="konflikttekst3"></xsl:param>
  <xsl:param name="konflikttekst4"></xsl:param>
  <xsl:param name="areal">0</xsl:param>
  <xsl:param name="leverandoer"></xsl:param>
  
  
  <xsl:param name="slamproducent"></xsl:param>
  <xsl:param name="maengdefosforha"></xsl:param>    
  
  <xsl:param name="flere_producenter"></xsl:param>
  <xsl:param name="slamproducent2"></xsl:param>
  <xsl:param name="maengdefosforha2"></xsl:param>    
  
  <xsl:param name="typeafslam"></xsl:param>
  <xsl:param name="aar"></xsl:param>    
  <xsl:param name="kvartal"></xsl:param>    
  <xsl:param name="slamnavn"></xsl:param>
  <xsl:param name="slamadresse"></xsl:param>
  <xsl:param name="slammail"></xsl:param>
  <xsl:param name="leverandoer"></xsl:param>
  <xsl:param name="email"></xsl:param>
  <xsl:param name="tlf"></xsl:param>
  
  <xsl:param name="maengdeslam"></xsl:param>
  <xsl:param name="maengdeslam2"></xsl:param>
  <xsl:param name="angivet_areal"></xsl:param>
  <xsl:param name="ton_toerstof"></xsl:param>
  <xsl:param name="ton_toerstof2"></xsl:param>
  
  <xsl:param name="filnavn1"></xsl:param>
  <xsl:param name="filnavn2"></xsl:param>
  <xsl:param name="filnavn3"></xsl:param>
  <xsl:param name="filnavn4"></xsl:param>
  
  
  
  <!--xmlns:exsl="urn:schemas-microsoft-com:xslt"-->
  <!--xmlns:exsl="http://xml.apache.org/xalan"-->
  
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
        <xsl:call-template name="reportheader">
        </xsl:call-template>
		<fo:table table-layout="fixed" >
        <fo:table-column column-width="80%"/>
        <fo:table-column column-width="20%"/>
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
						Direkte +45 8915 1746
					</fo:block>					
					<fo:block font-size="8pt">
						Telefax +45 8915 1660
					</fo:block>					
					<fo:block font-size="8pt">
						<xsl:attribute name="margin-top">3mm</xsl:attribute>
					</fo:block>					
					<fo:block font-size="8pt">
						ehk@randers.dk
					</fo:block>					
					<fo:block font-size="8pt">
						www.randers.dk
					</fo:block>					
				</fo:table-cell>				
			</fo:table-row>
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
	<fo:block>
		<xsl:attribute name="margin-top">3mm</xsl:attribute>
		<xsl:value-of select="$dagsdato"/><xsl:text>  </xsl:text><xsl:value-of select="$journalnr"/>
	</fo:block>
	<fo:block font-size="14pt" >
		<xsl:attribute name="margin-top">3mm</xsl:attribute>
		<fo:inline font-weight="bold">Anmeldelse af udbringning af spildevandsslam</fo:inline>
	</fo:block>

	<fo:block>
		<xsl:attribute name="margin-top">3mm</xsl:attribute>
		Det ansøgte areal udgør: <xsl:value-of select="$areal"/> m2 
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Slamproducent: <xsl:value-of select="$slamproducent"/>
	</fo:block>  
	<fo:block>  
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Mængde fosfor pr. Ha: <xsl:value-of select="$maengdefosforha"/> kg.    
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Samlet mængde slam i ton: <xsl:value-of select="$maengdeslam"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Antal ton tørstof/ha: <xsl:value-of select="$ton_toerstof"/>
	</fo:block>

	<xsl:choose>
		<xsl:when test="$flere_producenter != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Slamproducent 2: <xsl:value-of select="$slamproducent2"/>
			</fo:block>				
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Mængde fosfor pr. Ha (for producent2 ): <xsl:value-of select="$maengdefosforha2"/>
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Samlet mængde slam i ton (for producent2 ): <xsl:value-of select="$maengdeslam2"/>
			</fo:block>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Antal ton tørstof/ha (for producent2 ): <xsl:value-of select="$ton_toerstof2"/>
			</fo:block>

		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Arealstørrelse jf. enkeltbetaling/hektarstøtte: <xsl:value-of select="$angivet_areal"/>
	</fo:block>
	
	<fo:block>  
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		År for udbringelse: <xsl:value-of select="$aar"/>     
	</fo:block> 
	<fo:block>  
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Halvår for udbringelse: <xsl:value-of select="$kvartal"/>. halvår
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Slamtype: <xsl:value-of select="$typeafslam"/>
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Slam modtager: <xsl:value-of select="$slamnavn"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Slam modtagers adresse: <xsl:value-of select="$slamadresse"/>
	</fo:block>	
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Slam modtagers mail: <xsl:value-of select="$slammail"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Leverandør: <xsl:value-of select="$leverandoer"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		E-mail: <xsl:value-of select="$email"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Telefonnr.: <xsl:value-of select="$tlf"/>
	</fo:block>
	
	<xsl:choose>
		<xsl:when test="$filnavn1 != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Filnavn (Analyse): <xsl:value-of select="$filnavn1"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$filnavn2 != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Filnavn (Leveringsaftale): <xsl:value-of select="$filnavn2"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$filnavn3 != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Filnavn (Analyse/leverandør 2): <xsl:value-of select="$filnavn3"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="$filnavn4 != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Filnavn (Leveringsaftale/leverandør 2): <xsl:value-of select="$filnavn4"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	
<!-- 	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Filnavn (Analyse): <xsl:value-of select="$filnavn1"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Filnavn (Leveringsaftale): <xsl:value-of select="$filnavn2"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Filnavn (Analyse/leverandør 2): <xsl:value-of select="$filnavn3"/>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Filnavn (Leveringsaftale/leverandør 2): <xsl:value-of select="$filnavn4"/>
	</fo:block>
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
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Det ansøgte areal berører:
	</fo:block>
	<fo:block linefeed-treatment="preserve">
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		<xsl:value-of select="$konflikttekst1"/>
	</fo:block>
	<fo:block linefeed-treatment="preserve">
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		<xsl:value-of select="$konflikttekst2"/>					
	</fo:block>
	<fo:block linefeed-treatment="preserve">
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		<xsl:value-of select="$konflikttekst3"/>
	</fo:block>
	<fo:block linefeed-treatment="preserve">
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		<xsl:value-of select="$konflikttekst4"/>
	</fo:block>
    </xsl:template>

    <xsl:template name="reportheader">
        <fo:table table-layout="fixed" break-before="page">
        <fo:table-column column-width="80%"/>
        <fo:table-column column-width="20%"/>
        <fo:table-body>
            <fo:table-row>
                <fo:table-cell height="30mm" border-end-style="none" padding="1mm">
                    <fo:block>
                       <fo:external-graphic height="30mm" width="50mm" 
                           content-height="30mm" content-width="50mm">
                           <xsl:attribute name="src">url('<xsl:value-of 
                               select="$rklogo"/>')</xsl:attribute>
                       </fo:external-graphic>
                    </fo:block>
                </fo:table-cell>
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
