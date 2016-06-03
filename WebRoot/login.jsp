<%@ page language="java" import="java.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
<title>简易论坛-登录</title>
</head>
<body>
	<%@include file="LoginRegisterHead.jsp"%>
	<div class="container">
		<br> <br>
		<div class="row center">
			<i class="medium material-icons prefix">forum</i>
			<h5 class="header col s12 light">论坛登录</h5>
		</div>
		<br>
		<div class="row">
			<form class="col s12" action="${pageContext.request.contextPath}/bbs_login"
				method="post">
				<div class="row">
					<div class="input-field col s12">
						<i class="large material-icons prefix">person_pin</i> <input id="username"
							name="username" type="text" class="validate"> <label for="username">请输入用户名</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="large material-icons prefix">vpn_key</i> <input id="password"
							type="password" name="pwd" class="validate"> <label for="password">请输入密码</label>
					</div>
				</div>
				<br>
				<div class="row center">
					<h8 class="header col s12 orange darken-4 white-text"> <s:fielderror></s:fielderror></h8>
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
							href="bbs_login.action?username=anonymous&pwd=anonymous">以游客身份登录<i
							class="material-icons right">perm_identity</i></a>
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
	<%@include file="LoginRegisterTail.jsp"%>
</body>
</html>
