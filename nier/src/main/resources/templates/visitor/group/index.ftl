<!DOCTYPE html>
<html>
<head>
<#include "/visitor/common/header.ftl">
<title>group</title>
<style>
.dropdown-menu>.active>a{
	color: #333;
	background-color: white;
}
.dropdown-menu>.active>a:hover{
	color: #333;
	background-color: #ddd;
}
</style>
</head>
<body>
	<#include "/visitor/common/top.ftl">
	<div class="container" style="min-height: 1600px;">
		<div class="col-sm-10">
			<input class="form-control" type="text" id="search" data-provide="typeahead" data-items="4" autocomplete="off">
		</div>
		<div class="col-sm-2">
			<button class="btn btn-default" type="button" onclick="search();return false;">搜索</button>
		</div>
		<div class="col-sm-12">
			
		</div>
	</div>
<#include "/visitor/common/footer.ftl">
<#include "/visitor/common/js.ftl">
<script>
	$("#search").typeahead({
		source: function (query, process) {
            return $.ajax({
                url: '/group/search.do',
                type: 'post',
                data: {
                	name: query,
                	size: 4,
                	page: 0
                },
                success: function (res) {
                    return process(res.data.content);
                }
            });
   		},
		fitToElement:true,
		afterSelect: function (item) { 
            location.href="/group/view.do?id="+item.id;
        },
	});
	
	function search(){
		var name = $("#search").val();
		if (name != '') {
			location.href="/group/list.do?name="+name;
		} else {
			location.reload();
		}
		
	}
</script>
</body>
</html>