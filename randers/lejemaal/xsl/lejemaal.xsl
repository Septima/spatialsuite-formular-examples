<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output encoding="ISO-8859-1"/> 

  <xsl:param name="sessionid"/>
  <xsl:param name="frid"/>
  <xsl:param name="guid"><xsl:value-of select="$frid"></xsl:value-of> </xsl:param>
  <xsl:param name="logo">[module:formular.dir]/images/byvaaben.jpg</xsl:param>
  
  <xsl:param name="date"></xsl:param>
  <xsl:param name="konflikttekst1">INTET FUNDET</xsl:param>
  <xsl:param name="jrnr">IKKE ANGIVET</xsl:param>
  <xsl:param name="navn">IKKE ANGIVET</xsl:param>
  
  <xsl:param name="lejestatus">IKKE ANGIVET</xsl:param>
  <xsl:param name="lejemaal_type">IKKE ANGIVET</xsl:param>
  <xsl:param name="lejemaal_type_val">IKKE ANGIVET</xsl:param>
  <xsl:param name="udlej_dato">IKKE ANGIVET</xsl:param>
  <xsl:param name="udlej_aar">IKKE ANGIVET</xsl:param>
  <xsl:param name="gyldig_til">IKKE ANGIVET</xsl:param>
  
  <xsl:param name="aftale_type">IKKE ANGIVET</xsl:param>
  <xsl:param name="henblik">IKKE ANGIVET</xsl:param>
  <xsl:param name="henblik_andet">IKKE ANGIVET</xsl:param>
  
  <xsl:param name="reguleres_lejemaal">IKKE ANGIVET</xsl:param>
  <xsl:param name="beregningsmetode">IKKE ANGIVET</xsl:param>
  
  <xsl:param name="regulering_hvor">IKKE ANGIVET</xsl:param>
  <xsl:param name="andet_tekst"></xsl:param>
  <xsl:param name="regulering_dato">IKKE ANGIVET</xsl:param>
  <xsl:param name="sidst_regulet">IKKE ANGIVET</xsl:param>
  <xsl:param name="naeste_regulering">IKKE ANGIVET</xsl:param>
  
  
  <xsl:param name="ansv_husleje">IKKE ANGIVET</xsl:param>
  <xsl:param name="ansv_vand">IKKE ANGIVET</xsl:param>
  <xsl:param name="ansv_varme">IKKE ANGIVET</xsl:param>
  <xsl:param name="ansv_el">IKKE ANGIVET</xsl:param>
  <xsl:param name="ansv_renovation">IKKE ANGIVET</xsl:param>
  <xsl:param name="ansv_forsikring">IKKE ANGIVET</xsl:param>
  <xsl:param name="ansv_skatafgift">IKKE ANGIVET</xsl:param>
  <xsl:param name="moms">IKKE ANGIVET</xsl:param>
  <xsl:param name="faelles_afgift">IKKE ANGIVET</xsl:param>
  
  <xsl:param name="ansv_afgroeder">IKKE ANGIVET</xsl:param>
  <xsl:param name="ansv_ejdskat">IKKE ANGIVET</xsl:param>
  
  <xsl:param name="samlet_aarlig_leje">IKKE ANGIVET</xsl:param>
  <xsl:param name="opkraeves">IKKE ANGIVET</xsl:param>  
  <xsl:param name="belob">IKKE ANGIVET</xsl:param> 
  <xsl:param name="andet_tekst2">IKKE ANGIVET</xsl:param>  
  <xsl:param name="areal">IKKE ANGIVET</xsl:param>
  <xsl:param name="klenr">IKKE ANGIVET</xsl:param>
  <xsl:param name="facetnr">IKKE ANGIVET</xsl:param>
  <xsl:param name="etage"></xsl:param>
  <xsl:param name="address"></xsl:param>

  
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
        <xsl:call-template name="reportheader">
            <xsl:with-param name="date" select="$date"/>
         
        </xsl:call-template>
    
        <fo:block>
            <xsl:attribute name="margin-top">10mm</xsl:attribute>
        </fo:block>
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Det ansøgte areal berører:
        </fo:block>
		
        <fo:block linefeed-treatment="preserve">
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            <xsl:value-of select="$konflikttekst1"/>
        </fo:block>
		<fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            <xsl:value-of select="$address"/>
        </fo:block>
		<fo:block>
            <xsl:attribute name="margin-top">1mm</xsl:attribute>
            <xsl:value-of select="$etage"/> 
        </fo:block>
 
 
		<fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Indtastet journalnummer: <xsl:value-of select="$jrnr"/>
        </fo:block>
		<fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Forpagter/lejer: <xsl:value-of select="$navn"/>
        </fo:block>
        
		<fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Status: <xsl:value-of select="$lejestatus"/>
        </fo:block>
		
        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Lejemålets type: <xsl:value-of select="$lejemaal_type_val"/>
        </fo:block>
		
		<xsl:choose>
			<xsl:when test="$lejestatus = 'Udlejet'">
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Udlejet fra: <xsl:value-of select="$udlej_dato"/>.
				</fo:block>			
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Antal år: <xsl:value-of select="$udlej_aar"/>
				</fo:block>			
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Gyldig til: <xsl:value-of select="$gyldig_til"/>
				</fo:block>			
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Aftale type: <xsl:value-of select="$aftale_type"/>
				</fo:block>			

			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose> 	

        <fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Vælg årsag: <xsl:value-of select="$henblik"/>
        </fo:block>
		
		<xsl:choose>
		  <xsl:when test="$henblik = 'Andet'">
			<fo:block>
			<xsl:attribute name="margin-top">3mm</xsl:attribute>
            Opkøbt med henblik på: <xsl:value-of select="$henblik_andet"/>
			</fo:block>			
			</xsl:when>
		 <xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>

		<fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Reguleres lejemålet: <xsl:value-of select="$reguleres_lejemaal"/>
        </fo:block>

		<xsl:choose>
		  <xsl:when test="$reguleres_lejemaal = 'Ja'">
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Beregningsmetode: <xsl:value-of select="$beregningsmetode"/>
				</fo:block>
				<xsl:choose>
					<xsl:when test="$beregningsmetode = 'Andet'">
						<fo:block>
							<xsl:attribute name="margin-top">3mm</xsl:attribute>
							Hvor tit reguleres: <xsl:value-of select="$regulering_hvor"/>
						</fo:block>
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>

				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Reguleringstidspunkt: <xsl:value-of select="$regulering_dato"/>
				</fo:block>     
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Sidst regulet: <xsl:value-of select="$sidst_regulet"/>
				</fo:block>   
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Næste regulering: <xsl:value-of select="$naeste_regulering"/>
				</fo:block>  
				<xsl:choose>
					<xsl:when test="$andet_tekst != ''">
						<fo:block>
							<xsl:attribute name="margin-top">3mm</xsl:attribute>
							Andet: <xsl:value-of select="$andet_tekst"/>
						</fo:block>     
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>

        <xsl:choose>
			<xsl:when test="$lejemaal_type_val != 'Forpagtning' and $lejemaal_type_val != 'Bruger aftale - vederlags frie' ">
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Vand betales af: <xsl:value-of select="$ansv_vand"/>
				</fo:block>
				
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Varme betales af: <xsl:value-of select="$ansv_varme"/>
				</fo:block>
				
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					El betales af: <xsl:value-of select="$ansv_el"/>
				</fo:block>
				
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Renovation betales af: <xsl:value-of select="$ansv_renovation"/>
				</fo:block>
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Forsikring betales af: <xsl:value-of select="$ansv_forsikring"/>
				</fo:block>
				
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Skatter og afgifter betales af: <xsl:value-of select="$ansv_skatafgift"/>
				</fo:block>

				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Moms opkræves af: <xsl:value-of select="$moms"/>
				</fo:block>
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
				   Fælles afgift betales af lejer: <xsl:value-of select="$faelles_afgift"/>
				</fo:block>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>		

        <xsl:choose>
			<xsl:when test="$lejemaal_type_val = 'Forpagtning' or $lejemaal_type_val = 'Bruger aftale - vederlags frie' ">

				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Ejendomsskat betales af: <xsl:value-of select="$ansv_ejdskat"/>
				</fo:block>

				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Forsikring af afgrøder betales af: <xsl:value-of select="$ansv_afgroeder"/>
				</fo:block>

				<xsl:choose>
					<xsl:when test="$lejemaal_type_val = 'Forpagtning'">
					
						<fo:block>
							<xsl:attribute name="margin-top">3mm</xsl:attribute>
							Forpagtningsafgift: <xsl:value-of select="$ansv_husleje"/>
						</fo:block>

					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>			
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>		

		<fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Samlet årlig leje: <xsl:value-of select="$samlet_aarlig_leje"/>
        </fo:block>
        
		<fo:block>
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
            Opkræves: <xsl:value-of select="$opkraeves"/>
        </fo:block>
		
 		<xsl:choose>
		  <xsl:when test="$reguleres_lejemaal = 'Ja'">
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					udregnet beløb: <xsl:value-of select="$belob"/>
				</fo:block>		 
				<fo:block>
					<xsl:attribute name="margin-top">3mm</xsl:attribute>
					Andet: <xsl:value-of select="$andet_tekst2"/>
				</fo:block>     

			</xsl:when>
		 <xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>	

		
        <fo:block page-break-before="always">
            <xsl:attribute name="margin-top">30mm</xsl:attribute>
            Bilag kort i 1:<xsl:value-of select="format-number(//row/col[@name='scale'], '#')"/> - areal: <xsl:value-of select="$areal"/> m2
        </fo:block>
       
	   <fo:block>
            <fo:external-graphic height="150mm" width="190mm" content-height="150mm" content-width="190mm">
                <xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/tmp/<xsl:value-of select="//row/col[@name='img']"/>')</xsl:attribute>
            </fo:external-graphic>
        </fo:block>
       
       
    </xsl:template>

    <xsl:template name="reportheader">
        <xsl:param name="date"/>
    <fo:table table-layout="fixed" break-before="page">
        <fo:table-column column-width="50%"/>
        <fo:table-column column-width="50%"/>
        <fo:table-body>
            <fo:table-row>
                <fo:table-cell 
                     height="25mm" border="0.1pt solid black"  border-end-style="none" padding="1mm">
                    <fo:block margin="1pt" font-weight="bold" font-size="15pt">
                        Randers Kommune
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell 
                     height="25mm" border="0.1pt solid black" border-start-style="none" padding="1mm">
                    <fo:block text-align="end">
                   <fo:block text-align="end">
                       <fo:external-graphic height="25mm" width="22mm" 
                           content-height="25mm" content-width="22mm">
                           <xsl:attribute name="src">url('<xsl:value-of 
                               select="$logo"/>')</xsl:attribute>
                       </fo:external-graphic>
                   </fo:block>
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
