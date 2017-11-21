<!DOCTYPE html>
<html>
<head>
<#include "/manager/common/header.ftl">
<title>menu</title>
</head>
<body>
	<#macro menuTree menus>
    	<#list menus as it>
        	<#if it.submenus?? && it.submenus?size gt 0>
        		<li class="dropdown-submenu">
        			<a tabindex="-1" href="javascript:void(0);" key="${it.id}">${it.name}</a>
        			<ul class="dropdown-menu">
						<@menuTree menus = it.submenus/>
        			</ul>
        		</li>
    		<#else>
        		<li><a href="javascript:void(0);" key="${it.id}">${it.name}</a></li>
        	</#if>
    	</#list>				       
	</#macro>
	<#include "/manager/common/top.ftl">
	<div class="container" style="height: 1260px">
		<div class="panel-body" style="padding-bottom:0px;">
        	<div class="panel panel-default">
            	<div class="panel-heading">查询条件</div>
            	<div class="panel-body">
                	<form id="formSearch" class="form-horizontal">
                    	<div class="form-group" style="margin-top:15px">
                        	<label class="control-label col-sm-1" for="search_name">名称</label>
	                        <div class="col-sm-2">
	                            <input type="text" class="form-control" id="search_name">
	                        </div>
	                        <div class="col-sm-2" style="text-align:left;">
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
        	<table id="menus" data-use-row-attr-func="true" data-reorderable-rows="true"></table>
    	</div>
	</div>
<#include "/manager/common/footer.ftl">
<#include "/manager/common/js.ftl">
<script type="text/javascript" src="/third-party/bootstrap-table/js/bootstrap-table-reorder-rows.min.js"></script>
<script type="text/javascript" src="/third-party/bootstrap-table/js/jquery.tablednd.min.js"></script>
<script type="text/javascript" src="/third-party/bootstrap-table/js/bootstrap-table-editable.min.js"></script>
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
	        $('#menus').bootstrapTable({
	            url: '/manager/menu/ajaxList.do',  //请求后台的URL（*）
	            method: 'post',                     //请求方式（*）
	            toolbar: '#toolbar',                //工具按钮用哪个容器
	            striped: false,                      //是否显示行间隔色
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
	            //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
	            showToggle:false,                   //是否显示详细视图和列表视图的切换按钮
	            cardView: false,                    //是否显示详细视图
	            detailView: true,                   //是否显示父子表
	            editable:true,
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
	                width : 180,
	                formatter : function (value, row, index){
	                	return new Date(value).format('yyyy-MM-dd hh:mm:ss');
	                }
	            }, {
	                field : '',
	                title : '操作',
	                width : 120,
	                align : 'center',
	                formatter : function (value, row, index){
	                	var result = '<button class="btn btn-default btn-xs edit" type="button" onclick="addSubmenu(\''+row.id+'\');"><span class="glyphicon glyphicon-plus"></span>新增</button>'
	                		       + '<button class="btn btn-default btn-xs edit" type="button" onclick="edit(\''+row.id+'\');"><span class="glyphicon glyphicon-edit"></span>修改</button>';
	                	return result;
	                },
	            },],
	            onExpandRow: function (index, row, $detail) {
	    			oInit.InitSubTable(index, row, $detail);
	    		}
	            
	        });
	    }; 
	    var oInit = new Object();
	    oInit.InitSubTable = function (index, row, $detail) {
	    	var parentid = row.id;
	    	var cur_table = $detail.html('<table></table>').find('table');
	    	$(cur_table).bootstrapTable({
	    		url: '/manager/menu/getSubmenus.do',
	    		method: 'get',
	    		queryParams: { parentId: parentid },
	    		ajaxOptions: { parentId: parentid },
	    		clickToSelect: false,
	    		detailView: true,//父子表
	    		reorderableRows:true,
	    		useRowAttrFunc:true,
	    		uniqueId: "id",
	    		pageSize: 10,
	    		pageList: [10, 25],
/*	    		rowStyle: function (row, index) {
	                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
	                var strclass = "";
	                if (row.status == 1) {
	                    strclass = 'success';//还有一个active
	                } else if (row.status == 2) {
	                    strclass = 'danger';
	                } else {
	                    return {};
	                }
	                return { classes: strclass }
	            },
*/
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
	    			align : 'center',
	    			title : '名称'
	    		}, {
	    			field : 'url',
	    			align : 'center',
	    			title : 'URL'
	    		}, {
	    			field : 'parentName',
	    			align : 'center',
	    			title : '父节点'
	    		}, {
	    			field : 'depth',
	    			align : 'center',
	    			title : '层级'
	    		}, {
	                field : 'createTime',
	                title : '创建时间',
	                align : 'center',
	                width : 180,
	                formatter : function (value, row, index){
	                	return new Date(value).format('yyyy-MM-dd hh:mm:ss');
	                }
	            },{
	                field : '',
	                title : '操作',
	                width : 120,
	                align : 'center',
	                formatter : function (value, row, index){
	                	var result = '<button class="btn btn-default btn-xs edit" type="button" onclick="addSubmenu(\''+row.id+'\');"><span class="glyphicon glyphicon-plus"></span>新增</button>'
	                			   + '<button class="btn btn-default btn-xs edit" type="button" onclick="edit(\''+row.id+'\');"><span class="glyphicon glyphicon-edit"></span>修改</button>';
	                	return result;
	                },
	            },],
	    		//无线循环取子表，直到子表里面没有记录
	    		onExpandRow: function (index, row, $Subdetail) {
	    			oInit.InitSubTable(index, row, $Subdetail);
	    		}
	    	});
	    };
	    
	    //得到查询的参数
	    oTableInit.queryParams = function (params) {
	        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	            size: this.pageSize,   //页面大小
	            page: this.pageNumber-1,  //页码
	            name: $("#search_name").val(), 
	            depth:1
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
		$('#menus').bootstrapTable('refresh');
	}
	
	function del(){
		var arr = new Array();
		$("#menus tr.selected").each(function(){
			arr.push($(this).attr("data-uniqueid"));
		});
		var ids = arr.join(",");
		if (ids != "" && confirm("确定要进行删除操作吗？")) {
			$.ajax({
				url:"/manager/menu/remove.do",
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
	<#include "/manager/menu/add.ftl">
	<#include "/manager/menu/edit.ftl">  
</div>
</body>
</html>