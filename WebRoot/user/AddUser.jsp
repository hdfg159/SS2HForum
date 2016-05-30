<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加用户信息</title>
<link rel="stylesheet" href="../css/yi.css">
</head>
<body class="body">
	<center>
		<form action="admin_addUser" method="post">
			<table>
				<caption>添加用户信息</caption>
				<tr>
					<td>用户名:<input type="text" name="username" />
					</td>
				</tr>
				<tr>
					<td> 密 码 : <input type="password" name="password"></td>
				</tr>
			</table>
			<input type="submit" value="提交" /> <input type="reset" value="重置" /><br>
			<a href="admin_AgetUserList.action">返回</a>
		</form>
		<s:fielderror></s:fielderror>
	</center>
	<div class="di_yun"></div>
</body>
</html>
