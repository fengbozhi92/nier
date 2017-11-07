<!DOCTYPE html>
<html>
<head>
<#include "/visitor/common/header.ftl">
<title>${group.name!""}</title>
<style>
table{
   
    table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
}
td{
    width:100%;
    word-break:keep-all;/* 不换行 */
    white-space:nowrap;/* 不换行 */
    overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
    text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/
}
</style>
</head>
<body>
	<#include "/visitor/common/top.ftl">
	<div class="container" style="min-height: 1600px;">
		<div class="col-sm-12">
			<h1>${group.name}</h1>
		</div>
		<div class="col-sm-12">
			<#include "/visitor/post/list.ftl">
		</div>
	</div>
<#include "/visitor/common/footer.ftl">
<#include "/visitor/common/js.ftl">