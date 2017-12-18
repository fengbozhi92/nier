<!DOCTYPE html>
<html>
<head>
<#include "/visitor/common/import/header.ftl">
<title>login</title>
</head>
<body>
	<div class="content" style="min-height: 1000px;">
		<div class="">
			<div class="">
				<form role="form" action="/login/login.do" method="post">
					<div class="">
				    	<input type="text" class="" name="username" placeholder="用户名" value="nier"> 
			  		</div>
			  		<div class="">
				    	<input type="password" class="" name="password" placeholder="密码" value="123">
			  		</div>
			  		<div class="">
			    		<label>
			      			<input type="checkbox">记住
			    		</label>
			    		<label>
			      			<input type="checkbox">自动
			    		</label>
			  		</div>
			  		<button type="submit" class="">提交</button>
				</form>
			</div>
		</div>
	</div>
<#include "/visitor/common/layout/footer.ftl">
<#include "/visitor/common/import/js.ftl">
</body>
</html>