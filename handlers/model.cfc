<cfcomponent output="false">

	<cfset THIS.dsn="cfartgallery">
	
	    <!--- Lookup used for auto suggest --->
	<cffunction name="lookupArt" access="remote" returntype="array">
		<cfargument name="search" type="any" required="false" default="">
		
		<!--- Define variables --->
		<cfset var data="">
		<cfset var result=ArrayNew(1)>
		
		<cfset tags =  xmlsearch(Application.model,"/items/item/tags[contains(text(),search)]")>
		
		<!--- Build result array --->
		<cfloop array="#tags#" index="i">
			<cfset ArrayAppend(result, i.XMLAttributes.display)>
		</cfloop>
		
		 <!--- And return it --->
		<cfreturn result>
	</cffunction>
    
</cfcomponent>