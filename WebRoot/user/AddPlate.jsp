<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>发表帖子</title>
<link rel="stylesheet" href="../css/yi.css">
</head>
<body>
<body class="body">
	<center>
		<form action="${pageContext.request.contextPath}/user/plate_addPlate"
			method="post">
			<table>
				<caption>填写板块信息</caption>
				<tr>
					<td>板块分类</td>
					<td><input type="text" name="platetype" /></td>
				</tr>
			</table>
			<input type="submit" value="提交" /> <input type="reset" value="重置" />
		</form>
		<s:fielderror></s:fielderror>
		<a href="MainAction.action">返回首页</a>
	</center>
	<div class="di_yun"></div>
</body>
</html>
