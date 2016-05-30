<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="PersonalManagePlate.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>搜索帖子内容结果</title>
<link rel="stylesheet" href="../css/yi.css">
</head>
<body class="body">
	<center>
		<table
			style="margin-right:auto;margin-left:auto;background: #FFF none repeat scroll 0% 0%;border-radius: 10px;
        border: 2px solid #63A4BA;">
			<caption>所有板块信息</caption>
			<tr>
				<th>用户名</th>
				<th>板块名称</th>
				<th>帖子时间</th>
				<th>帖子标题</th>
			</tr>
			<c:forEach var="post" items="${seachposts}">
				<tr>
					<td>${post.user.username}</td>
					<td>${post.plate.platename}</td>
					<td>${post.postdate}</td>
					<td><a
						href="comment_postDetailComment.action?postid=${post.id}">${post.title}</a></td>
				</tr>
			</c:forEach>
		</table>
		<a href="MainAction.action">返回首页</a>
	</center>
	<div class="di_yun"></div>
</body>
</html>
