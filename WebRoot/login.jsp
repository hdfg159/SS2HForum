<%@ page language="java" import="java.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<link rel="stylesheet" href="css/login.css">
<title>简易论坛</title>
</head>
<body class="body">
	<div class="logins" style="margin-left: -461.5px; margin-top: -227px;">
		<h2>欢迎登录简易论坛</h2>
		<div class="form_box">
			<form action="${pageContext.request.contextPath}/bbs_login" method="post">
				<div class="content">
					<ul>
						<li><input placeholder="请输入登录用户名" type="text" name="username"> <span>占用位置</span></li>
						<li><input placeholder="请输入登录密码" type="password" name="pwd"> <span>
								占用位置 </span></li>
					</ul>
				</div>
				<div class="wangjimima">
					<div class="left">
						<s:fielderror />
					</div>
					<span style="width: 450px; float: left; text-indent: 1px;"> </span> <a
						href="bbs_login.action?username=anonymous&pwd=anonymous">以游客身份登录论坛</a> <a
						href="register.jsp" style="float: right; margin-right: 220px;">还没账号？点击注册</a>
				</div>
				<div class="btndenglu">
					<input value="登录" type="submit"> <input value="重置" type="reset">
				</div>
			</form>
		</div>
	</div>
	<div class="di_yun"></div>
</body>
</html>
