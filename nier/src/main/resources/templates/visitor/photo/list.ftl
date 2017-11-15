<#include "/visitor/common/macro/default.ftl">
<!DOCTYPE html>
<html>
<head>
<#include "/visitor/common/header.ftl">
<title>photo</title>
<link href="/third-party/cropper/css/cropper.min.css" rel="stylesheet">
<link href="/third-party/cropper/css/sitelogo.css" rel="stylesheet">
<link href="/third-party/jquery/zyUpload.css" rel="stylesheet">
<link rel="stylesheet" href="/third-party/bb/css/baguetteBox.css">
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
		h1, h2, h3, footer, .gallery {
		    text-align: center;
		}

		pre {
		    width: 340px;
		    margin: 0 auto;
		    border: dashed 1px #aaa;
		    margin-bottom: 10px;
		}

		@media (max-width: 480px) {
		    pre {
		        max-width: 98%;
		    }
		}

		header, footer {
		    display: block;
		    padding: .2em 0;
		    background-color: #555;
		    box-shadow: 0 0 8px #222;
		}

		footer {
		    margin-top: 1.5em;
		}

		.content {
		    max-width: 1160px;
		    margin: 0 auto;
		}

		.gallery:after {
		    content: '';
		    display: block;
		    height: 2px;
		    margin: .5em 0 1.4em;
		    background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0) 0%, rgba(77,77,77,1) 50%, rgba(0, 0, 0, 0) 100%);
		    background-image: linear-gradient(to right, rgba(0, 0, 0, 0) 0%, rgba(77,77,77,1) 50%, rgba(0, 0, 0, 0) 100%);
		}

		.gallery img {
		    height: 100%;
		}

		.gallery a {
		    width: 240px;
		    height: 180px;
		    display: inline-block;
		    overflow: hidden;
		    margin: 4px 6px;
		    box-shadow: 0 0 4px -1px #000;
		}

		.ribbon > img {
		    position: absolute;
		    top: 0;
		    right: 0;
		    border: 0;
		}

		@media (max-width: 768px) {
		    .sm-hidden {
		        display: none;
		    }
		}

		/* Highlight.js Tomorrow Night style */
		.hljs-comment,.hljs-quote{color:#969896}.hljs-deletion,.hljs-name,.hljs-regexp,.hljs-selector-class,.hljs-selector-id,.hljs-tag,.hljs-template-variable,.hljs-variable{color:#c66}.hljs-tag {color: #f8f8f2}.hljs-built_in,.hljs-builtin-name,.hljs-link,.hljs-literal,.hljs-meta,.hljs-number,.hljs-params,.hljs-type{color:#de935f}.hljs-attr{color:#f0c674}.hljs-addition,.hljs-bullet,.hljs-string,.hljs-symbol{color:#b5bd68}.hljs-section,.hljs-title{color:#81a2be}.hljs-keyword,.hljs-selector-tag{color:#b294bb}.hljs{display:block;overflow-x:auto;background:#1d1f21;color:#c5c8c6;padding:.8em}.hljs-emphasis{font-style:italic}.hljs-strong{font-weight:700}
	</style>
</head>
<body>
	<#include "/visitor/common/layout/top.ftl">
	<div class="container" style="min-height: 1260px;background-color: #ddd;">
		<div id="title" class="col-sm-12">
			<div class="row">
				<div class="col-sm-6">
					<h3>photo</h3>
				</div>
				<div class="col-sm-6 text-right" style="line-height:63px">
					<button id="btn_add" type="button" class="btn btn-default">新建</button>
				</div>
			</div>
		</div>
		<div class="col-sm-12">
			<div id="photo">
			    <div class="baguetteBoxFive gallery">

   				</div>
			</div>
		</div>
		<div class="col-sm-12">
			<div id="demo" class="h5"></div>
			</div>
		</div>
	</div>
<#include "/visitor/common/layout/footer.ftl">
<#include "/visitor/common/js.ftl">
<script src="/third-party/cropper/js/cropper.min.js"></script>
<script src="/third-party/cropper/js/sitelogo.js"></script>
<script src="/third-party/jquery/zyUpload.js"></script>
<script src="/third-party/jquery/zyFile.js"></script>
	<script src="/third-party/bb/js/baguetteBox.js" async></script>
	<script src="/third-party/bb/js/highlight.min.js" async></script>
<script>
	var cUser = '${(currentUser.id)!""}';
	var aId = '${aid!""}';
	
	window.onload = function() {
	    baguetteBox.run('.baguetteBoxOne');
	    baguetteBox.run('.baguetteBoxTwo');
	    baguetteBox.run('.baguetteBoxThree', {
	        animation: 'fadeIn',
	        noScrollbars: true
	    });
	    baguetteBox.run('.baguetteBoxFour', {
	        buttons: false
	    });
	    baguetteBox.run('.baguetteBoxFive', {
	        captions: function(element) {
	            return element.getElementsByTagName('img')[0].alt;
	        }
	    });

	    if (typeof oldIE === 'undefined' && Object.keys) {
	        hljs.initHighlighting();
	    }
	};
	
	$(function(){
		refresh(0,10);
	    $("#btn_add").on("click",function(){
	    	$('#addModal').modal();
	    });
	})
	
	$(function(){
		// 初始化插件
		$("#demo").zyUpload({
			width            :   "650px",                 // 宽度
			height           :   "400px",                 // 宽度
			itemWidth        :   "120px",                 // 文件项的宽度
			itemHeight       :   "100px",                 // 文件项的高度
			url              :   "/file/photo/upload.do?cUser="+cUser+"&aId="+aId,  // 上传文件的路径
			multiple         :   true,                    // 是否可以多个文件上传
			dragDrop         :   false,                    // 是否可以拖动上传文件
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
				refresh();
			},
			onFailure: function(file){                    // 文件上传失败的回调方法
				console.info("此文件上传失败：");
				console.info(file);
			},
			onComplete: function(responseInfo){           // 上传完成的回调方法
				console.info("文件上传完成");
				console.info(responseInfo);
				refresh(0,10);
			}
		});
	});	
	function refresh(page, size){
		$.ajax({
			url:"/photo/ajaxList.do",
			type:"POST",
			data:{
				page:page,
				size:size
			},
			success:function(res){
				$("#photo div.baguetteBoxFive").empty();
				$.each(res.data.content, function(i, item){
					var a = '<a href="'+item.path+'">';
					    a+= '<img src="'+item.path+'" alt="'+item.name+'">';
					    a+= '</a>';
					//var a = "<div style=\"background-color:white; padding:5px; margin:5px; width:200px;height:220px;float:left;\">"+
					//		"<div class=\"text-center\" style=\"min-height:156px\"><img src=\""+item.path+"\" width=\"156px\"></div>"+
					//		"<div class=\"text-center\"><a href=\"#\" onclick=\"changeName(this,'"+item.id+"','"+item.name+"')\">"+item.name+"</a></div>"+
					//		"</div>";
					$("#photo div.baguetteBoxFive").append(a);
				})
			},
			error:function(){
				
			}
		})
	}
	
	function changeName(el, id, name){
		var h = '<div class="col-sm-12">';
			h+=   '<input type="text" value="'+name+'" onblur="changeNameCancel(this);" style="width:100px; border:1px solid #ddd">';
			h+=   '<a href="#">确定</a><a href="#">取消</a>';
			h+= '</div>';
		$(el).parent().html(h);
	}
	
	function changeNameCancel(el){
		refresh(0,10);
		
	}
</script>
<#include "/visitor/photoalbum/add.ftl">
</body>
</html>