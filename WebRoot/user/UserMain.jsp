<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@include file="PersonalManagePlate.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>版块列表</title>
<link rel="stylesheet" href="../css/yi.css">
</head>
<body class="body">
	<center>
		<form action="AddPlate.jsp" method="post">
			<table>
				<caption>版块信息</caption>
				<tr>
					<th>版块id</th>
					<th>版块名称</th>
					<c:if test="${user.rank==1}">
						<th>操作</th>
						<th>版块信息修改</th>
					</c:if>
				</tr>
				<c:forEach var="plate" items="${sessionScope.PlateList }">
					<tr>
						<td align="center">${plate.id}</td>
						<td align="center"><a href="post_displayPosts?plateid=${plate.id}">${plate.platename}</a></td>
						<c:if test="${sessionScope.user.rank==1}">
							<td align="center"><a href="plate_deletePlate?plateid=${plate.id}">删除</a></td>
							<td align="center"><a href="plate_entermodinfo.action?plateid=${plate.id}">修改</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${sessionScope.user.rank==1}">
				<input type="submit" value="新增板块" />
				<a href="admin_AgetUserList.action">后台管理</a>
			</c:if>
		</form>
		<form action="SearchAction" method="post">
			<input type="text" name="search" /> <input type="submit" value="搜索帖子标题/内容" size="100" />
		</form>
		<s:fielderror></s:fielderror>
	</center>
	<div class="di_yun"></div>
</body>
</html>
