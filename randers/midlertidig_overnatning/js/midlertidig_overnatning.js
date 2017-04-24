/*
	JavaScript template skrevet af Kåre Mølgaard Rasmussen for GIS og Digitalisering/Randers Kommune

	Denne template indeholder en række standardfunction til klippe-klister formål i forbindelse med
	Septima´s selvbetjeningsløsninger.
	
	En funktion/metode defineres med nøgleordet "function" efterfulgt af navnet på funktionen og evt. parametre indenfor en start- og slut parantes.
	Indeholdet af funktionen skal holdes inden for en start- og slut tuborgparantes ( {} )
	Eksempel:
	function minFoersteFunktion()
	{
		//Her skrives de ting, som funktionen skal udfører
	}
	
	Følgende funktion tager to argumenter og viser dem for brugeren
	function minAndenFunktion(besked1, besked2)
	{
		//Vis beskeden for brugeren
		alert('minAndenFunktion() kaldt med argumenterne: ' + besked + ' og ' + besked2);
	}

	Vær opmærksom på, at der skelnes mellem store og små bogstaver. Et kald til minFoersteMetode vil gå godt, men et kald til MinfOerstemEthOde vil fejle
	Derudover må der ikke i funktionsnavnet være ÆØÅ (hverken store eller små)
	
	Evt. kommentare eller kode der driller kan udkommenteres på to måder. 
	En enkelt linje klares med //
	En blok klares med skråstreg+stjerne (start) og stjerne+skråstreg (slut) - se denne kommentarblok. 
	
	Vær opmærksom på, at man ikke kan lave en blokkommentar inde i en blokkommentar.
	
	
		
	
	

*/
window.onload = function() 
{
	setTimeout(function() {setDagsDato();},200);
}
	
function setDagsDato()
{
	var d = new Date();
	var strDate = d.getDate() + '-' + (d.getMonth()+1) + "/" + d.getFullYear();
	jQuery('#dagsdato').val(strDate);
}
function setMail()
{
	var kommune = jQuery('#kommune').val();
	var mailAdr = 'omrvest@bsik.dk';
	var sbsysDqId = 'DQ16332';
	switch (kommune)
	{
		case 'randers':
			mailAdr = 'omrvest@bsik.dk';
			sbsysDqId = 'DQ16332';
			break;
		case 'favrskov':
			mailAdr = 'omrvest@bsik.dk';
			sbsysDqId = 'DQ16332';
			break;
		case 'norddjurs':
			mailAdr = 'omrnord@bsik.dk';
			sbsysDqId = 'DQ25697 ';
			break;
		case 'syddjurs':
			mailAdr = 'omrsyd@bsik.dk';
			sbsysDqId = 'DQ25558';
			break;
		default:
			mailAdr = 'omrvest@bsik.dk';
			sbsysDqId = 'DQ16332';
			break;		
	}
	jQuery('#bsikmail').val(mailAdr);
	jQuery('#sbsysdqid').val(sbsysDqId);
}
function calcParticipents()
{
	
	var adults = jQuery('#antalvoksne').val();
	if (adults != '')
	{
		adults = parseInt(adults);
	}
	var chld = jQuery('#antalboern').val();
	if (chld != '')
	{
		chld = parseInt(chld);
	}
	var persons = adults + chld;
	jQuery('#participents').val(persons);
	formular.checkConditions();
}
/*
function settekst()
{
	var artValg = jQuery('#art').val();
	var artAndet = jQuery('#artAndet').val();
	var artTekst = jQuery('#arttekst');
	if (artValg == 'Andet')
	{
		artTekst.val(artAndet);
	}
	else
	{
		artTekst.val(artValg);
		//stedTekst.val(stedValg);
	}
	var stedValg = jQuery('#sted').val();
	var stedAndet = jQuery('#stedAndet').val();
	var stedTekst = jQuery('#stedtekst');
	if (stedValg == 'Andet')
	{
		stedTekst.val(stedAndet);
		//stedTekst.val(stedAndet);
	}
	else
	{
		stedTekst.val(stedValg);
	}	

}*/