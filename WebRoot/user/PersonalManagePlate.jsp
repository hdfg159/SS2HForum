<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<body>
	<center>
		<div
			style="width: 220px;height: 220px; background: #FFF none repeat scroll 0% 0%;
    border-radius: 10px;
    border: 2px solid #63A4BA;    position: absolute;
    right: 0px;
    top: 0px;">
			<c:if test="${user.head=='no'}">
				<img alt="" src="../upload/head/default.png" width="64px" height="64px"
					style="margin-top: 10px;">
			</c:if>
			<c:if test="${user.head!='no'}">
				<img alt="" src="../upload/head/${user.head}" width="64px" height="64px"
					style="margin-top: 10px;">
			</c:if>
			<p>你好，${user.username}</p>
			<c:if test="${user.username ne 'anonymous'}">
				<a href="PersonalInformation.jsp">个人信息管理</a>
				<br />
			</c:if>
			<c:if test="${user.username ne 'anonymous'}">
				<a href="personal_exitServer.action">退出登录</a>
			</c:if>
			<c:if test="${user.username eq 'anonymous'}">
				<a href="personal_exitServer.action">注册/登录</a>
			</c:if>
		</div>
	</center>
</body>
</html>
