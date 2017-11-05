<!--<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jQuery网站多级侧边栏导航菜单代码</title>

<link href="http://www.jq22.com/jquery/font-awesome.4.6.0.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="/nier/css/sidebar-menu.css">
<style type="text/css">
.main-sidebar{
	position: absolute;
	top: 0;
	left: 0;
	min-height: 1260px;
	width: 230px;
	z-index: 810;
	background-color: #222d32;
 }
</style>

</head>
<body>
<aside class="main-sidebar">
<section  class="sidebar">
	<ul class="sidebar-menu">
	  <li class="header" id="its">主导航</li>
	  <li class="treeview">
		<a href="#">
		  <i class="fa fa-dashboard"></i> <span>仪表盘</span> <i class="fa fa-angle-right pull-right"></i>
		</a>
		<ul class="treeview-menu">
		  <li><a href="#"><i class="fa fa-circle-o"></i> 仪表盘 v1</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 仪表盘 v2</a></li>
		</ul>
	  </li>
	  <li class="treeview">
		<a href="#">
		  <i class="fa fa-files-o"></i>
		  <span>布局选项</span>
		  <span class="label label-primary pull-right">4</span>
		</a>
		<ul class="treeview-menu" style="display: none;">
		  <li><a href="#"><i class="fa fa-circle-o"></i> 顶部导航</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 盒子布局</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 固定布局</a></li>
		  <li class=""><a href="#"><i class="fa fa-circle-o"></i> 折叠侧边栏</a>
		  </li>
		</ul>
	  </li>
	  <li>
		<a href="#">
		  <i class="fa fa-th"></i> <span>窗口小部件</span>
		  <small class="label pull-right label-info">新的</small>
		</a>
	  </li>
	  <li class="treeview">
		<a href="#">
		  <i class="fa fa-pie-chart"></i>
		  <span>图表</span>
		  <i class="fa fa-angle-right pull-right"></i>
		</a>
		<ul class="treeview-menu">
		  <li><a href="#"><i class="fa fa-circle-o"></i> ChartJS</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> Morris</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> Flot</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> Inline charts</a></li>
		</ul>
	  </li>
	  <li class="treeview">
		<a href="#">
		  <i class="fa fa-laptop"></i>
		  <span>UI 元素</span>
		  <i class="fa fa-angle-right pull-right"></i>
		</a>
		<ul class="treeview-menu">
		  <li><a href="#"><i class="fa fa-circle-o"></i> 一般</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> Icons图标</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 按钮</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 滑块</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 时间表</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 模态框</a></li>
		</ul>
	  </li>
	  <li class="treeview">
		<a href="#">
		  <i class="fa fa-edit"></i> <span>表单</span>
		  <i class="fa fa-angle-right pull-right"></i>
		</a>
		<ul class="treeview-menu">
		  <li><a href="#"><i class="fa fa-circle-o"></i> 一般表单</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 高级表单</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 可编辑表单</a></li>
		</ul>
	  </li>
	  <li class="treeview">
		<a href="#">
		  <i class="fa fa-table"></i> <span>表格</span>
		  <i class="fa fa-angle-right pull-right"></i>
		</a>
		<ul class="treeview-menu">
		  <li><a href="#"><i class="fa fa-circle-o"></i> 简单表格</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 时间表格</a></li>
		</ul>
	  </li>
	  <li>
		<a href="#">
		  <i class="fa fa-calendar"></i> <span>日历</span>
		  <small class="label pull-right label-danger">3</small>
		</a>
	  </li>
	  <li>
		<a href="#">
		  <i class="fa fa-envelope"></i> <span>邮箱</span>
		  <small class="label pull-right label-warning">12</small>
		</a>
	  </li>
	  <li class="treeview">
		<a href="#">
		  <i class="fa fa-folder"></i> <span>实例</span>
		  <i class="fa fa-angle-right pull-right"></i>
		</a>
		<ul class="treeview-menu">
		  <li><a href="#"><i class="fa fa-circle-o"></i> 清单</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 简况</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 登录</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 注册</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 锁频</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 404 错误</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 500 错误</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 空白页面</a></li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 自适应页面</a></li>
		</ul>
	  </li>
	  <li class="treeview">
		<a href="#">
		  <i class="fa fa-share"></i> <span>多级</span>
		  <i class="fa fa-angle-right pull-right"></i>
		</a>
		<ul class="treeview-menu">
		  <li><a href="/manager/groupcategory/list.do"><i class="fa fa-circle-o"></i>分类</a></li>
		  <li>
			<a href="/manager/groupsubcategory/list.do"><i class="fa fa-circle-o"></i> 子分类 <i class="fa fa-angle-right pull-right"></i></a>
			<ul class="treeview-menu">
			  <li><a href="#"><i class="fa fa-circle-o"></i> 二级</a></li>
			  <li>
				<a href="#"><i class="fa fa-circle-o"></i> 二级 <i class="fa fa-angle-right pull-right"></i></a>
				<ul class="treeview-menu">
				  <li><a href="#"><i class="fa fa-circle-o"></i> 三级</a></li>
				  <li><a href="#"><i class="fa fa-circle-o"></i> 三级</a></li>
				</ul>
			  </li>
			</ul>
		  </li>
		  <li><a href="#"><i class="fa fa-circle-o"></i> 一级</a></li>
		</ul>
	  </li>
	  <li><a href="#"><i class="fa fa-book"></i> <span>文档</span></a></li>
	  <li class="header">标签</li>
	  <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>重要</span></a></li>
	  <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>警告</span></a></li>
	  <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>通知</span></a></li>
	</ul>
  </section>
 </aside>
<script src="/third-party/jquery/jquery-1.11.0.min.js"></script>
<script src="/nier/js/sidebar-menu.js"></script>
<script>
$.sidebarMenu($('.sidebar-menu'))
</script>

</body>
</html>-->
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target="#example-navbar-collapse">
            <span class="sr-only">切换导航</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">菜鸟教程</a>
    </div>
    <div class="collapse navbar-collapse" id="example-navbar-collapse">
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
    </div>
    </div>
</nav>