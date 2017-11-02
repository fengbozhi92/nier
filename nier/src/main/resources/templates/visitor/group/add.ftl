<!DOCTYPE html>
<html>
<head>
<#include "/visitor/common/header.ftl">
<title>创建组</title>
</head>
<body>
	<div class="container" style="min-height: 1000px;">
		<div>
			<form role="form" class="form-horizontal">
				<input type="hidden" name="leaderId" value="${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!''}">
				<div class="form-group col-sm-12">
					<label class="form-label lh34">名称</label>
			    	<div class="">
			    		<input type="text" class="form-control">
		  			</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="form-label lh34">类型</label>
			    	<div class="">
			    		<select class="form-control">
			    			<option>111</option>
			    		</select>
		  			</div>
				</div>
				<div class="form-group col-sm-12">
		    		<div class="col-sm-12 pr0 text-center">
		  				<button type="button" class="btn btn-success justify btn-s" onclick="submit();">提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
<#include "/visitor/common/footer.ftl">
<#include "/visitor/common/js.ftl">
<script>
	
</script>
</body>
</html>