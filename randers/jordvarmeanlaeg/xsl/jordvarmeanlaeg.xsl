<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output encoding="ISO-8859-1"/> 

  <xsl:param name="sessionid"/>
  <xsl:param name="guid"><xsl:value-of select="$sessionid"></xsl:value-of> </xsl:param>
  <xsl:param name="logo">[module:formular.dir]/images/byvaaben.jpg</xsl:param>
  <xsl:param name="logo2">[module:formular.dir]/images/randerskommune.jpg</xsl:param>
  
  <xsl:param name="dagsdato"></xsl:param>
  <xsl:param name="journalnr"></xsl:param>
  
  <xsl:param name="address">Ikke oplyst</xsl:param>
  <xsl:param name="konflikttekst1">Ingen ejendomme fundet</xsl:param>
  <xsl:param name="areal">0</xsl:param>
  <xsl:param name="foedeledningnorm">Ikke oplyst</xsl:param>
  <xsl:param name="foedeledningens_dimension">Ikke oplyst</xsl:param>
  <xsl:param name="foedeledningens_laengde">Ikke oplyst</xsl:param>
  <xsl:param name="varmeslangensnorm">Ikke oplyst</xsl:param>
  <xsl:param name="varmeslangens_dimension">Ikke oplyst</xsl:param>
  <xsl:param name="varmeslangens_laengde">Ikke oplyst</xsl:param>
  <xsl:param name="antal_sloejfer">Ikke oplyst</xsl:param>
  <xsl:param name="laengde_sloejfer">Ikke oplyst</xsl:param>
  <xsl:param name="nedgravningsdybde">Ikke oplyst</xsl:param>
  <xsl:param name="inspektionsgang">Ikke oplyst</xsl:param>
  <xsl:param name="frostmiddel">Ikke oplyst</xsl:param>
  <xsl:param name="frostmiddel_maengde">Ikke oplyst</xsl:param>
  <xsl:param name="varmepumpe">Ikke oplyst</xsl:param>
  <xsl:param name="trykovervaagning">Ikke oplyst</xsl:param>
  <xsl:param name="alarm">Ikke oplyst</xsl:param>
  <xsl:param name="sikkerhedsanordning">Ikke oplyst</xsl:param>
  <xsl:param name="vandforsyning">Ikke oplyst</xsl:param>
  <xsl:param name="broend_boring">Ikke oplyst</xsl:param>
  <xsl:param name="navn">Ikke oplyst</xsl:param>
  <xsl:param name="email">Ikke oplyst</xsl:param>
  <xsl:param name="tlf">Ikke oplyst</xsl:param>
  <xsl:param name="filnavn">Ingen filer vedhæftet!</xsl:param>
  <xsl:param name="installatoer_navn">Ikke oplyst</xsl:param>
  
  

  
  <xsl:decimal-format decimal-separator = "," grouping-separator = "." NaN=" "/> 
    
  <xsl:attribute-set name="fixed-cell">
    <xsl:attribute name="overflow">hidden</xsl:attribute>
    <xsl:attribute name="wrap-option">no-wrap</xsl:attribute>
    <xsl:attribute name="padding-end">3pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="thisfont">
    <xsl:attribute name="font-family">Calibri</xsl:attribute>
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
            <xsl:with-param name="dagsdato" select="$dagsdato"/>
         
        </xsl:call-template>
    
        <fo:block >
            <xsl:attribute name="margin-top">50mm</xsl:attribute>
             Kvittering for modtagelse af anmeldelse af etablering af jordvarmeanlæg på ejendommen: <xsl:value-of select="$address"/>, <xsl:value-of select="$konflikttekst1"/>,Journalnr: <xsl:value-of select="$journalnr"/>
        </fo:block>
        <fo:block font-weight="bold">
			<xsl:attribute name="margin-top">3mm</xsl:attribute>
          1. Du kan efter lovgivningen igangsætte etableringsarbejdet 4 uger fra dags dato hvis du ikke hørt yderligere fra Randers Kommune.</fo:block>
        <fo:block >
			<xsl:attribute name="margin-top">3mm</xsl:attribute>	
          2. Randers Kommune vil indenfor den 4 ugers periode vurdere om grundvandsforhold eller lignende betyder, at der skal laves en egentlig jordvarmetilladelse. 
             I særlige tilfælde kan Randers Kommune dog ikke give tilladelse til etablering af jordvarme. 
        </fo:block>
        <fo:block >
			<xsl:attribute name="margin-top">3mm</xsl:attribute>
         3. Du vil indenfor de 4 uger få brev fra Randers Kommune med besked resultatet af vurderingen af anmeldelsen samt vilkår til en eventuel etablering af jordvarmeanlægget.        </fo:block>
        <fo:block >
			<xsl:attribute name="margin-top">3mm</xsl:attribute>            
            Såfremt der er spørgsmål kan jeg kontaktes på telefon 8915 1684, eller på e-mail per.eriksen@randers.dk 
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">20mm</xsl:attribute>
             Med venlig hilsen 
        </fo:block>
        <fo:block >
			<xsl:attribute name="margin-top">3mm</xsl:attribute>
          Per Eriksen
          </fo:block>
        <fo:block >
			<xsl:attribute name="margin-top">3mm</xsl:attribute>
          Ingeniør
          </fo:block>
        <fo:block page-break-before="always">
            <xsl:attribute name="margin-top">10mm</xsl:attribute>
            Oplysninger om anlægget
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Fødeledning norm: <xsl:value-of select="$foedeledningnorm"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Fødeledningens dimension: <xsl:value-of select="$foedeledningens_dimension"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Fødelednings længde (m): <xsl:value-of select="$foedeledningens_laengde"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Varmeslangens norm: <xsl:value-of select="$varmeslangensnorm"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Varmeslanges dimension: <xsl:value-of select="$varmeslangens_dimension"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Varmeslange længde (m): <xsl:value-of select="$varmeslangens_laengde"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Antal sløjfer: <xsl:value-of select="$antal_sloejfer"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Længde på sløjfer (m): <xsl:value-of select="$laengde_sloejfer"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Nedgravningsdybde (m): <xsl:value-of select="$nedgravningsdybde"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Inspektionsgang: <xsl:value-of select="$inspektionsgang"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Frostmiddel: <xsl:value-of select="$frostmiddel"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Mængden af frostmiddel: <xsl:value-of select="$frostmiddel_maengde"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Kompressor: <xsl:value-of select="$varmepumpe"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Trykovervågning: <xsl:value-of select="$trykovervaagning"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Alarm: <xsl:value-of select="$alarm"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Sikkerhedsanordning: <xsl:value-of select="$sikkerhedsanordning"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Installatørens navn: <xsl:value-of select="$installatoer_navn"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Vandforsyning: <xsl:value-of select="$vandforsyning"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Brønd/boring inden for 50m: <xsl:value-of select="$broend_boring"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Navn: <xsl:value-of select="$navn"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             E-mail: <xsl:value-of select="$email"/>
        </fo:block>
        <fo:block >
            <xsl:attribute name="margin-top">3mm</xsl:attribute>
             Tlf. nr: <xsl:value-of select="$tlf"/>
        </fo:block>


		  <fo:block page-break-before="always">
            <xsl:attribute name="margin-top">30mm</xsl:attribute>
            Bilag kort i 1:<xsl:value-of select="format-number(//row/col[@name='scale'], '#')"/>
        </fo:block>
        <fo:block>
            <fo:external-graphic height="150mm" width="170mm" content-height="150mm" content-width="170mm">
                <xsl:attribute name="src">url('[cbinfo.wwwroot.dir]/tmp/<xsl:value-of select="//row/col[@name='img']"/>')</xsl:attribute>
            </fo:external-graphic>
        </fo:block>
        <fo:block>
            
        </fo:block>
        
    </xsl:template>

    <xsl:template name="reportheader">
        <xsl:param name="dagsdato"/>
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
                        <xsl:value-of select="$navn"/>
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
        <fo:block margin="1pt" font-size="10pt" >
			<xsl:attribute name="margin-top">3mm</xsl:attribute>
          Dagensdato:  <xsl:value-of select="$dagsdato"/>
          </fo:block>

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
