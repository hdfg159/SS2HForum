<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>基本信息修改</title>
</head>
<body>
	<%@include file="PostPlateHead.jsp"%>
	<br>
	<br>
	<script type="text/javascript">
		$(document).ready(function() {
			$('select').material_select();
		});
	</script>
	<div class="container">
		<div class="row">
			<div class="col s12">
				<ul class="tabs">
					<li class="tab col s3"><a class="active" href="#headupload">头像上传</a></li>
					<li class="tab col s3"><a href="#modmsg">基本信息设置</a></li>
				</ul>
			</div>
			<div id="headupload" class="col s12">
				<br> <br>
				<div class="row center card-panel hoverable">
					<c:if test="${user.head=='no'}">
						<img src="../upload/head/default.png" width="64px" height="64px"
							class="circle responsive-img">
					</c:if>
					<c:if test="${user.head!='no'}">
						<img src="../upload/head/${user.head}" width="64px" height="64px"
							class="circle responsive-img">
					</c:if>
					<br> <br>
					<form action="personal_uploadheadportrait" method="post"
						enctype="multipart/form-data">
						<div class="file-field input-field">
							<div class="btn ">
								<span>File</span> <input type="file"
									accept="image/png,image/jpeg,image/bmp" name="headportrait">
							</div>
							<div class="file-path-wrapper">
								<input class="file-path validate" type="text">
							</div>
						</div>
						<div class="col s12 center">
							<button class="btn waves-effect btn-large" type="submit" name="action">
								上传 <i class="material-icons right">send</i>
							</button>
						</div>
					</form>
				</div>
				<div class="col s12">
					<blockquote class="flow-text">
						<s:fielderror>
						</s:fielderror>
					</blockquote>
				</div>
			</div>
			<div id="modmsg" class="col s12">
				<br> <br>
				<div class="row card-panel hoverable">
					<form action="personal_modotherinformation" method="post">
						<p>
						<div class="input-field col s12">
							<select name="sexradio">
								<option value="男">选择性别</option>
								<option value="男">男</option>
								<option value="女">女</option>
							</select> <label>性别</label>
						</div>
						<br> <br>
						<p>
						<div class="input-field col s12">
							<i class="material-icons prefix">phone</i> <input id="icon_telephone" type="tel"
								name="phonenum" class="validate" value="${user.phonenum}"> <label
								for="icon_telephone">请输入手机号码</label>
						</div>
						<br> <br>
						<p>
						<div class="input-field col s12">
							<i class="material-icons prefix">perm_contact_calendar</i> <input id="QQ"
								type="text" name="qq" class="validate" value="${user.qq}"> <label for="QQ">请输入QQ</label>
						</div>
						<br> <br>
						<div class="input-field col s12">
							<i class="material-icons prefix">email</i> <input id="email" type="email"
								name="mail" class="validate" value="${user.mail}"> <label for="email"
								data-error="wrong" data-success="right">请输入Email</label>
						</div>
						<div class="input-field col s12 center ">
							<button class="btn-large waves-effect waves-light" type="submit" name="action">
								确定 <i class="material-icons right">send</i>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@include file="../LoginRegisterTail.jsp"%>
</body>
</html>
