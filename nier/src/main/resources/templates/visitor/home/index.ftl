<#include "/visitor/common/import/init.ftl">
<!DOCTYPE html>
<html>
<head>
<title>home</title>
<#include "/visitor/common/import/header.ftl">
<link rel="stylesheet" type="text/css" href="/third-party/carousel/css/carousel.css"/> 
</head>
<body>
	<#include "/visitor/common/layout/top.ftl">
	<div class="banner">
		<div class="yx-rotaion">
			<ul class="rotaion_list">
				<li><a href="#"><img src="/nier/images/nier.png" width="600px" height="200px" alt="美国俄州遭遇龙卷风 已致91人死"></a></li>
				<li><a href="#"><img src="/nier/images/nier.png" width="600px" height="200px" alt="深圳路面塌陷形成直径10米大坑"></a></li>
				<li><a href="#"><img src="/nier/images/nier.png" width="600px" height="200px" alt='"520" 武汉新人扎堆结婚'></a></li>
				<li><a href="#"><img src="/nier/images/nier.png" width="600px" height="200px" alt="暴雨突袭广州 南沙上演科幻大片"></a></li>
				<li><a href="#"><img src="/nier/images/nier.png" width="600px" height="200px" alt="上海美博会模特赤身才会博眼球"></a></li>			
			</ul>	
		</div>
	</div>
	<div class="content" style="min-height: 1260px">
		<div class="clearfix" style="width: 100%">
	        <ul class="ul-h">
	            <li class="active"><a href="#">热门</a></li>
	            <li><a href="#">推荐</a></li>
	            <li><a href="#">Java</a></li>
	            <li><a href="#">Java</a></li>
	            <li><a href="#">Java</a></li>
	            <li><a href="#">Java</a></li>
	            <li><a href="#">Java</a></li>
	            <li><a href="#">Java</a></li>
	            <li><a href="#">Java</a></li>
	            <li><a href="#">Java</a></li>
	        </ul>
		</div>
		<div class="">
			<div style="border-top: 1px solid #20B2AA; border-bottom: 1px solid #20B2AA;">
				<#list 1..15 as i> 
					<a href="#"><span class="tag">水电费</span></a>
					<a href="#"><span class="tag">大师法规</span></a>
					<a href="#"><span class="tag">阿达</span></a>
					<a href="#"><span class="tag">柔荑花</span></a>  
				</#list>
			</div>
		</div>
		<div class="clearfix">
			<div class="left-sec">
				<div class="topic-box">
					<div class="topic-header">热门榜单</div>
					<ul class="topic-list">
						<#list 1..15 as i>
							<li class="topic-item">
								<#if i lt 4>
									<span class="topic-tag hot">${i}</span>
									<#else>
									<span class="topic-tag">${i}</span>
								</#if>
								<a href="#">nier大获成功！</a>
								<span class="topic-num">13594</span>
							</li>
						</#list>
					</ul>
				</div>
			</div>
			
			<div class="middle-sec">
				<div class="n-refresh">
					更新内容
				</div>
				<ul class="n-list">
					<#list 1..15 as i>
						<li class="n-item">
							<div class="g-name"><a href="#">java吧</a></div>
							<div class="t-name"><a href="#">第三方萨达</a></div>
							<div class="t-txt">
								巴拉巴拉大割发代首噶尔噶大师法师打发斯蒂芬多发发的说法
								巴拉巴拉大割发代首噶尔噶大师法师打发斯蒂芬多发发的说法...</div>
							<ul class="t-img">
								<li>
									<img src="/nier/images/nier.png" width="150px" height="100px">
								</li>
							</ul>
							<div class="n-reply">
								<span><a href="#">nier</a></span>
								<span>2017-11-20 13:33</span>
							</div>
						</li>
					</#list>
				</ul>
			</div>
			<div class="right-sec">
			</div>
		</div>
	</div>
	<!-- ########## PENDANT START ########## -->
	<div class="share">
		<div class="share-main" style="display: none;">
			<div>
				<ul>
					<li>
						<div class="share-item icon-1"></div>
					</li>
					<li>
						<div class="share-item icon-2"></div>
					</li>
					<li>
						<div class="share-item icon-3"></div>
					</li>
					<li>
						<div class="share-item icon-4"></div>
					</li>
					<li>
						<div class="share-item icon-5"></div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- ########## PENDANT END ########## -->
	<#include "/visitor/common/layout/footer.ftl">
	<#include "/visitor/common/import/js.ftl">
<script src="/third-party/carousel/js/carousel.js"></script>
<script>
	const cuid = '${(cuser.id)!""}';
	
	$(".yx-rotaion").yx_rotaion({
		/**轮换间隔时间，单位毫秒*/
        during:3000,
		 /**是否显示左右按钮*/
        btn:true,
		 /**是否显示焦点按钮*/
        focus:true,
		 /**是否显示标题*/
        title:true,
		 /**是否自动播放*/
        auto:true	
	});
</script>
</body>
</html>