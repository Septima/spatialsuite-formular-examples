window.onload = function() 
{
	setTimeout(function() {setDagsDato()},200);
}
function setDagsDato()
{
	var d = new Date();
	var month = '0' + (d.getMonth()+1);
	var monthTwoLetters = month.substr(month.length - 2);
	var setRev_dato = d.getDate() + '.' + monthTwoLetters + "." + d.getFullYear();
	jQuery('#dagsdato').val(setRev_dato);
}
function geomSelected(formularObj)
{
	var wkt = jQuery('#address_wkt').val();
	if (wkt != null && wkt.length > 0)
	{
		formularObj.features = [{wkt: wkt}]
		formularObj.mergedFeature = wkt;
		formularObj.query (formularObj.features);
		jQuery('#wkt').val(wkt);
		jQuery('#address_wkt').val("");
	}
}
function update()
{
	var husNr = jQuery('#husnr').val();
	var vejnavn = jQuery('#adr').val();
	jQuery('#adr').val(vejnavn + ' ' + husNr)
}
function handleOwner(konfliktVal)
{
	if (konfliktVal == null)
	{
		jQuery('#navn').val("");
		return;
	}
	//hent ejendomsnr;
	var tmp = "";
	var tmpName = "";
	var allNames = "";
	var ejdNr = "";
	var konValue = konfliktVal[0].value;
	konValue = konValue.replace(/[\n\r]/g, ';'); 
	var valArray = konValue.split(';');
	for (index = 0; index < valArray.length; ++index) 
	{
		tmp = valArray[index];
		if (tmp.toLowerCase().indexOf('ejer') > -1)
		{
			var ejdArray = tmp.split(':');
			tmpName = ejdArray[1].trim();
			allNames += tmpName + ",";
		}
	}
	if (allNames.length > 0)
	{
		allNames = allNames.substring(0,allNames.length-1);
	}
	jQuery('#navn').val(allNames);
	jQuery('#container_conflictdiv_konflikt1').hide();
}
function handleSagsbehandler(konfliktVal)
{
	if (konfliktVal == null)
	{
		jQuery('#sbsys_brugerid').val("");
		return;
	}
	//hent ejendomsnr;
	var tmp = "";
	var dqNummer = "";
	var sagsbehandler = "";
	
	var konValue = konfliktVal[0].value;
	konValue = konValue.replace(/[\n\r]/g, ';'); 
	var valArray = konValue.split(';');
	for (index = 0; index < valArray.length; ++index) 
	{
		tmp = valArray[index];
		if (tmp.toLowerCase().indexOf('dq') > -1)
		{
			var ejdArray = tmp.split(':');
			dqNummer = ejdArray[1].trim();
		}
		if (tmp.toLowerCase().indexOf('sagsbehandler') > -1)
		{
			var ejdArray = tmp.split(':');
			sagsbehandler = ejdArray[1].trim();
		}
		
	}
	jQuery('#sbsys_brugerid').val(dqNummer);
	jQuery('#sagsbehandler').val(sagsbehandler);
	jQuery('#container_conflictdiv_konflikt2').hide();
}