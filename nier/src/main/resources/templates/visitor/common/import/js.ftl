<script type="text/javascript" src="/third-party/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/nier/js/scrolltopcontrol.js"></script>
<script type="text/javascript" src="/nier/js/nier-core.js"></script>
<script type="text/javascript" src="/nier/js/nier-helper.js"></script>
<script type="text/javascript" src="/nier/js/nier-style.js"></script>
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