<!DOCTYPE html>
<html>
<head>
<#include "/manager/common/header.ftl">
<title>menu</title>
</head>
<body> 
    <#macro Tree tree>
        <#list tree as it>
            <#if it.childs?? && it.childs?size gt 0>
                <li class="dropdown-submenu">
                    <a tabindex="-1" href="javascript:void(0);" key="${it.code}">${it.name}</a>
                    <ul class="dropdown-menu">
                        <@Tree tree = it.childs/>
                    </ul>
                </li>
            <#else>
                <li><a href="javascript:void(0);" key="${it.code}">${it.name}</a></li>
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
	            <button id="btn_add" type="button" class="btn btn-default" onclick="add('');">
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
<script type="text/javascript" src="/third-party/bootstrap-table/js/bootstrap-table-editable.min.js"></script>
<script>
	$(function() {
	    var oTable = new TableInit();
	    oTable.Init();
	    var oButtonInit = new ButtonInit();
	    oButtonInit.Init();
	    $("#btn_delete").on("click",function(){
	    	del();
	    });
	});
	
	$(function(){
	  //参数设置，若用默认值可以省略以下面代
	  toastr.options = {
	  "closeButton": false, //是否显示关闭按钮
	  "debug": false, //是否使用debug模式
	  "positionClass": "toast-top-center",//弹出窗的位置
	  "showDuration": "300",//显示的动画时间
	  "hideDuration": "1000",//消失的动画时间
	  "timeOut": "1000", //展现时间
	  "extendedTimeOut": "1000",//加长展示时间
	  "showEasing": "swing",//显示时的动画缓冲方式
	  "hideEasing": "linear",//消失时的动画缓冲方式
	  "showMethod": "fadeIn",//显示时的动画方式
	  "hideMethod": "fadeOut" //消失时的动画方式
	  };
	})


	function search(){
		$('#menus').bootstrapTable('refresh');
	}
	
	function add(parentCode) {
	    $('#addModal').modal({
    	    remote:'/manager/menu/add.do?parentCode='+parentCode+'&t='+Math.random(),
    	});    
	}
	
	function edit(id) {
	    $('#editModal').modal({
    	    remote:'/manager/menu/edit.do?id='+id+'&t='+Math.random(),
    	});    
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
//==========================================================	  
	var TableInit = function () {
	    var oTableInit = new Object();
	    oTableInit.Init = function () {
	        $('#menus').bootstrapTable({
	            url: '/manager/menu/ajaxList.do',   //请求后台的URL（*）
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
	            //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
	            showToggle:false,                   //是否显示详细视图和列表视图的切换按钮
	            cardView: false,                    //是否显示详细视图
	            detailView: true,                   //是否显示父子表
	            editable:false,
	            columns: [
	                {checkbox: true}, 
	                {title: '序号',width: 50,align: 'center',formatter: function(value,row,index){}},
	                {title: '名称',field: 'name',align: 'center'}, 
	                {title: '创建时间',field: 'createTime',align: 'center',width: 180,
	                    formatter : function (value,row,index){
	                		return new Date(value).format('yyyy-MM-dd hh:mm:ss');
	                	}
	                }, 
	                {title: '操作',field: '',width: 120,align: 'center',
    	                formatter: function (value, row, index){
    	                	var result = '<button class="btn btn-default btn-xs edit" type="button" onclick="add(\''+row.code+'\');"><span class="glyphicon glyphicon-plus"></span>新增</button>'
    	                		       + '<button class="btn btn-default btn-xs edit" type="button" onclick="edit(\''+row.id+'\');"><span class="glyphicon glyphicon-edit"></span>修改</button>';
    	                	return result;
    	                }
	                }
                ],
	            onExpandRow: function (index,row,$detail) {
	    			oInit.InitSubTable(index,row,$detail);
	    		}
	            
	        });
	    }; 
	    var oInit = new Object();
	    oInit.InitSubTable = function (index, row, $detail) {
	    	var parentCode = row.code;
	    	var cur_table = $detail.html('<table></table>').find('table');
	    	$(cur_table).bootstrapTable({
	    		url: '/manager/menu/getSubmenus.do',
	    		method: 'post',
	    		queryParams: { parentCode: parentCode },
	    		ajaxOptions: { parentCode: parentCode },
	    		striped: false,
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
	            },*/
	    		columns: [
	    		    {checkbox: true}, 
	    		    {title: '序号',align: 'center',width: 50,formatter: function(value, row, index){return index+1;}},
    		    	{title: '名称',field: 'name',	align: 'center'}, 
	    		    {title: 'URL',field: 'url',	align: 'center'}, 
	    		    {title: '父节点',field: 'parentName',align: 'center'}, 
	    		    {title: '层级',field: 'depth',align: 'center'}, 
	    		    {title: '创建时间',field: 'createTime',align: 'center',width: 180,
	                formatter: function(value,row,index){
	                	return new Date(value).format('yyyy-MM-dd hh:mm:ss');
	                }},
	                {title: '操作',width: 120,align: 'center',
	                formatter: function(value,row,index){
	                	var result = '<button class="btn btn-default btn-xs edit" type="button" onclick="add(\''+row.code+'\');"><span class="glyphicon glyphicon-plus"></span>新增</button>'
	                			   + '<button class="btn btn-default btn-xs edit" type="button" onclick="edit(\''+row.id+'\');"><span class="glyphicon glyphicon-edit"></span>修改</button>';  
	                	return result;
	                }}
                ],
	    		onExpandRow: function (index, row, $Subdetail) {
	    			oInit.InitSubTable(index, row, $Subdetail);
	    		}
	    	});
	    };
	    
	    //得到查询的参数
	    oTableInit.queryParams = function (params) {
	        var temp = {
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
	    oInit.Init = function () {};
	    return oInit;
	};	

	function responseHandler(res) { 
	    if (res) {
	        return {"rows": res.data.content,"total": res.data.totalElements};
	    } else {
	        return {"rows": [],"total": 0};
	    }
	}
</script>
<div id="include">
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content"></div>
        </div>
    </div>
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content"></div>
        </div>
    </div> 
</div>
</body>
</html>