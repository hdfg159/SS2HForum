<%@ page language="java" import="java.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@include file="PersonalManagePlate.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>帖子详情</title>
<link rel="stylesheet" href="../css/yi.css">
</head>
<body class="body">
	<center>
		<div class="bb">
			<p>帖子发表时间:${PostDetail.postdate}</p>
			<p>帖子标题:${PostDetail.title}</p>
			<p>帖子内容:${PostDetail.content}</p>
		</div>
		<form action="${pageContext.request.contextPath}/user/comment_addComment" method="post">
			<table>
				<tr>
					<!-- 					<th>回帖人id</th> -->
					<th>用户</th>
					<th>时间</th>
					<th>内容</th>
					<th>操作</th>
				</tr>
				<c:forEach var="comment" items="${Postcomments}">
					<tr>
						<td>${comment.user.username}</td>
						<td>${comment.date}</td>
						<td>${comment.content}</td>
						<c:if
							test="${user.id==comment.user.id||user.rank==1||(user.plateid==nowppppp&&user.rank==2)}">
							<td><a href="comment_deleteComment.action?commentid=${comment.id}">删除</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${nowppppp!=NULL}">
				<c:if test="${user.username ne 'anonymous'}">
					<textarea name="lcomment" rows="3" cols="55"></textarea>
					<br>
					<input type="submit" value="发表回复" />
				</c:if>
			</c:if>
		</form>
		<c:if test="${nowppppp!=NULL}">
			<a href="post_displayPosts.action?plateid=${nowppppp}">返回帖子列表</a>
		</c:if>
		<s:fielderror></s:fielderror>
	</center>
	<div class="di_yun"></div>
</body>
</html>
