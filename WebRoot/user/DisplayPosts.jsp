<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="PersonalManagePlate.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../css/yi.css">
<title>帖子列表</title>
</head>
<body class="body">
	<center>
		<form action="AddPosts.jsp" method="post">
			<table
				style="margin-right:auto;margin-left:auto;background: #FFF none repeat scroll 0% 0%;border-radius: 10px;
        border: 2px solid #63A4BA;">
				<caption>帖子信息</caption>
				<tr>
					<th>用户名</th>
					<th>版块名称</th>
					<th>帖子时间</th>
					<th>帖子标题</th>
					<c:if
						test="${sessionScope.user.id==post.userid||sessionScope.user.rank==1||(sessionScope.user.plateid==sessionScope.nowppppp&&sessionScope.user.rank==2)}">
						<th>帖子操作</th>
					</c:if>
					<c:if test="${user.rank==1||(user.plateid==nowppppp&&sessionScope.user.rank==2)}">
						<th>置顶操作</th>
					</c:if>
				</tr>
				<c:forEach var="post" items="${displaypost}">
					<tr>
						<td align="center">${post.user.username}</td>
						<td align="center">${post.plate.platename}</td>
						<td align="center">${post.postdate}</td>
						<td align="center"><a href="comment_postDetailComment.action?postid=${post.id}">${post.title}</a></td>
						<c:if
							test="${user.id==post.user.id||user.rank==1||(user.plateid==nowppppp&&user.rank==2)}">
							<td align="center"><a href="post_deletePost.action?postid=${post.id}">删除</a></td>
						</c:if>
						<c:if test="${user.rank==1||(user.plateid==nowppppp&&user.rank==2)}">
							<c:if test="${post.position==0}">
								<td align="center"><a href="post_top.action?postid=${post.id}">置顶</a></td>
							</c:if>
							<c:if test="${post.position!=0}">
								<td align="center"><a href="post_top.action?postid=${post.id}">取消置顶</a></td>
							</c:if>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${user.username ne 'anonymous'}">
				<input type="submit" value="新增帖子" />
			</c:if>
			<c:if test="${sessionScope.user.rank==1}">
				<div class="centers">
					<a href="admin_PgetUserList.action">设置版主</a>
				</div>
			</c:if>
		</form>
		<a href="MainAction.action">返回首页</a>
	</center>
	<div class="di_yun"></div>
</body>
</html>