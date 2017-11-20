<div id="title" class="col-sm-12">
	<div class="row">
		<div class="col-sm-6">
			<h3>${thread.title}</h3>
		</div>
		<div class="col-sm-6 text-right" style="line-height:63px">
			<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;只看楼主</button>&nbsp;
			<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-tag"></span>&nbsp;收藏</button>&nbsp;
			<button type="button" class="btn btn-default"  onclick="javascript:document.getElementById('pub_post').scrollIntoView(true);return false;">
				<span class="glyphicon glyphicon-comment"></span>&nbsp;回复</button>
		</div>
	</div>
</div>
<div class="panel-body" style="padding-bottom:0; padding-top: 0">
	<table id="posts"></table>
</div>
<#include "/visitor/common/js.ftl">
<script>
	$(function () {
	    //1.初始化Table
	    var oTable = new TableInit();
	    oTable.Init();
	    //2.初始化Button的点击事件
	    var oButtonInit = new ButtonInit();
	    oButtonInit.Init();
	});
	
	var TableInit = function () {
	    var oTableInit = new Object();
	    //初始化Table
	    oTableInit.Init = function () {
	        $('#posts').bootstrapTable({
	            url: '/post/ajaxList.do',  			//请求后台的URL（*）
	            method: 'post',                     //请求方式（*）
	            toolbar: '#title',                  //工具按钮用哪个容器
	            toolbarAlign: 'center',
	            striped: false,                     //是否显示行间隔色
	            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	            pagination: true,                   //是否显示分页（*）
	            sortable: false,                    //是否启用排序
	            sortOrder: "asc",                   //排序方式
	            queryParams: oTableInit.queryParams,//传递参数（*）
	            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
	            pageNumber:1,                       //初始化加载第一页，默认第一页
	            pageSize: 10,                       //每页的记录行数（*）
	            pageList: [],         				//可供选择的每页的行数（*）
	            search: false,                      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
	            strictSearch: true,
	            responseHandler: responseHandler,
	            showColumns: false,                  //是否显示所有的列
	            showRefresh: false,                  //是否显示刷新按钮
	            minimumCountColumns: 2,             //最少允许的列数
	            clickToSelect: false,               //是否启用点击选中行
	            //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
	            showToggle: false,                  //是否显示详细视图和列表视图的切换按钮
	            cardView: false,                    //是否显示详细视图
	            detailView: false,                  //是否显示父子表
	            editable: false,					//
	            showHeader: false,
	            showFooter: false,
	            onlyInfoPagination: false,
	            showColumns: false,
	            showPaginationSwitch: false,
	            columns: [{
	                field : '',
	                title : '',
	                width : 150,
	                align : 'center',
	                class : "p-left",
	                formatter : function (value, row, index){
	                	var head = '<img src="/nier/images/system/sys-def-head.png" width="100" style="padding:2px;border:1px solid #b0b0b0;">';
	                	if (row.user.imagePath != null && row.user.imagePath.length > 36) {
	                		head = '<img src="'+row.user.imagePath+'" width="100" style="padding:2px;border:1px solid #b0b0b0;">';
	                	}
	                	var	result = '<div class="col-sm-12">'+
	                					'<div class="row">'+
		                			     	'<div class="col-sm-12" style="min-height:100px;">'+
		                				    	head+
		                				   	'</div>'+
		                				   	'<div class="col-sm-12 lh34">'+
	                				    		'<a href="#">'+row.user.nickname+'</a>'+
	                				   		'</div>'+
	                				   		'<div class="col-sm-12 lh34">'+
                				    			'<button class="btn btn-default"><span class="glyphicon glyphicon-star"></span>1</button>'+
                				   			'</div>'+
	                				   	'</div>'+  	
	                				 '</div>';
	                	return result;
	                }
	    		},{
	                field : '',
	                title : '内容',
	                align : 'left',
	                formatter : function (value, row, index){
	                	var date;
	                	/*if (isToday(row.createTime)) {
	                		date = new Date(row.createTime).format('HH:mm');
	                	} else {
	                		date = new Date(row.createTime).format('yyyy-MM-dd');
	                	}*/
	                	date = new Date(row.createTime).format('yyyy-MM-dd HH:mm');
	                	var tool;
	                	if ('${thread.createUser}' == '${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}'){
	                		tool = '<a href="#" style="color:#b0b0b0">禁言</a>&nbsp;|&nbsp;<a href="#" style="color:#b0b0b0">删除</a>';
	                	}
	                	else if (row.userId == '${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}') {
	                		tool = '<a href="#" style="color:#b0b0b0">删除</a>';
	                	} else {
	                		tool = '<a href="#" style="color:#b0b0b0">举报</a>';
	                	}
	                	var lord;
	                	if (row.userId = '${thread.createUser}') {
	                		lord = "楼主"
	                	}
	                	
	                	var replyList = '';
	                	var replyContent = 'display:none;';
	                	var replyTarget = "<a href=\"#\" onclick=\"reply(this,'"+row.id+"');return false;\">回复</a>"+
										  "<a href=\"#\" onclick=\"reply(this,'"+row.id+"');return false;\" style=\"display:none\">收起回复</a>";
	                	if (row.existedReply) {
	                		replyContent = '';
	                		replyTarget = "<a href=\"#\" onclick=\"reply(this,'"+row.id+"');return false;\" style=\"display:none\">回复</a>"+
							  			  "<a href=\"#\" onclick=\"reply(this,'"+row.id+"');return false;\">收起回复</a>";
				  			
							$.each(row.replys, function(i, item){
								var rep_user = '';
								if (item.targetUserNickname !=null) {
									rep_user = '回复 <a href="#">'+item.targetUserNickname+'</a> : ';
						 		}
								replyList += '<div class="col-sm-12" style="min-height:50px; padding:2px;">'+
	                							 '<div class="row">'+
			                						 '<div class="col-sm-12">'+
			                						 	'<div class="col-sm-1">'+
			                						 		'<img src="/nier/images/system/sys-def-head.png" width="32" style="padding:2px;border:1px solid #b0b0b0;">'+
			                						 	'</div>'+
			                						 	'<div class="col-sm-11">'+
			                						 		'<p><a href="#">'+item.userNickname+'</a> : '+
			                						 		rep_user+
			                						 		item.content+'</p>'+
			                						 		'<p class="text-right" style="color:#b0b0b0">'+new Date(item.createTime).format('yyyy-MM-dd HH:mm')+
			                						 			'&nbsp;<a href="#" onclick=\"addName(\''+row.id+'\',\''+item.userNickname+'\');return false;\">回复</a>'+
			                						 		'</p>'+
			                						 	'</div>'+
			                						 '</div>'+
			                					 '</div>'+
	                						 '</div>';
	                		})
	                	}
	                	var	result = '<div class="col-sm-12"">'+
	                					'<div class="row">'+
		                			     	'<div class="col-sm-12" style="min-height:150px;">'+
		                				    	'<div>'+row.content+'</div>'+
		                				   	'</div>'+
		                				   	
		                				   	'<div class="col-sm-12 lh34" class="panel-group">'+
		                				   		'<div class="row">'+
		                				   			'<div class="col-lg-4 col-md-2 hidden-sm">'+
	                				    			'</div>'+
	                				    			'<div class="col-lg-8 col-md-10 col-sm-12 text-right">'+
	                				    				'<div class="row" style="color:#b0b0b0;">'+
			                				    			'<div class="col-sm-4 col-xs-4">'+
		                				    					tool+
		                				    				'</div>'+
			                				    			'<div class="col-sm-1 col-xs-1" style="padding:0">'+
				            				    				'<span>'+row.sequence+'楼</span>'+
				            				    			'</div>'+
				            				    			'<div class="col-sm-4 col-xs-4" style="padding:0">'+
		            				    						'<span>'+date+'</span>'+
	            				    						'</div>'+
			            				    				'<div class="col-sm-3 col-xs-3">'+
			            				    					replyTarget+
		            				    					'</div>'+
	            				    					'</div>'+
	            				    				'</div>'+
	                				    		'</div>'+
	                				   		'</div>'+
	    	
                				   			'<div class="col-sm-12" style="'+replyContent+' border-top:1px solid #F0F0F0; padding-top:5px; background-color:#F0F0F0; border-radius:5px;" id="'+row.id+'">'+
                				   				'<div class="row">'+
                				   					replyList+
                				   				'</div>'+
                				   				'<div class="row">'+
	                				   				'<div class="col-sm-12">'+
	                				   					'<textarea id="rep_content'+row.id+'" class="form-control" style="resize:none;min-height:50px;"></textarea>'+
	                				   				'</div>'+
	                				   			'</div>'+
	                				   			'<div class="row" style="margin-top:5px">'+
                				   					'<div class="col-sm-8">'+
                				   					'</div>'+
	                				   				'<div class="col-sm-4 text-right">'+
	                				   					'<button type="button" class="btn btn-default btn-sm" onclick="pub_rep(\''+row.id+'\',\'\')">发表</button>'+
	                				   				'</div>'+
                				   				'</div>'+
                				   			'</div>'+
                				   			
	                				   	'</div>'+  	
	                				 '</div>';
	                	return result;
	                } 
	            },],  
	        });
	    }; 
	    var oInit = new Object();    
	    //得到查询的参数
	    oTableInit.queryParams = function (params) {
	        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	            size: this.pageSize,   //页面大小
	            page: this.pageNumber-1,  //页码
	            threadId:'${thread.id}'
	        };
	        return temp;
	    };
	    return oTableInit;
	};

	var ButtonInit = function () {
	    var oInit = new Object();
	    var postdata = {};
	
	    oInit.Init = function () {
	        //初始化页面上面的按钮事件
	    };
	
	    return oInit;
	};	

	function responseHandler(res) { 
	    if (res) {
	        return {
	            "rows" : res.data.content,
	            "total" : res.data.totalElements
	        };
	    } else {
	        return {
	            "rows" : [],
	            "total" : 0
	        };
	    }
	}
	
	function search(){
		$('#posts').bootstrapTable('refresh');
	}
	
	function reply(el, id){
		$("#"+id).slideToggle();
		$(el).hide();
		$(el).siblings().show();
	}

	function pub_rep(targetId, tragetUserId){
		var content = $("#rep_content"+targetId).val();
		if (content.trim() == '') {
			alert("请输入内容");
			return false;
		} else {
			content = content.replace(/\n/g,"<br/>").replace(/\s/g,"&nbsp;");
		}
		alert(content);
		$.ajax({
			url:"/postreply/pub.do",
			data:{
				targetId:targetId,
				tragetUserId:tragetUserId,
				content:content,
				createUser:'${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}'
			},
			success:function(res){
				alert("成功！");
			},
			error:function(){
				alert("失败");
			}
		});
	}
	function addName(targetId, nickname){
		$("#rep_content"+targetId).val("回复  "+nickname+" :");
	}
</script>