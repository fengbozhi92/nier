<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
	<div class="modal-dialog" role="document">
    	<div class="modal-content">
        	<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                	<span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addModalLabel">新增</h4>
            </div>
            <form role="form" id="addForm">
            	<div class="col-sm-12 modal-body form-horizontal">
                	<div class="form-group">
                    	<label class="col-sm-2 lh34 text-right" for="add_name">名称</label>
                     	<div class="col-sm-8">
                     		<input type="text" name="name" class="form-control" id="add_name" placeholder="名称">
                     	</div>
                 	</div>
                 	<div class="form-group">
                		<label class="col-sm-2 lh34 text-right" for="add_categoryId">分类</label>
                     	<div class="col-sm-8">
                     		<select class="form-control" id="add_categoryId" name="categoryId" onchange="add_getSubcategorys();">
                     			<option value="">全部</option>
                     			<#list categorys as it>
                            		<option value="${it.id}">${it.name}</option>
	                            </#list>
                     		</select>
                 		</div>
                 	</div>
                 	<div class="form-group">
                		<label class="col-sm-2 lh34 text-right" for="add_subcategoryId">子分类</label>
                     	<div class="col-sm-8">
                     		<select class="form-control" id="add_subcategoryId" name="subcategoryId">
                     			<option value="">全部</option>
                     		</select>
                 		</div>
                 	</div>
                 	<div class="form-group">
                    	<label class="col-sm-2 lh34 text-right" for="add_description">描述</label>
                     	<div class="col-sm-8">
                     		<textarea name="description" class="form-control" id="add_description" rows="4" placeholder="描述" maxlength="100"></textarea>
                     	</div>
                 	</div>
             	</div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
                </button>
                <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="add_save()">
                	<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
                </button>
            </div>
        </div>
    </div>
</div>
<script>
	function add_getSubcategorys(){
		var categoryId = $("#add_categoryId").val();
		$.ajax({
			url:"/manager/groupmanage/getSubcategorys.do?categoryId="+categoryId,
			success:function(res){
				add_refreshSubcategorys(res.data);
			},
			error:function(){
				alert("错误");
			}
		});
	}
	
	function add_refreshSubcategorys(data){
		$("#add_subcategoryId option").remove();
		var base = "<option value=''>全部</option>";
		$("#add_subcategoryId").append(base);
		if (data.length > 0) {
			$(data).each(function(index, el){
				var op = "<option value='"+el.id+"'>"+el.name+"</option>";
				$("#add_subcategoryId").append(op);
			});
		}
	}
	
	function add_save(){
		var data = {
				createUser:'${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}',
				rand:Math.random()
			}
		$.ajax({
			url:"/manager/groupmanage/save.do",
			type:"POST",
			data:$("#addForm").serialize() + "&" + $.param(data),
			success:function(res){
				alert("保存成功！");
				$("#addForm")[0].reset();
				search();
			},
			error:function(res){
				alert("保存失败！");
			}
		});
	}
</script>