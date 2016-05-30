<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>发表帖子</title>
<link rel="stylesheet" href="../css/yi.css">
</head>
<body class="body">
	<center>
		<form action="${pageContext.request.contextPath}/user/post_addPost"
			method="post">
			<table>
				<caption>填写帖子信息</caption>
				<tr>
					<td>帖子标题</td>
					<td><input type="text" name="title" /></td>
				</tr>
				<tr>
					<td>帖子内容</td>
					<td><textarea name="content" rows="6" cols="50"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="提交" /> <input type="reset" value="重置" />
		</form>
		<a href="post_displayPosts?plateid=${nowppppp}">返回板块</a>
		<s:fielderror></s:fielderror>
	</center>
	<div class="di_yun"></div>
</body>
</html>
