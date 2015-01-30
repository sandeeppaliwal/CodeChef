<html>
<script src="../scripts/jquery-2.0.3.min.js"></script>
<script >
	function callIDE()
	{			
		var text = document.getElementById("fullText").value;
		if(text != null && text != "")
		{
		var caller = new ide();
		caller.invokeIDECommand(text);
		}
	}
	
</script>
<cfajaxproxy cfc="idecaller" jsclassname="ide">
<body style="background-color:#ffffdf">
<div style="width:100%;min-width:270;padding-left:10;padding-top:10;padding-right:5;">
<span style="font-size:large;font-style:italic;font-weight:bold"><img src="../images/codechef.png" height="70px" width="60px" />Code Chef </span> - Search with action or keyword (ex. create/write/loop or file/pdf/query)
<br/>

<cfform onsubmit="javascript:callIDE()" style="width:90%;padding-top:5" >
	<cfinput id="fullText" type="text" name="artname" autosuggest="cfc:model.lookupArt({cfautosuggestvalue})" 
		matchContains="true" showautosuggestloadingicon="false" style="width:100%;min-width:250;"
		tooltip="enter action or keyword related to CFML code you want to write"  />
	<cfinput name="Add" type="submit" style="display:none" >
</cfform>
</div>
</body>
</html>
