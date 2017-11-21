<!DOCTYPE html>
<html>
<head>
<#include "/manager/common/header.ftl">
<#import "/manager/common/macro.ftl" as m>

<title></title>
</head>
<body>
	<#include "/manager/common/top.ftl">
	<div class="container" style="min-height: 1600px;">
		<div class="panel-body" style="padding-bottom:0px;">
        	<div class="panel panel-default">
            	<div class="panel-heading">查询条件</div>
            	<div class="panel-body">
                	<form id="formSearch" class="form-horizontal">
                    	<div class="form-group" style="margin-top:15px">
                        	<label class="control-label col-sm-1" for="search_name">名称</label>
	                        <div class="col-sm-3">
	                            <input type="text" class="form-control" id="search_name">
	                        </div>
	                        <label class="control-label col-sm-1" for="search_deleted">状态</label>
	                       	<div class="col-sm-3">
							   <@m.select data = deleted id="search_deleted" key="value" text="label" headKey="" headValue="全部"/>
							</div>
	                        <div class="col-sm-4" style="text-align:left;">
	                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary" onclick="search();">查询</button>
	                        </div>
                    	</div>
                	</form>
            	</div>
        	</div>       

	        <div id="toolbar" class="btn-group">
	            <button id="btn_add" type="button" class="btn btn-default">
	                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
	            </button>
	            <button id="btn_delete" type="button" class="btn btn-default">
	                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
	            </button>
	        </div>
        	<table id="groupCategorys"></table>
    	</div>
	</div>
<#include "/manager/common/footer.ftl">
<#include "/manager/common/js.ftl">

<script>
	$(function () {
		
	    //1.初始化Table
	    var oTable = new TableInit();
	    oTable.Init();
	    //2.初始化Button的点击事件
	    var oButtonInit = new ButtonInit();
	    oButtonInit.Init();
	    
	    $("#btn_add").on("click",function(){
	    	$('#addModal').modal();
	    });
	
	    $("#btn_delete").on("click",function(){
	    	del();
	    });
	});

	var TableInit = function () {
	    var oTableInit = new Object();
	    //初始化Table
	    oTableInit.Init = function () {
	        $('#groupCategorys').bootstrapTable({
	            url: '/manager/groupcategory/ajaxList.do',  //请求后台的URL（*）
	            method: 'post',                     //请求方式（*）
	            toolbar: '#toolbar',                //工具按钮用哪个容器
	            striped: true,                      //是否显示行间隔色
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
	            showColumns: true,                  //是否显示所有的列
	            showRefresh: true,                  //是否显示刷新按钮
	            minimumCountColumns: 2,             //最少允许的列数
	            clickToSelect: false,               //是否启用点击选中行
	            //height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
	            showToggle:false,                    //是否显示详细视图和列表视图的切换按钮
	            cardView: false,                    //是否显示详细视图
	            detailView: false,                  //是否显示父子表
	            editable:true,
	            rowStyle: function (row, index) {
	                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
	                var strclass = "";
	                if (row.deleted == 1) {
	                    strclass = 'danger';//还有一个active
	                } else if (row.deleted == 2) {
	                    strclass = 'success';
	                } else {
	                    return {};
	                }
	                return { classes: strclass }
	            },
	            columns: [{
	                checkbox: true
	            }, {
	                field : '',
	                title : '序号',
	                width : 50,
	                align : 'center',
	                formatter : function (value, row, index) {
	                	return index+1;
	         		}
	    		},{
	                field : 'name',
	                title : '名称',
	                align : 'center'
	            }, {
	                field : 'createTime',
	                title : '创建时间',
	                align : 'center',
	                width : 200,
	                formatter : function (value, row, index){
	                	return new Date(value).format('yyyy-MM-dd hh:mm:ss');
	                }
	            }, {
	                field : '',
	                title : '操作',
	                width : 100,
	                align : 'center',
	                formatter : function (value, row, index){
	                	var result = '<button class="btn btn-default btn-xs edit" type="button" onclick="edit(\''+row.id+'\');"><span class="glyphicon glyphicon-edit"></span>修改</button>';
	                	return result;
	                },
	            },]
	        });
	    }; 
	  	      
	    //得到查询的参数
	    oTableInit.queryParams = function (params) {
	        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	            size: this.pageSize,   //页面大小
	            page: this.pageNumber-1,  //页码
	            name: $("#search_name").val(), 
	            deleted:$("#search_deleted").val(),
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
		$('#groupCategorys').bootstrapTable('refresh');
	}
	
	function del(){
		var arr = new Array();
		$("#groupCategorys tr.selected").each(function(){
			arr.push($(this).attr("data-uniqueid"));
		});
		var ids = arr.join(",");
		if (ids != "" && confirm("确定要进行删除操作吗？")) {
			$.ajax({
				url:"/manager/groupcategory/remove.do",
				data:{
					id:ids
				},
				success:function(){
					alert("操作成功");
					search();
				},
				error:function(){
					alert("操作失败");
				}
			});
		}
		return;
	}
</script>
<div id="include">
	<#include "/manager/groupcategory/add.ftl">
	<#include "/manager/groupcategory/edit.ftl">  
</div>
</body>
</html>