window.onload = function() 
{
	setTimeout(function() {setDagsDato()},500);
	
}
function setDagsDato()
{
	var d = new Date();
	var strDate = d.getDate() + '-' + (d.getMonth()+1) + "/" + d.getFullYear();
	jQuery('#dagsdato').val(strDate);
	jQuery('#hid_aar').val(d.getFullYear());
}

function Init()
{
	var sendKnap = document.getElementById('sendbutton');
	sendKnap.disabled = true;
}

function SetMailText()
{	
	var hasInit = jQuery('#hasInit').val();
	if (hasInit == 0)
	{
		Init()
		jQuery('#hasInit').val(1);
	}
		
	var intetAnalyseBehov = jQuery('#analysebehov').is(':checked');
	var standardAnalyse = jQuery('#standardanalyse').is(':checked');
	
	var aktuelOverskrift = "";
	var aktuelMail = "";
	
	var kontrol1 = jQuery('#kontrolniv1').val();
	var kontrol2 = jQuery('#kontrolniv2').val();
	
	var lab = jQuery('#laboratorium').val();
	var labAndet = jQuery('#laboratorium_andet').val();
	
	
	if (intetAnalyseBehov) //der skal ikke analyseres
	{
		aktuelMail = jQuery('#tekstAndet').val();
		aktuelOverskrift = jQuery('#overskriftAndet').val();
		jQuery('#analysebehov_tekst').val('Nej');
		jQuery('#standardanalyse_tekst').val('Nej');
		jQuery('#laboratorium_tekst').val("")
	}
	else
	{
		jQuery('#analysebehov_tekst').val('Ja');
		
		if (standardAnalyse)
		{
			jQuery('#standardanalyse_tekst').val('Ja');
			aktuelMail = jQuery('#tekstStandardAnalyse').val();
			aktuelMail = aktuelMail.replace("{analyse}",kontrol1);
			aktuelOverskrift = jQuery('#overskriftStandardAnalyse').val();
			jQuery('#kontrolniv').val(kontrol1);
			jQuery('#laboratorium_tekst').val("Eurofins")
		}
		else
		{
			jQuery('#laboratorium_tekst').val(lab);
			jQuery('#standardanalyse_tekst').val('Nej');
			aktuelMail = jQuery('#tekstAndenAnalyse').val();
			aktuelOverskrift = jQuery('#overskriftAndenAnalyse').val();
			if (lab == 'Andet')
			{
				aktuelMail = aktuelMail.replace("{firma}",labAndet);
			}
			else
			{
				aktuelMail = aktuelMail.replace("{firma}",lab);
			}
			aktuelMail = aktuelMail.replace("{analyse}",kontrol2);
			jQuery('#kontrolniv').val(kontrol2);
		}
	}
	jQuery('#mailtekstfinal').val(aktuelMail);
	jQuery('#mailtekstoverskriftfinal').val(aktuelOverskrift);
	
	
}
function UpdateStd()
{
	
	var thisChk = jQuery('#standardanalyse').is(':checked');
	
	jQuery('#andet_analyse').prop('checked', !thisChk);
	SetMailText();
	var sendKnap = document.getElementById('sendbutton');
	sendKnap.disabled = false;
}

function UpdateAndet()
{
	var thisChk = jQuery('#andet_analyse').is(':checked');
	
	jQuery('#standardanalyse').prop('checked', !thisChk);
	SetMailText();
	var sendKnap = document.getElementById('sendbutton');
	sendKnap.disabled = false;
}

function Update()
{
	SetMailText();
	var sendKnap = document.getElementById('sendbutton');
	sendKnap.disabled = false;
}
function SetAdresser()
{
	
	var ddValue = jQuery('#antal_adresser').val();
	
	var adrOne = jQuery('#adrHiddenOne');
	var adrTwo = jQuery('#adrHiddenTwo');
	//var adrThree = jQuery('#adrHiddenThree');
	//var adrFour = jQuery('#adrHiddenFour');
	//var adrFive = jQuery('#adrHiddenFive');
	//var adrSix = jQuery('#adrHiddenSix');
	//var adrSeven = jQuery('#adrHiddenSeven');
	//var adrEight = jQuery('#adrHiddenEight');
	//var adrNine = jQuery('#adrHiddenNine');	
	adrOne.val(0)
	adrTwo.val(0)
	//adrThree.val(0)
	//adrFour.val(0)
	//adrFive.val(0)
	//adrSix.val(0)
	//adrSeven.val(0)
	//adrEight.val(0)
	//adrNine.val(0)
	
	var counter = 1
	if (counter <= ddValue)
	{
		adrOne.val(1)
		counter = counter + 1;
	}
	
	if (counter <= ddValue)
	{
		adrTwo.val(1)
		counter = counter + 1;
	}
	/*
	if (counter <= ddValue)
	{
		adrThree.val(1)
		counter = counter + 1;
	}
	if (counter <= ddValue)
	{
		adrFour.val(1)
		counter = counter + 1;
	}
	if (counter <= ddValue)
	{
		adrFive.val(1)
		counter = counter + 1;
	}
	if (counter <= ddValue)
	{
		adrSix.val(1)
		counter = counter + 1;
	}
	if (counter <= ddValue)
	{
		adrSeven.val(1)
		counter = counter + 1;
	}
	if (counter <= ddValue)
	{
		adrEight.val(1)
		counter = counter + 1;
	}
	if (counter <= ddValue)
	{
		adrNine.val(1)
		counter = counter + 1;
	}
	*/
}
