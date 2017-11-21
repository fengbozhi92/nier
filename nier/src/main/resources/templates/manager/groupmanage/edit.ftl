<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel">
	<div class="modal-dialog" role="document">
    	<div class="modal-content">
        	<div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
            		<span aria-hidden="true">&times;</span>
            	</button>
                <h4 class="modal-title" id="editModalLabel">修改</h4>
            </div>
            <form role="form" id="editForm">
            	<div class="col-sm-12 modal-body form-horizontal">
					<input type="hidden" name="id" class="form-control">
                  	<div class="form-group">
                    	<label class="col-sm-2 lh34 text-right" for="edit_name">名称</label>
                      	<div class="col-sm-8">
                      		<input type="text" name="name" class="form-control" id="edit_name" placeholder="名称">
                      	</div>
                  	</div>
                  	<div class="form-group">
                		<label class="col-sm-2 lh34 text-right" for="edit_categoryId">分类</label>
                     	<div class="col-sm-8">
                     		<select class="form-control" id="edit_categoryId" name="categoryId" onchange="add_getSubcategorys();">
                     			<option value="">全部</option>
                     			<#list categorys as it>
                            		<option value="${it.id}">${it.name}</option>
	                            </#list>
                     		</select>
                 		</div>
                 	</div>
                 	<div class="form-group">
                		<label class="col-sm-2 lh34 text-right" for="edit_subcategoryId">子分类</label>
                     	<div class="col-sm-8">
                     		<select class="form-control" id="edit_subcategoryId" name="subcategoryId">
                     			<option value="">全部</option>
                     		</select>
                 		</div>
                 	</div>
                 	<div class="form-group">
                    	<label class="col-sm-2 lh34 text-right" for="edit_description">描述</label>
                     	<div class="col-sm-8">
                     		<textarea name="description" class="form-control" id="edit_description" rows="4" placeholder="描述" maxlength="100"></textarea>
                     	</div>
                 	</div>
              	</div>
             </form>
             <div class="modal-footer">
                 <button type="button" class="btn btn-default" data-dismiss="modal">
                 	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消
                 </button>
                 <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="update()">
                	<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
                </button>
            </div>
        </div>
    </div>
</div>
<script>
	function edit(id){
	    $.ajax({
	    	url:"/manager/groupmanage/edit.do?id="+id,
	    	type:"POST",
	    	success:function(res){
    		    $('#editModal').modal('show');
    		    var data = res.data;
    		    $('#editModal').find("input[name='id']").val(data.id);
    		    $('#editModal').find("input[name='name']").val(data.name);
    		    $('#editModal').find("#edit_categoryId option[value='"+data.categoryId+"']").attr("selected", true);
    		    $('#editModal').find("#edit_subcategoryId option[value='"+data.subcategoryId+"']").attr("selected", true);
	    	},
	    	error:function(){
	    		alert("操作失败");
	    	}
	    });
	}
	
	function update(){
		var data = {
				modifyUser:'${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}',
				rand:Math.random()
			}
		$.ajax({
			url:"/manager/groupmanage/update.do",
			type:"POST",
			data:$("#editForm").serialize() + "&" + $.param(data),
			success:function(res){
				 $('#editModal').modal('hide');
				alert("修改成功");
				search();
			},
			error:function(){
				alert("操作失败");
			}
		})
	}
</script>