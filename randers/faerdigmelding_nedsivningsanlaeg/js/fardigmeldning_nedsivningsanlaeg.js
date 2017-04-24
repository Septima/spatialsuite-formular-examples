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
	//enableSend(0);
	setDagsDato();
}
function fortsaet()
{
	jQuery('#tab1').click();
	//enableSend(0);
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
			setMultipleText(formular,'ds_formular_login','navn,firma,cvrnr,adresse,firmaadresse,email1,email2','login');
			//enableSend(1);
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
	if (checkVal == 0)
	{
		jQuery('#sendbutton').prop('disabled',true);
	}
	else
	{
		jQuery('#sendbutton').prop('disabled',false);
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
function updateEjdAdr(ejdOpl, visData)
{
	var ejdAdreOpl = '';
	if (visData)
	{
		var ejdValue = ejdOpl[0].value;
		ejdValue = ejdValue.replace(/[\n\r]/g, ';'); 
		var valArray = ejdValue.split(':');
		if (valArray.length > 0)
		{
			var ejdAdreOplarray = valArray[1].split(';');
			if (ejdAdreOplarray.length > 0)
			{
				var adrArray = ejdAdreOplarray[0].split(',');
				if (adrArray.length > 1)
				{
					var vej = adrArray[0].trim();
					var postnr = adrArray[1].trim();
					ejdAdreOpl = vej + ', ' + postnr;
				}
			}
		}

	}
	jQuery('#ejendommens_adresse').val(ejdAdreOpl);
}
function setSagsbehandler(sagsbehandlerdata, visData)
{
	jQuery('#conflictdiv_sagsbehandler').hide();
	var navn = '';
	if (sagsbehandlerdata != null && sagsbehandlerdata.length > 0)
	{
		var sagsbehandler = sagsbehandlerdata[0].value.replace(/[\n\r]/g, ''); 
		var valArray = sagsbehandler.split(':');
		if (valArray != null && valArray.length > 0)
		{
			navn = valArray[1].toLowerCase();
		}
	}
	var sbsysbruger = ''
	var mail = 'kmr@randers.dk'
	switch(navn)
	{
		case 'peter høeg':
			sbsysbruger = 'apkt037';
			break;
		case 'per eriksen':
			sbsysbruger = 'apkt108';
			break;
		case 'jeanette rosager-hansen':
			sbsysbruger = 'apkt039';
			break;
		case 'jonna ploug':
			sbsysbruger = 'apkt048';
			break;
		case 'anja fisker jensen':
			sbsysbruger = 'dq15585';
			break;
		case 'jakob aarup':
			sbsysbruger = 'dq22274';
			mail = 'Jakob.Aarup@randers.dk'
			break;
		case 'christina sass møller':
			sbsysbruger = 'dq15432';
			mail = 'Christina.Sass.Moller@randers.dk'
			break;
    
	}
	jQuery('#sbsys_brugerid').val(sbsysbruger);
	jQuery('#mail_intern').val(mail);
}
function haandterEjer(konfliktObj)
{
	var myData = konfliktObj[0].attributes.value.value;
	var ansoeger_org = jQuery('#navn').val();
	var ansoeger = jQuery('#navn').val().toLowerCase();
	var singleDatas = null;
	if (myData.indexOf("\r") > 0)
	{
		//IE Hack
		singleDatas = myData.split("\r");
	}
	else
	{
		singleDatas = myData.split("\n");
	}

	var ejdAdreOpl = '';
	var counter = 0;
	for (var x = 0; x < singleDatas.length; x++)
	{
		var curData = singleDatas[x];
		var singleArr = curData.split(':');
		var curType = singleArr[0];
		var curVaerdi = singleArr[1];
		if (curVaerdi != null)
		{
			curVaerdi = curVaerdi.replace(/^\s+|\s+$/g, '');
			if (curType == 'Ejer')
			{
				jQuery('#enavn').val(curVaerdi);
			}
			if (curType == 'Adresse')
			{
				var adrArray = curVaerdi.split(',');
				if (adrArray.length > 1)
				{
					var vej = adrArray[0].trim();
					var postnr = adrArray[1].trim();
					ejdAdreOpl = vej + ', ' + postnr;
				}

				jQuery('#eadresse').val(ejdAdreOpl);
			}
		}
	}
}
function haandterSBSYS(konfliktObj)
{
	var myData = konfliktObj[0].attributes.value.value;
	var singleDatas = null;
	if (myData.indexOf("\r") > 0)
	{
		//IE Hack
		singleDatas = myData.split("\r");
	}
	else
	{
		singleDatas = myData.split("\n");
	}

	var ejdAdreOpl = '';
	var counter = 0;
	for (var x = 0; x < singleDatas.length; x++)
	{
		var curData = singleDatas[x];
		var singleArr = curData.split(':');
		var curType = singleArr[0];
		var curVaerdi = singleArr[1];
		if (curVaerdi != null)
		{
			curVaerdi = curVaerdi.replace(/^\s+|\s+$/g, '');
			if (curType == 'Journalnummer')
			{
				jQuery('#journalnr').val(curVaerdi);
				//return;
			}
			else if (curType == 'Ejers adresse')
			{
				jQuery('#eadresse').val(curVaerdi)
			}
			else if (curType == 'Ejers navn')
			{
				jQuery('#enavn').val(curVaerdi)
			}
			else if (curType == 'Ejendommens adresse')
			{
				jQuery('#ejendommens_adresse').val(curVaerdi)
			}
			
		}
	}
}
function updateAdr()
{
	var vaerdi = jQuery('#address_soeg').val();
	jQuery('#ejendommens_adresse').val(vaerdi);
}
function updateValue(inputId)
{
	var vaerdi = jQuery('#'+ inputId +'').val();
	vaerdi = vaerdi.replace(',','.');
	jQuery('#'+ inputId +'').val(vaerdi);
}

