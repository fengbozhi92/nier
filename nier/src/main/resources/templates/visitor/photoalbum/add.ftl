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
                    	<label class="col-sm-2 lh34 text-right" for="title">名称</label>
                     	<div class="col-sm-8">
                     		<input type="text" name="title" class="form-control" id="title" placeholder="名称">
                     	</div>
                 	</div>
                 	
                 	<div class="form-group">
                    	<label class="col-sm-2 lh34 text-right" for="imagePath">封面</label>
                     	<div class="col-sm-8">
                     		<div class="ibox-content">
								<div class="row">
									<div id="crop-avatar" class="col-md-6">
										<div class="avatar-view" title="Change Logo Picture">
									    	<img src="/nier/images/system/sys-nier.png">
									    </div>
									</div>
								</div>
							</div>
                     		<input type="hidden" name="imagePath" class="form-control" id="imagePath" placeholder="名称">
                     	</div>
                 	</div>
                 	
                 	
                 	
                 	<div class="form-group">
                    	<label class="col-sm-2 lh34 text-right" for="description">描述</label>
                     	<div class="col-sm-8">
                     		<textarea name="description" class="form-control" id="description" placeholder="描述"></textarea>
                     	</div>
                 	</div>
                	<div class="form-group">
                		<label class="col-sm-2 lh34 text-right" for="type">状态</label>
                     	<div class="col-sm-8">
                     		<select class="form-control" id = "type" name="type">
                     			<option value="1">仅自己</option>
                     			<option value="2">好友</option>
                     		</select>
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
	function save(){
		var data = {
				createUser:'${(Session.SPRING_SECURITY_CONTEXT.authentication.principal.id)!""}',
				rand:Math.random()
			}
		$.ajax({
			url:"/photoalbum/save.do",
			type:"POST",
			data:$("#addForm").serialize() + "&" + $.param(data),
			success:function(res, status){
				alert("保存成功！"+status);
				$("#addForm")[0].reset();
				refresh(0,10);
			},
			error:function(res){
				alert("保存失败！");
			}
		});
	}
</script>
<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form class="avatar-form" action="/file/photo/upload.do" enctype="multipart/form-data" method="post">
				<div class="modal-header">
					<button class="close" data-dismiss="modal" type="button">&times;</button>
					<h4 class="modal-title" id="avatar-modal-label">Change Logo Picture</h4>
				</div>
				<div class="modal-body">
					<div class="avatar-body">
						<div class="avatar-upload">
							<input class="avatar-src" name="avatar_src" type="hidden">
							<input class="avatar-data" name="avatar_data" type="hidden">
							<label for="avatarInput">图片上传</label>
							<input class="avatar-input" id="avatarInput" name="photoFile" type="file"></div>
						<div class="row">
							<div class="col-md-9">
								<div class="avatar-wrapper"></div>
							</div>
							<div class="col-md-3">
								<div class="avatar-preview preview-lg"></div>
								<div class="avatar-preview preview-md"></div>
								<div class="avatar-preview preview-sm"></div>
							</div>
						</div>
						<div class="row avatar-btns">
							<div class="col-md-9">
								<div class="btn-group">
									<button class="btn" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"><i class="fa fa-undo"></i> 向左旋转</button>
								</div>
								<div class="btn-group">
									<button class="btn" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"><i class="fa fa-repeat"></i> 向右旋转</button>
								</div>
							</div>
							<div class="col-md-3">
								<button class="btn btn-success btn-block avatar-save" type="submit"><i class="fa fa-save"></i> 保存修改</button>
							</div>
						</div>
					</div>
				</div>
  		</form>
  	</div>
  </div>
</div>