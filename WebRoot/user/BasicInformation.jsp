<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>基本信息修改</title>
<link rel="stylesheet" href="../css/yi.css">
</head>
<body class="body">
	<center>
		<form action="personal_uploadheadportrait" method="post"
			enctype="multipart/form-data">
			<table>
				<tr>
					<td>头像上传：</td>
					<td><input type="file" name="headportrait" /></td>
				</tr>
			</table>
			<input type="submit" value="上传" />
		</form>
		<form action="personal_modotherinformation" method="post">
			<table>
				<tr>
					<td>性别:</td>
					<td><input type="radio" name="sexradio" value="男"
						checked="checked" />男 <input type="radio" name="sexradio"
						value="女" />女</td>
				<tr>
				<tr>
					<td>QQ:</td>
					<td><input type="text" name="qq"></td>
				<tr>
				<tr>
					<td>手机号码:</td>
					<td><input type="text" name="phonenum"></td>
				<tr>
				<tr>
					<td>邮箱:</td>
					<td><input type="text" name="mail"></td>
				<tr>
			</table>
			<input type="submit" value="提交" />
		</form>
		<a href="PersonalInformation.jsp">返回用户信息管理</a>
		<s:fielderror></s:fielderror>
	</center>
	<div class="di_yun"></div>
</body>
</html>
