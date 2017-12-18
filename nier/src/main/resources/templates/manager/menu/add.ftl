<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
    	<span aria-hidden="true">&times;</span>
    </button>
    <h4 class="modal-title" id="addModalLabel">新增菜单</h4>
</div>
<form role="form" id="addForm">
	<div class="col-sm-12 modal-body form-horizontal">
    	<div class="form-group">
        	<label class="col-sm-2 lh34 text-right" for="name">名称</label>
         	<div class="col-sm-8">
         		<input type="text" class="form-control" name="name" id="name" placeholder="菜单名称" maxlength="20">
         	</div>
     	</div>
     	<div class="form-group">
    		<label class="col-sm-2 lh34 text-right" for="parentCode">父节点</label>
         	<div class="col-sm-8">
                <#if parent??>
                    <input type="text" class="form-control" id="parentName" value="${parent.name}" readonly="readonly">
         		    <input type="hidden" class="form-control" name="parentCode" id="parentCode" value="${parent.code}">
                    <input type="hidden" class="form-control" name="depth" id="depth" value="${parent.depth + 1}">
                <#else>
                    <input type="text" class="form-control" id="parentName" value="根节点" readonly="readonly">
                    <input type="hidden" class="form-control" name="parentCode" id="parentCode" value="_">
                    <input type="hidden" class="form-control" name="depth" id="depth" value="1">
                </#if>
     		</div>
     	</div>
     	<div class="form-group">
        	<label class="col-sm-2 lh34 text-right" for="url">URL</label>
         	<div class="col-sm-8">
         		<input type="text" name="url" class="form-control" id="url" placeholder="链接地址" onkeyup="onlyUrl(this)">
         	</div>
     	</div>
 	</div>
</form>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">
    	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
    </button>
    <button type="button" id="btn_submit" class="btn btn-primary"  onclick="save()">
    	<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
    </button>
</div>
<script>
    $(document).ready(function() {
        $('#addModal').on('hide.bs.modal', function() {
            $(this).removeData("bs.modal");  
            $(this).find(".modal-content").children().remove();
        });
        $('#addForm').bootstrapValidator({
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
        $("#addForm")[0].reset();
        $('#addForm').data('bootstrapValidator').resetForm(true); 
    }
    
	function save(){
	    $('#addForm').bootstrapValidator('validate');
		var data = {
				createUser:'${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}',
				rand:Math.random()
			}
		if($("#addForm").data('bootstrapValidator').isValid()) {
		    $.ajax({
				url:"/manager/menu/save.do",
				type:"POST",
				data:$("#addForm").serialize() + "&" + $.param(data),
				success:function(res){
					$("#addModal").modal('hide');
					toastr.success("保存成功");
					search();
				},
				error:function(res){
				    toastr.error("保存失败");
				}
			});
		}
	}
</script>