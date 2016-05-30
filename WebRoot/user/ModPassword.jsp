<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>个人密码修改</title>
<link rel="stylesheet" href="../css/yi.css">
</head>
<body class="body">
	<center>
		<form action="ModPasswordAction" method="post"
			style="margin-right:auto;margin-left:auto;background: #FFF none repeat scroll 0% 0%;border-radius: 10px;
        border: 2px solid #63A4BA; width: 200px;">
			<br> 密码:<input type="password" name="password" /><br>
			<input type="submit" value="确认修改" /><br> <a
				href="PersonalInformation.jsp">返回用户信息管理</a>
		</form>
		<s:fielderror></s:fielderror>
	</center>
	<div class="di_yun"></div>
</body>
</html>
