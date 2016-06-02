<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>版块信息修改</title>
</head>
<body class="body">
	<%@include file="PostPlateHead.jsp"%>
	<br>
	<br>
	<div class="container">
		<br> <br>
		<div class="row center">
			<i class="medium material-icons prefix">settings_applications</i>
			<h5 class="header col s12 light">版块信息修改</h5>
		</div>
		<br>
		<div class="row">
			<form class="col s12" action="plate_modinfo" method="post">
				<div class="row">
					<div class="input-field col s12">
						<i class="large material-icons prefix">loyalty</i> <input id="password" type="text"
							name="platename" class="validate"> <label for="password">请输入修改后的版块名</label>
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
					<div class="col s12 m4 l2">
						<button class="btn waves-effect light-blue lighten-1 btn-large" type="submit"
							name="action">
							确定 <i class="material-icons right">send</i>
						</button>
					</div>
					<div class="col s12 m4 l8">
						<a class="waves-effect light-blue lighten-1 btn-large" href="MainAction.action">返回首页
							<i class="material-icons right">toc</i>
						</a>
					</div>
					<div class="col s12 m4 l2">
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
