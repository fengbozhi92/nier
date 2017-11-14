<#include "/visitor/common/macro/default.ftl">
<!DOCTYPE html>
<html>
<head>

<title>home</title>
<link rel="stylesheet" type="text/css" href="/third-party/bootstrap/css/bootstrap.min.css"/>
<link href="/third-party/wang-editor/css/wang-editor.min.css" rel="stylesheet">		
<link href="/third-party/jquery/zyUpload.css" rel="stylesheet">
<link href="/nier/css/emoji.css" rel="stylesheet">
<style type="text/css">
.h5 * {
  -webkit-box-sizing: content-box;
     -moz-box-sizing: content-box;
          box-sizing: content-box;
}
.h5 *:before,
.h5 *:after {
  -webkit-box-sizing: content-box;
     -moz-box-sizing: content-box;
          box-sizing: content-box;
}
</style>
</head>
<body>
	<#include "/visitor/common/layout/top.ftl">
	<div class="container">
		<div class="jumbotron">
			${currentUser!""}<div class="emoji_tieba17"></div>
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
	
			<div id="demo" class="h5"></div>
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
<script>

	var E = window.wangEditor;
	var editor = new E("#editor1");
	editor.customConfig.debug = true;
	editor.customConfig.uploadFileName = 'imageFile';
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
	
	$(function(){
		// 初始化插件
		$("#demo").zyUpload({
			width            :   "650px",                 // 宽度
			height           :   "400px",                 // 宽度
			itemWidth        :   "120px",                 // 文件项的宽度
			itemHeight       :   "100px",                 // 文件项的高度
			url              :   "/file/image/upload.do",  // 上传文件的路径
			multiple         :   true,                    // 是否可以多个文件上传
			dragDrop         :   true,                    // 是否可以拖动上传文件
			del              :   true,                    // 是否可以删除文件
			finishDel        :   false,  				  // 是否在上传文件完成后删除预览
			/* 外部获得的回调接口 */
			onSelect: function(files, allFiles){                    // 选择文件的回调方法
				console.info("当前选择了以下文件：");
				console.info(files);
				console.info("之前没上传的文件：");
				console.info(allFiles);
			},
			onDelete: function(file, surplusFiles){                     // 删除一个文件的回调方法
				console.info("当前删除了此文件：");
				console.info(file);
				console.info("当前剩余的文件：");
				console.info(surplusFiles);
			},
			onSuccess: function(file){                    // 文件上传成功的回调方法
				console.info("此文件上传成功：");
				console.info(file);
			},
			onFailure: function(file){                    // 文件上传失败的回调方法
				console.info("此文件上传失败：");
				console.info(file);
			},
			onComplete: function(responseInfo){           // 上传完成的回调方法
				console.info("文件上传完成");
				console.info(responseInfo);
			}
		});
	});
</script>
</body>
</html>