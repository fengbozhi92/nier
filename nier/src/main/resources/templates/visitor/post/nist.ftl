<div id="title" class="col-sm-12">
	<div class="row">
		<div class="col-sm-8">
			<h3>${thread.title}</h3>
		</div>
		<div class="col-sm-4 text-right" style="line-height:63px">
			<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;只看楼主</button>&nbsp;
			<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-tag"></span>&nbsp;收藏</button>&nbsp;
			<button type="button" class="btn btn-default"  onclick="javascript:document.getElementById('pub_post').scrollIntoView(true);return false;">
				<span class="glyphicon glyphicon-comment"></span>&nbsp;回复</button>
		</div>
	</div>
</div>
<div class="panel-body" style="padding-bottom:0px;">
	<table data-toggle="table"
		 data-url="/post/ajaxList.do"
		 data-pagination="true"
		 data-method="post"
		 data-show-search="true"
		 data-show-columns="true"
		 data-icon-size="outline"  
		 data-mobile-responsive="true"
		 data-height="500" 
		 id="tablelist"
		 data-side-pagination="server">
    <thead>
    <tr>
	    <th data-field="id">ID</th>
	    <th data-field="username" 
	        data-formatter="usernameFormatter"
	        data-events="usernameEvents">用户名</th>
	    <th data-field="real_name">真实姓名</th>
	    <th data-field="tel_num">座机</th>
	    <th data-field="mobile">手机</th>
	    <th data-field="user_type">用户类型</th>
	    <th data-field="operation" 
	        data-formatter="actionFormatter"
	        data-events="actionEvents">操作</th>
	    </tr>
    </thead>
</table>
</div>
<#include "/manager/common/js.ftl">
<script>

</script>