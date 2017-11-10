<#if Session["SPRING_SECURITY_CONTEXT"]?exists>
	<#assign currentUser=Session["SPRING_SECURITY_CONTEXT"].authentication.principal>
</#if>
