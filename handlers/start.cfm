<cfparam name="ideeventinfo"  >
<cfset xmldoc = xmlParse(ideeventinfo)>

<cfset Application.callbackURL = xmldoc.event.ide.callbackurl.XMLtext>

<cfset link = "#Application.serverurl#" & "/autosuggest.cfm">
<cfoutput>
	<script >
		
		top.location.href = "#link#";
		
	</script>
</cfoutput>
