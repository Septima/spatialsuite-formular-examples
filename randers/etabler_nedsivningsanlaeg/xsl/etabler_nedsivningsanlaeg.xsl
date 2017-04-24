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
  <xsl:param name="matrikelnr"></xsl:param>
  <xsl:param name="ejer"></xsl:param>
  <xsl:param name="ejendommens_adresse"></xsl:param>
  <xsl:param name="navn"></xsl:param> 
  <xsl:param name="adresse"></xsl:param> 
  <xsl:param name="email"></xsl:param>
  <xsl:param name="ejers_tlf"></xsl:param> 
  <xsl:param name="eks_forh_benyttelse"></xsl:param> 
  <xsl:param name="eks_forh_vandforsyning"></xsl:param> 
  <xsl:param name="eks_forh_vandvaerk"></xsl:param> 
  <xsl:param name="eks_forh_bundfaeldning"></xsl:param> 
  <xsl:param name="eks_forh_husspildevand"></xsl:param> 
  <xsl:param name="eks_forh_bortskaffelse"></xsl:param> 
  <xsl:param name="eks_forh_bortskaf_beskrivelse"></xsl:param> 

  <xsl:param name="frem_forh_placering"></xsl:param> 
  <xsl:param name="frem_forh_accpet"></xsl:param> 
  <xsl:param name="frem_forh_tryksat"></xsl:param> 
  <xsl:param name="frem_forh_overterraen"></xsl:param> 
  <xsl:param name="frem_forh_flerehusstande"></xsl:param> 
  <xsl:param name="frem_forh_antalhusstande"></xsl:param> 
  <xsl:param name="frem_forh_spildvandstype"></xsl:param> 
  <xsl:param name="frem_forh_groeftareal"></xsl:param> 
  <xsl:param name="frem_forh_sivelaengde"></xsl:param> 
  <xsl:param name="frem_forh_siveareal"></xsl:param> 
  <xsl:param name="frem_forh_eksisterendebundtanke"></xsl:param> 
  <xsl:param name="frem_forh_nytank_kamre"></xsl:param> 
  <xsl:param name="frem_forh_nytank_vol"></xsl:param> 
  <xsl:param name="frem_forh_nytank_type"></xsl:param> 
  <xsl:param name="frem_forh_belastning"></xsl:param> 
  <xsl:param name="frem_forh_belastning_detalje"></xsl:param> 
  <xsl:param name="frem_forh_tro_og_love"></xsl:param> 
  
  
  <xsl:param name="afstand_naermestebygning"></xsl:param> 
  <xsl:param name="afstand_naermesteskel"></xsl:param> 
  <xsl:param name="afstand_naermesteboring"></xsl:param> 
  <xsl:param name="afstand_naermesteandenboring"></xsl:param> 
  <xsl:param name="afstand_vandvaerkmindre"></xsl:param> 
  <xsl:param name="afstand_vandvaerkmindrenavn"></xsl:param> 
  <xsl:param name="afstand_vandvaerkmere"></xsl:param> 
  <xsl:param name="afstand_vandvaerkmerenavn"></xsl:param>   
  <xsl:param name="afstand_proj_kyst"></xsl:param> 
  <xsl:param name="afstand_proj_kyst_meter"></xsl:param> 
  <xsl:param name="afstand_proj_soe"></xsl:param> 
  <xsl:param name="afstand_proj_soe_meter"></xsl:param> 
  <xsl:param name="afstand_proj_vandloeb"></xsl:param> 
  <xsl:param name="afstand_proj_vandloeb_meter"></xsl:param> 
  <xsl:param name="afstand_proj_groeft"></xsl:param> 
  <xsl:param name="afstand_proj_groeft_meter"></xsl:param> 
  <xsl:param name="afstand_proj_draenled"></xsl:param> 
  <xsl:param name="afstand_proj_draenled_meter"></xsl:param> 
  <xsl:param name="afstand_proj_stejle"></xsl:param> 
  <xsl:param name="afstand_proj_stejle_meter"></xsl:param> 
  <xsl:param name="afstand_proj_gravhoeje"></xsl:param> 
  <xsl:param name="afstand_proj_gravhoej_meter"></xsl:param> 
  <xsl:param name="afstand_markvandingsboringer"></xsl:param> 
  
  
  <xsl:param name="km_navn"></xsl:param> 
  <xsl:param name="km_adr"></xsl:param> 
  <xsl:param name="km_email"></xsl:param> 
  <xsl:param name="km_cvr"></xsl:param> 
  
  <xsl:param name="eks_forh_antalpe"></xsl:param> 
  <xsl:param name="eks_forh_spabad"></xsl:param> 
  <xsl:param name="eks_forh_saerlige_forhold"></xsl:param> 
  
  <xsl:param name="frem_forh_afstand_sivdraen_gvs"></xsl:param> 
  
  <xsl:param name="frem_forh_afstand_sivdraen_ter"></xsl:param>
  <xsl:param name="frem_forh_pejling_dato"></xsl:param> 
  <xsl:param name="frem_forh_mile"></xsl:param> 
  <xsl:param name="frem_forh_nytank_type_txt"></xsl:param> 
  <xsl:param name="frem_forh_sigteanalyse"></xsl:param> 
  
  <xsl:param name="afstand_proj_fortidsminder"></xsl:param> 
  <xsl:param name="afstand_proj_andre_nedsivningsanlaeg"></xsl:param> 
    
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
	<!-- OVERSKRIFT SVARENDE TIL HEADER SEKTIONEN I FORMULAR FILEN -->
	<fo:block font-size="14pt" >
		<xsl:attribute name="margin-top">3mm</xsl:attribute>
		<fo:inline font-weight="bold">Ansøgning om etablering af nedsivningsanlæg</fo:inline>
	</fo:block>
	<!-- HEREFTER KOMMER DE VANLIGE INFORMATIONER FRA FORMULAREN - FOERSTE SAET DATA HAR EN 'MARGIN-TOP' PAA 3MM - RESTEN 2MM -->
	<fo:block>
		<xsl:attribute name="margin-top">3mm</xsl:attribute>
		Fundne ejendomme: <xsl:value-of select="$matrikelnr"/> 
	</fo:block>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Fundne ejer: <xsl:value-of select="$ejer"/> 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Ejendommens adresse: <xsl:value-of select="$ejendommens_adresse"/> 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Ejers navn: <xsl:value-of select="$navn"/> 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Ejers adresse: <xsl:value-of select="$adresse"/> 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Ejers e-mail: <xsl:value-of select="$email"/> 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Ejers tlf: <xsl:value-of select="$ejers_tlf"/> 
	</fo:block>  
	
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Kloakmester: <xsl:value-of select="$km_navn"/> 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Kloakmesters adresse: <xsl:value-of select="$km_adr"/> 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Kloakmester e-mail: <xsl:value-of select="$km_email"/> 
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Kloakmester CVR: <xsl:value-of select="$km_cvr"/> 
	</fo:block>  
	
	<!--
	###  EKSISTERENDE FORHOLD ### 
	-->

	<fo:block font-size="14pt">
		<xsl:attribute name="margin-top" >2mm</xsl:attribute>
		Eksisterende forhold
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Ejendommens benyttes som: <xsl:value-of select="$eks_forh_benyttelse"/> 
	</fo:block> 	
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Ejendommens nuværende vandforsyning: <xsl:value-of select="$eks_forh_vandforsyning"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$eks_forh_vandvaerk != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Vandværkekts navn: <xsl:value-of select="$eks_forh_vandvaerk"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Passerer alt spildevand en bundfælningstank: <xsl:value-of select="$eks_forh_bundfaeldning"/> 
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Ledes andet end husspildevand til tanken: <xsl:value-of select="$eks_forh_husspildevand"/> 
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Hvorledes bortskaffes slam fra bundfældningstanken: <xsl:value-of select="$eks_forh_bortskaffelse"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$eks_forh_bortskaffelse = 'andenvis'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				- Angivelse: <xsl:value-of select="$eks_forh_bortskaf_beskrivelse"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Antal PE: <xsl:value-of select="$eks_forh_antalpe"/> 
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Spabad?: <xsl:value-of select="$eks_forh_spabad"/> 
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Særlige forhold: <xsl:value-of select="$eks_forh_saerlige_forhold"/> 
	</fo:block> 
	
	<!--
	###  FREMTIDIGE FORHOLD ### 
	-->
	
	<fo:block font-size="14pt">
		<xsl:attribute name="margin-top" >2mm</xsl:attribute>
		Fremtidige forhold
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Placeres nedsivningsanlægget på egen grund: <xsl:value-of select="$frem_forh_placering"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$frem_forh_placering = 'nej'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Fil vedhæftet: <xsl:value-of select="$frem_forh_accpet"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Tryksat siveanlæg: <xsl:value-of select="$frem_forh_tryksat"/> 
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Er nedsivningsanlægget hævet over terræn?: <xsl:value-of select="$frem_forh_overterraen"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$frem_forh_overterraen != 'nej'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Højde af mile i forhold til terræn: <xsl:value-of select="$frem_forh_mile"/> m
			</fo:block> 
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Afstand fra sivdræn til højeste grundvandsspejl: <xsl:value-of select="$frem_forh_afstand_sivdraen_gvs"/> m
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Afstand fra sivdræn til terræn: <xsl:value-of select="$frem_forh_afstand_sivdraen_ter"/> m
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Pejlingsdato: <xsl:value-of select="$frem_forh_pejling_dato"/>
	</fo:block> 

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Skal der tilsluttes mere end 1 husstad til nedsivningsanlægget?: <xsl:value-of select="$frem_forh_flerehusstande"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$frem_forh_antalhusstande != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Antal hustande, der tilsluttes: <xsl:value-of select="$frem_forh_antalhusstande"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Typen af spildevand, der ledes til nedsivningsanlægget: <xsl:value-of select="$frem_forh_spildvandstype"/> 
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Sivedræn eller siveareal?: <xsl:value-of select="$frem_forh_groeftareal"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$frem_forh_sivelaengde != 'areal'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Drænets længde: <xsl:value-of select="$frem_forh_sivelaengde"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Drænets areal: <xsl:value-of select="$frem_forh_siveareal"/>
			</fo:block>				
		</xsl:otherwise>
	</xsl:choose>
	
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Indgår eksisterende bundfældningstanke i anlægget?: <xsl:value-of select="$frem_forh_eksisterendebundtanke"/> 
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Antal kamre: <xsl:value-of select="$frem_forh_nytank_kamre"/> 
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Volumen i alt: <xsl:value-of select="$frem_forh_nytank_vol"/> 
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Tank type: <xsl:value-of select="$frem_forh_nytank_type"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$frem_forh_nytank_type = 'anden'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Anden tanktype: <xsl:value-of select="$frem_forh_nytank_type_txt"/>
			</fo:block> 
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	
	<xsl:choose>
		<xsl:when test="$frem_forh_tro_og_love = 'true'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Bundfældningstanken overholder §24a i spildevandsbekendtgørelsen: Ja
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Bundfældningstanken overholder §24a i spildevandsbekendtgørelsen: Nej
			</fo:block>				
		</xsl:otherwise>
	</xsl:choose>
	
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Bliver anlægget udsat for belastning (trafik eller andet):<xsl:value-of select="$frem_forh_belastning"/>
	</fo:block>				
	
	<xsl:choose>
		<xsl:when test="$frem_forh_belastning = 'ja'">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Typen af belastning, som anlægget kan blive udsat for: <xsl:value-of select="$frem_forh_belastning_detalje"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Sigteanalyse: <xsl:value-of select="$frem_forh_sigteanalyse"/>
	</fo:block> 
	<!--
	###  AFSTANDE ### 
	-->
	<fo:block font-size="14pt">
		<xsl:attribute name="margin-top" >2mm</xsl:attribute>
		Afstande
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Nærmeste bygning (m): <xsl:value-of select="$afstand_naermestebygning"/> 
	</fo:block> 

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Nærmeste nabo- eller vejskel (m): <xsl:value-of select="$afstand_naermesteskel"/> 
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Egen private drikkevandsboring/brønd (m): <xsl:value-of select="$afstand_naermesteboring"/> 
	</fo:block> 
	<fo:block font-size="12pt">
		<xsl:attribute name="margin-top" >2mm</xsl:attribute>
		Findes der indenfor 150 meter en/et af følgende:
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Markvandingsboringer/andre boringer: <xsl:value-of select="$afstand_markvandingsboringer"/> 
	</fo:block> 

	<fo:block font-size="12pt">
		<xsl:attribute name="margin-top" >2mm</xsl:attribute>
		Findes der indenfor 300 meter en/et af følgende:
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Andre private drikkevandsboringer: <xsl:value-of select="$afstand_naermesteandenboring"/> 
	</fo:block> 

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Fælles vandværk, der forsyner mindre end 10 ejendomme: <xsl:value-of select="$afstand_vandvaerkmindre"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$afstand_vandvaerkmindrenavn != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Vandværkets navn: <xsl:value-of select="$afstand_vandvaerkmindrenavn"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Fælles vandværk, der forsyner 10 eller flere ejendomme: <xsl:value-of select="$afstand_vandvaerkmere"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$afstand_vandvaerkmerenavn != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Vandværkets navn: <xsl:value-of select="$afstand_vandvaerkmerenavn"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<fo:block font-size="12pt" font-weight="bold">
		<xsl:attribute name="margin-top" >2mm</xsl:attribute>
		Ligger der, indenfor en afstand af 25 meter, fra det projekterede nedsivningsanlæg?:
	</fo:block>  
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Kyst: <xsl:value-of select="$afstand_proj_kyst"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$afstand_proj_kyst_meter != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Afstand til kysten (m):  <xsl:value-of select="$afstand_proj_kyst_meter"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		 Sø(er): <xsl:value-of select="$afstand_proj_soe"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$afstand_proj_soe_meter != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Afstand til søen/søerne (m): <xsl:value-of select="$afstand_proj_soe_meter"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		 Vandløb: <xsl:value-of select="$afstand_proj_vandloeb"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$afstand_proj_vandloeb_meter != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Afstand til vandløbet (m): <xsl:value-of select="$afstand_proj_vandloeb_meter"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		 Grøfter langs offentlig vej: <xsl:value-of select="$afstand_proj_groeft"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$afstand_proj_groeft_meter != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Afstand til grøften (m): <xsl:value-of select="$afstand_proj_groeft_meter"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		 Drænledninger: <xsl:value-of select="$afstand_proj_draenled"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$afstand_proj_draenled_meter != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Afstand til drænledning (m): <xsl:value-of select="$afstand_proj_draenled_meter"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		 Stejle skråninger: <xsl:value-of select="$afstand_proj_stejle"/> 
	</fo:block> 
	<xsl:choose>
		<xsl:when test="$afstand_proj_stejle_meter != ''">
			<fo:block>
				<xsl:attribute name="margin-top">2mm</xsl:attribute>
				Afstand til skråninger (m): <xsl:value-of select="$afstand_proj_stejle_meter"/>
			</fo:block>				
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
	<!--
	###  ANDRE AFSTANDE ### 
	-->
	<fo:block font-size="14pt">
		<xsl:attribute name="margin-top" >2mm</xsl:attribute>
		Andre afstande
	</fo:block>  

	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Gravhøje/fortidsminder: <xsl:value-of select="$afstand_proj_fortidsminder"/>
	</fo:block> 
	<fo:block>
		<xsl:attribute name="margin-top">2mm</xsl:attribute>
		Andre nedsivningsanlæg: <xsl:value-of select="$afstand_proj_andre_nedsivningsanlaeg"/>
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
