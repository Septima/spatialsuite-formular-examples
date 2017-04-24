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
	setTimeout(function() {handleLoginPage(true)},500);
}
function handleLoginPage(hideAll)
{
	var pwField = jQuery('#login');
	pwField.prop('type','password');
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
		}
		else
		{
			jQuery('#cont').val(0);
			alert('Forkert kode!');
			handleLoginPage(true);
		}
		hideSpinner('login');
		setMultipleText(formular,'ds_formular_login','firma,email','login');
		setLeverandoer();
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
	var fil1 = jQuery('#filnavn1').val();
	var fil2 = jQuery('#filnavn2').val();
	var fil3 = jQuery('#filnavn3').val();
	var fil4 = jQuery('#filnavn4').val();
	var filEftersendes = jQuery('#accBoxFile').is(':checked');
	if (typeof checkVal=="string")
	{
		var tmp = jQuery('#'+checkVal);
		if (tmp.is(":checkbox"))
		{
			if (fil1.length == 0 && fil2.length == 0 && 
				fil3.length == 0 && fil4.length == 0 && !filEftersendes)
				{
					alert('Hvis ikke der vedhæftes filer, skal \'Filer eftersendes\' vinges af');
					jQuery('#sendbutton').prop('disabled',true);
					tmp.prop('checked',false);
					return;
				}
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

function setLeverandoer()
{
	var val = jQuery('#firma').val();
	if (val == 'Anden')
	{
		val = jQuery('#leverandoer_ind').val();
	}
	jQuery('#firma').val(val);

}

function setSlamProducent()
{
	var val = jQuery('#slamproducent_valg').val();
	if (val == 'Anden')
	{
		val = jQuery('#slamproducent_ind').val();
	}
	jQuery('#slamproducent').val(val);
	
	val = jQuery('#slamproducent_valg2').val();
	if (val == 'Anden')
	{
		val = jQuery('#slamproducent_ind2').val();
	}
	jQuery('#slamproducent2').val(val);
	
}
function setFosfor()
{
	var val = jQuery('#maengdefosforha_valg').val();
	if (val == 'Anden')
	{
		val = jQuery('#maengdefosforha_ind').val();
	}
	val = val.replace(',','.');
	jQuery('#maengdefosforha').val(val);
	
	val = jQuery('#maengdefosforha_valg2').val();
	if (val == 'Anden')
	{
		val = jQuery('#maengdefosforha_ind2').val();
	}
	val = val.replace(',','.');
	jQuery('#maengdefosforha2').val(val);
}
function setVaerdi(feltId)
{
	var val = jQuery('#' + feltId).val();
	val = val.replace(',','.');
	jQuery('#'+feltId).val(val);
	
//	val = jQuery('#'+feltId).val();
//	val = val.replace(',','.');
//	jQuery('#'+feltId).val(val);
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
							else if (elem.is('select'))
							{
								curValue = curValue.substring(1, curValue.length - 1);
								//elem.option.each(function(index, curElement)
								jQuery('#' + curName + ' option').each(function(index, curElement)
								{
									if (curValue.toLowerCase().indexOf(curElement.value.toLowerCase()) > -1 ||
										curElement.value.toLowerCase().indexOf(curValue.toLowerCase()) > -1)
										{
											jQuery('#' + curName).prop('selectedIndex',index);
										}
									//alert(curElement.text + ' ' + curElement.value + ' idx:' + index);
								});
								
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
function handleArea()
{
	var angivet_areal = jQuery('#angivet_areal').val();
	angivet_areal = angivet_areal.replace(",", ".");
	jQuery('#angivet_areal').val(angivet_areal);

}