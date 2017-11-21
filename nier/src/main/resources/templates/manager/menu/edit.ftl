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
                    	<label class="col-sm-2 lh34 text-right" for="name">名称</label>
                      	<div class="col-sm-8">
                      		<input type="text" name="name" class="form-control" id="name" placeholder="名称">
                      	</div>
                  	</div>
                  	
                 	<div class="form-group">
                  		<label class="col-sm-2 lh34 text-right">父节点</label>
                  		<div class="col-sm-8">
                  			<div class="btn-group menu">
                  				<input type="hidden" name="parentId">
							    <button type="button" id="selected" key="" class="btn btn-default">根节点</button>
							    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							    	<span class="caret"></span>
							    </button>
							    <ul class="dropdown-menu" role="menu">
							    	<li><a href="javascript:void(0);" key="">根节点</a></li>
							    	<#if parentMenus??>
							    		<@menuTree menus = parentMenus/>
							    	</#if>
							    </ul>
							</div>
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
	$(function(){
		$(".btn-group a").on("click", function(){
			var value = $(this).text();
			var key = $(this).attr("key");
			$(".btn-group #selected").text(value);
			$(".btn-group input[name='parentId']").val(key);
		})
	})
	
	function edit(id){
	    $.ajax({
	    	url:"/manager/menu/get.do?id="+id,
	    	type:"POST",
	    	success:function(res){
    		    $('#editModal').modal('show');
    		    var data = res.data;
    		    $('#editModal').find("input[name='id']").val(data.id);
    		    $('#editModal').find("input[name='name']").val(data.name);
    		    $('#editModal').find("input[name='url']").val(data.url);
    		    $('#editModal').find("#parentId").val(data.parentId);
    		    var value = $(".btn-group a[key='"+data.parentId+"']").text();
    		    $(".btn-group #selected").text(value);
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
			url:"/manager/groupsubcategory/update.do",
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
