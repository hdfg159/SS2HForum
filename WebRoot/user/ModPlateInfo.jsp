<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="../css/yi.css">
<title>版块信息修改</title>
</head>
<body class="body">
	<center>
		<form action="plate_modinfo" method="post">
			<input type="text" name="platename"> <input type="submit"
				value="提交">
		</form>
		<a href="MainAction.action">返回首页</a>
		<s:fielderror></s:fielderror>
	</center>
	<div class="di_yun"></div>
</body>
</html>
