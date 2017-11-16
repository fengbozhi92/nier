<#include "/visitor/common/macro/default.ftl">
<!DOCTYPE html>
<html>
<head>
<title>home</title>
<link rel="stylesheet" type="text/css" href="/third-party/bootstrap/css/bootstrap.min.css"/>
<link href="/nier/css/nier-core.css" rel="stylesheet">
<style type="text/css">
.nav .open>a, .nav .open>a:focus, .nav .open>a:hover {
    background-color: #20B2AA;
    border-color: #337ab7;
    opacity:0.8;
}
.nav>li>a:focus, .nav>li>a:hover {
    text-decoration: none;
    background-color: #20B2AA;
    opacity:0.8;
}
.dropdown-menu > li > a:hover,
.dropdown-menu > li > a:focus {
  color: #262626;
  text-decoration: none;
  background-color: white;
}
.nier a{
	color:#20B2AA !important;
	opacity:0.8;
	font-size: 16px;
}
.nier a:hover{
	color:white !important;
	opacity:0.8;
}
</style>
</head>
<body style="background-color: #F8F8FF">
	<#include "/visitor/common/layout/top2.ftl">
	<div class="container" style="min-height: 1260px;background-color: white">
		<div class="col-sm-12 mt15">
	        <ul class="nav navbar-nav nier">
	            <li class="active"><a href="#">iOS</a></li>
	            <li><a href="#">SVN</a></li>
	            <li><a href="#">Java</a></li>
	        </ul>
		</div>
		<div class="col-sm-12">
			<div>
				<a href="#">haha</a><span>|</span>
				<a href="#">haha</a><span>|</span>
				<a href="#">haha</a><span>|</span>
				<a href="#">haha</a><span>|</span>
				<a href="#">haha</a><span>|</span>
			</div>
		</div>
	</div>
<#include "/visitor/common/layout/footer.ftl">
<#include "/visitor/common/js.ftl">
<script>
	var cUser = '${(currentUser.id)!""}';

</script>
</body>
</html>