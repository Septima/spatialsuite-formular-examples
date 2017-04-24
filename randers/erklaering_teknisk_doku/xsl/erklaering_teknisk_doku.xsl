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
  <xsl:param name="journalnr"/>
  
  <xsl:param name="a"/>
  <xsl:param name="b"/>  
  <xsl:param name="c"/>
  <xsl:param name="d"/>  
  <xsl:param name="e"/>
  <xsl:param name="f"/>  
  <xsl:param name="g"/>
  <xsl:param name="h"/>  
  <xsl:param name="i"/>
  <xsl:param name="j"/>  
  <xsl:param name="k"/>
  <xsl:param name="l"/>  
  <xsl:param name="m"/>
  <xsl:param name="n"/> 
  <xsl:param name="o"/>  
  <xsl:param name="p"/>  
  <xsl:param name="q"/>  
  <xsl:param name="aa"/>  
  <xsl:param name="ab"/>  
  <xsl:param name="bb"/>  
  <xsl:param name="cb"/>  
  <xsl:param name="db"/>  
  <xsl:param name="eb"/>  
  <xsl:param name="fb"/>  
  <xsl:param name="gb"/>  
  <!--xmlns:exsl="urn:schemas-microsoft-com:xslt"-->
  <!--xmlns:exsl="http://xml.apache.org/xalan"-->
  
  <xsl:decimal-format decimal-separator = "," grouping-separator = "." NaN=" "/> 
    
  <xsl:attribute-set name="fixed-cell">
    <xsl:attribute name="overflow">hidden</xsl:attribute>
    <xsl:attribute name="wrap-option">no-wrap</xsl:attribute>
    <xsl:attribute name="padding-end">3pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="thisfont">
    <xsl:attribute name="font-family">arial</xsl:attribute>
    <xsl:attribute name="font-size">12pt</xsl:attribute>
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
  <xsl:attribute-set name="regnr" >
	<xsl:attribute name="wrap-option">nowrap</xsl:attribute>
    <xsl:attribute name="font-size">36pt</xsl:attribute>
	<xsl:attribute name="font-family">arial</xsl:attribute>
  </xsl:attribute-set>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="all" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="1cm" margin-left="1.0cm" margin-right="1.0cm">
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
						INDSENDT TIL
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
	<fo:block font-size="16pt" font-weight="bold">
		<xsl:attribute name="margin-top">3mm</xsl:attribute>
		Erklæring om teknisk dokumentation
	</fo:block>  
	<fo:block font-size="14pt" font-weight="bold">
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Følgende er registreret:
	</fo:block>  
	<xsl:choose>
		<xsl:when test="$a != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				At bygningen er opført i overensstemmelse med byggelovens formål og bygningsreglementets bestemmelser
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$b != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				At den fornødne dokumentation vedrørende tekniske forhold er fremsendt på forhånd
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$c != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				At den fornødne dokumentation vedrørende tekniske forhold var medsendt ansøgningen om byggetilladelse
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$d != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Tegningsmateriale, som viser niveaufri adgang
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$e != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Tegningsmateriale, der viser lydisolering mod nabo
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$f != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Tegningsmateriale, der viser bygningens tæthed mod jord
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$g != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Dokumentation for, at bygningens bærende konstruktioner opfylder bestemmelserne i bygningsreglementets kap. 4, jf. bilag 4 om statisk dokumentation, og at konstruktionerne er udført i overensstemmelse med god byggeskik, f.eks. efter SBI-anvisning 230
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$h != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Dokumentation for, at spær er leveret fra spærfabrik
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$i != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Stabilitetsberegning
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$j != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Dokumentation for, at konstruktioner og materialer ikke har et fugtindhold, der ved indflytning medfører risiko for skimmelsvamp (målingsrapport)
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$k != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Dokumentation for at brandkravene er opfyldt, således at der haves et tilstrækkeligt sikkerhedsniveau, eksempelvis efter eksempelsamlingen for brandsikring af byggeri 2010
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$l != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Energirammeberegning
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$m != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Dokumentation for bygningens tæthed
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$n != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Energimærkning i overensstemmelse med Energistyrelsens Bekendtgørelse om energimærkning af bygninger
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$o != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Varmetabsberegning (ved ombygning)
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$p != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Dokumentation vedrørende kloakforhold, herunder kloakplan, erklæring om arbejdernes udførelse fra autoriseret vvs-mester og kloakmester
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$q != 'false'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Dokumentation vedrørende ventilation
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$ab != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Ekstra - fritekst 1: <xsl:value-of select="$ab"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$bb != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Ekstra - fritekst 2: <xsl:value-of select="$bb"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$cb != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Ekstra - fritekst 3: <xsl:value-of select="$cb"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$db != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Ekstra - fritekst 4: <xsl:value-of select="$db"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$eb != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Ekstra - fritekst 5: <xsl:value-of select="$eb"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$fb != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Ekstra - fritekst 6: <xsl:value-of select="$fb"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="$gb != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Ekstra - fritekst 7: <xsl:value-of select="$gb"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
        
    </xsl:template>

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
                </fo:table-row>
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
