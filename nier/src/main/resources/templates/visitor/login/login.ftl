<!DOCTYPE html>
<html>
<head>
<#include "/visitor/common/header.ftl">
<title>login</title>
</head>
<body>
	<div class="container" style="min-height: 1000px;">
		<div class="col-md-4"></div>
		<div class="col-md-3">
			<div class="col-md-12" style="margin-top: 20%">
				<form role="form" action="/login/login.do" method="post">
					<div class="form-group">
				    	<input type="text" class="form-control" name="username" placeholder="用户名">
			  		</div>
			  		<div class="form-group">
				    	<input type="password" class="form-control" name="password" placeholder="密码">
			  		</div>
			  		<div class="checkbox">
			    		<label>
			      			<input type="checkbox">记住
			    		</label>
			    		<label>
			      			<input type="checkbox">自动
			    		</label>
			  		</div>
			  		<button type="submit" class="btn btn-default" style="width: 100%">提交</button>
				</form>
			</div>
		</div>
	</div>
<#include "/visitor/common/layout/footer.ftl">
<#include "/visitor/common/js.ftl">
</body>
</html>