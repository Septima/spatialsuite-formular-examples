window.onload = function() 
{
	setTimeout(function() {setDagsDato();},300);
}
function setDagsDato()
{
	var d = new Date();
	var strDate = d.getDate() + '/' + (d.getMonth()+1) + "-" + d.getFullYear();
	jQuery('#dagsdato').val(strDate);
	jQuery('#aar').val(d.getFullYear());
	var setDatoTilsyn = d.getDate() + '.' + (d.getMonth()+1) + "." + d.getFullYear();
	jQuery('#dato_tilsyn').val(setDatoTilsyn);
	setDropDown(formular,'ds_miljoetilsyn_virksomhedstyper','','virksomhedstype',true);
	setAutocomplete();
}
function setSbsysBrugerId()
{
	var ansvarlig = jQuery('#tilsyn_udfoert_af').val();
	var id = "";
	switch(ansvarlig)
	{
		case "Per Eriksen":
			id = "apkt037";
			break;
		case "Peter Høeg":
			id = "apkt180";
			break;
		case "Jonna Ploug":
			id = "apkt039";
			break;
		case "Jeanette Rosager-Hansen":
			id = "apkt048";
			break;
		case "Anja Fisker Jensen":
			id = "dq15585";
			break;
		case "Freddy Fisker Sørensen":
			id = "dq16570";
			break;
		case "Rene Chris Jensen":
			id = "dq10981";
			break;
			}
	jQuery('#sbsys_brugerid').val(id)
}
function setSagsbehandlerMail()
{
	var ansvarlig = jQuery('#tilsyn_udfoert_af').val();
	var mail = "";
	switch(ansvarlig)
	{
		case "Per Eriksen":
			mail = "per.eriksen@randers.dk";
			break;
		case "Peter Høeg":
			mail = "peter.hoeg@randers.dk";
			break;
		case "Jonna Ploug":
			mail = "jonna.ploug@randers.dk";
			break;
		case "Jeanette Rosager-Hansen":
			mail = "jrh@randers.dk";
			break;
		case "Anja Fisker Jensen":
			mail = "afj@randers.dk";
			break;
		case "Freddy Fisker Sørensen":
			id = "freddy.fisker.sorensen@randers.dk";
			break;
		case "Rene Chris Jensen":
			mail = "rcj@randers.dk";
			break;
	}
	jQuery('#sagsbehandler_mail').val(mail)
}
function setSagsbehandlerTlf()
{
	var ansvarlig = jQuery('#tilsyn_udfoert_af').val();
	var tlf = "";
	switch(ansvarlig)
	{
		case "Per Eriksen":
			tlf = "89151684";
			break;
		case "Peter Høeg":
			tlf = "89151682";
			break;
		case "Jonna Ploug":
			tlf = "89151687";
			break;
		case "Jeanette Rosager-Hansen":
			tlf = "89151685";
			break;
		case "Anja Fisker Jensen":
			tlf = "89151747";
			break;
		case "Freddy Fisker Sørensen":
			id = "89151704";
			break;
		case "Rene Chris Jensen":
			tlf = "89151853";
			break;
	}
	jQuery('#sagsbehandler_tlf').val(tlf)
}

function setAutocomplete()
{
	showSpinner('soeg_adresse');
	var list = createList();
	jQuery('input#soeg_adresse').autocomplete({
		selectFirst : true,
		source: list,
		delay: 200,
		minLength : 3,
		select: function( event, ui ) {elementSelectedAnmeld(event, ui)}
		
	});
	setTimeout(continueExecution, 2000)
	
}
function continueExecution()
{
	hideSpinner('soeg_adresse');
}
function createList()
{
	var params = {
		page: 'formular.send.miljoetilsyn.readall'
	};

	var list = [];

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
				
				
				var curValue = jQuery(rows[i]).find('col[name="adresse_officiel"]').text() + ' (' +jQuery(rows[i]).find('col[name="navn"]').text() + ')'
				var curName = jQuery(rows[i]).find('col[name="pnr"]').text();
				
				list.push(
				{
					value: curValue,
					name: curName
					//selected: (i==0)
				});

			}
			if (list.length > 0)
			{
				jQuery('#listerror').val('false');
			}
			else
			{
				jQuery('#listerror').val('true');
			}
		
		},
		error : function(xhr,status, error) 
		{
			jQuery('#listerror').val('true');
		}
	});
	//update formular
	formular.checkConditions();
	return list;
}
function elementSelectedAnmeld(event, ui)
{
	var id = ui.item.name;
	var params = {
		page: 'formular.send.miljoetilsyn.readall',
		command: 'readgeom',
		pnr: id
	};

	var curWKT = '';
	var curCVR = '';
	var curPnr = '';
	var curNavn = '';
	var curAdr = '';
	var curTLF = '';
	var curPostnr = '';
	var curPostdist = '';
	var curPostNrDist = '';
	var curAnt_incl_ejere = '';
	var curEnh_startdato = '';
	var opstartsdato = '';
	var shape_wkt = '';
	var curE_mail = '';
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
				curWKT = jQuery(rows[i]).find('col[name="wkb_geometry"]').text();
				shape_wkt = jQuery(rows[i]).find('col[name="shape_wkt"]').text();
				curCVR = jQuery(rows[i]).find('col[name="cvrnr"]').text();
				curPnr = jQuery(rows[i]).find('col[name="pnr"]').text();
				curNavn = jQuery(rows[i]).find('col[name="navn"]').text();
				curAdr = jQuery(rows[i]).find('col[name="adresse_officiel"]').text();
				curTLF = jQuery(rows[i]).find('col[name="telefonnummer"]').text();
				curPostnr = jQuery(rows[i]).find('col[name="postnr_officiel"]').text();
				curPostdist = jQuery(rows[i]).find('col[name="postdist_officiel"]').text();
				curPostNrDist = curPostnr + ' ' + curPostdist
				curAnt_incl_ejere = jQuery(rows[i]).find('col[name="ant_incl_ejere"]').text();
				curEnh_startdato = jQuery(rows[i]).find('col[name="enh_startdato"]').text();
				opstartsdato = curEnh_startdato.substring(6, 8) + '/' + curEnh_startdato.substring(4, 6) + '-' + curEnh_startdato.substring(0, 4);
				curE_mail = jQuery(rows[i]).find('col[name="e_mail"]').text();
			}
		}
	});
	if (curWKT.length > 0)
	{
		jQuery('#soeg_adresse_wkt').val(curWKT);
	}
	else if (shape_wkt.length > 0)
	{
		jQuery('#soeg_adresse_wkt').val(shape_wkt);
	}
	jQuery('#soeg_adresse_wkt').val(curWKT);
	jQuery('#cvr_nummer').val(curCVR);
	jQuery('#p_nummer').val(curPnr);
	jQuery('#virksomhed').val(curNavn);
	jQuery('#virksomhed_adresse').val(curAdr);
	jQuery('#virksomhed_tlf').val(curTLF);
	jQuery('#virksomhed_postnr_by').val(curPostNrDist);
	jQuery('#antal_ansatte').val(curAnt_incl_ejere);
	jQuery('#opstartsdato').val(opstartsdato);
	jQuery('#virksomhed_mail').val(curE_mail);

	if (curWKT.length > 0)
	{
		formular.map.drawWKT(curWKT,function(event) 
			{
				setTimeout(SpatialMap.Function.bind(function (id) {formular.map.deleteFeature(id);},null,event.id),100);
			},
			{zoomto: true, styles: {fillOpacity: 100,strokeOpacity: 0}}
		)
	}
	else if (shape_wkt.length > 0)
	{
		formular.map.drawWKT(shape_wkt,function(event) 
			{
				setTimeout(SpatialMap.Function.bind(function (id) {formular.map.deleteFeature(id);},null,event.id),100);
			},
			{zoomto: true, styles: {fillOpacity: 100,strokeOpacity: 0}}
		)
	
	}
	
}


function elementSelectedTrans(event, ui)
{
	elementSelected(event,ui,'trans');
}

function elementSelected(event, ui, prefix)
{
	var tmp = ui;
	var id = ui.item.name;
	var tmp2 = event;
	var params = {
		page: 'formular.lookup.jordflytning.cvrdata',
		command: 'readall',
		cvrnr: id
	};

	var list = [];

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
				var curName = jQuery(rows[i]).find('col[name="navn"]').text();
				var curAdr = jQuery(rows[i]).find('col[name="adresse"]').text();
				var curMail = jQuery(rows[i]).find('col[name="mail"]').text();
				var curTlf = jQuery(rows[i]).find('col[name="tlf"]').text();
				jQuery('#' + prefix + 'navn').val(curName);
				jQuery('#' + prefix + 'adr').val(curAdr);
				jQuery('#' + prefix + 'mail').val(curMail);
				jQuery('#' + prefix + 'tlf').val(curTlf);
			}
		}
	});
}
function showSpinner(elementName) 
{
	var elmPos = jQuery('#' + elementName).position();
	var elmPosLeft = elmPos.left;
	var elmPosTop = elmPos.top - 5; //flytter spinneren lidt op
	var img = document.createElement("img");
	img.src = "/images/standard/loading/loader_l.gif";
	img.id = "spinner-" + elementName;
	img.style.left = elmPosLeft + "px";
	img.style.top = elmPosTop + "px";
	img.style.position  = "absolute";
	img.style.zIndex = "100";
	var src = document.getElementById("content");
	src.appendChild(img);
}
function hideSpinner(elementName)
{
	var navn = "spinner-" + elementName;
	var spinner = document.getElementById(navn);
	spinner.parentNode.removeChild(spinner);
}
function setDropDown(formular, datasource, searchID,resultID, appendSelectToList)
{
	var searchText = jQuery('#'+searchID).val();
	if (typeof searchText == 'undefined')
	{
		searchText = '';
	}
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
			value: "",
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
				if (searchText.length == 0)
				{
					list.push(
					{
						value: curValue,
						name: curName,
						//selected: (i==0)
					});
				}
				else if (soegeTekst == searchText)
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
function removeOptions(dropDown)
{
    var i;
	if (dropDown != null && dropDown.options != null && dropDown.options.length > 0)
	{
		while(dropDown.options.length)
		{
			dropDown.remove(0);
		}
	}
}
function updateUndertype()
{
	var hovedType = jQuery('#virksomhedstype').val();
	if (hovedType == 'Autovirksomheder' || hovedType == 'Bilag 1 Listevirksomheder' || hovedType == 'Dyrehospitaler')
	{
		setKleAndFacet();
	}
	else
	{
		setDropDown(formular,'ds_miljoetilsyn_undertyper','virksomhedstype','undertype',true);
	}
}
function setKleAndFacet()
{
	jQuery('#klenr').val(getKleAndFacet().kle);
	jQuery('#facetnr').val(getKleAndFacet().facet);
	jQuery('#bemaerkning_andre_virksomheder').val(getKleAndFacet().undertype);
	
}
function getKleAndFacet()
{
	var hovedType = jQuery('#virksomhedstype').val();
	var underType = jQuery('#undertype').val();
	if (typeof underType == 'undefined' || underType == null || 
		hovedType == 'Autovirksomheder' || hovedType == 'Bilag 1 Listevirksomheder' || hovedType == 'Dyrehospitaler')
	{
		underType = '';
	}
	var kle = '';
	var facet = '';
	var params = {
		page: 'formular.send.miljoetilsyn.virksomhed.readall',
		command: 'read-kleandfacet',
		hovedtp: hovedType,
		undertp: underType
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
				kle = jQuery(rows[i]).find('col[name="kle"]').text();
				facet = jQuery(rows[i]).find('col[name="facet"]').text();
				undertype = jQuery(rows[i]).find('col[name="undertype"]').text();
			}
		}
	});

    return {kle:kle,facet:facet,undertype:undertype};
}