<!DOCTYPE html>
<html>
<head>
<#include "/visitor/common/header.ftl">
<title></title>
</head>
<body>
	<div class="container" style="min-height: 1600px;">
		<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">查询条件</div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="name">名称</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="name">
                        </div>
                        <label class="control-label col-sm-1" for="status">状态</label>
                        <div class="col-sm-3">
                            <select class="form-control" id="status">
                            	<option value="1">启用</option>
                            	<option value="2">停用</option>
                            </select>
                        </div>
                        <div class="col-sm-4" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
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
        <table id="tb_departments">
        	
        </table>
    </div>
		<div id="listDiv">
			<#include "/manager/groupcategory/groupCategoryListFrag.ftl">
			<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
	            <div class="modal-dialog" role="document">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                        <h4 class="modal-title" id="addModalLabel">新增</h4>
	                    </div>
	                    <div class="col-sm-12 modal-body form-horizontal">
	
	                        <div class="form-group">
	                            <label class="col-sm-2 lh34 text-right" for="name">名称</label>
	                            <div class="col-sm-8">
	                            	<input type="text" name="name" class="form-control" id="name" placeholder="名称">
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label class="col-sm-2 lh34 text-right" for="status">状态</label>
	                            <div class="col-sm-8">
	                            	<input type="text" name="status" class="form-control" id="status" placeholder="状态">
	                        	</div>
	                        </div>
	                    </div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">
	                        	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
	                        <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="save()">
	                        	<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
	                    </div>
	                </div>
	            </div>
        	</div>
        	
        	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel">
	            <div class="modal-dialog" role="document">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                        <h4 class="modal-title" id="editModalLabel">修改</h4>
	                    </div>
	                    <div class="col-sm-12 modal-body form-horizontal">
	
	                        <div class="form-group">
	                            <label class="col-sm-2 lh34 text-right" for="name">名称</label>
	                            <div class="col-sm-8">
	                            	<input type="text" name="name" class="form-control" id="name" placeholder="名称">
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label class="col-sm-2 lh34 text-right" for="status">状态</label>
	                            <div class="col-sm-8">
	                            	<input type="text" name="status" class="form-control" id="status" placeholder="状态">
	                        	</div>
	                        </div>
	                    </div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">
	                        	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
	                        <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="save()">
	                        	<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
	                    </div>
	                </div>
	            </div>
        	</div>	
        	
		</div>
	</div>
<#include "/visitor/common/footer.ftl">
<#include "/visitor/common/js.ftl">
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
        $('#tb_departments').bootstrapTable({
            url: '/manager/groupcategory/ajaxList.do',  //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
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
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            responseHandler: responseHandler,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: false,                //是否启用点击选中行
            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            editable:true,
            columns: [{
                checkbox: true
            }, {
                field: '',
                title: '序号',
                formatter: function (value, row, index) {
                	return index+1;
         		}
    		},{
                field: 'name',
                title: '名称'
            }, {
                field: 'status',
                title: '状态'
            }, {
                field: 'createTime',
                title: '创建时间',
                formatter : function (value, row, index){
                	return new Date(value).format('yyyy-MM-dd hh:mm:ss');
                }
            },{
                field: 'name',
                title: '操作',
                width:100
            },]
        });
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            size: this.pageSize,   //页面大小
            page: this.pageNumber-1,  //页码
            name: $("#name").val(), 
            status: $("#status").val()
        };
        return temp;
    };
    window.editEvent={
    		'click':function(e,value, row, index){
    			$('#editModal').modal("show");
    		}
    }
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
function edit(el, row){
    
}
function responseHandler(res) { 
    if (res) {
        return {
            "rows" : res.list.content,
            "total" : res.list.totalElements
        };
    } else {
        return {
            "rows" : [],
            "total" : 0
        };
    }
}

function save(){
	var name = $("#addModal").find("input[name='name']").val();
	var status = $("#addModal").find("input[name='status']").val();
	$.ajax({
		url:"/manager/groupcategory/save.do",
		type:"POST",
		data:{
			name:name,
			status:status,
			createUser:'${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}'
		},
		success:function(res){
			if (res.result) {
				alert("保存成功！");
				 $('#tb_departments').bootstrapTable("refresh");
			} else {
				alert("保存失败！");
			}
		},
		error:function(res){
			alert("保存失败！");
		}
		
	});
}

</script>
</body>
</html>