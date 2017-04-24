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

  <!-- INDSAET EKSTRA URLPARAM HER (SOM DU PLEJER) -->
<!--
  <xsl:param name="address"></xsl:param>
  <xsl:param name="konflikttekst1"></xsl:param>
  <xsl:param name="konflikttekst2"></xsl:param>
  <xsl:param name="dato_tilsyn"></xsl:param>
  <xsl:param name="tilsyn_udfoert_af"></xsl:param>
  <xsl:param name="virksomhed_deltager"></xsl:param>
  <xsl:param name="virksomhed_mail"></xsl:param>

  <xsl:param name="virksomhedstype"></xsl:param>

  <xsl:param name="opstartsdato"></xsl:param>
  <xsl:param name="udvidelse_aendringer"></xsl:param>

  <xsl:param name="antal_ansatte"></xsl:param>
  <xsl:param name="driftstid"></xsl:param>

  <xsl:param name="miljoemaessige_bemaerkninger">false</xsl:param>
  <xsl:param name="miljoemaessige_bemaerkninger_tekst"></xsl:param>
  <xsl:param name="haandhaevelser">false</xsl:param>
  <xsl:param name="haandhaevelser_tekst"></xsl:param>
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
							<xsl:variable name="url_et" select="concat('mailto:',//row/col[@name='sagsbehandler_mail'])"></xsl:variable>
							<fo:basic-link color="blue" text-decoration="underline">
							<xsl:attribute name="external-destination"><xsl:value-of select="$url_et"/></xsl:attribute>
								<xsl:value-of select="//row/col[@name='sagsbehandler_mail']"/>
							</fo:basic-link>		
					</fo:block>					
					<fo:block font-size="8pt">
							<xsl:variable name="url_to" select="http://www.randers.dk"></xsl:variable>
							<fo:basic-link color="blue" text-decoration="underline">
							<xsl:attribute name="external-destination"><xsl:value-of select="$url_to"/></xsl:attribute>
								www.randers.dk
							</fo:basic-link>		
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
		<xsl:attribute name="margin-top">1mm</xsl:attribute>
		D. <xsl:value-of select="$dagsdato"/> / <xsl:value-of select="//row/col[@name='journalnr']"/>
	</fo:block>

	<!-- OVERSKRIFT SVARENDE TIL HEADER SEKTIONEN I FORMULAR FILEN -->
	<fo:block>
		<xsl:attribute name="margin-top">8mm</xsl:attribute>
		<fo:inline font-weight="bold">TILSYN MED VIRKSOMHEDENS MILJØFORHOLD</fo:inline>
	</fo:block>
	<!-- HEREFTER KOMMER DE VANLIGE INFORMATIONER FRA FORMULAREN - FOERSTE SAET DATA HAR EN 'MARGIN-TOP' PAA 3MM - RESTEN 2MM -->
	<fo:block>
		<xsl:attribute name="margin-top">1mm</xsl:attribute>
		Randers Kommune har udført miljøtilsyn ved virksomheden d. <xsl:value-of select="//row/col[@name='dato_tilsyn']"/>. Formålet med tilsynet var at tilse om de miljømæssige forhold vedrørende indretning, drift, affald, luftemissioner, spildevand og støj er i orden. 
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">5mm</xsl:attribute>
		<fo:inline font-weight="bold">MILJØMÆSSIGE BEMÆRKNINGER TIL TILSYNET</fo:inline>
	</fo:block>
	<xsl:choose>
		<xsl:when test="//row/col[@name='miljoemaessige_bemaerkninger'] != 'Ja' and //row/col[@name='virksomhed_deltager'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='tilsyn_udfoert_af']"/> har sammen med <xsl:value-of select="//row/col[@name='virksomhed_deltager']"/> gennemgået virksomheden og ikke fundet anledning til bemærkninger til tilsynet.
			</fo:block>			
		</xsl:when>
		<xsl:when test="//row/col[@name='miljoemaessige_bemaerkninger'] != 'Ja'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='tilsyn_udfoert_af']"/> har gennemgået virksomheden og ikke fundet anledning til bemærkninger til tilsynet.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='miljoemaessige_bem_tekst']"/>
			</fo:block>			
		</xsl:otherwise>
	</xsl:choose> 		
	<fo:block>
		<xsl:attribute name="margin-top">5mm</xsl:attribute>
		<fo:inline font-weight="bold">JORDFORURENING</fo:inline>
	</fo:block>
	<xsl:choose>
		<xsl:when test="//row/col[@name='jordforurening_bemaerkninger'] != 'Ja'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				Der er ved miljøtilsynet ikke konstateret tegn på jordforurening.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='jordforurening_bem_tekst']"/>
			</fo:block>			
		</xsl:otherwise>
	</xsl:choose> 		
	<fo:block>
		<xsl:attribute name="margin-top">5mm</xsl:attribute>
		<fo:inline font-weight="bold">HÅNDHÆVELSER</fo:inline>
	</fo:block>
	<xsl:choose>
		<xsl:when test="//row/col[@name='haandhaevelser'] != 'Ja'">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				Der er ved miljøtilsynet ikke meddelt påbud, forbud eller indskærpelser til virksomheden.
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='haandhaevelser_tekst']"/>
			</fo:block>			
		</xsl:otherwise>
	</xsl:choose> 		
	<fo:block>
		<xsl:attribute name="margin-top">5mm</xsl:attribute>
		<fo:inline font-weight="bold">HJÆLP TIL AFFALD</fo:inline>
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">1mm</xsl:attribute>
		Randers kommune har for at hjælpe virksomhederne i kommunen valgt at abonnere på et program som hedder Affaldstjek. Affaldstjek er virksomhedens eget værktøj til at få styr på affaldet.
		Når du har svaret på spørgsmålene, får du resultatet på skærmen. Resultatet kan du printe ud og bruge i virksomhedens arbejde med at få tjek på affaldet. Linket til hjemmesiden er:
		<fo:basic-link external-destination="http://affald.randers.dk/FrontEnd.aspx?id=206938" color="blue" text-decoration="underline">http://affald.randers.dk</fo:basic-link>
		, det kan du så sætte ind som et hyperlink som du kalder Affaldstjek.dk
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">5mm</xsl:attribute>
		<fo:inline font-weight="bold">ØVRIGE BEMÆRKNINGER</fo:inline>
	</fo:block>
	<xsl:choose>
		<xsl:when test="//row/col[@name='oevrige_bemaerkninger'] != ''">
			<fo:block>
				<xsl:attribute name="margin-top">1mm</xsl:attribute>
				<xsl:value-of select="//row/col[@name='oevrige_bemaerkninger']"/>
			</fo:block>			
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose> 		
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Hvis du har spørgsmål til Miljø og Teknik, er du velkommen til at rette henvendelse til mig, så vil jeg gerne være behjælpelig med at sikre spørgsmålene bliver belyst/besvaret. 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Hvis der er spørgsmål og bemærkninger til brevet eller til tilsynsnotatet kan jeg kontaktes på telefonnummer: <xsl:value-of select="//row/col[@name='sagsbehandler_tlf']"/> eller på <xsl:value-of select="//row/col[@name='sagsbehandler_mail']"/>
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Du har netop fået behandlet en ansøgning om miljøgodkendelse / fået udført miljøtilsyn.
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">1mm</xsl:attribute>
		Må vi høre din mening? På et par minutter kan du give os din mening om sagsbehandlingen og kontakten til os. Vi håber derfor, at du vil svare på nogle spørgsmål, som du finder ved at trykke her:
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">1mm</xsl:attribute>
		<xsl:variable name="url_et" select="concat('http://webkort.randers.dk/spatialmap&#63;page=formular&amp;formular=poll&amp;journalnr=',//row/col[@name='journalnr'])"></xsl:variable>
		<fo:basic-link color="blue" text-decoration="underline">
			<xsl:attribute name="external-destination"><xsl:value-of select="$url_et"/></xsl:attribute>
			Tilfredshedsundersøgelse
		</fo:basic-link>		
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">5mm</xsl:attribute>
		Venlig hilsen
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">5mm</xsl:attribute>
		<xsl:value-of select="//row/col[@name='tilsyn_udfoert_af']"/>
	</fo:block>  

	<!-- sikre, at der kommer en ny side -->
	<fo:block page-break-before="always">
	</fo:block>
	<fo:table table-layout="fixed" >
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
	<fo:table table-layout="fixed" >
        <fo:table-column column-width="100%"/>
		<fo:table-body border-color="black"  border-style="solid"  border-width="thin" padding="1mm">
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
						MILJØTILSYN IFØLGE MILJØBESKYTTELSESLOVEN
					</fo:block>
					<fo:block>
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						Det udførte tilsyn er et "samlet tilsyn", hvilket svarer til, at alle påvirkning af det eksterne miljø fra virksomhedens aktiviter er blevet gennemgået.
					</fo:block>  
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
	<fo:block>
		<xsl:attribute name="margin-top">5mm</xsl:attribute>
	</fo:block>  
	<fo:table table-layout="fixed" >
    <fo:table-column column-width="25%"/>
    <fo:table-column column-width="75%"/>
		<fo:table-body border-color="black"  border-style="solid"  border-width="thin" padding="1mm">
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
						Tilsynsdato:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='dato_tilsyn']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
						CVR-nummer:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='cvr_nummer']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						P-nummer:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='p_nummer']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
						Virksomhed:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='virksomhed']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						Adresse:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='virksomhed_adresse']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						Postnummer og by:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='virksomhed_postnr_by']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						Telefonnummer:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='virksomhed_tlf']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						E-mail:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='virksomhed_mail']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						Matrikelnr:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='konflikttekst1']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						Områdestatus:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='konflikttekst2']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
						Virksomhedstype:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='virksomhedstype']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						Opstartsdato:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='opstartsdato']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						Udvidelse/ændringer:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='udvidelse_aendringer']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						Tilsynsmyndighed:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						Randers Kommune
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
						Tilstede ved tilsynet:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">5mm</xsl:attribute>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						Virksomheden:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='virksomhed_deltager']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
            <fo:table-row>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block font-weight="bold">
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						Randers Kommune:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="1mm" number-rows-spanned="1"> 
					<fo:block>
						<xsl:attribute name="margin-top">2mm</xsl:attribute>
						<xsl:value-of select="//row/col[@name='tilsyn_udfoert_af']"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>


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
