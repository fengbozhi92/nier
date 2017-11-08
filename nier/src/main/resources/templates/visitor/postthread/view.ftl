<!DOCTYPE html>
<html>
<head>
<#include "/visitor/common/header.ftl">
<link rel="stylesheet" type="text/css" href="/third-party/emoji/css/jquery.emoji.css"/>
<link rel="stylesheet" type="text/css" href="/third-party/emoji/css/jquery.mCustomScrollbar.min.css"/>
<title>${thread.title}</title>
<style>
.fixed-table-container{border:none;}
.fixed-table-body{border:1px solid #ddd; border-bottom: none;}
</style>
</head>
<body>
	<#include "/visitor/common/top.ftl">
	<div class="container" style="min-height:1260px;">
		<#include "/visitor/post/list.ftl">
		<div id="pub_post">
	    	<form role="form" id="postForm">
	           	<div class="col-sm-12 modal-body form-horizontal">
	           		<div class="form-group">
	           			<div class="col-sm-2"></div>
	                   	<div class="col-sm-8">
	                   		<h4><span class="glyphicon glyphicon-pencil"></span>&nbsp;发表回复</h4>
	                   	</div>
	               	</div>
	           		<input type="hidden" name="groupId" value="${thread.groupId}">
	           		<input type="hidden" name="threadId" value="${thread.id}">
	           		<input type="hidden" name="userId" value="${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!''}">
	               	<div class="form-group">
	                  	<label class="col-sm-2 lh34 text-right" for="pub_content"></label>
	                   	<div class="col-sm-8">
	                   		<textarea class="form-control" id="pub_content" rows="5"></textarea>
	                   	</div>
	               	</div>
	               	<div class="form-group">
	               		<div class="col-sm-2"></div>
	                  	<div class="col-sm-8 text-left">
	                  		<button type="button" class="btn btn-default" onclick="pub();">发表</button>
	                  	</div>
	               	</div>
	           	</div>
	        </form>
	     </div>
	</div>
<#include "/visitor/common/footer.ftl">
<#include "/manager/common/js.ftl">
<script src="/third-party/emoji/js/jquery.emoji.min.js"></script>
<script src="/third-party/emoji/js/jquery.mCustomScrollbar.min.js"></script>
<script src="/third-party/emoji/js/jquery.mousewheel-3.0.6.min.js"></script>
<script>
	function pub(){
		var userId = $("#postForm").find("input[name='userId']").val();
		if (userId == "") {
			alert("请先登录");
			return false;
		} 
		var content = $("#pub_content").val();
		if (content.trim() == '') {
			alert("请输入内容");
			return false;
		} else {
			content = content.replace(/\n/g,"<br/>").replace(/\s/g,"&nbsp;");
		}
		
		var data = {
				content:content,
				createUser:'${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}',
				rand:Math.random()
			}
		$.ajax({
			url:"/post/pub.do",
			data:$("#postForm").serialize() + "&" + $.param(data),
			success:function(res){
				alert("保存成功！"+status);
				$("#postForm")[0].reset();
				search();
			},
			error:function(){
				alert("保存失败！");
			}
		});
	}
</script>
</body>
</html>