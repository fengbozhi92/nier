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
                    	<label class="col-sm-2 lh34 text-right" for="name">名称</label>
                     	<div class="col-sm-8">
                     		<input type="text" name="name" class="form-control" id="name" placeholder="名称">
                     	</div>
                 	</div>
                 	<div class="form-group">
                		<label class="col-sm-2 lh34 text-right" for="parentId">父节点</label>
                     	<div class="col-sm-8">
                     		<select class="form-control" id="parentId" name="parentId">
                     			<option value="">根节点</option>
                     			<#if parentMenus??>
	                     			<#list parentMenus as it>
	                            		<option value="${it.id}" depth="${it.depth}">${it.name}</option>
		                            </#list>
		                        </#if>
                     		</select>
                 		</div>
                 	</div>
                 	<div class="form-group">
                    	<label class="col-sm-2 lh34 text-right" for="url">URL</label>
                     	<div class="col-sm-8">
                     		<input type="text" name="url" class="form-control" id="url" placeholder="链接">
                     	</div>
                 	</div>
             	</div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
                </button>
                <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="save()">
                	<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
                </button>
            </div>
        </div>
    </div>
</div>
<script>
	function addSubmenu(id){
		 $.ajax({
		    	url:"/manager/menu/get.do?id="+id,
		    	type:"POST",
		    	success:function(res){
	    		    $('#addModal').modal('show');
	    		    var data = res.data;
	    		    $('#addModal').find("#parentId option[value='"+data.id+"']").attr("selected", true);
		    	},
		    	error:function(){
		    		alert("操作失败");
		    	}
		 });
	}
	
	function save(){
		var depth = $('#addModal').find("#parentId option:selected").attr("depth");
		if (!isNaN(depth)) {
			depth = parseInt(depth)+1;
		}
		var data = {
				createUser:'${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}',
				depth:depth,
				rand:Math.random()
			}
		$.ajax({
			url:"/manager/menu/save.do",
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