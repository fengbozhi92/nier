<#include "/visitor/common/macro/default.ftl">
<!DOCTYPE html>
<html>
<head>
<#include "/visitor/common/header.ftl">
<title>home</title>
<style type="text/css">
	.avatar-btns button {
	    height: 35px;
	}
</style>
<link href="/third-party/wang-editor/css/wang-editor.min.css" rel="stylesheet">		
<link href="/third-party/jquery/zyUpload.css" rel="stylesheet">
</head>
<body>
	<#include "/visitor/common/layout/top.ftl">
	<div class="container">
		<div class="jumbotron">
			${currentUser!""}
		</div>
		
		<div class="jumbotron">
			
			<button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#avatar-modal" style="margin: 10px;">
				修改头像
			</button>
		<div class="user_pic" style="margin: 10px;">
			<img src=""/>
		</div>

		<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<!--<form class="avatar-form" action="upload-logo.php" enctype="multipart/form-data" method="post">-->
					<form class="avatar-form">
						<div class="modal-header">
							<button class="close" data-dismiss="modal" type="button">&times;</button>
							<h4 class="modal-title" id="avatar-modal-label">上传图片</h4>
						</div>
						<div class="modal-body">
							<div class="avatar-body">
								<div class="avatar-upload">
									<input class="avatar-src" name="avatar_src" type="hidden">
									<input class="avatar-data" name="avatar_data" type="hidden">
									<label for="avatarInput" style="line-height: 35px;">图片上传</label>
									<button class="btn btn-danger"  type="button" style="height: 35px;" onclick="$('input[id=avatarInput]').click();">请选择图片</button>
									<span id="avatar-name"></span>
									<input class="avatar-input hide" id="avatarInput" name="avatar_file" type="file"></div>
								<div class="row">
									<div class="col-md-9">
										<div class="avatar-wrapper"></div>
									</div>
									<div class="col-md-3">
										<div class="avatar-preview preview-lg" id="imageHead"></div>
										<!--<div class="avatar-preview preview-md"></div>
								<div class="avatar-preview preview-sm"></div>-->
									</div>
								</div>
								<div class="row avatar-btns">
									<div class="col-md-4">
										<div class="btn-group">
											<button class="btn btn-danger fa fa-undo" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"> 向左旋转</button>
										</div>
										<div class="btn-group">
											<button class="btn  btn-danger fa fa-repeat" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"> 向右旋转</button>
										</div>
									</div>
									<div class="col-md-5" style="text-align: right;">								
										<button class="btn btn-danger fa fa-arrows" data-method="setDragMode" data-option="move" type="button" title="移动">
							            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
							            </span>
							          </button>
							          <button type="button" class="btn btn-danger fa fa-search-plus" data-method="zoom" data-option="0.1" title="放大图片">
							            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, 0.1)">
							              <!--<span class="fa fa-search-plus"></span>-->
							            </span>
							          </button>
							          <button type="button" class="btn btn-danger fa fa-search-minus" data-method="zoom" data-option="-0.1" title="缩小图片">
							            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, -0.1)">
							              <!--<span class="fa fa-search-minus"></span>-->
							            </span>
							          </button>
							          <button type="button" class="btn btn-danger fa fa-refresh" data-method="reset" title="重置图片">
								            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;reset&quot;)" aria-describedby="tooltip866214">
								       </button>
							        </div>
									<div class="col-md-3">
										<button class="btn btn-danger btn-block avatar-save fa fa-save" type="button" data-dismiss="modal"> 保存修改</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
			<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
		</div>
		<div >
			<img alt="" src="/nier/images/butterfly.png">
		<div class="jumbotron">
			<img alt="" src="/nier/images/cloud.png">
		</div>
		<div class="jumbotron">
		11
		</div>
		
		<div style="height: 800px">
			<div id="editor1" class="toolbar">
    		</div>
			<button class="btn btn-default" type="button" onclick="sub()">发表</button>
		</div>
			<div id="ttt" style="height: 800px">
			<h1 style="text-align:center;">Html5 Upload示例</h1>
	
			<div id="demo" class="demo"></div>
			</div>
		</div>
	</div>
<#include "/visitor/common/layout/footer.ftl">
<#include "/visitor/common/js.ftl">
<#import "/visitor/common/js.ftl" as mac>
<@mac.loadJS third="bootstrap" nier=""/>

<script src="/third-party/wang-editor/js/wang-editor.min.js"></script>
<script src="/third-party/jquery/zyUpload.js"></script>
<script src="/third-party/jquery/zyFile.js"></script>
<script src="/third-party/jquery/jq22.js"></script>
<script>

	var E = window.wangEditor;
	var editor = new E("#editor1");
	editor.customConfig.debug = true;
	editor.customConfig.uploadFileName = 'myFileName';
	editor.customConfig.showLinkImg = false;
	editor.customConfig.uploadImgServer = '/file/image/upload.do?t='+Math.random();  // 上传图片到服务器
	editor.customConfig.menus = [
	    'head',  // 标题
	    'bold',  // 粗体
	    'italic',  // 斜体
	    'underline',  // 下划线
	    'strikeThrough',  // 删除线
	    'foreColor',  // 文字颜色
	    //'backColor',  // 背景颜色
	    //'link',  // 插入链接
	    //'list',  // 列表
	    'justify',  // 对齐方式
	    //'quote',  // 引用
	    'emoticon',  // 表情
	    'image',  // 插入图片
	    //'table',  // 表格
	    //'video',  // 插入视频
	    //'code',  // 插入代码
	    'undo',  // 撤销
	    'redo'  // 重复
	];

	 //editor.customConfig.pasteFilterStyle = false;
	 editor.customConfig.pasteTextHandle = function (content) {
	        // content 即粘贴过来的内容（html 或 纯文本），可进行自定义处理然后返回
	        alert(content.indexOf("http://")>0)
	        return content;
	    }
	//editor.customConfig.uploadImgShowBase64 = true
	editor.create();
	
	function sub(){
		if($("div.w-e-text img.emoji").attr("src") || editor.txt.text() != ""){
			$.ajax({
				url:"/home/index.do",
				data:{
					content:editor.txt.html()
				},
				success:function(res){
					$("#ttt").html(editor.txt.html());
				},
				error:function(res){
					
				}
			});
		} else {
			alert("内容不能为空");
		}
	}

</script>
</body>
</html>