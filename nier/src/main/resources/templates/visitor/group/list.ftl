<!DOCTYPE html>
<html>
<head>
<#include "/visitor/common/header.ftl">
<title>group</title>
</head>
<body>
	<#include "/visitor/common/top.ftl">	
	<div class="container" style="min-height: 1260px">
		<div class="col-md-8">
			<div class="panel-body" style="padding-bottom:0px;">
	           	<form id="formSearch" class="form-horizontal">
	               	<div class="form-group" style="margin-top:15px">
	                    <div class="col-sm-8">
	                        <input type="text" class="form-control" id="search_name" value="${searchName!''}">
	                    </div>
	                    <div class="col-sm-2" style="text-align:left;">
	                        <button type="button" style="margin-left:50px" id="btn_query" class="btn default" onclick="search();">查询</button>
	                    </div>
	               	</div>
	           	</form>
	        </div>
			<div class="panel-body" style="padding-bottom:0px;">
	        	<table id="groups" data-use-row-attr-func="true" data-reorderable-rows="true"></table>
	    	</div>
    	</div>
    	<div class="col-md-4"></div>
	</div>
<#include "/visitor/common/footer.ftl">
<#include "/manager/common/js.ftl">
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
	        $('#groups').bootstrapTable({
	            url: '/group/ajaxList.do',  		//请求后台的URL（*）
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
	            showHeader: false,
	            showFooter: false,
	            onlyInfoPagination: false,
	            showColumns: false,
	            showPaginationSwitch: false,
	            columns: [{
	                field : '',
	                title : '',
	                align : 'center',
	                formatter : function (value, row, index){
	                	var result = '<div>'+
	                				 	'<div class="col-sm-12">'+
	                				 		'<h4>'+row.name+'</4>'+
	                				 	'</div>'+
	                				 '</div>';
	                	return result;
	                }
	            }],      
	        });
	    }; 
	    var oInit = new Object();    
	    //得到查询的参数
	    oTableInit.queryParams = function (params) {
	        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	            size: this.pageSize,   //页面大小
	            page: this.pageNumber-1,  //页码
	            name: $("#search_name").val(),
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
	    	var name = $("#search_name").val();
	    	if (name != '') {
	    		$.each(res.data.content, function(i, item){
    					var reg = new RegExp("(" + name.replace(/,/, "|") + ")", "g");
    					item.name =item.name.replace(reg,"<font style=\"color:red; font-weight: bold;\">$1</font>");	
		    	});
	    	}
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
		$('#groups').bootstrapTable('refresh');
	}

</script>
</body>
</html>