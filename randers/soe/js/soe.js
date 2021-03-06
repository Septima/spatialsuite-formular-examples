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
	
	Centralt i JavaScript programmering er muligheden for at få et "håndtag" til et element (en dropdown, en checkbox/bullit, et tekstfelt, en knap, andet)
	Med "håndtaget" kan man tilføje,ændre,slette,skjule mm. Måden man får et "håndtag" er således:
	var mitHaandtag = jQuery('#<elements ID>');
	
	"var" står for variabel og er et nøgleord som skal stå foran alle de elementer vi selv erklære (uanset om det er "håndtag" eller egentlige værdier)
	"mitHaandtag" er navnet på variablen, så man senere kan bruge den til noget.
	"jQuery('#<elementets ID>');" er en metode, som kan returnere et "håndtag" til det element, der har id="<elementets ID>"
	
	Et eksempel fra en xml-fil
	<input type="input" urlparam="mitinput" id="id_som_kan_anvends_i_javascrip" />
	
	I JavaScript kan vi få et håndtag til inputfeltet således:
	var inputHaandtag = jQuery('#id_som_kan_anvends_i_javascrip');
	
	Når vi har et håndtag, kan vi lave om på elementet - for eksempel skjule det:
	inputHaandtag.css('display','none'); 

	Skal man have fat i det brugeren har indtastet kan man gøre således:
	var tekstFraInput = inputHaandtag.val();
	
	Er det kun værdien man er interesseret i, kan man gå den direkte vej;
	var tekstFraInput = jQuery('#id_som_kan_anvends_i_javascrip').val();
	
	I ovenstående eksempler er jQuery anvendt. jQuery er et rammeværktøj (framework), der gør det hurtigere at skrive JavaScript, men det kan give bøvl en gang i mellem.
	Virker jQuery ikke efter hensigten kan man bruge standard JavaScript og metoderne i denne template er blandet sammen. Til sammenligning vil ovenstående eksempel med 
	input feltet se således ud i standard JavaScript:
	var inputHaandtag = document.getElementById('#id_som_kan_anvends_i_javascrip');
	
	inputHaandtag.style.visibility="hidden";

	var tekstFraInput = inputHaandtag.value;
	
	var tekstFraInput = document.getElementById('#id_som_kan_anvends_i_javascrip').value;

	VÆR OPMÆRKSOM PÅ FØLGENDE:
	Har man fået et håndtag via jQuery() kan man ikke anvende JavaScript metoder. Man kan således ikke anvende ".val()" fra jQuery() på et "håndtag"
	skabt af JavaScript - eksempel:
	document.getElementById('#id_som_kan_anvends_i_javascrip').val();
	
	Den jQuery(), som er indlejeret i vores formular motor har lidt problemer med visse elementer (specielt dropdown) - der kan det være nødvendigt (som det også ses
	af metoderne setDropDown,addToDropDown,removeOptions i denne template) at blande standard JavaScript med jQuery()
	
	Generelle programmerings ting:
	skal man sammenligne to værdier anvendes en if (hvis) sætning og dobbelt lighedstegn (==) - eksempel:
	
	var tekstFraInput = jQuery('#id_som_kan_anvends_i_javascrip').val();
	if (tekstFraInput == 'andet')
	{
		//Gør noget
	}
	
	Læg mærket til, at JavaScript/jQuery skelner mellem stor og små bogstaver (case-sensitiv). Taster brugeren i ovenstående eksempel 'Andet' bliver det ikke fanget
	
	Vil man i forbindelse med en IF-sætning også reagere på, hvis ikke den første test bliver opfyldt kan man gøre således:
	if (tekstFraInput == 'andet')
	{
		//Gør noget
	}
	else
	{
		//Gør noget andet
	}
	

*/
/*
*****************
Metoden modtager følgende:
formular: 			et "håndtag" til formularmotoren
datasource:			en datasource (som en tekststreng - eks: <sql command="read-dropdown">SELECT <kolonne1>,<kolonne2>....<kolonneN>,<soegeKolonne> as soegetekst from <Tabel>
searchID:			en tekst streng der repræsentere ID´et for det element, som indeholder værdien der skal søges efter
resultID:			en tekst streng der repræsentere ID´et for det element (en dropdown), der skal modtage data/listen
appendSelectToList:	en boolean (true/false) der indikerer om listen skal have en "Vælg" tekst som det første element. true sætter "Vælg"-værdien ind, false gør ikke
*****************
*/

window.onload = function() 
{
	setTimeout(function() {setDagsDato();},500);
}
function setDagsDato()
{
	var d = new Date();
	var strDate = d.getDate() + '-' + (d.getMonth()+1) + "/" + d.getFullYear();
	jQuery('#dagsdato').val(strDate);
}
function setDropDown(formular, datasource, searchID,resultID, appendSelectToList)
{
	var searchText = jQuery('#'+searchID).val();
	var resultDropDown = document.getElementById(resultID);  //jQuery('#'+resultID);	
	removeOptions(resultDropDown);
	
	var params = {
		page: 'formular.read.dropdown',
		sessionid: formular.sessionid,
		datasource: datasource
	};

	var list = [];
	if (appendSelectToList)
	{
		list.push(
		{
			value: "---",
			name: "Vælg",
		})
		
	}
	jQuery.ajax( {
		url: 'cbkort',
		dataType: 'xml',
		type: 'POST',
		async: false,
		data: params,
		success : function(data, status) 
		{
			var rows = jQuery(data).find('row');
			for (var i=0;i<rows.length;i++) 
			{
				var curValue = jQuery(rows[i]).find('col[name="value"]').text()
				var curName = jQuery(rows[i]).find('col[name="name"]').text()
				var soegeTekst = jQuery(rows[i]).find('col[name="soegetekst"]').text()
				if (soegeTekst == searchText)
				{
					list.push(
					{
						value: curValue,
						name: curName,
						//selected: (i==0)
					});
				}
			}
		}
	});
	
	addToDropDown(list,resultDropDown);
}
/*
**************
Metoden modtager en liste over elementer og "håndtaget" til en dropdown liste, hvorefter listen overføres til dropdown-listen
Anvendes af: setDropDown
**************
*/
function addToDropDown(list,dropDown)
{
    for (var j=0;j<list.length;j++) 
	{
		var opt = document.createElement("option");
		opt.value = list[j].value;
		opt.text = list[j].name;
		dropDown.options.add(opt);
	}
}
/*
**************
Metoden modtager "håndtaget" til en dropdown liste, hvorefter elementerne i dropdown listen slettes.
Anvendes af: setDropDown
**************
*/
function removeOptions(dropDown)
{
    var i;
	if (dropDown.options != null && dropDown.options.length > 0)
	{
		while(dropDown.options.length)
		{
			dropDown.remove(0);
		}
	}
}

/*
**************
Metoden modtager følgende:
formular: 			et "håndtag" til formularmotoren
datasource:			en datasource (som en tekststreng - eks: <sql command="read-dropdown">SELECT <kolonne1>,<kolonne2>....<kolonneN>,<soegeKolonne> as soegetekst from <Tabel>
columnName:			navnet på den kolonne fra SQL´en i datasourcen, hvor data skal hentes
searchID:			en tekst streng der repræsentere ID´et for det element, som indeholder værdien der skal søges efter
resultID:			en tekst streng der repræsentere ID´et for det element (en dropdown), der skal modtage data/listen
**************
*/
function setText(formular, datasource, columnName, searchID, resultID)
{
	var searchText = jQuery('#'+searchID).val();
	var resultObj = jQuery('#'+resultID);
	var result = "";
	var params = {
		page: 'formular.read.dropdown',
		sessionid: formular.sessionid,
		datasource: datasource
	};

	var column = "col[name=\"" + columnName + "\"]";
	//alert('column:' + column);
	jQuery.ajax( {
		url: 'cbkort',
		dataType: 'xml',
		type: 'POST',
		async: false,
		data: params,
		success : function(data, status) 
		{
			var rows = jQuery(data).find('row');
			for (var i=0;i<rows.length;i++) 
			{
				var curValue = jQuery(rows[i]).find(column).text();
				var soegeTekst = jQuery(rows[i]).find('col[name="soegetekst"]').text()
				//alert('searchText:' + searchText + ' -> ' + soegeTekst +' ->' + curValue);
				if (soegeTekst == searchText)
				{
					result = curValue;
					break;
				}
			}
		}
	});
	//alert('searchText: ' + searchText +' -> setText ->result ->' + result +'<-');
	resultObj.val(result);
}


/*
**************
Metoden modtager "håndtaget" til et Septima datofelt og til et hidden-felt der skal indholde den konverterede dato. 
Septimas dato dd.mm.åååå er ikke nemt at sortere efter i en database - det er datoformatet ååååmmdd bedre til

Anvendes af: setDropDown
**************
*/
function convertSeptimaDate(dateField, hiddenField)
{
	var currentDate = jQuery('#' + dateField).val();
	var dateArray = currentDate.split(".")
	var result = dateArray[2] + "" + dateArray[1] + "" + dateArray[0];
	jQuery('#' + hiddenField).val(result);
}

function enableSend(checkVal)
{
	if (checkVal == null)
	{
		document.getElementById('sendbutton').disabled = true;
		return;
	}
	if (checkVal == 0)
	{
		document.getElementById('sendbutton').disabled = true;
	}
	else
	{
		document.getElementById('sendbutton').disabled = false;
	}
}
function lockInputField(checkBoxId, textId)
{
	if (jQuery('#' + checkBoxId).is(':checked'))
	{
		document.getElementById(textId).readOnly = true;
	}
	else
	{
		document.getElementById(textId).readOnly = false;
	}
}

function haandterEjer(konfliktObj,ejerInputFelt)
{
	var myData = konfliktObj[0].attributes.value.nodeValue;
	var ansoeger_org = jQuery('#navn').val();
	var ansoeger = jQuery('#navn').val().toLowerCase();
	var singleDatas = myData.split("\n");
	
	var counter = 0;
	for (var x = 0; x < singleDatas.length; x++)
	{
		var curData = singleDatas[x];
		var singleArr = curData.split(':');
		var curType = singleArr[0];
		var curVaerdi = singleArr[1];
		if (curVaerdi != null)
		{
			curVaerdi = curVaerdi.toLowerCase().trim();
			if (curType == 'Ejer')
			{
				if (ansoeger == curVaerdi)
				{
					jQuery("#ejerOK").val(1);
					jQuery("#navn1").val(ansoeger_org);
					formular.checkConditions();
				}
				else
				{
					jQuery("#ejerOK").val(0);
					formular.checkConditions();
				}
			}
		}
	}
}
function setJournaldata()
{
	var opg = jQuery('#hvad').val();
	var kle = "";
	var facetnr = "";
	switch (opg)
	{
		case "nyt vandhul":
			kle="01.03.03";
			facetnr="P16";
			break;
		case "oprensning af vandhul":
			kle="01.05.08";
			facetnr="K08";
			break;
		case "udvidelse af vandhul":
			kle="01.05.08";
			facetnr="K08";
			break;			
	}
	jQuery('#klenummer').val(kle);
	jQuery('#facetnummer').val(facetnr);
		
}