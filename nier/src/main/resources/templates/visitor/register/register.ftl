<!DOCTYPE html>
<html>
<head>
<#include "/visitor/common/header.ftl">
<title>register</title>
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
</style>
</head>
<body>
	<div class="container" style="min-height: 1000px;">
		<div class="col-lg-3 col-md-2 col-sm-1">
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="myModalLabel">用户协议</h4>
			            </div>
			            <div class="modal-body"></div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			            </div>
			        </div>
			    </div>
			</div>
		</div>
		<div class="col-lg-6 col-md-8 col-sm-10">
			<div class="col-md-12" style="margin-top: 20%">         
				<form id="myForm" role="form" class="form-horizontal" action="/register/register.do" method="post">
					<div class="form-group col-sm-12">
						<label class="col-sm-3 form-label lh34">账号名称</label>
						<div class="col-sm-9">
					    	<input type="text" class="form-control" name="username" placeholder="不少于6个字符">
				    	</div>
			  		</div>
			  		<div class="form-group col-sm-12">
			  			<label class="col-sm-3 form-label lh34">密码</label>
				    	<div class="col-sm-9">
				    		<input type="password" class="form-control" name="password" placeholder="至少8位,必须包含字母、数字、特殊字符">
			  			</div>
			  		</div>
			  		<div class="form-group col-sm-12">
			  			<label class="col-sm-3 form-label lh34">确认密码</label>
				    	<div class="col-sm-9">
				    		<input type="password" class="form-control" name="password2" placeholder="再次输入密码，确保两次输入一致">
			  			</div>
			  		</div>
					<div class="form-group col-sm-12">
						<label class="col-sm-3 form-label lh34">邮箱地址</label>
				    	<div class="col-sm-9">
				    		<input type="email" class="form-control" name="email" placeholder="通过邮箱激活账号">
			  			</div>
			  		</div>
			  		<div class="form-group col-sm-12">
			  			<label class="col-sm-3 form-label"></label>
				  		<div class="checkbox col-sm-9" style="height: 50px">
			      			<input type="checkbox" name="agree">同意并愿意遵守<a href="#" data-toggle="modal" data-target="#myModal">《用户协议》</a>
				    	</div>
			    	</div>
			    	<div class="form-group col-sm-12">
			    		<div class="col-sm-12 pr0 text-center">
			  				<button type="submit" class="btn btn-success justify" style="width: 200px;">注册</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
<#include "/visitor/common/footer.ftl">
<#include "/visitor/common/js.ftl">
<script type="text/javascript">
/*function agreed(){
	if ($('#agree').attr('checked')){
		return true;
	}
	alert("请阅读用户协议并勾选同意条款");
	return false;
}*/
$(document).ready(function() {
	$(".modal-body").html($("#agreement").text());
    $('#myForm').bootstrapValidator({
            message: '无效的值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            verbose :false,
            fields: {
                username: {
                    message: '请正确填写账号名称',
                    validators: {
                    	notEmpty: {	
                            message: '请设置账号名称'
                        },
                        stringLength: {
                            min: 6,
                            max: 20,
                            message: '账号名称长度必须在6到20之间'
                        },
                        threshold: 6,
                        remote: {
                        	type:'post',
                        	url: '/register/checkUsername.do',
                            data: function (validator) {
                                return {
                                    username: $("input[name='username']").val(),
                                };
                            },
                            message: '该登录名已被使用，请使用其他登录名',
                            delay:2000
                        }
                    }
                },
                password: {
                    message:'请正确填写登录密码',
                    validators: { 	
                    	notEmpty: {
                            message: '请设置登陆密码'
                        },
                        stringLength: {
                            min: 8,
                            max: 30,
                            message: '密码长度必须在8到30之间'
                        },
                        different: {
                            field: 'username',
                            message: '密码不能和账号名称相同'
                        },
                        regexp: {
                            regexp: /^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).+$/,
                            message: '密码必须包含字母、数字、特殊字符'
                        }
                    }
                },
                password2: {
                    message:'请正确填写确认密码',
                    validators: {
                        notEmpty: {
                            message: '请确认登陆密码'
                        },
                        identical: {
                            field: 'password',
                            message: '确认密码不一致'
                        }
                    }
                },
                email: {
                    validators: {
                        message:'请正确填写邮箱地址',
                    	notEmpty: {
                            message: '请填写邮箱地址'
                        },
                        emailAddress: {
                            message: '邮箱格式错误'
                        }
                    }
                },
                agree: {
                    validators: {
                        message:'请阅读用户协议并勾选同意',
                    	notEmpty: {
                            message: '请阅读用户协议并勾选同意'
                        }
                    }
                }
            }
        });
});

</script>
<script type="text/template" id="agreement">
<h3>遵守法律</h3>

<p>您同意遵守中华人民共和国相关法律法规的所有规定，并对以任何方式使用您的密码和您的帐号使用本服务的任何行为及其结果承担全部责任。如您的行为违反国家法律和法规的任何规定，有可能构成犯罪的，将被追究刑事责任，并由您承担全部法律责任。</p>

<p>使用规则</p>

<p>您同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶</p>

<p>1）发布或以其它方式传送含有下列内容之一的信息：</p>

<p>&nbsp;&sdot; 反对宪法所确定的基本原则的；</p>

<p>&nbsp;&sdot; 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</p>

<p>&nbsp;&sdot; 损害国家荣誉和利益的；</p>

<p>&nbsp;&sdot; 煽动民族仇恨、民族歧视、破坏民族团结的；</p>

<p>&nbsp;&sdot; 破坏国家宗教政策，宣扬邪教和封建迷信的；</p>

<p>&nbsp;&sdot; 散布谣言，扰乱社会秩序，破坏社会稳定的；</p>

<p>&nbsp;&sdot; 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</p>

<p>&nbsp;&sdot; 侮辱或者诽谤他人，侵害他人合法权利的；</p>

<p>&nbsp;&sdot; 含有虚假、诈骗、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容；</p>

<p>&nbsp;&sdot; 含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的；</p>

<p>2）以任何方式危害他人的合法权益；</p>

<p>3）冒充其他任何人或机构，或以虚伪不实的方式陈述或谎称与任何人或机构有关；</p>

<p>4）将依据任何法律或合约或法定关系（例如由于雇佣关系和依据保密合约所得知或揭露之内部资料、专属及机密资料）知悉但无权传送之任何内容加以发布、发送电子邮件或以其它方式传送；</p>

<p>5）将侵害他人著作权、专利权、商标权、商业秘密、或其它专属权利（以下简称“专属权利”）之内容加以发布或以其它方式传送；</p>

<p>6）将任何广告信函、促销资料、“垃圾邮件”、““滥发信件”、“连锁信件”、“直销”或其它任何形式的劝诱资料加以发布、发送或以其它方式传送；</p>

<p>7）将设计目的在于干扰、破坏或限制任何计算机软件、硬件或通讯设备功能之计算机病毒（包括但不限于木马程序（trojan horses）、蠕虫（worms）、定时炸弹、删除蝇（cancelbots）（以下简称“病毒”）或其它计算机代码、档案和程序之任何资料，加以发布、发送或以其它方式传送；</p>

<p>8）干扰或破坏本服务或与本服务相连线之服务器和网络，或违反任何关于本服务连线网络之规定、程序、政策或规范；</p>

<p>9）跟踪、人肉搜索或以其它方式骚扰他人；</p>

<p>10）故意或非故意地违反任何适用的当地、国家法律，以及任何具有法律效力的规则；</p>

<p>11）未经合法授权而截获、篡改、收集、储存或删除他人个人信息、站内邮件或其它数据资料，或将获知的此类资料用于任何非法或不正当目的。</p>
</script>
</body>
</html>