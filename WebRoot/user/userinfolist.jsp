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
		<div class="center hoverable">
			<blockquote class="grey-text flow-text card-panel">所有用户信息</blockquote>
		</div>
		<div class="row">
			<c:forEach var="user2" items="${userlist}">
				<div class="col s12 m6">
					<div class="card hoverable">
						<div class="card-content">
							<span class="card-title truncate">用户：${user2.username}</span><i
								class="activator material-icons right">more_vert</i>
							<p class="grey-text">UserID:${user2.id }</p>
						</div>
						<div class="card-reveal">
							<span class="card-title grey-text text-darken-4"><i class=" material-icons">loyalty</i>用户详细信息<i
								class="material-icons right">close</i></span>
							<p>
								<i class=" material-icons">person_pin</i>用户ID:${user2.id }
							</p>
							<p>
								<i class=" material-icons">vpn_key</i>用户密码:${user2.password}
							</p>
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
			<div class="col s12 center">
				<a class="waves-effect light-blue lighten-1 btn-large" href="AddUser.jsp"> <i
					class="material-icons right">playlist_add</i>添加用户
				</a>
			</div>
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
