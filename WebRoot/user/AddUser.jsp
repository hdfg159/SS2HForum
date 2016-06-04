<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>添加用户信息</title>
</head>
<body>
	<%@include file="PostPlateHead.jsp"%>
	<br>
	<br>
	<div class="container">
		<br> <br>
		<div class="row center">
			<i class="medium material-icons prefix">playlist_add</i>
			<h5 class="header col s12 light">添加用户</h5>
		</div>
		<br>
		<div class="row">
			<form class="col s12" action="admin_addUser" method="post">
				<div class="row">
					<div class="input-field col s12">
						<i class="large material-icons prefix">person_pin</i> <input id="username"
							name="username" type="text" class="validate"> <label for="username">请输入用户名</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="large material-icons prefix">vpn_key</i> <input id="password"
							type="password" name="password" class="validate"> <label for="password">请输入密码</label>
					</div>
				</div>
				<br>
				<div class="row center">
					<blockquote class="flow-text">
						<s:fielderror></s:fielderror>
					</blockquote>
				</div>
				<br>
				<div class="row center">
					<div class="col s4">
						<button class="btn waves-effect light-blue lighten-1 btn-large" type="submit"
							name="action">
							确定 <i class="material-icons right">send</i>
						</button>
					</div>
					<div class="col s4">
						<a class="waves-effect light-blue lighten-1 btn-large"
							href="admin_AgetUserList.action">后台管理 <i class="material-icons right">perm_identity</i></a>
					</div>
					<div class="col s4">
						<button class="btn waves-effect light-blue lighten-1 btn-large" type="reset"
							name="action">
							重置 <i class="material-icons right">clear_all</i>
						</button>
					</div>
				</div>
			</form>
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
