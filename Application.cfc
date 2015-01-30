<cfcomponent>
	<cfscript>
		this.name = "CodeChef";    	    
    </cfscript>
    
    <cffunction name="onApplicationStart">
    	
    	<cfset Application = structNew()>
    	
    	<!--- read mode.xml into memory. This will be used for auto-suggest --->
    	<cfif not isDefined("Application.model")>
	    	<cffile action="read" file="#expandPath('../')#/model.xml" variable="modelXML" >
			<cfset var model =  xmlParse(modelXML)>
		
			<cfset Application.model = model>
		</cfif>
		
		<!--- read code snippets into memory. This will be used to get code snippets to insert --->
		<cfif not isDefined("Application.codeSnippets")>
			
			<cfset var snippets = CreateObject("java","java.util.Properties").init()>
			<cfset var path = "#expandPath('../')#/content.properties">
			<cfset snippets.load( CreateObject("java","java.io.FileInputStream").init(path)) > 
		
			<cfset Application.codeSnippets = snippets>
		</cfif>
		
		<!--- save URL to application root DIR --->
		<cfif not isDefined("Application.serverurl")>
			<cfset var str = createobject("java","java.lang.String")>
			<cfset str = #cgi.SCRIPT_NAME#>
			<cfset str =  str.subString(0,str.lastIndexOf("/"))>
			
			<cfif #cgi.https# eq "off" >
				<cfset Application.serverurl = "http://" & "#cgi.hTTP_HOST#" & "#str#" >
			<cfelse>
				<cfset Application.serverurl = "https://" & "#cgi.hTTP_HOST#" & "#str#" >	
			</cfif>		

		</cfif>
	</cffunction>
</cfcomponent>