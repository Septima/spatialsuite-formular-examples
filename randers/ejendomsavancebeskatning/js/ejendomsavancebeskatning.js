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
	var showLoginPage = true;
	var queryStr = window.location.search.replace(/^\?/, "");
	var params = queryStr.split('&');
	for (i=0;i<params.length;i++)
	{
		var curParam = params[i];
		if (curParam.indexOf('navn') > -1)
		{
			showLoginPage = false;
		}
	}
	if (showLoginPage)
	{
		setTimeout(function() {handleLoginPage(true)},500);
	}
	else
	{
		setTimeout(function() {fortsaet()},500);
	}
	
}
function handleLoginPage(hideAll)
{
	var length = 0;
	var loginPage = false;
	var godkendPagePresent = false;
	var elements = jQuery('#content').children(); //jQuery("div").children();
	//alert("elements.length" + elements.length);
	elements.each(	function(index,element)
	{                 
        var idx = index;
		var curHtml = $(this).html();
		if (curHtml.indexOf('Login') >= 0)
		{
			if (curHtml.indexOf('Godkend') >= 0)
			{
				godkendPagePresent = true;
			}
			var curChildren = $(this).children();
			length = $(this).children().length;
			if (length > 1)
			{
				var firstElem = $(this).children().first().text();
				if (firstElem == 'Login')
				{
					loginPage = true;
					return false;
				}
			}
		}
	})
	//alert('length:' + length)
	if (loginPage && length > 1)
	{
		var newCounter = (length / 2 ) + 0.5;
		//alert ('newCounter:' + newCounter);
		for (var i = 1; i <= newCounter; i++)
		{
			var name = "tab" + i;
			var tabElements = jQuery('#'+name);
			//alert('tab:' + name);
			if (hideAll)
			{
				tabElements.hide();
			}
			else
			{
				tabElements.show();
			}
		}
		if (hideAll)
		{
			jQuery('#next0').hide();
			if (godkendPagePresent)
			{
				jQuery('#tabconfirm').hide();
			}
		}
		else
		{
			jQuery('#next0').show();
			if (godkendPagePresent)
			{
				jQuery('#tabconfirm').show();
			}
		}
	}
	enableSend(0);
	setDagsDato();
}
function fortsaet()
{
	jQuery('#tab1').click();
	setDagsDato();
}
function login()
{
	var login = jQuery('#login').val();
	var result = "";
	if (login.length > 7)
	{
		showSpinner('login');
		result = getText(formular,'ds_formular_login','kode','login');
		if (result.length > 0)
		{
			jQuery('#cont').val(1);
			alert('Login OK!');
			handleLoginPage(false);
			setMultipleText(formular,'ds_formular_login','navn,firma,cvrnr,firmaadresse','login');
			enableSend(1);
		}
		else
		{
			jQuery('#cont').val(0);
			alert('Forkert kode!');
			handleLoginPage(true);
		}
		hideSpinner('login')
	}
}
function setDagsDato()
{
	var d = new Date();
	var strDate = d.getDate() + '-' + (d.getMonth()+1) + "/" + d.getFullYear();
	jQuery('#dagsdato').val(strDate);
}
function showSpinner(elementName) 
{
	var ddPos = jQuery('#' + elementName).position();
	var ddPosLeft = ddPos.left;
	var ddPosTop = ddPos.top - 5; //flytter spinneren lidt op
	var img = document.createElement("img");
	img.src = "/images/standard/loading/loader_l.gif";
	img.id = "spinner-" + elementName;
	img.style.left = ddPosLeft + "px";
	img.style.top = ddPosTop + "px";
	img.style.position  = "absolute";
	img.style.zIndex = "100";
	var src = document.getElementById("content");
	src.appendChild(img);
}
function hideSpinner(elementName)
{
	var navn = "spinner-" + elementName;
	var dims = document.getElementById(navn);
	dims.parentNode.removeChild(dims);
}
function AreaChanged()
{
	alert('Kort funktion færdig');
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
			name: "Vælg"
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
						name: curName
						//selected: (i==0)
					});
				}
			}
		}
	});
	
	addToDropDown(list,resultDropDown);
}
function addToDropDown(list,dropDown)
{
    for (var j=0;j<list.length;j++) 
	{
		var opt = document.createElement("option");
		opt.value = list[j].value;
		opt.text = list[j].name;
		dropDown.options.add(opt);
		//resultDropDown.append('<option value="'+list[j].value+'"'+checked+'>'+list[j].name+'</option>');
	}
}
function removeOptions(selectbox)
{
    var i;
	if (selectbox.options != null && selectbox.options.length > 0)
	{
		while(selectbox.options.length)
		{
			selectbox.remove(0);
		}
	}
}
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
function lockSendBtn()
{
	if (jQuery('#laasSendKnap').is(':checked'))
	{
		jQuery('#sendbutton').attr('disabled' , true);
	}
	else
	{
		jQuery('#sendbutton').attr('disabled' , false);
	}
}
function lockInputField()
{
	if (jQuery('#laasInputFelt').is(':checked'))
	{
		document.getElementById('inputFeltLaas').readOnly = true;
	}
	else
	{
		document.getElementById('inputFeltLaas').readOnly = false;
	}
}
function checkTextLength(maxlaengde,soegeId)
{
	if (jQuery('#' + soegeId).val().length > maxlaengde)
	{
		alert('Hertil og ikke længere');
		var txt = jQuery('#' + soegeId).val();
		txt = txt.substring(0,maxlaengde);
		jQuery('#' + soegeId).val(txt);
	}
}
function setRefTekst(id)
{
	jQuery('#txtId').val(id);
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
	//alert('convertSeptimaDate: " + result);
	jQuery('#' + hiddenField).val(result);
}
function showWKT(formular)
{
	var wkt = formular.feature.wkt;
	alert('wkt:' + wkt);
}
function zoomToEx(formularObj)
{
	var val = jQuery('#zoomTo').val();
	alert(val);
	if (val == "1")
	{
		formularObj.map.zoomToExtent({x1:563560,y1:6257686,x2:563580,y2:6257706},100);
	}
	else
	{
		formularObj.map.zoomToExtent({x1:563860,y1:6257686,x2:563880,y2:6257706},100);
	}
}
function getText(formular, datasource, columnName, searchID)
{
	var searchText = jQuery('#'+searchID).val();
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
	return result;
}
function enableSend(checkVal)
{
	if (checkVal == null)
	{
		jQuery('#sendbutton').prop('disabled',true);
		return;
	}
	if (typeof checkVal=="string")
	{
		var tmp = jQuery('#'+checkVal);
		if (tmp.is(":checkbox"))
		{
			if (tmp.is(':checked'))
			{
				jQuery('#sendbutton').prop('disabled',false);
			}
			else
			{
				jQuery('#sendbutton').prop('disabled',true);
			}
		}
		return;
	}
	if (checkVal == 0)
	{
		jQuery('#sendbutton').prop('disabled',true);
	}
	else
	{
		jQuery('#sendbutton').prop('disabled',false);
	}
}

function skjulKonflit(konfliktObj)
{
	var tmp = konfliktObj;
	var len = konfliktObj.length;
	for (var i= 0; i<len; i++)
	{
		try
		{
			var current = konfliktObj[i];
			current.parentElement.firstChild.style.display = "none";
			//current.parentElement.firstChild.cssText = "display: none";
		}
		catch(err)
		{
			var tmp2 = err;
		}			
	}
}
function handleConflict(myValue)
{
	try 
	{
		switch (myValue)
		{
			case 'lokalplan':
			  jQuery('#'+myValue).val('ja');
			  break;
			case 'kommuneplan':
			  jQuery('#'+myValue).val('ja');
			  break;
			case 'landzone':
			  jQuery('#'+myValue).val('nej'); //Hvis der er konflikt med denne, saa er det i byzone eller sommerhus - derfor nej til landzone
			  break;
		}
	} 
	catch(err)	
	{
		return false;
    }
	setStraksSvar();
	logValue();
}
function resetConflict(myValue)
{
	try 
	{
		switch (myValue)
		{
			case 'lokalplan':
			  jQuery('#'+myValue).val('nej');
			  break;
			case 'kommuneplan':
			  jQuery('#'+myValue).val('nej');
			  break;
			case 'landzone':
			  jQuery('#'+myValue).val('ja'); //Hvis der IKKE er konflikt med denne, saa er det i landzonen - derfor nej til landzone
			  break;
		}
	} 
	catch(err)	
	{
		return false;
    }
	setStraksSvar();
	
}
function setStraksSvar()
{
	var landzone = jQuery('#landzone').val();
	var kommuneplan = jQuery('#kommuneplan').val();
	var lokalplan = jQuery('#lokalplan').val();
	if (landzone == 'ja' &&
		kommuneplan == 'nej' &&
		lokalplan == 'nej')
	{
		jQuery('#straksafg').val('ja');
	}
	else
	{
		jQuery('#straksafg').val('nej');
	}
}

function logValue()
{
	var myValue = 'Lokalplan:' + jQuery('#lokalplan').val() + ' /kommuneplan:' + jQuery('#kommuneplan').val() + ' /landzone:' + jQuery('#landzone').val() + ' /areal:' + jQuery('#samletareal').val();
	//console.log(myValue);
	//jQuery('#status').val(myValue);
}
function handleEjendom(konfliktVal)
{
	//hent ejendomsnr;
	var tmp = "";
	var tmpEjdNr = "";
	var ejdNr = "";
	var konValue = konfliktVal[0].value;
	konValue = konValue.replace(/[\n\r]/g, ';'); 
	var valArray = konValue.split(';');
	for (index = 0; index < valArray.length; ++index) 
	{
		tmp = valArray[index];
		if (tmp.toLowerCase().indexOf('ejend') > -1)
		{
			var ejdArray = tmp.split(':');
			tmpEjdNr = ejdArray[1].trim();
			if (ejdNr.length == 0)
			{
				ejdNr = tmpEjdNr;
			}
			else
			{
				if (tmpEjdNr != ejdNr)
				{
					alert('Det er ikke muligt at vælge matrikler fra flere forskellige ejendomme');
					jQuery('#sendbutton').prop("disabled",true);
					return;
				}
			}
		}
	}
	jQuery('#sendbutton').prop("disabled",false);
	//console.log(ejdNr);
	var area = 0;
	area = getArea(formular,ejdNr);
	
	//if (area < 1400)
	//{
//		alert('Det samlet areal er mindre en 1400 m2 - du kan derfor ikke forvente at få tilladelse!');	
//	}
	
	var matrNrs = getMatr(formular,ejdNr);
	jQuery('#samletareal').val(area);
	jQuery('#samletmatr').val(matrNrs);
}
function resetEjendom()
{
	jQuery('#samletareal').val(0);
	jQuery('#samletmatr').val("");
}
function setMultipleText(formular, datasource, columnNames, searchID)
{
	var searchText = jQuery('#'+searchID).val();
	//var resultObj = jQuery('#'+resultID);
	var colNamesArray = columnNames.split(",");
	var result = "";
	var params = {
		page: 'formular.read.dropdown',
		sessionid: formular.sessionid,
		datasource: datasource
	};

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
				var soegeTekst = jQuery(rows[i]).find('col[name="soegetekst"]').text()
				//alert('searchText:' + searchText + ' -> ' + soegeTekst +' ->' + curValue);
				if (soegeTekst == searchText)
				{
					for (var j=0;j<colNamesArray.length; j++)
					{
						var curName = colNamesArray[j];
						var column = "col[name=\"" + curName + "\"]";
						var curValue = jQuery(rows[i]).find(column).text();
						if (curValue != null)
						{
							//jQuery('#'+curName).val(curValue);
							var elem = jQuery('#'+curName);
							if (elem.is('input:checkbox'))
							{
								if (curValue.toLowerCase() == 'true')
								{
									elem.prop("checked", true);
								}
								else
								{
									elem.prop("checked", false);
								}
							}
							else
							{
								elem.val(curValue);
							}
						}
					}
					break;
				}
			}
		}
	});
	//alert('searchText: ' + searchText +' -> setText ->result ->' + result +'<-');
}
function getArea(formular, ejdnr)
{
	var result = "";
	datasource = 'ds_ejendomsopslag';
	var params = {
		page: 'formular.ejendomsavancebeskatning.getEjendomArea',
		command: 'read',
		sessionid: formular.sessionid,
		ejdnr: ejdnr 
	};

	var column = "col[name=\"sum\"]";
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
				result = jQuery(rows[i]).find(column).text();
			}
		}
	});
	//alert('searchText: ' + searchText +' -> setText ->result ->' + result +'<-');
	return result;
}
function getMatr(formular, ejdnr)
{
	var result = "";
	datasource = 'ds_ejendomsopslag';
	var params = {
		page: 'formular.ejendomsavancebeskatning.getEjendomArea',
		command: 'readmatr',
		sessionid: formular.sessionid,
		ejdnr: ejdnr 
	};

	var column = "col[name=\"matr\"]";
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
				result += jQuery(rows[i]).find(column).text() + ','
			}
		}
	});
	if (result.length > 0)
	{
		result = result.substring(0,result.length-1);
	}
	//alert('searchText: ' + searchText +' -> setText ->result ->' + result +'<-');
	return result;
}
function handleAddress(data)
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
				var tmp = curVaerdi.toString().toLowerCase();
				curVaerdi = tmp.replace(/^\s+|\s+$/g, '');
				
				if (curType == 'Adresse')
				{
					jQuery('#ejendomadr').val(curVaerdi);
				}
			}
		}
	}	
}