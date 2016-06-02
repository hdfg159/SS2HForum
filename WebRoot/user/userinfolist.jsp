<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>后台用户管理</title>
</head>
<body>
	<%@include file="PostPlateHead.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="card-panel center card-panel hoverable">
			<span class="black-text flow-text">用户信息列表</span>
		</div>
		<div class="row">
			<c:forEach var="user2" items="${userlist}">
				<div class="col s12 m6">
					<div class="card hoverable">
						<div class="card-content">
							<span class="card-title truncate">用户名：${user2.username}</span>
							<p>ID：${user2.id }</p>
							<p>密码：${user2.password }</p>
						</div>
						<div class="card-action">
							<c:if test="${user2.id!=user.id&&user2.username ne 'anonymous'}">
								<a class="waves-effect btn-flat " href="admin_deleteUser.action?id=${user2.id}">删除用户</a>
								<a class="waves-effect btn-flat " href="admin_setAdmin.action?id=${user2.id}">
									<c:if test="${user2.rank==1}">取消管理员</c:if> <c:if test="${user2.rank!=1}">设置管理员</c:if>
								</a>
							</c:if>
							<c:if test="${user2.id==user.id||user2.username eq 'anonymous'}">
								<a class="waves-effect btn-flat ">禁止操作</a>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="col s12 center">
			<a class="waves-effect light-blue lighten-1 btn-large" href="AddUser.jsp"> <i
				class="material-icons right">playlist_add</i>添加用户
			</a>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@include file="../LoginRegisterTail.jsp"%>
</body>
</html>
