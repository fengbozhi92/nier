<!DOCTYPE html>
<html>
<head>
<#include "/visitor/common/header.ftl">
<title>setting</title>
<style type="text/css">
	.lh34{
		line-height: 34px;
	}
	.pl15{
		padding-left: 15px;
	}
	.pr15{
		padding-right: 15px;
	}
	.pl0{
		padding-left: 0;
	}
	.pr0{
		padding-right: 0;
	}
	.btn-s{
		width: 200px;
	}
	.mt50{
		margin-top: 50px;
	}

</style>
</head>
<body>
	<div class="container" style="min-height: 1000px;">
		<div class="col-lg-2 col-md-2 col-sm-1">
		</div>
		<div class="col-lg-8 col-md-8 col-sm-10" id="app">
			<div style="margin-top: 100px">
				<ul class="nav nav-tabs nav-justified">
					<li><a href="#image" data-toggle="tab">头像设置</a></li>
				  	<li class="active"><a href="#account" data-toggle="tab">账号设置</a></li>
				  	<li><a href="#basic" data-toggle="tab">基本资料</a></li>
				  	<li><a href="#person" data-toggle="tab">个人信息</a></li>
				  	<li><a href="#contact" data-toggle="tab">联系方式</a></li>
				</ul>
			</div>
			<div id="myTabContent" class="tab-content">
				<div id="image" class="col-md-12 tab-pane fade mt50">
					<div class="form-group col-sm-12">
			    		<div class="col-sm-12 pr0 text-center">
			  				<button type="submit" class="btn btn-success justify btn-s">保存</button>
						</div>
					</div>
				</div>
				<div id="account" class="col-md-12 tab-pane fade in active mt50">  
					<div class="form-horizontal">
						<div class="form-group col-sm-12">
							<label class="col-sm-3 form-label lh34">账号名称</label>
							<div class="col-sm-7">
						    	<input type="text" class="form-control" v-model="account.username" readonly>
					    	</div>
					    	<div class="col-sm-2 lh34">  
	            				<a href="#" class="edit"><span class="glyphicon glyphicon-edit"></span>修改</a>
	        					<span style="display: none">
	        						<button class="btn btn-success btn-xs" onclick="u_save('username');">保存</button>
	        						<button class="btn btn-default btn-xs" onclick="u_cancel();">取消</button>
	        					</span>
	        				</div>  
				  		</div>
				  		<div class="form-group col-sm-12">
				  			<label class="col-sm-3 form-label lh34">密码</label>
					    	<div class="col-sm-7">
					    		<input type="password" class="form-control" v-model="account.password" readonly>
				  			</div>
				  			<div class="col-sm-2 lh34">  
	            				<a href="#" class="edit"><span class="glyphicon glyphicon-edit"></span>修改</a>  
	        				</div>
				  		</div>
				  		<div class="form-group col-sm-12">
							<label class="col-sm-3 form-label lh34">昵称</label>
							<div class="col-sm-7">
						    	<input type="text" class="form-control" v-model="account.nickname" readonly>
					    	</div>
					    	<div class="col-sm-2 lh34">  
	            				<a href="#" class="edit"><span class="glyphicon glyphicon-edit"></span>修改</a>  
	        				</div>
				  		</div>
						<div class="form-group col-sm-12">
							<label class="col-sm-3 form-label lh34">邮箱地址</label>
					    	<div class="col-sm-7">
					    		<input type="email" class="form-control" v-model="account.email" readonly>
				  			</div>
				  			<div class="col-sm-2 lh34">  
	            				<a href="#" class="edit"><span class="glyphicon glyphicon-edit"></span>修改</a>  
	        				</div>
				  		</div>
					</div>
				</div>
				
				<div id="basic" class="col-md-12 tab-pane fade mt50"> 
					<div id ="msg" class="alert alert-success" style="display: none">
						<a href="#" class="close" data-dismiss="alert">
							&times;
						</a>
						保存成功！
					</div> 
					  
					<form id="basicForm" role="form" class="form-horizontal">
				  		<div class="form-group col-sm-12">
				  			<label class="col-sm-2 form-label lh34">姓名</label>
					    	<div class="col-sm-6">
					    		<input type="text" class="form-control" v-model="basic.realName">
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<select class="form-control pl0 pr0" style="font-size: 12px">
					    			<option>所有人可见</option>
					    			<option>仅好友</option>
					    			<option>仅自己</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<input type="checkbox" name="show">首页展示
				  			</div>
				  		</div>
				  		
				  		<div class="form-group col-sm-12">
				  			<label class="col-sm-2 form-label lh34">性别</label>
					    	<div class="col-sm-6">
					    		<label class="radio-inline">
	        						<input type="radio" id="man" value="1" v-model="basic.gender">男
	    						</label>
	    						<label class="radio-inline">
	        						<input type="radio" id="women" value="2" v-model="basic.gender">女
	    						</label>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<select class="form-control">
					    			<option>1</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<input type="checkbox" name="show">首页展示
				  			</div>
				  		</div>
						
						<div class="form-group col-sm-12">
				  			<label class="col-sm-2 form-label lh34">出生年月</label>
					    	<div class="col-sm-6">
					    		<input type="date" class="form-control" v-model="basic.birthday">
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<select class="form-control">
					    			<option>1</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<input type="checkbox" name="show">首页展示
				  			</div>
				  		</div>
				  		
						<div class="form-group col-sm-12">
							<label class="col-sm-2 form-label lh34">家乡</label>
					    	<div class="col-sm-6">
					    		<input type="text" class="form-control" v-model="basic.hometown">
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<select class="form-control">
					    			<option>1</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<input type="checkbox" name="show">首页展示
				  			</div>
				  		</div>
				  		
				  		<div class="form-group col-sm-12">
							<label class="col-sm-2 form-label lh34">居住地</label>
					    	<div class="col-sm-6">
					    		<input type="text" class="form-control" v-model="basic.residence">
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<select class="form-control">
					    			<option>1</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<input type="checkbox" name="show">首页展示
				  			</div>
				  		</div>
				  		
				  		<div class="form-group col-sm-12">
							<label class="col-sm-2 form-label lh34">婚姻</label>
					    	<div class="col-sm-6">
					    		<select class="form-control" v-model="basic.marriage">
					    			<option value="1">保密</option>
					    			<option value="2">已婚</option>
					    			<option value="3">未婚</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<select class="form-control">
					    			<option>1</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<input type="checkbox" name="show">首页展示
				  			</div>
				  		</div>
				  		
				  		<div class="form-group col-sm-12">
							<label class="col-sm-2 form-label lh34">职位</label>
					    	<div class="col-sm-6">
					    		<input type="text" class="form-control" v-model="basic.position">
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<select class="form-control">
					    			<option>1</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<input type="checkbox" name="show">首页展示
				  			</div>
				  		</div>
				  		
				  		<div class="form-group col-sm-12">
							<label class="col-sm-2 form-label lh34">公司</label>
					    	<div class="col-sm-6">
					    		<input type="text" class="form-control" v-model="basic.company">
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<select class="form-control">
					    			<option>1</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<input type="checkbox" name="show">首页展示
				  			</div>
				  		</div>
				  		
				  		<div class="form-group col-sm-12">
							<label class="col-sm-2 form-label lh34">工作情况</label>
					    	<div class="col-sm-6">
					    		<select class="form-control" v-model="basic.worked">
					    			<option value=""></option>
					    			<option value="1">学生</option>
					    			<option value="2">已工作</option>
					    			<option value="3">待业</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<select class="form-control">
					    			<option>1</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<input type="checkbox" name="show">首页展示
				  			</div>
				  		</div>
				  		
				    	<div class="form-group col-sm-12">
				    		<div class="col-sm-12 pr0 text-center">
				  				<button type="button" class="btn btn-success justify btn-s" @click="basic_save();">保存</button>
							</div>
						</div>
					</form>
				</div>
				
				<div id="person" class="col-md-12 tab-pane fade mt50">    
					<form id="personForm" role="form" class="form-horizontal">
						<div class="form-group col-sm-12">
							<label class="col-sm-3 form-label lh34">QQ</label>
					    	<div class="col-sm-9">
					    		<input type="text" class="form-control" name="qq">
				  			</div>
				  		</div>
				  		<div class="form-group col-sm-12">
							<label class="col-sm-3 form-label lh34">微信</label>
					    	<div class="col-sm-9">
					    		<input type="text" class="form-control" name="wechat">
				  			</div>
				  		</div>
				  		<div class="form-group col-sm-12">
							<label class="col-sm-3 form-label lh34">微博</label>
					    	<div class="col-sm-9">
					    		<input type="text" class="form-control" name="sinaMicroblog">
				  			</div>
				  		</div>
				  		<div class="form-group col-sm-12">
							<label class="col-sm-3 form-label lh34">手机</label>
					    	<div class="col-sm-9">
					    		<input type="text" class="form-control" name="phone">
				  			</div>
				  		</div>
						<div class="form-group col-sm-12">
				    		<div class="col-sm-12 pr0 text-center">
				  				<button type="submit" class="btn btn-success justify btn-s">保存</button>
							</div>
						</div>
					</form>
				</div>
				
				<div id="contact" class="col-md-12 tab-pane fade mt50">    
					<form id="contactForm" role="form" class="form-horizontal">
						<div class="form-group col-sm-12">
							<label class="col-sm-2 form-label lh34">QQ</label>
					    	<div class="col-sm-6">
					    		<input type="text" class="form-control" v-model="contact.qq">
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<select class="form-control pl0 pr0" style="font-size: 12px">
					    			<option>所有人可见</option>
					    			<option>仅好友</option>
					    			<option>仅自己</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<input type="checkbox" name="show">首页展示
				  			</div>
				  		</div>
				  		<div class="form-group col-sm-12">
							<label class="col-sm-2 form-label lh34">微信</label>
					    	<div class="col-sm-6">
					    		<input type="text" class="form-control" v-model="contact.wechat">
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<select class="form-control pl0 pr0" style="font-size: 12px">
					    			<option>所有人可见</option>
					    			<option>仅好友</option>
					    			<option>仅自己</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<input type="checkbox" name="show">首页展示
				  			</div>
				  		</div>
				  		<div class="form-group col-sm-12">
							<label class="col-sm-2 form-label lh34">微博</label>
					    	<div class="col-sm-6">
					    		<input type="text" class="form-control" v-model="contact.sinaMicroblog">
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<select class="form-control pl0 pr0" style="font-size: 12px">
					    			<option>所有人可见</option>
					    			<option>仅好友</option>
					    			<option>仅自己</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<input type="checkbox" name="show">首页展示
				  			</div>
				  		</div>
				  		<div class="form-group col-sm-12">
							<label class="col-sm-2 form-label lh34">手机</label>
					    	<div class="col-sm-6">
					    		<input type="text" class="form-control" v-model="contact.phone">
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<select class="form-control pl0 pr0" style="font-size: 12px">
					    			<option>所有人可见</option>
					    			<option>仅好友</option>
					    			<option>仅自己</option>
					    		</select>
				  			</div>
				  			<div class="col-sm-2 lh34">
					    		<input type="checkbox" name="show">首页展示
				  			</div>
				  		</div>
						<div class="form-group col-sm-12">
				    		<div class="col-sm-12 pr0 text-center">
				  				<button type="button" class="btn btn-success justify btn-s" @click="contact_save();">保存</button>
							</div>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
<#include "/visitor/common/layout/footer.ftl">
<#include "/visitor/common/js.ftl">
<script type="text/javascript">
	new Vue({
		el:"#app",
		data:{
			account:{
				username:"${detail.username!''}",
				password:"${detail.password!''}",
				nickname:"${detail.nickname!''}",
				email:"${detail.email!''}"
			},
			basic:{
				id:"${detail.id!''}",
				realName:"${detail.realName!''}",
				gender:"${detail.gender!'1'}",
				birthday:"${detail.birthday!''}",
				hometown:"${detail.hometown!''}",
				residence:"${detail.residence!''}",
				marriage:"${detail.marriage!''}",
				position:"${detail.position!''}",
				company:"${detail.company!''}",
				worked:"${detail.worked!''}",
				
			},
			person:{
				
			},
			contact:{
				qq:"${detail.qq!''}",
				wechat:"${detail.wechat!''}",
				sinaMicroblog:"${detail.sinaMicroblog!''}",
				phone:"${detail.phone!''}"
			}
		},
		methods:{
			basic_save:function(){
				$.ajax({
					url:"/person/save.do",
					type:"POST",
					data:{
						id:this.basic.id,
						realName:this.basic.realName,
						gender:this.basic.gender,
						//birthday:birthday,
						hometown:this.basic.hometown,
						residence:this.basic.residence,
						marriage:this.basic.marriage,
						position:this.basic.position,
						company:this.basic.company,
						worked:this.basic.worked
					},
					success:function(res){
						if (res.detail!=""){
							$("#msg").show();
							setTimeout(function(){
								$("#msg").alert("close");
							},2000);
						}	
					},
					error:function(res){	
					}
				});
			},
			contact_save:function(){
				$.ajax({
					url:"/person/save.do",
					type:"POST",
					data:{
						id:this.basic.id,
						qq:this.contact.qq,
						wechat:this.contact.wechat,
						sinaMicroblog:this.contact.sinaMicroblog,
						phone:this.contact.phone,
					},
					success:function(res){
						if (res.detail!=""){
							$("#msg").show();
							setTimeout(function(){
								$("#msg").alert("close");
							},2000);
						}	
					},
					error:function(res){	
					}
				});
			}
		}
	});
</script>
</body>
</html>