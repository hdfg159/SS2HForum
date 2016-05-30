<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>后台用户管理</title>
<link rel="stylesheet" href="../css/yi.css">
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
					<th>操作</th>
					<th>管理员权限</th>
				</tr>
				<c:forEach var="user2" items="${userlist}">
					<tr>
						<td>${user2.id }</td>
						<td>${user2.username }</td>
						<td>${user2.password }</td>
						<td><c:if test="${user2.id!=user.id}">
								<a href="admin_deleteUser.action?id=${user2.id}">删除</a>
							</c:if></td>
						<td><c:if test="${user2.rank==1}">
								<a href="admin_setAdmin.action?id=${user2.id}">取消管理员</a>
							</c:if> <c:if test="${user2.rank!=1}">
								<a href="admin_setAdmin.action?id=${user2.id}">设置管理员</a>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<a href="AddUser.jsp">添加用户</a> <a href="MainAction.action">返回首页</a>
	</center>
</body>
</html>
