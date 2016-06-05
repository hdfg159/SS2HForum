<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="../css/materialize.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="../css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
</head>
<body>
	<script src="../js/jquery-2.1.1.min.js"></script>
	<script src="../js/materialize.js"></script>
	<script src="../js/init.js"></script>
	<c:if test="${user.username ne 'anonymous'}">
		<ul id="dropdown1" class="dropdown-content">
			<li><a href="personal_viewPosts.action">帖子管理</a></li>
			<li><a href="personal_viewComments.action">回帖管理</a></li>
			<li class="divider"></li>
			<li><a href="BasicInformation.jsp">基本信息修改</a></li>
			<li><a href="ModPassword.jsp">密码修改</a></li>
			<c:if test="${user.rank==1}">
				<li class="divider"></li>
				<li><a href="admin_AgetUserList.action">后台管理</a></li>
			</c:if>
		</ul>
	</c:if>
	<nav>
		<div class="nav-wrapper light-blue lighten-1">
			<a href="#!" class="brand-logo">SimpleForum</a>
			<ul class="right hide-on-med-and-down">
				<li><a class="tooltipped" data-position="bottom" data-delay="300"
					data-tooltip="这是你的个人头像哦..."> <c:if test="${user.head=='no'}">
							<img src="../upload/head/default.png" width="42px" height="42px"
								class="circle responsive-img" align="middle">
						</c:if> <c:if test="${user.head!='no'}">
							<img src="../upload/head/${user.head}" width="42px" height="42px"
								class="circle responsive-img" align="middle">
						</c:if>
				</a></li>
				<li><a class="dropdown-button" href="#!" data-activates="dropdown1">${user.username}<i
						class="material-icons right">arrow_drop_down</i></a></li>
				<li><a href="MainAction.action">论坛首页</a></li>
				<li><a href="Searchpt.jsp" class="tooltipped" data-position="bottom"
					data-delay="300" data-tooltip="可以搜索帖子标题和帖子内容">搜索</a></li>
				<li><a href="personal_exitServer.action"> <c:if
							test="${user.username ne 'anonymous'}">退出</c:if> <c:if
							test="${user.username eq 'anonymous'}">注册/登录</c:if>
				</a></li>
			</ul>
			<ul id="nav-mobile" class="side-nav">
				<li><a href="#"> <c:if test="${user.head=='no'}">
							<img src="../upload/head/default.png" width="42px" height="42px"
								class="circle responsive-img" align="middle">
						</c:if> <c:if test="${user.head!='no'}">
							<img src="../upload/head/${user.head}" width="42px" height="42px"
								class="circle responsive-img" align="middle">
						</c:if>
				</a></li>
				<c:if test="${user.username ne 'anonymous'}">
					<li><a href="personal_viewPosts.action">帖子管理</a></li>
					<li><a href="personal_viewComments.action">回帖管理</a></li>
					<li class="divider"></li>
					<li><a href="BasicInformation.jsp">基本信息修改</a></li>
					<li><a href="ModPassword.jsp">密码修改</a></li>
					<c:if test="${user.rank==1}">
						<li class="divider"></li>
						<li><a href="admin_AgetUserList.action">后台管理</a></li>
					</c:if>
				</c:if>
				<li><a href="MainAction.action">首页</a></li>
				<li><a href="Searchpt.jsp">搜索</a></li>
				<li><a href="personal_exitServer.action"> <c:if
							test="${user.username ne 'anonymous'}">退出</c:if> <c:if
							test="${user.username eq 'anonymous'}">注册/登录</c:if>
				</a></li>
			</ul>
			<a href="#" data-activates="nav-mobile" class="button-collapse"><i
				class="material-icons">menu</i></a>
		</div>
	</nav>
</body>
</html>
