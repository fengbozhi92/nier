<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
	    <div class="navbar-header">
	        <a class="navbar-brand" href="#">Nier</a>
	    </div>
	    <div>
	        <ul class="nav navbar-nav">
	            <li class="active"><a href="#">iOS</a></li>
	            <li><a href="#">SVN</a></li>
	            <li class="dropdown">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                    Java <b class="caret"></b>
	                </a>
	                <ul class="dropdown-menu">
	                    <li><a href="#">jmeter</a></li>
	                    <li><a href="#">EJB</a></li>
	                    <li><a href="#">Jasper Report</a></li>
	                    <li class="divider"></li>
	                    <li><a href="#">分离的链接</a></li>
	                    <li class="divider"></li>
	                    <li><a href="#">另一个分离的链接</a></li>
	                </ul>
	            </li>
	        </ul>
	        <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
      		<#if (Session.SPRING_SECURITY_CONTEXT.authentication.principal)??>
	      		<li>
	      			<a href="#" style="padding: 10px;">
	      				<img alt="" src="/nier/images/nier.png" style="width: 32px;height: 32px;">
	      			</a>
	      		</li>
	      		<li class="dropdown">     			
	          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
	          			${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.username)!"用户"}<span class="caret"></span>
	          		</a>
		          	<ul class="dropdown-menu">
			            <li><a href="/person/setting.do?id=${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!''}">账号设置</a></li>
			            <li><a href="/blog/my.do?userId=">我的博客</a></li>
		          	</ul>
	       	 	</li>
	      		<li>
	      		<a href="javascript:if(confirm('确定退出吗？')){$.ajax({url:'/logout/logout.do',success:function(){location.reload();}});}">
	      		退出
	      		</a>
	      		</li>
			<#else>
	     		<li><a href="#">游客</a></li>
	     		<li><a href="/login/login.do">登陆</a></li>
      		</#if>
      </ul>
	    </div>
    </div>
</nav>