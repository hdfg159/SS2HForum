<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>${user.username}回帖管理</title>
</head>
<body>
	<%@include file="PostPlateHead.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="center hoverable">
			<blockquote class="grey-text flow-text card-panel">${user.username}回帖列表</blockquote>
		</div>
		<div class="row">
			<c:forEach var="comment" items="${modcomments}">
				<div class="col s6">
					<div class="card-panel hoverable">
						<div class="left">${comment.user.username}</div>
						<div class="right">${comment.date}</div>
						<br>
						<div class="divider"></div>
						<br>
						<div style="word-wrap: break-word;white-space: pre-wrap;">">${comment.content}</div>
						<br>
						<div class="right">
							<a class="waves-effect  orange darken-4 btn"
								href="personal_deleteComment.action?commentid=${comment.id}"><i
								class="material-icons right">delete</i>删除</a>
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
