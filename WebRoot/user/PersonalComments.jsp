<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>个人回帖管理</title>
<link rel="stylesheet" href="../css/yi.css">
</head>
<body class="body">
	<center>
		<form action="" method="post">
			<table
				style="margin-right:auto;margin-left:auto;background: #FFF none repeat scroll 0% 0%;border-radius: 10px;
        border: 2px solid #63A4BA;">
				<caption>个人回帖管理</caption>
				<tr>
					<th>回帖时间</th>
					<th>回帖标题</th>
					<th>回帖操作</th>
				</tr>
				<c:forEach var="comment" items="${modcomments}">
					<tr>
						<td>${comment.date}</td>
						<td>${comment.content}</td>
						<td><a
							href="personal_deleteComment.action?commentid=${comment.id}">删除</a></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<a href="PersonalInformation.jsp">返回用户信息管理</a>
	</center>
	<div class="di_yun"></div>
</body>
</html>
