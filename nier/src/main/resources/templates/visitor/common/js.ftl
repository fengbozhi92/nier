<script type="text/javascript" src="/third-party/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/third-party/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/third-party/bootstrap-table/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="/third-party/bootstrap-table/i18n/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="/third-party/bootstrap-validator/js/bootstrap-validator.min.js"></script>
<script type="text/javascript" src="/nier/js/scrolltopcontrol.js"></script>
<script type="text/javascript" src="/nier/js/nier-core.js"></script>
<#macro loadJS third nier>
	<#if third != "">
		<#list third?split(",") as it>
			<script type="text/javascript" src="/third-party/${it}/js/${it}.min.js"></script>
		</#list>
	</#if>
	<#if nier != "">
		<#list nier?split(",") as it>
			<script type="text/javascript" src="/nier/js/${it}.js"></script>
		</#list>
	</#if>
</#macro>