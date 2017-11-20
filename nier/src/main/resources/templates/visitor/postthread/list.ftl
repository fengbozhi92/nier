	<div class="container" style="height: 1260px">
		<div class="panel-body" style="padding-bottom:0px;">
        	<table id="threads" data-use-row-attr-func="true" data-reorderable-rows="true"></table>
    	</div>
    	
    	<form role="form" id="threadForm">
           	<div class="col-sm-12 modal-body form-horizontal">
           		<div class="form-group">
           			<div class="col-sm-2"></div>
                   	<div class="col-sm-8">
                   		<h4>发表新贴</h4>
                   	</div>
               	</div>
           		<input type="hidden" name="groupId" value="${group.id}">
           		<input type="hidden" name="userId" value="${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!''}">
               	<div class="form-group">
                   	<label class="col-sm-2 lh34 text-right" for="title">标题</label>
                   	<div class="col-sm-8">
                   		<input type="text" name="title" class="form-control" id="title" placeholder="名称">
                   	</div>
               	</div>
     
               	<div class="form-group">
                  	<label class="col-sm-2 lh34 text-right" for="content">内容</label>
                   	<div class="col-sm-8">
                   		<textarea name="content" class="form-control" id="content" rows="5"></textarea>
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
<#include "/visitor/common/js.ftl">
<script>
	$(function () {
	    //1.初始化Table
	    var oTable = new TableInit();
	    oTable.Init();
	    //2.初始化Button的点击事件
	    var oButtonInit = new ButtonInit();
	    oButtonInit.Init();
	    $("#threads thead").hide();
	});

	var TableInit = function () {
	    var oTableInit = new Object();
	    //初始化Table
	    oTableInit.Init = function () {
	        $('#threads').bootstrapTable({
	            url: '/postthread/ajaxList.do',  //请求后台的URL（*）
	            method: 'post',                     //请求方式（*）
	            toolbar: '#toolbar',                //工具按钮用哪个容器
	            striped: false,                     //是否显示行间隔色
	            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	            pagination: true,                   //是否显示分页（*）
	            sortable: true,                     //是否启用排序
	            sortOrder: "asc",                   //排序方式
	            queryParams: oTableInit.queryParams,//传递参数（*）
	            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
	            pageNumber:1,                       //初始化加载第一页，默认第一页
	            pageSize: 10,                       //每页的记录行数（*）
	            pageList: [10, 20, 30, 50],         //可供选择的每页的行数（*）
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
	            columns: [{
	                field : 'replyCount',
	                title : '回复',
	                width : 50,
	                align : 'center'
	    		},{
	                field : 'title',
	                title : '标题',
	                align : 'center',
	                formatter : function (value, row, index){
	                	var result = "";
	                	if (value != null) {
	                		result = "<a href='/postthread/view.do?id="+row.id+"'>"+value+"</a>";
	                	}
	                	return result;
	                }
	            }, {
	                field : 'content',
	                title : '内容',
	                align : 'center',
	                formatter : function (value, row, index){
	                	var result = '';
	                	if (value != null) {
	                		result = '<span data-toggle="tooltip" title="'+value+'">'+value+'</span>';
	                	}
	                	return result;
	                }
	            },{
	                field : 'userNickname',
	                title : '楼主',
	                align : 'center',
	                width : 150,
	                formatter : function (value, row, index){
	                	var result = "";
	                	if (value != null) {
	                		result = "<a href='#'>"+value+"</a>";
	                	}
	                	if (isToday(row.createTime)) {
	                		var date = "<span style='float:right;color:#b0b0b0;'>"+new Date(row.createTime).format('HH:mm')+"</span>";
	                	} else {
	                		var date = "<span style='float:right;color:#b0b0b0;'>"+new Date(row.createTime).format('yyyy-MM-dd')+"</span>";
	                	}
	                	
	                	return result+date;
	                }
	            }, {
	                field : 'userNickname',
	                title : '最后回复',
	                align : 'center',
	                width : 150,
	                formatter : function (value, row, index){
	                	var result = "";
	                	if (value != null) {
	                		result = "<a href='#'>"+value+"</a>";
	                	}
	                	if (isToday(row.createTime)) {
	                		var date = "<span style='float:right;color:#b0b0b0;'>"+new Date(row.createTime).format('HH:mm')+"</span>";
	                	} else {
	                		var date = "<span style='float:right;color:#b0b0b0;'>"+new Date(row.createTime).format('yyyy-MM-dd')+"</span>";
	                	}
	                	
	                	return result+date;
	                }
	            }],
	            onExpandRow: function (index, row, $detail) {
	    			oInit.InitSubTable(index, row, $detail);
	    		}
	            
	        });
	    }; 
	    var oInit = new Object();    
	    //得到查询的参数
	    oTableInit.queryParams = function (params) {
	        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	            size: this.pageSize,   //页面大小
	            page: this.pageNumber-1,  //页码
	            groupId:'${group.id}'
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
		$('#threads').bootstrapTable('refresh');
	}
	
	function pub(){
		var userId = $("#threadForm").find("input[name='userId']").val();
		if (userId == "") {
			alert("请先登录");
			return false;
		}
		var data = {
				createUser:'${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}',
				rand:Math.random()
			}
		$.ajax({
			url:"/postthread/pub.do",
			data:$("#threadForm").serialize() + "&" + $.param(data),
			success:function(res){
				alert("保存成功！"+status);
				$("#threadForm")[0].reset();
				search();
			},
			error:function(){
				alert("保存失败！");
			}
		});
	}
</script>