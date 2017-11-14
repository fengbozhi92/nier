<#include "/visitor/common/macro/default.ftl">
<!DOCTYPE html>
<html>
<head>
<#include "/visitor/common/header.ftl">
<title>photoalbum</title>
<link href="/third-party/cropper/css/cropper.min.css" rel="stylesheet">
<link href="/third-party/cropper/css/sitelogo.css" rel="stylesheet">
</head>
<body>
	<#include "/visitor/common/layout/top.ftl">
	<div class="container" style="min-height: 1260px;background-color: #ddd;">
		<div id="title" class="col-sm-12">
			<div class="row">
				<div class="col-sm-6">
					<h3>album</h3>
				</div>
				<div class="col-sm-6 text-right" style="line-height:63px">
					<button id="btn_add" type="button" class="btn btn-default">新建</button>
				</div>
			</div>
		</div>
		<div class="col-sm-12">
			<div id="album">
			
			</div>
		</div>
	</div>
<#include "/visitor/common/layout/footer.ftl">
<#include "/visitor/common/js.ftl">
<script src="/third-party/cropper/js/cropper.min.js"></script>
<script src="/third-party/cropper/js/sitelogo.js"></script>
<script>
	$(function(){
		refresh(0,10);
	    $("#btn_add").on("click",function(){
	    	$('#addModal').modal();
	    });
	})
	
	function refresh(page, size){
		$.ajax({
			url:"/photoalbum/ajaxList.do",
			type:"POST",
			data:{
				page:page,
				size:size
			},
			success:function(res){
				$("#album").empty();
				$.each(res.data.content, function(i, item){
					var src = "/nier/images/system/sys-nier.png";
					if (item.imagePath != null) {
						src = item.imagePath;
						alert(src);
					}
					var a = "<div style=\"background-color:white; padding:5px; margin:5px; width:200px;height:220px;float:left;\">"+
							"<div class=\"text-center\"><img src=\""+src+"\"></div>"+
							"<div class=\"text-center\"><h4>"+item.title+"</h4></div>"+
							"</div>";
					$("#album").append(a);
				})
			},
			error:function(){
				
			}
		})
	}
</script>
<#include "/visitor/photoalbum/add.ftl">
</body>
</html>