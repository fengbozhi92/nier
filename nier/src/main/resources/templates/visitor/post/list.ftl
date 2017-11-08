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
	<table id="posts" data-use-row-attr-func="true" data-reorderable-rows="true"></table>
</div>
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
	        $('#posts').bootstrapTable({
	            url: '/post/ajaxList.do',  //请求后台的URL（*）
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
	            pageSize: 20,                       //每页的记录行数（*）
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
	                width : 150,
	                align : 'center',
	                formatter : function (value, row, index){
	                	var	result = '<div class="col-sm-12">'+
	                					'<div class="row">'+
		                			     	'<div class="col-sm-12" style="min-height:100px;">'+
		                				    	'<img src="'+row.user.imagePath+'" width="100" style="padding:2px;border:1px solid #b0b0b0;">'+
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
	                	if ('${thread.userId}' == '${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}'){
	                		tool = '<a href="#" style="color:#b0b0b0">禁言</a>&nbsp;|&nbsp;<a href="#" style="color:#b0b0b0">删除</a>';
	                	}
	                	else if (row.userId == '${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}') {
	                		tool = '<a href="#" style="color:#b0b0b0">删除</a>';
	                	} else {
	                		tool = '<a href="#" style="color:#b0b0b0">举报</a>';
	                	}
	                	var lord;
	                	if (row.userId = '${thread.userId}') {
	                		lord = "楼主"
	                	}
	                	var	result = '<div class="col-sm-12">'+
	                					'<div class="row">'+
		                			     	'<div class="col-sm-12" style="min-height:150px;">'+
		                				    	'<div>'+row.content+'</div>'+
		                				   	'</div>'+
		                				   	'<div class="col-sm-12 lh34" class="panel-group">'+
		                				   		'<div class="row">'+
		                				   			'<div class="col-sm-6">'+
	                				    			'</div>'+
	                				    			'<div class="col-sm-6 text-right">'+
	                				    				'<div class="row" style="color:#b0b0b0; font-size:12px">'+
			                				    			'<div class="col-sm-4">'+
		                				    					tool+
		                				    				'</div>'+
			                				    			'<div class="col-sm-2">'+
				            				    				'<span>'+row.sequence+'楼</span>'+
				            				    			'</div>'+
				            				    			'<div class="col-sm-4">'+
		            				    						'<span>'+date+'</span>'+
	            				    						'</div>'+
			            				    				'<div class="col-sm-2">'+
		            				    						"<a href=\"#\" onclick=\"reply(this,'"+row.id+"')\">回复</a>"+
		            				    						"<a href=\"#\" onclick=\"reply(this,'"+row.id+"')\" style=\"display:none\">收起回复</a>"+
		            				    					'</div>'+
	            				    					'</div>'+
	            				    				'</div>'+
	                				    		'</div>'+
	                				   		'</div>'+
	    	
                				   			'<div class="col-sm-12" style="display:none" id="'+row.id+'">'+
                				   				'<div class="row">'+
	                				   				'<div class="col-sm-4">'+
	                				   				'</div>'+
	                				   				'<div class="col-sm-8">'+
	                				   					'<textarea id="rep_content" class="form-control rep" style="resize:none;"></textarea>'+
	                				   				'</div>'+
	                				   			'</div>'+
	                				   			'<div class="row">'+
                				   					'<div class="col-sm-8">'+
                				   					'</div>'+
	                				   				'<div class="col-sm-4 text-right">'+
	                				   					'<button type="button" id="btn'+row.id+'" class="btn btn-default">^_^</button>'+
	                				   					'<button type="button" class="btn btn-default">发表</button>'+
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
		$("#"+id).find("#rep_content").emoji({
		    showTab: true,
		    animation: 'fade',
		    icons: [{
		        name: "贴吧表情",
		        path: "/third-party/emoji/img/tieba/",
		        maxNum: 50,
		        file: ".jpg",
		        placeholder: ":{alias}:",
		        alias: {
		            1: "hehe",
		            2: "haha",
		            3: "tushe",
		            4: "a",
		            5: "ku",
		            6: "lu",
		            7: "kaixin",
		            8: "han",
		            9: "lei",
		            10: "heixian",
		            11: "bishi",
		            12: "bugaoxing",
		            13: "zhenbang",
		            14: "qian",
		            15: "yiwen",
		            16: "yinxian",
		            17: "tu",
		            18: "yi",
		            19: "weiqu",
		            20: "huaxin",
		            21: "hu",
		            22: "xiaonian",
		            23: "neng",
		            24: "taikaixin",
		            25: "huaji",
		            26: "mianqiang",
		            27: "kuanghan",
		            28: "guai",
		            29: "shuijiao",
		            30: "jinku",
		            31: "shengqi",
		            32: "jinya",
		            33: "pen",
		            34: "aixin",
		            35: "xinsui",
		            36: "meigui",
		            37: "liwu",
		            38: "caihong",
		            39: "xxyl",
		            40: "taiyang",
		            41: "qianbi",
		            42: "dnegpao",
		            43: "chabei",
		            44: "dangao",
		            45: "yinyue",
		            46: "haha2",
		            47: "shenli",
		            48: "damuzhi",
		            49: "ruo",
		            50: "OK"
		        },
		        title: {
		            1: "呵呵",
		            2: "哈哈",
		            3: "吐舌",
		            4: "啊",
		            5: "酷",
		            6: "怒",
		            7: "开心",
		            8: "汗",
		            9: "泪",
		            10: "黑线",
		            11: "鄙视",
		            12: "不高兴",
		            13: "真棒",
		            14: "钱",
		            15: "疑问",
		            16: "阴脸",
		            17: "吐",
		            18: "咦",
		            19: "委屈",
		            20: "花心",
		            21: "呼~",
		            22: "笑脸",
		            23: "冷",
		            24: "太开心",
		            25: "滑稽",
		            26: "勉强",
		            27: "狂汗",
		            28: "乖",
		            29: "睡觉",
		            30: "惊哭",
		            31: "生气",
		            32: "惊讶",
		            33: "喷",
		            34: "爱心",
		            35: "心碎",
		            36: "玫瑰",
		            37: "礼物",
		            38: "彩虹",
		            39: "星星月亮",
		            40: "太阳",
		            41: "钱币",
		            42: "灯泡",
		            43: "茶杯",
		            44: "蛋糕",
		            45: "音乐",
		            46: "haha",
		            47: "胜利",
		            48: "大拇指",
		            49: "弱",
		            50: "OK"
		        }
		    }]
		});
		$(el).hide();
		$(el).siblings().show();
	}
</script>