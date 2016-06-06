<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>设置版主页面</title>
</head>
<body>
	<%@include file="PostPlateHead.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="card-panel center card-panel hoverable">
			<span class="grey-text flow-text">用户信息列表</span>
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
							<c:if test="${user2.rank!=1&&user2.username ne 'anonymous'}">
								<a href="admin_setPlateAdmin.action?id=${user2.id}"> <c:if
										test="${user2.rank==2&&user2.plateid==plateIdAdmin}">取消当前版块版主权限</c:if> <c:if
										test="${user2.rank==0}">设置为当前版主</c:if> <c:if
										test="${user2.rank==2&&user2.plateid!=plateIdAdmin}">
								取消其他版块版主权限
							</c:if>
								</a>
							</c:if>
							<c:if test="${user2.rank==1}">已经是超级管理员权限</c:if>
							<c:if test="${user2.rank!=1&&user2.username eq 'anonymous'}">游客身份不能设置</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
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
