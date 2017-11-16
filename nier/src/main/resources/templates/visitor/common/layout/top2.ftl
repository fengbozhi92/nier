<nav class="nier-nav" role="navigation" >
    <div class="container-fluid">
	    <div class="left">
	        <h2>Nier</h2>
	    </div>
	    <div class="right">
	    	<#if currentUser??>	
	        	<div class="l">
	        		<span><a href="/person/setting.do?id=${currentUser.id!''}">设置</a></span>
	        		<span>|</span>
	        		<span><a href="javascript:if(confirm('确定退出吗？')){$.ajax({url:'/logout/logout.do',success:function(){location.reload();}});}">退出</a></span>
	        		<span>|</span>
	        		<span><a href="#">帮助</a></span>
	        	</div>
	        	<div class="u">
	       			<a href="#" class="un">${currentUser.nickname}</a>
	       			<span>&sdot;</span>
	        	</div>
        	<#else>
        		<div class="l">
	        		<span><a href="/login/login.do">登陆</a></span>
	        		<span>|</span>
	        		<span><a href="#">注册</a></span>
	        		<span>|</span>
	        		<span><a href="#">帮助</a></span>
	        	</div>
	        	<div class="u">
	       			<span class="msg">您还未登录</span>
	       			<span>&sdot;</span>
	        	</div>
        	</#if>
	    </div>
    </div>
</nav>