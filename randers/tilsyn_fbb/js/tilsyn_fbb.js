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
	setTimeout(function() {setDagsDato();},500);
}
function setDagsDato()
{
	var d = new Date();
	var strDate = d.getDate() + '-' + (d.getMonth()+1) + "-" + d.getFullYear();
	jQuery('#dagsdato').val(strDate);
}

function handleAddress(data)
{
	$('#adr').empty();
	if (data != null && typeof data[0] !== 'undefined')
	{
		var myData = data[0].attributes.value.value;
		var singleDatas = null; //myData.split("\n");
		if (myData.indexOf("\r") > 0)
		{
			//IE Hack
			singleDatas = myData.split("\r");
		}
		else
		{
			singleDatas = myData.split("\n");
		}

		var counter = 0;
		var ownerFound = false;
		for (var x = 0; x < singleDatas.length; x++)
		{
			var curData = singleDatas[x];
			var singleArr = curData.split(':');
			var curType = singleArr[0];
			var curVaerdi = singleArr[1];
			if (curVaerdi != null)
			{
				var tmp = curVaerdi.toString();
				curVaerdi = tmp.replace(/^\s+|\s+$/g, '');
				
				if (curType == 'Adresse')
				{
					$('#adr').append($('<option></option>').val(curVaerdi).html(curVaerdi));
				}
			}
		}
	}
	var curAdr = jQuery('#adresse').val();
	$('#adr').append($('<option></option>').val(curAdr).html(curAdr));

	jQuery('#container_conflictdiv_adrsoeg').css("display", "none");
}
function handleEjd(data)
{
	if (data == null)
	{
		jQuery('#bygnr').val('1');
		return;
	}
	if (typeof data[0] !== 'undefined')
	{
		var myData = data[0].attributes.value.value;
		var singleDatas = null; //myData.split("\n");
		if (myData.indexOf("\r") > 0)
		{
			//IE Hack
			singleDatas = myData.split("\r");
		}
		else
		{
			singleDatas = myData.split("\n");
		}

		var counter = 0;
		var ownerFound = false;
		for (var x = 0; x < singleDatas.length; x++)
		{
			var curData = singleDatas[x];
			var singleArr = curData.split(':');
			var curType = singleArr[0];
			var curVaerdi = singleArr[1];
			if (curVaerdi != null)
			{
				var tmp = curVaerdi.toString();
				curVaerdi = tmp.replace(/^\s+|\s+$/g, '');
				
				if (curType == 'Bygnings nr')
				{
					jQuery('#bygnr').val(curVaerdi);
				}
			}
		}
	}
}
function handleEjdNr(data)
{
	if (typeof data[0] !== 'undefined')
	{
		var myData = data[0].attributes.value.value;
		var singleDatas = null; //myData.split("\n");
		if (myData.indexOf("\r") > 0)
		{
			//IE Hack
			singleDatas = myData.split("\r");
		}
		else
		{
			singleDatas = myData.split("\n");
		}

		var counter = 0;
		var ownerFound = false;
		for (var x = 0; x < singleDatas.length; x++)
		{
			var curData = singleDatas[x];
			var singleArr = curData.split(':');
			var curType = singleArr[0];
			var curVaerdi = singleArr[1];
			if (curVaerdi != null)
			{
				var tmp = curVaerdi.toString();
				curVaerdi = tmp.replace(/^\s+|\s+$/g, '');
				
				if (curType == 'Ejendomsnr')
				{
					jQuery('#ejdnr').val(curVaerdi);
				}
			}
		}
	}
}