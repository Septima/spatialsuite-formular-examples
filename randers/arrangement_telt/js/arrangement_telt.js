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
	jQuery('#journr').prop('readonly', true);
	formular.countDays(jQuery('#date1').val(),jQuery('#date2').val(),'days')
	
}
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

}
function setMail()
{
	var kommune = jQuery('#kommune').val();
	var mailAdr = 'omrvest@bsik.dk';
	switch (kommune)
	{
		case 'randers':
			mailAdr = 'omrvest@bsik.dk';
			break;
		case 'favrskov':
			mailAdr = 'omrvest@bsik.dk';
			break;
		case 'norddjurs':
			mailAdr = 'omrnord@bsik.dk';
			break;
		case 'syddjurs':
			mailAdr = 'omrsyd@bsik.dk';
			break;
		default:
			mailAdr = 'omrvest@bsik.dk';
			break;		
	}
	jQuery('#bsikmail').val(mailAdr);
}
function handleContinue()
{
	var baseUrl = jQuery(location).prop('host');
	var loc = "http://" +baseUrl + "?page=formular&formular=arrangement150&journr=" + formular.currentParams.journalnr + "&antalpersoner=" + formular.currentParams.antalpersoner + "&startdato=" +formular.currentParams.startdato +"&slutdato=" +formular.currentParams.slutdato + "&address=" +formular.currentParams.address + "&start_tid=" + formular.currentParams.start_tid + "&slut_tid=" + formular.currentParams.slut_tid + "&navn=" + formular.currentParams.navn + "&adresse2=" + formular.currentParams.adresseansvarlig + "&tlf=" + formular.currentParams.tlf + "&frid=" + formular.currentParams.frid;
	window.open(loc, '_blank');}