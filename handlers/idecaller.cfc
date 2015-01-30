<cfcomponent>
	
	<cffunction name="invokeIDECommand" access="remote" >
		<cfargument name="str" type="String" >
		
		<cfset tags = xmlsearch(Application.model,"/items/item/tags[@display = '#str#']")>
		<cfset var id = tags[1].XMLAttributes.id>
		<cfset propContent = Application.codeSnippets.getProperty(id)>
		
<cfif not isnull(propContent) >	
	<cfsavecontent variable="callbackxml" >
	<cfoutput>
	<response>
	    <ide >          
	        <commands>
	        	<command type="inserttext">
						<params>
						<param key="text">
							<![CDATA[#propContent#]]>
						</param>
					</params>
		 			</command>
	        </commands>
	    </ide>
	</response>
	
	</cfoutput>
	
	</cfsavecontent>
	<cflog text="sending command to IDE">
	<cfhttp url="#Application.callbackURL#" method="post" result="out" >
		<cfhttpparam type="body" value="#callbackxml#" >
		<cfhttpparam type="header" name="mimetype" value="text/xml" />
	</cfhttp>
<cfelse>
	<cflog text="no code snippet found" >
</cfif>
		
	</cffunction>

</cfcomponent>