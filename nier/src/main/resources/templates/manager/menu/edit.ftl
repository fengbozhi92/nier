<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
    <h4 class="modal-title" id="editModalLabel">修改</h4>
</div>
<form role="form" id="editForm">
	<div class="col-sm-12 modal-body form-horizontal">
		<input type="hidden" name="id" class="form-control" value="${menu.id}">
      	<div class="form-group">
        	<label class="col-sm-2 lh34 text-right" for="name">名称</label>
          	<div class="col-sm-8">
          		<input type="text" class="form-control" name="name" id="name" value="${menu.name}">
          	</div>
      	</div>
      	
     	<div class="form-group">
      		<label class="col-sm-2 lh34 text-right">父节点</label>
      		<div class="col-sm-8">
      			<#if (parent.parentName)??>
                    <input type="text" class="form-control" id="parentName" value="${parent.name}" readonly="readonly">
                <#else>
                    <input type="text" class="form-control" id="parentName" value="根节点" readonly="readonly">
                </#if>
      		</div>
      	</div>
      	
     	<div class="form-group">
        	<label class="col-sm-2 lh34 text-right" for="url">URL</label>
         	<div class="col-sm-8">
         		<input type="text" name="url" class="form-control" id="url" placeholder="链接地址" value="${menu.url}" onkeyup="onlyUrl(this)">
         	</div>
     	</div>

  	</div>
</form>
<div class="modal-footer">
     <button type="button" class="btn btn-default" data-dismiss="modal">
     	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消
     </button>
     <button type="button" id="btn_submit" class="btn btn-primary" onclick="update()">
    	<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
    </button>
</div>
<script>
    $(document).ready(function() {
        $('#editModal').on('hide.bs.modal', function() {
            $(this).removeData("bs.modal");  
            $(this).find(".modal-content").children().remove();
        });
        $('#editForm').bootstrapValidator({
            message: '无效的值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            verbose : false,
            fields: {
                name: {
                    message: '请正确填写菜单名称',
                    validators: {
                    	notEmpty: {	
                            message: '请设置菜单名称'
                        },
                    }
                },
                url: {
                    message:'请正确填写链接地址',
                    validators: { 	
                    	notEmpty: {
                            message: '请设置链接地址'
                        }
                    }
                }
            }
        });
    });
	
    
    function formReset() {
        $('#editForm').data('bootstrapValidator').resetForm(true);
    }
	
	function update(){
	    $('#editForm').bootstrapValidator('validate');
		var data = {
				modifyUser:'${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}',
				rand:Math.random()
			}
		if($("#editForm").data('bootstrapValidator').isValid()) {
    		$.ajax({
    			url:"/manager/menu/update.do",
    			type:"POST",
    			data:$("#editForm").serialize() + "&" + $.param(data),
    			success:function(res){
    				$("#editModal").modal('hide');
    				toastr.success("保存成功");
    				search();
    			},
    			error:function(){
    			    toastr.error("保存失败");
    			}
    		});
		}
	}
</script>
