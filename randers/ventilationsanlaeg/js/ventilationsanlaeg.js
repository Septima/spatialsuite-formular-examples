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
	setTimeout(function() {setAutocomplete();},300);
}

function setAutocomplete()
{
	showSpinner('soeg_anlaeg');
	var list = createList();
	jQuery('input#soeg_anlaeg').autocomplete({
		selectFirst : true,
		source: list,
		delay: 200,
		minLength : 3,
		select: function( event, ui ) {elementSelectedAnmeld(event, ui)}
		
	});
	lockAddressAndStednavn();
	hideSpinner('soeg_anlaeg');
	setDagsDato();
	
}

function setDagsDato()
{
	var d = new Date();
	var month = '0' + (d.getMonth()+1);
	var monthTwoLetters = month.substr(month.length - 2);
	var setRev_dato = d.getDate() + '.' + monthTwoLetters + "." + d.getFullYear();
	jQuery('#rev_dato').val(setRev_dato);
}

function lockAddressAndStednavn()
{
	if (jQuery('#rediger').val() == 'true')
	{
		jQuery('#address').prop("readonly", true);
		jQuery('#anlaeg_nr').prop("readonly", true);
	}
	else
	{
		jQuery('#address').prop("readonly", false);
		jQuery('#anlaeg_nr').prop("readonly", false);		
	}
}
function checkAdrAndSitenr()
{
	if (jQuery('#kopierdata').val() == 'true' || jQuery('#rediger').val() == 'false') 
	{
		var anlaeg_nr = jQuery('#anlaeg_nr').val().toLowerCase();
		var adresse = jQuery('#address').val();
		var params = {
		page: 'formular.ventilation.readall',
		command: 'readAdrAndSitenr',
		anlaeg: anlaeg_nr,
		adr: adresse };

		jQuery.ajax( {
		url: 'cbkort',
		dataType: 'xml',
		type: 'POST',
		async: true,
		data: params,
			success : function(data, status) 
			{
				var rows = jQuery(data).find('row');
				if (rows.length > 0)
				{
					jQuery('#knownAdrAndSitenr').val('true');
					jQuery('button#sendbutton').prop('disabled',true);
					formular.checkConditions();
				}
				else
				{
					jQuery('#knownAdrAndSitenr').val('false');
					jQuery('button#sendbutton').prop('disabled',false);
					formular.checkConditions();
					
				}
			}
		});
		
	}
	
	
	var val = jQuery('#anlaeg_nr').val().toLowerCase();
	jQuery('#anlaeg_nr').val(val);
	
}
function elementSelectedAnmeld(event, ui)
{
	var id = ui.item.name;
	var params = {
		page: 'formular.ventilation.readall',
		command: 'readdata',
		ogc_fid: id
	};
	var tmpHtml = jQuery('#roegspjaeld_link').html();
	var tmpHtml1 = jQuery('#foto1_link').html();
	var tmpHtml2 = jQuery('#foto2_link').html();
	var tmpHtml3 = jQuery('#foto3_link').html();
	var tmpHtml4 = jQuery('#foto4_link').html();
	var dataFound = false;
	var shape_wkt = ''
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
				dataFound = true;
				shape_wkt = jQuery(rows[i]).find('col[name="shape_wkt"]').text();
				formular.feature = [true];
				formular.mergedFeature = shape_wkt;

				jQuery('#shape_wkt').val(shape_wkt);
				jQuery('#update_id').val(jQuery(rows[i]).find('col[name="ogc_fid"]').text()); //;curaddress);
				jQuery('#address').val(jQuery(rows[i]).find('col[name="adresse"]').text()); //;curaddress);
				jQuery('#stednavn').val(jQuery(rows[i]).find('col[name="stednavn"]').text()); //curstednavn);	
				jQuery('#aggregatplacering').val(jQuery(rows[i]).find('col[name="aggregatplacering"]').text()); //curaggregatplacering);
				jQuery('#betjeningsomraade').val(jQuery(rows[i]).find('col[name="betjeningsomraade"]').text()); //curbetjeningsomraade);
				jQuery('#kontaktperson_navn').val(jQuery(rows[i]).find('col[name="kontaktperson_navn"]').text()) //;curkontaktperson_navn);
				jQuery('#kontaktperson_tlf').val(jQuery(rows[i]).find('col[name="kontaktperson_tlf"]').text()); //curkontaktperson_tlf);
				jQuery('#sagsnr').val(jQuery(rows[i]).find('col[name="sagsnr"]').text()); //cursagsnr);
				if (jQuery('#kopierdata').val() != 'true')
				{
					jQuery('#anlaeg_nr').val(jQuery(rows[i]).find('col[name="anlaeg_nr"]').text()); //curanlaeg_nr);	
				}
				
				jQuery('#rev_dato').val(jQuery(rows[i]).find('col[name="rev_dato"]').text()); //currev_dato);
				jQuery('#rev_navn').val(jQuery(rows[i]).find('col[name="rev_navn"]').text());//currev_navn);
				jQuery('#tegning_nr').val(jQuery(rows[i]).find('col[name="tegning_nr"]').text()); //curtegning_nr);
				jQuery('#ventilationprincip').val(jQuery(rows[i]).find('col[name="ventilationprincip"]').text()); //curventilationprincip);
				jQuery('#vent_type').val(jQuery(rows[i]).find('col[name="vent_type"]').text()); //curvent_type);
				jQuery('#vent_automatik').val(jQuery(rows[i]).find('col[name="vent_automatik"]').text()); //curvent_automatik);
				jQuery('#vent_luftmaengde_proj').val(jQuery(rows[i]).find('col[name="vent_luftmaengde_proj"]').text()); //curvent_luftmaengde_proj);
				jQuery('#vent_luftmaengde_maalt').val(jQuery(rows[i]).find('col[name="vent_luftmaengde_maalt"]').text()); //curvent_luftmaengde_maalt);
				jQuery('#vent_statisk_tryk_proj').val(jQuery(rows[i]).find('col[name="vent_statisk_tryk_proj"]').text()); //curvent_statisk_tryk_proj);
				jQuery('#vent_statisk_tryk_maalt').val(jQuery(rows[i]).find('col[name="vent_statisk_tryk_maalt"]').text()); //curvent_statisk_tryk_maalt);
				jQuery('#vent_total_tryk_proj').val(jQuery(rows[i]).find('col[name="vent_total_tryk_proj"]').text()); //curvent_total_tryk_proj);
				jQuery('#vent_total_tryk_maalt').val(jQuery(rows[i]).find('col[name="vent_total_tryk_maalt"]').text()); //curvent_total_tryk_maalt);
				jQuery('#vent_omdrejning_proj').val(jQuery(rows[i]).find('col[name="vent_omdrejning_proj"]').text()); //curvent_omdrejning_proj);
				jQuery('#vent_omdrejning_maalt').val(jQuery(rows[i]).find('col[name="ud_vent_omdrejning_maalt"]').text()); //curvent_omdrejning_maalt);
				jQuery('#vent_maks_omdr_proj').val(jQuery(rows[i]).find('col[name="vent_maks_omdr_proj"]').text()); //curvent_maks_omdr_proj);
				jQuery('#vent_maks_omdr_maalt').val(jQuery(rows[i]).find('col[name="vent_maks_omdr_maalt"]').text()); //curvent_maks_omdr_maalt);
				jQuery('#vent_sef_proj').val(jQuery(rows[i]).find('col[name="vent_sef_proj"]').text()); //curvent_sef_proj);
				jQuery('#vent_sef_maalt').val(jQuery(rows[i]).find('col[name="vent_sef_maalt"]').text()); //curvent_sef_maalt);
				jQuery('#motor_type').val(jQuery(rows[i]).find('col[name="motor_type"]').text()); //;curmotor_type);
				jQuery('#motor_effekt_proj').val(jQuery(rows[i]).find('col[name="motor_effekt_proj"]').text()); //curmotor_effekt_proj);
				jQuery('#motor_effekt_maalt').val(jQuery(rows[i]).find('col[name="motor_effekt_maalt"]').text()); //curmotor_effekt_maalt);
				jQuery('#motor_spaending_proj').val(jQuery(rows[i]).find('col[name="motor_spaending_proj"]').text()); //curmotor_spaending_proj);
				jQuery('#motor_spaending_maalt').val(jQuery(rows[i]).find('col[name="motor_spaending_maalt"]').text()); //curmotor_spaending_maalt);
				jQuery('#motor_stroemforbrug_proj').val(jQuery(rows[i]).find('col[name="motor_stroemforbrug_proj"]').text()); //curmotor_stroemforbrug_proj);
				jQuery('#motor_stroemforbrug_maalt').val(jQuery(rows[i]).find('col[name="motor_stroemforbrug_maalt"]').text()); //curmotor_stroemforbrug_maalt);
				jQuery('#motor_omdrejning_proj').val(jQuery(rows[i]).find('col[name="motor_omdrejning_proj"]').text()); //curmotor_omdrejning_proj);
				jQuery('#motor_omdrejning_maalt').val(jQuery(rows[i]).find('col[name="motor_omdrejning_maalt"]').text()); //curmotor_omdrejning_maalt);
				jQuery('#motor_cos_proj').val(jQuery(rows[i]).find('col[name="motor_cos_proj"]').text()); //curmotor_cos_proj);
				jQuery('#motor_cos_maalt').val(jQuery(rows[i]).find('col[name="motor_cos_maalt"]').text()); //curmotor_cos_maalt);
				jQuery('#drivkraft').val(jQuery(rows[i]).find('col[name="drivkraft"]').text()); //curdrivkraft);
				jQuery('#rem_ventilator_remskive').val(jQuery(rows[i]).find('col[name="rem_ventilator_remskive"]').text()); //currem_ventilator_remskive);
				jQuery('#rem_ventilator_udbor').val(jQuery(rows[i]).find('col[name="rem_ventilator_udbor"]').text()); //currem_ventilator_udbor);
				jQuery('#rem_motor_remskive').val(jQuery(rows[i]).find('col[name="rem_motor_remskive"]').text()); //currem_motor_remskive);
				jQuery('#rem_motor_udbor').val(jQuery(rows[i]).find('col[name="rem_motor_udbor"]').text()); //currem_motor_udbor);
				jQuery('#rem_kileremme_antal').val(jQuery(rows[i]).find('col[name="rem_kileremme_antal"]').text()); //currem_kileremme_antal);
				jQuery('#rem_kileremme_type').val(jQuery(rows[i]).find('col[name="rem_kileremme_type"]').text()); //currem_kileremme_type);
				jQuery('#rem_centerafstand').val(jQuery(rows[i]).find('col[name="rem_centerafstand"]').text()); //currem_centerafstand);
				jQuery('#rem_justering').val(jQuery(rows[i]).find('col[name="rem_justering"]').text()); //currem_justering);
				jQuery('#ud_ventilationprincip').val(jQuery(rows[i]).find('col[name="ud_ventilationprincip"]').text()); //curud_ventilationprincip);
				jQuery('#ud_vent_type').val(jQuery(rows[i]).find('col[name="ud_vent_type"]').text()); //curud_vent_type);
				jQuery('#ud_vent_automatik').val(jQuery(rows[i]).find('col[name="ud_vent_automatik"]').text()); //curud_vent_automatik);
				jQuery('#ud_vent_luftmaengde_proj').val(jQuery(rows[i]).find('col[name="ud_vent_luftmaengde_proj"]').text()); //curud_vent_luftmaengde_proj);
				jQuery('#ud_vent_luftmaengde_maalt').val(jQuery(rows[i]).find('col[name="ud_vent_luftmaengde_maalt"]').text()); //curud_vent_luftmaengde_maalt);
				jQuery('#ud_vent_statisk_tryk_proj').val(jQuery(rows[i]).find('col[name="ud_vent_statisk_tryk_proj"]').text()); //curud_vent_statisk_tryk_proj);
				jQuery('#ud_vent_statisk_tryk_maalt').val(jQuery(rows[i]).find('col[name="ud_vent_statisk_tryk_maalt"]').text()); //curud_vent_statisk_tryk_maalt);
				jQuery('#ud_vent_total_tryk_proj').val(jQuery(rows[i]).find('col[name="ud_vent_total_tryk_proj"]').text()); //curud_vent_total_tryk_proj);
				jQuery('#ud_vent_total_tryk_maalt').val(jQuery(rows[i]).find('col[name="ud_vent_total_tryk_maalt"]').text()); //curud_vent_total_tryk_maalt);
				jQuery('#ud_vent_omdrejning_proj').val(jQuery(rows[i]).find('col[name="ud_vent_omdrejning_proj"]').text()); //curud_vent_omdrejning_proj);
				jQuery('#ud_vent_omdrejning_maalt').val(jQuery(rows[i]).find('col[name="ud_vent_omdrejning_maalt"]').text()); //curud_vent_omdrejning_maalt);
				jQuery('#ud_vent_maks_omdr_proj').val(jQuery(rows[i]).find('col[name="ud_vent_maks_omdr_proj"]').text()); //curud_vent_maks_omdr_proj);
				jQuery('#ud_vent_maks_omdr_maalt').val(jQuery(rows[i]).find('col[name="ud_vent_maks_omdr_maalt"]').text()); //curud_vent_maks_omdr_maalt);
				jQuery('#ud_vent_sef_proj').val(jQuery(rows[i]).find('col[name="ud_vent_sef_proj"]').text()); //curud_vent_sef_proj);
				jQuery('#ud_vent_sef_maalt').val(jQuery(rows[i]).find('col[name="ud_vent_sef_maalt"]').text()); //curud_vent_sef_maalt);
				jQuery('#ud_motor_type').val(jQuery(rows[i]).find('col[name="ud_motor_type"]').text()); //curud_motor_type);
				jQuery('#ud_motor_effekt_proj').val(jQuery(rows[i]).find('col[name="ud_motor_effekt_proj"]').text()); //curud_motor_effekt_proj);
				jQuery('#ud_motor_effekt_maalt').val(jQuery(rows[i]).find('col[name="ud_motor_effekt_maalt"]').text()); //curud_motor_effekt_maalt);
				jQuery('#ud_motor_spaending_proj').val(jQuery(rows[i]).find('col[name="ud_motor_spaending_proj"]').text()); //curud_motor_spaending_proj);
				jQuery('#ud_motor_spaending_maalt').val(jQuery(rows[i]).find('col[name="ud_motor_spaending_maalt"]').text()); //curud_motor_spaending_maalt);
				jQuery('#ud_motor_stroemforbrug_proj').val(jQuery(rows[i]).find('col[name="ud_motor_stroemforbrug_proj"]').text()); //curud_motor_stroemforbrug_proj);
				jQuery('#ud_motor_stroemforbrug_maalt').val(jQuery(rows[i]).find('col[name="ud_motor_stroemforbrug_maalt"]').text()); //curud_motor_stroemforbrug_maalt);
				jQuery('#ud_motor_omdrejning_proj').val(jQuery(rows[i]).find('col[name="ud_motor_omdrejning_proj"]').text()); //curud_motor_omdrejning_proj);
				jQuery('#ud_motor_omdrejning_maalt').val(jQuery(rows[i]).find('col[name="ud_motor_omdrejning_maalt"]').text()); //curud_motor_omdrejning_maalt);
				jQuery('#ud_motor_cos_proj').val(jQuery(rows[i]).find('col[name="ud_motor_cos_proj"]').text()); //curud_motor_cos_proj);
				jQuery('#ud_motor_cos_maalt').val(jQuery(rows[i]).find('col[name="ud_motor_cos_maalt"]').text()); //curud_motor_cos_maalt);
				jQuery('#ud_drivkraft').val(jQuery(rows[i]).find('col[name="ud_drivkraft"]').text()); //curud_drivkraft);
				jQuery('#ud_rem_ventilator_remskive').val(jQuery(rows[i]).find('col[name="ud_rem_ventilator_remskive"]').text()); //curud_rem_ventilator_remskive);
				jQuery('#ud_rem_ventilator_udbor').val(jQuery(rows[i]).find('col[name="ud_rem_ventilator_udbor"]').text()); //curud_rem_ventilator_udbor);
				jQuery('#ud_rem_motor_remskive').val(jQuery(rows[i]).find('col[name="ud_rem_motor_remskive"]').text()); //curud_rem_motor_remskive);
				jQuery('#ud_rem_motor_udbor').val(jQuery(rows[i]).find('col[name="ud_rem_motor_udbor"]').text()); //curud_rem_motor_udbor);
				jQuery('#ud_rem_kileremme_antal').val(jQuery(rows[i]).find('col[name="ud_rem_kileremme_antal"]').text()); //curud_rem_kileremme_antal);
				jQuery('#ud_rem_kileremme_type').val(jQuery(rows[i]).find('col[name="ud_rem_kileremme_type"]').text()); //curud_rem_kileremme_type);
				jQuery('#ud_rem_centerafstand').val(jQuery(rows[i]).find('col[name="ud_rem_centerafstand"]').text()); //curud_rem_centerafstand);
				jQuery('#ud_rem_justering').val(jQuery(rows[i]).find('col[name="ud_rem_justering"]').text()); //curud_rem_justering);
				jQuery('#filter1_type').val(jQuery(rows[i]).find('col[name="filter1_type"]').text()); //curfilter1_type);
				jQuery('#filter1_antal').val(jQuery(rows[i]).find('col[name="filter1_antal"]').text()); //curfilter1_antal);
				jQuery('#filter1_nr').val(jQuery(rows[i]).find('col[name="filter1_nr"]').text()); //curfilter1_nr);
				jQuery('#filter1_klasse').val(jQuery(rows[i]).find('col[name="filter1_klasse"]').text()); //curfilter1_klasse);
				jQuery('#filter1_bredde').val(jQuery(rows[i]).find('col[name="filter1_bredde"]').text()); //curfilter1_bredde);
				jQuery('#filter1_hoejde').val(jQuery(rows[i]).find('col[name="filter1_hoejde"]').text()); //curfilter1_hoejde);
				jQuery('#filter1_laengde').val(jQuery(rows[i]).find('col[name="filter1_laengde"]').text()); //curfilter1_laengde);
				jQuery('#filter1_pose_antal').val(jQuery(rows[i]).find('col[name="filter1_pose_antal"]').text()); //curfilter1_pose_antal);
				jQuery('#filter2_type').val(jQuery(rows[i]).find('col[name="filter2_type"]').text()); //curfilter2_type);
				jQuery('#filter2_antal').val(jQuery(rows[i]).find('col[name="filter2_antal"]').text()); //curfilter2_antal);
				jQuery('#filter2_nr').val(jQuery(rows[i]).find('col[name="filter2_nr"]').text()); //curfilter2_nr);
				jQuery('#filter2_klasse').val(jQuery(rows[i]).find('col[name="filter2_klasse"]').text()); //curfilter2_klasse);
				jQuery('#filter2_bredde').val(jQuery(rows[i]).find('col[name="filter2_bredde"]').text()); //curfilter2_bredde);
				jQuery('#filter2_hoejde').val(jQuery(rows[i]).find('col[name="filter2_hoejde"]').text()); //curfilter2_hoejde);
				jQuery('#filter2_laengde').val(jQuery(rows[i]).find('col[name="filter2_laengde"]').text()); //curfilter2_laengde);
				jQuery('#filter2_pose_antal').val(jQuery(rows[i]).find('col[name="filter2_pose_antal"]').text()); //curfilter2_pose_antal);
				jQuery('#filter3_type').val(jQuery(rows[i]).find('col[name="filter3_type"]').text()); //curfilter3_type);
				jQuery('#filter3_antal').val(jQuery(rows[i]).find('col[name="filter3_antal"]').text()); //curfilter3_antal);
				jQuery('#filter3_nr').val(jQuery(rows[i]).find('col[name="filter3_nr"]').text()); //curfilter3_nr);
				jQuery('#filter3_klasse').val(jQuery(rows[i]).find('col[name="filter3_klasse"]').text()); //curfilter3_klasse);
				jQuery('#filter3_bredde').val(jQuery(rows[i]).find('col[name="filter3_bredde"]').text()); //curfilter3_bredde);
				jQuery('#filter3_hoejde').val(jQuery(rows[i]).find('col[name="filter3_hoejde"]').text()); //curfilter3_hoejde);
				jQuery('#filter3_laengde').val(jQuery(rows[i]).find('col[name="filter3_laengde"]').text()); //curfilter3_laengde);
				jQuery('#filter3_pose_antal').val(jQuery(rows[i]).find('col[name="filter3_pose_antal"]').text()); //curfilter3_pose_antal);
				jQuery('#bemaerkning').val(jQuery(rows[i]).find('col[name="bemaerkning"]').text()); //curbemaerkning);
				jQuery('#filter1_ud_type').val(jQuery(rows[i]).find('col[name="filter1_ud_type"]').text()); //curfilter1_ud_type);
				jQuery('#filter1_ud_antal').val(jQuery(rows[i]).find('col[name="filter1_ud_antal"]').text()); //
				jQuery('#filter1_ud_nr').val(jQuery(rows[i]).find('col[name="filter1_ud_nr"]').text()); //
				jQuery('#filter1_ud_klasse').val(jQuery(rows[i]).find('col[name="filter1_ud_klasse"]').text()); //
				jQuery('#filter1_ud_bredde').val(jQuery(rows[i]).find('col[name="filter1_ud_bredde"]').text()); //
				jQuery('#filter1_ud_hoejde').val(jQuery(rows[i]).find('col[name="filter1_ud_hoejde"]').text()); //
				jQuery('#filter1_ud_laengde').val(jQuery(rows[i]).find('col[name="filter1_ud_laengde"]').text()); //
				jQuery('#filter1_ud_pose_antal').val(jQuery(rows[i]).find('col[name="filter1_ud_pose_antal"]').text()); //
				jQuery('#filter2_ud_type').val(jQuery(rows[i]).find('col[name="filter2_ud_type"]').text()); //
				jQuery('#filter2_ud_antal').val(jQuery(rows[i]).find('col[name="filter2_ud_antal"]').text()); //
				jQuery('#filter2_ud_nr').val(jQuery(rows[i]).find('col[name="filter2_ud_nr"]').text()); //
				jQuery('#filter2_ud_klasse').val(jQuery(rows[i]).find('col[name="filter2_ud_klasse"]').text()); //
				jQuery('#filter2_ud_bredde').val(jQuery(rows[i]).find('col[name="filter2_ud_bredde"]').text()); //
				jQuery('#filter2_ud_hoejde').val(jQuery(rows[i]).find('col[name="filter2_ud_hoejde"]').text()); //
				jQuery('#filter2_ud_laengde').val(jQuery(rows[i]).find('col[name="filter2_ud_laengde"]').text()); //
				jQuery('#filter2_ud_pose_antal').val(jQuery(rows[i]).find('col[name="filter2_ud_pose_antal"]').text()); //
				jQuery('#filter3_ud_type').val(jQuery(rows[i]).find('col[name="filter3_ud_type"]').text()); //
				jQuery('#filter3_ud_antal').val(jQuery(rows[i]).find('col[name="filter3_ud_antal"]').text()); //
				jQuery('#filter3_ud_nr').val(jQuery(rows[i]).find('col[name="filter3_ud_nr"]').text()); //
				jQuery('#filter3_ud_klasse').val(jQuery(rows[i]).find('col[name="filter3_ud_klasse"]').text()); //
				jQuery('#filter3_ud_bredde').val(jQuery(rows[i]).find('col[name="filter3_ud_bredde"]').text()); //
				jQuery('#filter3_ud_hoejde').val(jQuery(rows[i]).find('col[name="filter3_ud_hoejde"]').text()); //
				jQuery('#filter3_ud_laengde').val(jQuery(rows[i]).find('col[name="filter3_ud_laengde"]').text()); //
				jQuery('#filter3_ud_pose_antal').val(jQuery(rows[i]).find('col[name="filter3_ud_pose_antal"]').text()); //
				jQuery('#bemaerkning_ud').val(jQuery(rows[i]).find('col[name="bemaerkning_ud"]').text()); //
				jQuery('#roegspjaeld_antal').val(jQuery(rows[i]).find('col[name="roegspjaeld_antal"]').text()); //
				var roegspjaeld_foto = jQuery(rows[i]).find('col[name="roegspjaeld_foto"]').text();
				if (roegspjaeld_foto.length > 0)
				{
					tmpHtml = tmpHtml.replace('{linkdata}',roegspjaeld_foto);
					jQuery('#roegspjaeld_link').html(tmpHtml);
					jQuery('#roegspjaeld_foto').val(roegspjaeld_foto); //	
				}
				
				var foto1 = jQuery(rows[i]).find('col[name="foto1"]').text();
				if (foto1.length > 0)
				{
					tmpHtml1 = tmpHtml1.replace('{linkdata1}',foto1);
					jQuery('#foto1_link').html(tmpHtml1);
					jQuery('#foto1').val(foto1); //	
				}
				
				var foto2 = jQuery(rows[i]).find('col[name="foto2"]').text();
				if (foto2.length > 0)
				{
					tmpHtml2 = tmpHtml2.replace('{linkdata2}',foto2);
					jQuery('#foto2_link').html(tmpHtml2);
					jQuery('#foto2').val(foto2); //	
				}
				
				var foto3 = jQuery(rows[i]).find('col[name="foto3"]').text();
				if (foto3.length > 0)
				{
					tmpHtml3 = tmpHtml3.replace('{linkdata3}',foto3);
					jQuery('#foto3_link').html(tmpHtml3);
					jQuery('#foto3').val(foto3); //	
				}
				
				var foto4 = jQuery(rows[i]).find('col[name="foto4"]').text();
				if (foto4.length > 0)
				{
					tmpHtml4 = tmpHtml4.replace('{linkdata4}',foto4);
					jQuery('#foto4_link').html(tmpHtml4);
					jQuery('#foto4').val(foto4); //	
				}
				
				
			  


/*
			  var curaddress = jQuery(rows[i]).find('col[name="adresse"]').text();
			  var curaggregatplacering = jQuery(rows[i]).find('col[name="aggregatplacering"]').text();
			  var curbetjeningsomraade = jQuery(rows[i]).find('col[name="betjeningsomraade"]').text();
			  var curkontaktperson_navn = jQuery(rows[i]).find('col[name="kontaktperson_navn"]').text();
			  var curkontaktperson_tlf = jQuery(rows[i]).find('col[name="kontaktperson_tlf"]').text();
			  var cursagsnr = jQuery(rows[i]).find('col[name="sagsnr"]').text();
			  var curanlaeg_nr = jQuery(rows[i]).find('col[name="anlaeg_nr"]').text();
			  var currev_dato = jQuery(rows[i]).find('col[name="rev_dato"]').text();
			  var currev_navn = jQuery(rows[i]).find('col[name="rev_navn"]').text();
			  var curtegning_nr = jQuery(rows[i]).find('col[name="tegning_nr"]').text();
			  var curventilationprincip = jQuery(rows[i]).find('col[name="ventilationprincip"]').text();
			  var curvent_type = jQuery(rows[i]).find('col[name="vent_type"]').text();
			  var curvent_automatik = jQuery(rows[i]).find('col[name="vent_automatik"]').text();
			  var curvent_luftmaengde_proj = jQuery(rows[i]).find('col[name="vent_luftmaengde_proj"]').text();
			  var curvent_luftmaengde_maalt = jQuery(rows[i]).find('col[name="vent_luftmaengde_maalt"]').text();
			  var curvent_statisk_tryk_proj = jQuery(rows[i]).find('col[name="vent_statisk_tryk_proj"]').text();
			  var curvent_statisk_tryk_maalt = jQuery(rows[i]).find('col[name="vent_statisk_tryk_maalt"]').text();
			  var curvent_total_tryk_proj = jQuery(rows[i]).find('col[name="vent_total_tryk_proj"]').text();
			  var curvent_total_tryk_maalt = jQuery(rows[i]).find('col[name="vent_total_tryk_maalt"]').text();
			  var curvent_omdrejning_proj = jQuery(rows[i]).find('col[name="vent_omdrejning_proj"]').text();
			  var curvent_omdrejning_maalt = jQuery(rows[i]).find('col[name="vent_omdrejning_maalt"]').text();
			  var curvent_maks_omdr_proj = jQuery(rows[i]).find('col[name="vent_maks_omdr_proj"]').text();
			  var curvent_maks_omdr_maalt = jQuery(rows[i]).find('col[name="vent_maks_omdr_maalt"]').text();
			  var curvent_sef_proj = jQuery(rows[i]).find('col[name="vent_sef_proj"]').text();
			  var curvent_sef_maalt = jQuery(rows[i]).find('col[name="vent_sef_maalt"]').text();
			  var curmotor_type = jQuery(rows[i]).find('col[name="motor_type"]').text();
			  var curmotor_effekt_proj = jQuery(rows[i]).find('col[name="motor_effekt_proj"]').text();
			  var curmotor_effekt_maalt = jQuery(rows[i]).find('col[name="motor_effekt_maalt"]').text();
			  var curmotor_spaending_proj = jQuery(rows[i]).find('col[name="motor_spaending_proj"]').text();
			  var curmotor_spaending_maalt = jQuery(rows[i]).find('col[name="motor_spaending_maalt"]').text();
			  var curmotor_stroemforbrug_proj = jQuery(rows[i]).find('col[name="motor_stroemforbrug_proj"]').text();
			  var curmotor_stroemforbrug_maalt = jQuery(rows[i]).find('col[name="motor_stroemforbrug_maalt"]').text();
			  var curmotor_omdrejning_proj = jQuery(rows[i]).find('col[name="motor_omdrejning_proj"]').text();
			  var curmotor_omdrejning_maalt = jQuery(rows[i]).find('col[name="motor_omdrejning_maalt"]').text();
			  var curmotor_cos_proj = jQuery(rows[i]).find('col[name="motor_cos_proj"]').text();
			  var curmotor_cos_maalt = jQuery(rows[i]).find('col[name="motor_cos_maalt"]').text();
			  var curdrivkraft = jQuery(rows[i]).find('col[name="drivkraft"]').text();
 			  var currem_ventilator_remskive = jQuery(rows[i]).find('col[name="rem_ventilator_remskive"]').text();
			  var currem_ventilator_udbor = jQuery(rows[i]).find('col[name="rem_ventilator_udbor"]').text();
			  var currem_motor_remskive = jQuery(rows[i]).find('col[name="rem_motor_remskive"]').text();
			  var currem_motor_udbor = jQuery(rows[i]).find('col[name="rem_motor_udbor"]').text();
			  var currem_kileremme_antal = jQuery(rows[i]).find('col[name="rem_kileremme_antal"]').text();
			  var currem_kileremme_type = jQuery(rows[i]).find('col[name="rem_kileremme_type"]').text();
			  var currem_centerafstand = jQuery(rows[i]).find('col[name="rem_centerafstand"]').text();
			  var currem_justering = jQuery(rows[i]).find('col[name="rem_justering"]').text();
			  var curud_ventilationprincip = jQuery(rows[i]).find('col[name="ud_ventilationprincip"]').text();
			  var curud_vent_type = jQuery(rows[i]).find('col[name="ud_vent_type"]').text();
			  var curud_vent_automatik = jQuery(rows[i]).find('col[name="ud_vent_automatik"]').text();
			  var curud_vent_luftmaengde_proj = jQuery(rows[i]).find('col[name="ud_vent_luftmaengde_proj"]').text();
			  var curud_vent_luftmaengde_maalt = jQuery(rows[i]).find('col[name="ud_vent_luftmaengde_maalt"]').text();
			  var curud_vent_statisk_tryk_proj = jQuery(rows[i]).find('col[name="ud_vent_statisk_tryk_proj"]').text();
			  var curud_vent_statisk_tryk_maalt = jQuery(rows[i]).find('col[name="ud_vent_statisk_tryk_maalt"]').text();
			  var curud_vent_total_tryk_proj = jQuery(rows[i]).find('col[name="ud_vent_total_tryk_proj"]').text();
			  var curud_vent_total_tryk_maalt = jQuery(rows[i]).find('col[name="ud_vent_total_tryk_maalt"]').text();
			  var curud_vent_omdrejning_proj = jQuery(rows[i]).find('col[name="ud_vent_omdrejning_proj"]').text();
			  var curud_vent_omdrejning_maalt = jQuery(rows[i]).find('col[name="ud_vent_omdrejning_maalt"]').text();
			  var curud_vent_maks_omdr_proj = jQuery(rows[i]).find('col[name="ud_vent_maks_omdr_proj"]').text();
			  var curud_vent_maks_omdr_maalt = jQuery(rows[i]).find('col[name="ud_vent_maks_omdr_maalt"]').text();
			  var curud_vent_sef_proj = jQuery(rows[i]).find('col[name="ud_vent_sef_proj"]').text();
			  var curud_vent_sef_maalt = jQuery(rows[i]).find('col[name="ud_vent_sef_maalt"]').text();
			  var curud_motor_type = jQuery(rows[i]).find('col[name="ud_motor_type"]').text();
			  var curud_motor_effekt_proj = jQuery(rows[i]).find('col[name="ud_motor_effekt_proj"]').text();
			  var curud_motor_effekt_maalt = jQuery(rows[i]).find('col[name="ud_motor_effekt_maalt"]').text();
			  var curud_motor_spaending_proj = jQuery(rows[i]).find('col[name="ud_motor_spaending_proj"]').text();
			  var curud_motor_spaending_maalt = jQuery(rows[i]).find('col[name="ud_motor_spaending_maalt"]').text();
			  var curud_motor_stroemforbrug_proj = jQuery(rows[i]).find('col[name="ud_motor_stroemforbrug_proj"]').text();
			  var curud_motor_stroemforbrug_maalt = jQuery(rows[i]).find('col[name="ud_motor_stroemforbrug_maalt"]').text();
			  var curud_motor_omdrejning_proj = jQuery(rows[i]).find('col[name="ud_motor_omdrejning_proj"]').text();
			  var curud_motor_omdrejning_maalt = jQuery(rows[i]).find('col[name="ud_motor_omdrejning_maalt"]').text();
			  var curud_motor_cos_proj = jQuery(rows[i]).find('col[name="ud_motor_cos_proj"]').text();
			  var curud_motor_cos_maalt = jQuery(rows[i]).find('col[name="ud_motor_cos_maalt"]').text();
			  var curud_drivkraft = jQuery(rows[i]).find('col[name="ud_drivkraft"]').text();
			  var curud_rem_ventilator_remskive = jQuery(rows[i]).find('col[name="ud_rem_ventilator_remskive"]').text();
			  var curud_rem_ventilator_udbor = jQuery(rows[i]).find('col[name="ud_rem_ventilator_udbor"]').text();
			  var curud_rem_motor_remskive = jQuery(rows[i]).find('col[name="ud_rem_motor_remskive"]').text();
			  var curud_rem_motor_udbor = jQuery(rows[i]).find('col[name="ud_rem_motor_udbor"]').text();
			  var curud_rem_kileremme_antal = jQuery(rows[i]).find('col[name="ud_rem_kileremme_antal"]').text();
			  var curud_rem_kileremme_type = jQuery(rows[i]).find('col[name="ud_rem_kileremme_type"]').text();
			  var curud_rem_centerafstand = jQuery(rows[i]).find('col[name="ud_rem_centerafstand"]').text();
			  var curud_rem_justering = jQuery(rows[i]).find('col[name="ud_rem_justering"]').text();
			  var curfilter1_type = jQuery(rows[i]).find('col[name="filter1_type"]').text();
			  var curfilter1_antal = jQuery(rows[i]).find('col[name="filter1_antal"]').text();
			  var curfilter1_nr = jQuery(rows[i]).find('col[name="filter1_nr"]').text();
			  var curfilter1_klasse = jQuery(rows[i]).find('col[name="filter1_klasse"]').text();
			  var curfilter1_bredde = jQuery(rows[i]).find('col[name="filter1_bredde"]').text();
			  var curfilter1_hoejde = jQuery(rows[i]).find('col[name="filter1_hoejde"]').text();
			  var curfilter1_laengde = jQuery(rows[i]).find('col[name="filter1_laengde"]').text();
			  var curfilter1_pose_antal = jQuery(rows[i]).find('col[name="filter1_pose_antal"]').text();
			  var curfilter2_type = jQuery(rows[i]).find('col[name="filter2_type"]').text();
			  var curfilter2_antal = jQuery(rows[i]).find('col[name="filter2_antal"]').text();
			  var curfilter2_nr = jQuery(rows[i]).find('col[name="filter2_nr"]').text();
			  var curfilter2_klasse = jQuery(rows[i]).find('col[name="filter2_klasse"]').text();
			  var curfilter2_bredde = jQuery(rows[i]).find('col[name="filter2_bredde"]').text();
			  var curfilter2_hoejde = jQuery(rows[i]).find('col[name="filter2_hoejde"]').text();
			  var curfilter2_laengde = jQuery(rows[i]).find('col[name="filter2_laengde"]').text();
			  var curfilter2_pose_antal = jQuery(rows[i]).find('col[name="filter2_pose_antal"]').text();
			  var curfilter3_type = jQuery(rows[i]).find('col[name="filter3_type"]').text();
			  var curfilter3_antal = jQuery(rows[i]).find('col[name="filter3_antal"]').text();
			  var curfilter3_nr = jQuery(rows[i]).find('col[name="filter3_nr"]').text();
			  var curfilter3_klasse = jQuery(rows[i]).find('col[name="filter3_klasse"]').text();
			  var curfilter3_bredde = jQuery(rows[i]).find('col[name="filter3_bredde"]').text();
			  var curfilter3_hoejde = jQuery(rows[i]).find('col[name="filter3_hoejde"]').text();
			  var curfilter3_laengde = jQuery(rows[i]).find('col[name="filter3_laengde"]').text();
			  var curfilter3_pose_antal = jQuery(rows[i]).find('col[name="filter3_pose_antal"]').text();
			  var curbemaerkning = jQuery(rows[i]).find('col[name="bemaerkning"]').text();
			  var curfilter1_ud_type = jQuery(rows[i]).find('col[name="filter1_ud_type"]').text();
			  var curfilter1_ud_antal = jQuery(rows[i]).find('col[name="filter1_ud_antal"]').text();
			  var curfilter1_ud_nr = jQuery(rows[i]).find('col[name="filter1_ud_nr"]').text();
			  var curfilter1_ud_klasse = jQuery(rows[i]).find('col[name="filter1_ud_klasse"]').text();
			  var curfilter1_ud_bredde = jQuery(rows[i]).find('col[name="filter1_ud_bredde"]').text();
			  var curfilter1_ud_hoejde = jQuery(rows[i]).find('col[name="filter1_ud_hoejde"]').text();
			  var curfilter1_ud_laengde = jQuery(rows[i]).find('col[name="filter1_ud_laengde"]').text();
			  var curfilter1_ud_pose_antal = jQuery(rows[i]).find('col[name="filter1_ud_pose_antal"]').text();
			  var curfilter2_ud_type = jQuery(rows[i]).find('col[name="filter2_ud_type"]').text();
			  var curfilter2_ud_antal = jQuery(rows[i]).find('col[name="filter2_ud_antal"]').text();
			  var curfilter2_ud_nr = jQuery(rows[i]).find('col[name="filter2_ud_nr"]').text();
			  var curfilter2_ud_klasse = jQuery(rows[i]).find('col[name="filter2_ud_klasse"]').text();
			  var curfilter2_ud_bredde = jQuery(rows[i]).find('col[name="filter2_ud_bredde"]').text();
			  var curfilter2_ud_hoejde = jQuery(rows[i]).find('col[name="filter2_ud_hoejde"]').text();
			  var curfilter2_ud_laengde = jQuery(rows[i]).find('col[name="filter2_ud_laengde"]').text();
			  var curfilter2_ud_pose_antal = jQuery(rows[i]).find('col[name="filter2_ud_pose_antal"]').text();
			  var curfilter3_ud_type = jQuery(rows[i]).find('col[name="filter3_ud_type"]').text();
			  var curfilter3_ud_antal = jQuery(rows[i]).find('col[name="filter3_ud_antal"]').text();
			  var curfilter3_ud_nr = jQuery(rows[i]).find('col[name="filter3_ud_nr"]').text();
			  var curfilter3_ud_klasse = jQuery(rows[i]).find('col[name="filter3_ud_klasse"]').text();
			  var curfilter3_ud_bredde = jQuery(rows[i]).find('col[name="filter3_ud_bredde"]').text();
			  var curfilter3_ud_hoejde = jQuery(rows[i]).find('col[name="filter3_ud_hoejde"]').text();
			  var curfilter3_ud_laengde = jQuery(rows[i]).find('col[name="filter3_ud_laengde"]').text();
			  var curfilter3_ud_pose_antal = jQuery(rows[i]).find('col[name="filter3_ud_pose_antal"]').text();
			  var curbemaerkning_ud = jQuery(rows[i]).find('col[name="bemaerkning_ud"]').text();
  			  var curroegspjaeld_antal = jQuery(rows[i]).find('col[name="roegspjaeld_antal"]').text();
			  var curroegspjaeld_foto = jQuery(rows[i]).find('col[name="roegspjaeld_foto"]').text();
			  var curfoto1 = jQuery(rows[i]).find('col[name="foto1"]').text();
			  var curfoto2 = jQuery(rows[i]).find('col[name="foto2"]').text();
			  var curfoto3 = jQuery(rows[i]).find('col[name="foto3"]').text();
			  var curfoto4 = jQuery(rows[i]).find('col[name="foto4"]').text();
*/
			}
		}
	});
	/*
	if (curWKT.length > 0)
	{
		jQuery('#soeg_adresse_wkt').val(curWKT);
	}
	else if (shape_wkt.length > 0)
	{
		jQuery('#soeg_adresse_wkt').val(shape_wkt);
	}
	*/

			/*
			jQuery('#stednavn').val(curstednavn);
				jQuery('#wkt').val(curWKT);
			
			  */


	if (dataFound && shape_wkt.length > 0)
	{
		formular.map.drawWKT(shape_wkt,function(event) 
			{
				//setTimeout(SpatialMap.Function.bind(function (id) {formular.map.deleteFeature(id);},null,event.id),10000);
			},
			{zoomto: true, styles: {fillOpacity: 100,strokeOpacity: 0}}
		)
	
	}
	formular.checkConditions();
	
}


function createList()
{
	var params = {
		page: 'formular.ventilation.readall'
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
				
				
				var curValue = jQuery(rows[i]).find('col[name="adresse"]').text() + ' (' +jQuery(rows[i]).find('col[name="anlaeg_nr"]').text() + ')'
				var curName = jQuery(rows[i]).find('col[name="ogc_fid"]').text();
				
				list.push(
				{
					value: curValue,
					name: curName
					//selected: (i==0)
				});

			}
		}
	});
	return list;
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
	var searchT = jQuery('#'+searchID).val();
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
				if (soegeTekst == searchT)
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
function clearTexts(htmlIDs)
{
	var colNamesArray = htmlIDs.split(",");
	for (var j=0;j<colNamesArray.length; j++)
	{
		var curName = colNamesArray[j];
		if (curName != null)
		{
			jQuery('#'+curName).val('');
		}
	}


}
function zoomToEx(formularObj,xMin,yMin,xMax,yMax)
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
function setDecimal(feltnavn)
{
	var val = jQuery('#'+feltnavn).val();
	val = val.replace(',','.');
	jQuery('#'+feltnavn).val(val);
	
}
function handleMessageButton()
{
	var login = jQuery('#login').val()
	var isLoading = jQuery('#loading').is(':visible');
	if (!isLoading)
	{
		window.location.assign('http://webkort.randers.dk/?page=formular&formular=ventilation&login=' + login,'_blank');	
	}
	
}