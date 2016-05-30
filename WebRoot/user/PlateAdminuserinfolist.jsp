<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="../css/yi.css">
<title>设置版主页面</title>
</head>
<body class="body">
	<center>
		<form>
			<table>
				<caption>用户信息管理</caption>
				<tr>
					<th>用户id</th>
					<th>用户名</th>
					<th>密码</th>
					<th>版主权限</th>
				</tr>
				<c:forEach var="user2" items="${userlist}">
					<tr>
						<td>${user2.id }</td>
						<td>${user2.username }</td>
						<td>${user2.password }</td>
						<td><c:if test="${user2.rank==2&&user2.plateid==nowppppp}">
								<a href="admin_setPlateAdmin.action?id=${user2.id}">取消当前版块版主权限</a>
							</c:if> <c:if test="${user2.rank==0}">
								<a href="admin_setPlateAdmin.action?id=${user2.id}">设置为当前版块版主</a>
							</c:if> <c:if test="${user2.rank==2&&user2.plateid!=nowppppp}">
								<a href="admin_setPlateAdmin.action?id=${user2.id}">取消其他版块版主权限</a>
							</c:if>
							<c:if test="${user2.rank==1}">已经是超级管理员权限</c:if>
							</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<a href="post_displayPosts.action?plateid=${nowppppp}">返回帖子列表</a>
	</center>
</body>
</html>
