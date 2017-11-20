<#if Session["SPRING_SECURITY_CONTEXT"]?exists>
	<#assign cuser = Session["SPRING_SECURITY_CONTEXT"].authentication.principal>
</#if>


